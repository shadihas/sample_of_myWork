import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tech_t/application/home/widgets/custom_app_bar.dart';
import 'package:tech_t/core/utils/utils.dart';

import '../logic/pokemons_bloc/bloc/pokemons_bloc.dart';

class PokemonsScreen extends StatefulWidget {
  const PokemonsScreen({super.key});

  @override
  State<PokemonsScreen> createState() => _PokemonsScreenState();
}

class _PokemonsScreenState extends State<PokemonsScreen> {
  late Bloc pokemonsBloc;
  final imageUrl = 'https://via.placeholder.com/300.png';
  @override
  void initState() {
    pokemonsBloc = BlocProvider.of<PokemonsBloc>(context);
    if (pokemonsBloc.state is! PokemonsFetchedSuccessfullyState) {
      pokemonsBloc.add(GetPokemonsSubmittedEvent());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => pokemonsBloc.add(GetPokemonsSubmittedEvent()),
      child: Scaffold(
        appBar: customAppBar(title: "pokemons", context: context),
        body: BlocBuilder<PokemonsBloc, PokemonsState>(
          builder: (context, state) {
            if (state is PokemonsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PokemonsFailedState) {
              return Container(
                  height: Dimensions.screenHeight / 2,
                  width: Dimensions.screenWidth,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.message,
                        style: AppFontStyle.appTextStyle(
                            color: AppColors.blackColor),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      GestureDetector(
                          onTap: () =>
                              pokemonsBloc.add(GetPokemonsSubmittedEvent()),
                          child: const Icon(
                            Icons.refresh,
                            color: AppColors.darkBlueColor,
                          ))
                    ],
                  ));
            } else if (state is PokemonsFetchedSuccessfullyState) {
              return ListView.builder(
                itemCount: state.response.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 30.h, right: 20.w, left: 20.w),
                    height: 130.w,
                    decoration: BoxDecoration(
                        color: AppColors.wightColor,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              spreadRadius: 3,
                              color: AppColors.lightGreyTextColor)
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 130.w,
                          width: 130.w,
                          decoration: BoxDecoration(
                              color: AppColors.wightColor,
                              borderRadius: BorderRadius.circular(14)),
                          child: CachedNetworkImage(
                            imageUrl: Constants.pokemonsImagesURL(
                                id: state.pokemonsIdList[index]),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: AppColors.lightGreyTextColor,
                              highlightColor: AppColors.wightColor,
                              child: Container(
                                height: 130.h,
                                width: 130.h,
                                decoration: BoxDecoration(
                                    color: AppColors.lightGreyTextColor,
                                    borderRadius: BorderRadius.circular(14)),
                              ),
                            ), // Placeholder while loading
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error), // Widget to display on error
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.w),
                          child: SizedBox(
                            width: 220.w,
                            child: Text(
                              state.response[index].name,
                              style: AppFontStyle.appTextStyle(
                                  color: AppColors.blackColor),
                              softWrap: true,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
