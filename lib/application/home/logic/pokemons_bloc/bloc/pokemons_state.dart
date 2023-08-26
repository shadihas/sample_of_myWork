part of 'pokemons_bloc.dart';

@immutable
abstract class PokemonsState {
  List<Result> pokemonsList;
  List<int> pokemonsIdList;
  int totalPokemonsCount;
  bool isLoading;
  PokemonsState(
      {required this.pokemonsList,
      required this.pokemonsIdList,
      this.totalPokemonsCount = 0,
      this.isLoading = false});
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
            isLoading: true);
}

class PokemonsFetchedSuccessfullyState extends PokemonsState {
  final int totalPokemonsCount;

  PokemonsFetchedSuccessfullyState({
    required List<Result> pokemonsList,
    required List<int> pokemonsIdList,
    required this.totalPokemonsCount,
  }) : super(
            pokemonsList: pokemonsList,
            pokemonsIdList: pokemonsIdList,
            totalPokemonsCount: totalPokemonsCount,
            isLoading: false);
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
            isLoading: false);
}
