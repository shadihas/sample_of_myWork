import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tech_t/application/home/repositories/pokemons_repo.dart';

import '../../../models/pokemons_model.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  List<int> pokemonsIdList = [];
  List<Result> pokemonsList = [];
  PokemonsRepository pokemonsRepository;

  PokemonsBloc({required this.pokemonsRepository}) : super(PokemonsInitial()) {
    on<GetPokemonsSubmittedEvent>((event, emit) async {
      await _onGetPokemonsSubmitted(emit, event);
    });
  }

  Future<void> _onGetPokemonsSubmitted(
      Emitter<PokemonsState> emit, GetPokemonsSubmittedEvent event) async {
    emit(PokemonsLoadingState(
        pokemonsIdList: pokemonsIdList, pokemonsList: pokemonsList));
    pokemonsIdList = event.pokemonsIdList;
    pokemonsList = event.pokemonsList;
    try {
      final List<dynamic> response =
          await pokemonsRepository.getPokemonsList(offset: event.offset);
          // response[0] is a List that has PokemonsInfo(name, url)
      final newPokemonsList = response[0] as List<Result>;
      // response[1] is the count of all the list of pokemons that 
      // we need for pagination.
      final totalPokemonsCount = response[1] as int;

      pokemonsList.addAll(newPokemonsList);
      final Iterable<int> newIds =
          newPokemonsList.map((e) => _extractPokemonId(e.url));
      pokemonsIdList.addAll(newIds);
      emit(PokemonsFetchedSuccessfullyState(
          pokemonsList: pokemonsList,
          pokemonsIdList: pokemonsIdList,
          totalPokemonsCount: totalPokemonsCount));
    } catch (e) {
      emit(
        PokemonsFailedState(
            message: e.toString(),
            pokemonsIdList: event.pokemonsIdList,
            pokemonsList: event.pokemonsList),
      );
    }
  }

  int _extractPokemonId(String url) {
    final idRegExp = RegExp(r'/(\d+)/$');
    final match = idRegExp.firstMatch(url);
    if (match != null && match.groupCount >= 1) {
      return int.parse(match.group(1)!);
    }
    return -1; // Default ID if extraction fails
  }
}
