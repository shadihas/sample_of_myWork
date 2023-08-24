 

part of utils;

class Dimensions{
static late  double screenWidth;
static late double screenHeight;
static final  double defaultWidth = 430;
static final double defaultHeight = 925;

  void getScreenDimensions(double width,double height){
     screenWidth = width;
     screenHeight = height;

  }
}

extension PercentSized on int {
  double get h => ((this * Dimensions.screenHeight) / Dimensions.defaultHeight);

  double get w => ((this * Dimensions.screenWidth) / Dimensions.defaultWidth);

  double get sp =>
      ((Dimensions.screenWidth * Dimensions.screenHeight) * this) /
      (Dimensions.defaultHeight * Dimensions.defaultWidth);
}


