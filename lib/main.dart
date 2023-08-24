import 'package:flutter/material.dart';
import 'package:tech_t/application/home/screens/splash_screen.dart';
import 'package:tech_t/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      theme: ThemeData(appBarTheme: AppBarTheme(
       
      )),
      debugShowCheckedModeBanner: false, 
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRouter.splashScreen
    );
  }
}

