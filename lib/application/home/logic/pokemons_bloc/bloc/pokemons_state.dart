part of 'pokemons_bloc.dart';

@immutable
abstract class PokemonsState {}

class PokemonsInitial extends PokemonsState {}
class PokemonsLoadingState extends PokemonsState {}
class PokemonsFetchedSuccessfullyState extends PokemonsState {
 final List<Result> response;
 final List<int> pokemonsIdList;
 PokemonsFetchedSuccessfullyState({required this.response, required this.pokemonsIdList});
}
class PokemonsFailedState extends PokemonsState {
  final String message;

  PokemonsFailedState({required this.message});
}
