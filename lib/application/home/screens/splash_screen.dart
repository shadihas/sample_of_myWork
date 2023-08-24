
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tech_t/core/utils/utils.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key}); 

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToHomeScreenAfter3Seconds();
    super.initState();
  }

void goToHomeScreenAfter3Seconds(){ 
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      },));
     });
  }
  @override
  Widget build(BuildContext context) { 
    Dimensions dimensions = Dimensions();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    dimensions.getScreenDimensions(screenWidth, screenHeight);
    return  Scaffold(
         body: Center(
          child: SizedBox(
            // added the width/1.5 for the height to to preserve the image's aspect ratio.
            height: Dimensions.screenWidth/1.5,
            width: Dimensions.screenWidth/2,
            child: const Image(image: AssetImage(ImagePath.logo)),
          ),
         ),
    );
  }
}