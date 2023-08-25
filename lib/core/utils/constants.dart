
part of utils;

class Constants{
  static const String BASE_URL = "https://pokeapi.co/api/v2/";
  static const String GET_POKEMONS_LIST_ENDPOINT = "pokemon";
  static String pokemonsImagesURL({required int id}) => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";
}