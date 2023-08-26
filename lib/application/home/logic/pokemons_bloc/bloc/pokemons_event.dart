part of 'pokemons_bloc.dart';

@immutable
abstract class PokemonsEvent {}

class GetPokemonsSubmittedEvent extends PokemonsEvent {
  final int offset;
   List<Result> pokemonsList = [];
   List<int> pokemonsIdList = [];
  GetPokemonsSubmittedEvent({
     this.offset = 0,
     required this.pokemonsIdList,
     required this.pokemonsList
  }); 
}
