part of 'pokemons_bloc.dart';

abstract class PokemonsEvent {}

class GetPokemonsSubmittedEvent extends PokemonsEvent {
  int offset;
  final List<Result> pokemonsList;
  final List<int> pokemonsIdList;
  GetPokemonsSubmittedEvent(
      {this.offset = 0,
      required this.pokemonsIdList,
      required this.pokemonsList});
}
