import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_t/application/home/logic/animations_bloc/bloc/animations_bloc.dart';
import 'package:tech_t/application/home/logic/text_home_bloc/bloc/text_home_bloc.dart';
import 'package:tech_t/application/home/screens/splash_screen.dart';
import 'package:tech_t/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TextHomeBloc(),
        ),
        BlocProvider(
          create: (context) => AnimationsBloc(),
        ),
      ],
      child: MaterialApp(
          builder: (context, child) {
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.0,
                ),
                child: child!);
          },
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRouter.splashScreen),
    );
  }
}
