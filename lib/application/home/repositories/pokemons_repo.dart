import 'package:tech_t/application/home/models/pokemons_model.dart';

import '../../../core/data/remote_data/network_client_http.dart';
import '../../../core/utils/utils.dart';
import '../models/pokemons_model.dart';
import '../models/pokemons_model.dart';

abstract class PokemonsRepository{
  Future<List> getPokemonsList({required int offset}); 
}

class PokemonsRepositoryImpl implements PokemonsRepository{

  final NetworkClient networkClient;
  PokemonsRepositoryImpl({required this.networkClient});

  @override
  Future<List> getPokemonsList({required int offset}) async{
  Map<String, dynamic> res = (await networkClient
        .handleResponse(await networkClient.buildHttpResponse(
      Constants.GET_POKEMONS_LIST_ENDPOINT,
      method: HttpMethod.GET,
      queryParameters: {"offset" : "$offset"  ,"limit": "6"},
    )));
   
    return [PokemonsModel.fromJson(res).results, PokemonsModel.fromJson(res).count ];
  } 

}  