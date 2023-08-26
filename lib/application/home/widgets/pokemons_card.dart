import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/utils.dart';
import '../logic/pokemons_bloc/bloc/pokemons_bloc.dart';

class PokemonsCard extends StatelessWidget {
  int index;
  late PokemonsBloc pokemonsBloc;
  PokemonsCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    pokemonsBloc = BlocProvider.of<PokemonsBloc>(context);
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
                  id: pokemonsBloc.state.pokemonsIdList[index]),
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
                  const Icon(Icons.error), // Widget to display on error
              fadeInDuration: const Duration(milliseconds: 500),
              fadeOutDuration: const Duration(milliseconds: 500),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: SizedBox(
              width: 220.w,
              child: Text(
                pokemonsBloc.state.pokemonsList[index].name,
                style: AppFontStyle.appTextStyle(color: AppColors.blackColor),
                softWrap: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
