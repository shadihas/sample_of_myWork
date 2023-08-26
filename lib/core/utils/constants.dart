part of utils;

class Constants {
  static const String BASE_URL = "https://pokeapi.co/api/v2/";
  static const String GET_POKEMONS_LIST_ENDPOINT = "pokemon";
  static const String NO_INTERNET ="Your internet is not working";
  static const String MESSAGE ="message";
  static const String SOMETHING_WENT_WRONG ="Something went wrong";
  static String pokemonsImagesURL({required int id}) =>
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";
}
