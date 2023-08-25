import 'package:tech_t/application/home/models/pokemons_model.dart';

import '../../../core/data/remote_data/network_client_http.dart';
import '../../../core/utils/utils.dart';

abstract class PokemonsRepository{
  Future<List<Result>?> getPokemonsList();

}

class PokemonsRepositoryImpl extends PokemonsRepository{
  final NetworkClient networkClient;
  PokemonsRepositoryImpl({required this.networkClient});

  @override
  Future<List<Result>?> getPokemonsList() async{
  Iterable res = (await networkClient
        .handleResponse(await networkClient.buildHttpResponse(
      Constants.GET_POKEMONS_LIST_ENDPOINT,
      method: HttpMethod.GET,
      queryParameters: {"limit": "20"},
    )))['results'];
    print(res);
    return res.map((e) => Result.fromJson(e)).toList();
  }

}  