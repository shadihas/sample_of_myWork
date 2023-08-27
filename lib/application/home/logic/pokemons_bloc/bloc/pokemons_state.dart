part of 'pokemons_bloc.dart';

abstract class PokemonsState {
  final List<Result> pokemonsList;
  final List<int> pokemonsIdList;
  final int totalPokemonsCount;
  final bool isLoading;

  PokemonsState({
    required this.pokemonsList,
    required this.pokemonsIdList,
    this.totalPokemonsCount = 0,
    this.isLoading = false,
  });
}

class PokemonsInitial extends PokemonsState {
  PokemonsInitial() : super(pokemonsList: [], pokemonsIdList: []);
}

class PokemonsLoadingState extends PokemonsState {
  PokemonsLoadingState({
    required List<Result> pokemonsList,
    required List<int> pokemonsIdList,
  }) : super(
          pokemonsList: pokemonsList,
          pokemonsIdList: pokemonsIdList,
        );
}

class PokemonsFetchedSuccessfullyState extends PokemonsState {
  @override
  final int totalPokemonsCount;

  PokemonsFetchedSuccessfullyState({
    required List<Result> pokemonsList,
    required List<int> pokemonsIdList,
    required this.totalPokemonsCount,
  }) : super(
          pokemonsList: pokemonsList,
          pokemonsIdList: pokemonsIdList,
          totalPokemonsCount: totalPokemonsCount,
        );
}

class PokemonsFailedState extends PokemonsState {
  final String message;

  PokemonsFailedState({
    required List<Result> pokemonsList,
    required List<int> pokemonsIdList,
    required this.message,
  }) : super(
          pokemonsList: pokemonsList,
          pokemonsIdList: pokemonsIdList,
        );
}
