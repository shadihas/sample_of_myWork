
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tech_t/core/utils/utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key}); 


  @override
  Widget build(BuildContext context) { 
    Dimensions dimensions = Dimensions();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    dimensions.getDimensions(screenWidth, screenHeight);
    return  Scaffold(
         body: Center(
          child: SizedBox(
            // added the width/1.5 for the height to to preserve the image's aspect ratio.
            height: Dimensions.width/1.5,
            width: Dimensions.width/2,
            child: Image(image: AssetImage(ImagePath.logo)),
          ),
         ),
    );
  }
}