import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tech_t/application/home/repositories/pokemons_repo.dart';

import '../../../models/pokemons_model.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  final PokemonsRepository pokemonsRepository;

  PokemonsBloc({required this.pokemonsRepository}) : super(PokemonsInitial()) {
    on<GetPokemonsSubmittedEvent>(_onGetPokemonsSubmitted);
  }

  Future<void> _onGetPokemonsSubmitted(
      GetPokemonsSubmittedEvent event, Emitter<PokemonsState> emit) async {
    emit(PokemonsLoadingState(
        pokemonsIdList: state.pokemonsIdList,
        pokemonsList: state.pokemonsList));

    try {
      final response =
          await pokemonsRepository.getPokemonsList(offset: event.offset);
      // response[0] is the list of pokemons model info(name & url)
      final newPokemonsList = response[0] as List<Result>;
      // response[1] is total pokemons count for pagination to know when to stop retrieving data
      final totalPokemonsCount = response[1] as int;
      // Adding the incoming list of pokemons from Api to the existing list
      final updatedPokemonsList = [...state.pokemonsList, ...newPokemonsList]; 
      final updatedIdsList = [
        ...state.pokemonsIdList,
        ...newPokemonsList.map((e) => _extractPokemonId(e.url)),
      ];

      emit(PokemonsFetchedSuccessfullyState(
        pokemonsList: updatedPokemonsList,
        pokemonsIdList: updatedIdsList,
        totalPokemonsCount: totalPokemonsCount,
      ));
    } catch (e) {
      emit(PokemonsFailedState(
        message: e.toString(),
        pokemonsIdList: state.pokemonsIdList,
        pokemonsList: state.pokemonsList,
      ));
    }
  }
// to extract the pokemon's id from the url
  int _extractPokemonId(String url) {
    final idRegExp = RegExp(r'/(\d+)/$');
    final match = idRegExp.firstMatch(url);
    if (match != null && match.groupCount >= 1) {
      return int.parse(match.group(1)!);
    }
    return -1; // Default ID if extraction fails
  }
}
