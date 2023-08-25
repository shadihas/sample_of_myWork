import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tech_t/application/home/repositories/pokemons_repo.dart';

import '../../../models/pokemons_model.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  PokemonsRepository pokemonsRepository;
PokemonsBloc({required this.pokemonsRepository}) : super(PokemonsInitial()) {
    on<PokemonsEvent>((event, emit)async {
      emit(PokemonsLoadingState());
     try {
      List<Result>? pokemonsList; 
     pokemonsList =  await pokemonsRepository.getPokemonsList();
     // to get pokemons Id to display the pokemons' image based on it.
     final List<int> pokemonsIdList = pokemonsList!.map((e) => _extractPokemonId(e.url)).toList();
     emit(PokemonsFetchedSuccessfullyState(response: pokemonsList, pokemonsIdList: pokemonsIdList));
     } catch (e) {
       emit(PokemonsFailedState(message: e.toString()));
     }
    });
  }
   int _extractPokemonId(String url) {
  final idRegExp = RegExp(r'/(\d+)/$');
  final match = idRegExp.firstMatch(url);
  if (match != null && match.groupCount >= 1) {
    return int.parse(match.group(1)!);
  }
  return 0; // Default ID if extraction fails
}
}
