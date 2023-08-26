import 'package:flutter/material.dart';
import 'package:tech_t/application/home/screens/home_screen.dart';
import 'package:tech_t/application/home/screens/pokemons_screen.dart';
import 'package:tech_t/application/home/screens/splash_screen.dart';

import '../application/home/screens/animations_screen.dart';

class AppRouter {
  static const String homeScreen = '/home';
  static const String splashScreen = 'splashScreen';
  static const String animationsScreen = 'animationsScreen';
  static const String pokemonsScreen = 'pokemonsScreen';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case animationsScreen:
        return MaterialPageRoute(
          builder: (context) => const AnimationsScreen(),
        );
      case pokemonsScreen:
        return MaterialPageRoute(
          builder: (context) => const PokemonsScreen(),
        );

      default:
    }
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Text('No route defined'),
      ),
    );
  }
}
