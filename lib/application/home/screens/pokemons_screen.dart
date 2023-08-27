import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tech_t/application/home/widgets/custom_app_bar.dart';
import 'package:tech_t/core/utils/utils.dart';
import '../logic/pokemons_bloc/bloc/pokemons_bloc.dart';
import '../widgets/custom_loader.dart';
import '../widgets/pokemons_card.dart';

class PokemonsScreen extends StatefulWidget {
  const PokemonsScreen({super.key});

  @override
  State<PokemonsScreen> createState() => _PokemonsScreenState();
}

class _PokemonsScreenState extends State<PokemonsScreen> {
  late PokemonsBloc pokemonsBloc;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    pokemonsBloc = BlocProvider.of<PokemonsBloc>(context);
    if (pokemonsBloc.state.pokemonsIdList.isEmpty) {
      _fetchPokemonsInfo();
    }
    // Listen to scroll events for pagination
    scrollController.addListener(() {
      if ((scrollController.position.maxScrollExtent ==
              scrollController.offset) &&
          (!pokemonsBloc.state.isLoading) &&
          (pokemonsBloc.state.totalPokemonsCount >
              (pokemonsBloc.state.pokemonsIdList.length))) {
        _fetchPokemonsInfo();
      }
    });

    super.initState();
  }

  // Fetch more pokemons based on pagination
  _fetchPokemonsInfo() {
    pokemonsBloc.add(GetPokemonsSubmittedEvent( 
        offset: pokemonsBloc.state.pokemonsIdList.length));
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(title: "pokemons", context: context),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              BlocBuilder<PokemonsBloc, PokemonsState>(
                builder: (context, state) {
                  if (state is PokemonsLoadingState) {
                    // Loading state with shimmer effect
                    return Column(
                      children: [
                        Column(
                          children: List.generate(
                              state.pokemonsList.length,
                              (index) => PokemonsCard(
                                    index: index,
                                  )),
                        ),
                        state.pokemonsList.isEmpty
                            ? SizedBox(
                                height: Dimensions.screenHeight / 2,
                                child: const CustomLoader(),
                              )
                            : Shimmer.fromColors(
                                baseColor: AppColors.lightGreyTextColor,
                                highlightColor: AppColors.wightColor,
                                child: PokemonsCard(
                                  index: 0,
                                )),
                      ],
                    );
                  } else if (state is PokemonsFailedState) {
                    // Failed state with error message and refresh option
                    return Column(
                      children: [
                        Column(
                          children: List.generate(
                              state.pokemonsList.length,
                              (index) => PokemonsCard(
                                    index: index,
                                  )),
                        ),
                        SizedBox(
                          width: Dimensions.screenWidth,
                          height: Dimensions.screenHeight / 4,
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
                                  onTap: () => _fetchPokemonsInfo(),
                                  child: const Icon(
                                    Icons.refresh,
                                    color: AppColors.darkBlueColor,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (state is PokemonsFetchedSuccessfullyState) {
                    // Successfully fetched state with pokemons list
                    return Column(
                      children: List.generate(
                        state.pokemonsList.length,
                        (index) {
                          return PokemonsCard(
                            index: index,
                          );
                        },
                      ),
                    );
                  } else {
                    // Other states
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ));
  }
}
