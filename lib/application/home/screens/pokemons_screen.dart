import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:tech_t/application/home/widgets/custom_app_bar.dart';
import 'package:tech_t/core/utils/utils.dart'; 
import '../logic/pokemons_bloc/bloc/pokemons_bloc.dart';
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

  _fetchPokemonsInfo() {
    pokemonsBloc.add(GetPokemonsSubmittedEvent(
        pokemonsIdList: pokemonsBloc.state.pokemonsIdList,
        pokemonsList: pokemonsBloc.state.pokemonsList,
        offset: pokemonsBloc.state.pokemonsIdList.length));
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(pokemonsBloc.state.pokemonsIdList.length);
    return Scaffold(
        appBar: customAppBar(title: "pokemons", context: context),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              BlocBuilder<PokemonsBloc, PokemonsState>(
                builder: (context, state) {
                  if (state is PokemonsLoadingState) {
                    return Column(
                      children: [
                        Column(
                          children: List.generate(
                              state.pokemonsList.length,
                              (index) => PokemonsCard(
                                    state: state,
                                    index: index,
                                  )),
                        ),
                        const SizedBox(
                          height: 30,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    );
                  } else if (state is PokemonsFailedState) {
                    return Column(
                      children: [
                        Column(
                          children: List.generate(
                              state.pokemonsList.length,
                              (index) => PokemonsCard(
                                    state: state,
                                    index: index,
                                  )),
                        ),
                        Column(
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
                      ],
                    );
                  } else if (state is PokemonsFetchedSuccessfullyState) {
                    return Column(
                      children: List.generate(
                        state.pokemonsList.length,
                        (index) {
                          return PokemonsCard(
                            state: state,
                            index: index,
                          );
                        },
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ));
  }
}
