import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_t/application/home/logic/pokemons_bloc/bloc/pokemons_bloc.dart';
import 'package:tech_t/application/home/logic/text_home_bloc/bloc/text_home_bloc.dart';

import '../../../core/data/remote_data/network_client_http.dart';
import '../repositories/pokemons_repo.dart';
import 'animations_bloc/bloc/animations_bloc.dart';

List<BlocProvider> getBlocProviders() {
  return [
    BlocProvider<TextHomeBloc>(create: (context) => TextHomeBloc()),
    BlocProvider<AnimationsBloc>(create: (context) => AnimationsBloc()),
    BlocProvider<PokemonsBloc>(
      create: (context) => PokemonsBloc(
        pokemonsRepository: PokemonsRepositoryImpl(
          networkClient: NetworkClientHttp(),
        ),
      ),
    ),
  ];
}
