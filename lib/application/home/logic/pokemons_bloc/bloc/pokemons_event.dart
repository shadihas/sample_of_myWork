part of 'pokemons_bloc.dart';

abstract class PokemonsEvent {}

class GetPokemonsSubmittedEvent extends PokemonsEvent {
  int offset;
 
  GetPokemonsSubmittedEvent(
      {this.offset = 0, });
}
