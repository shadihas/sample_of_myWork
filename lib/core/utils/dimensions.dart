 

part of utils;

class Dimensions{
static late  double width;
static late double height;
static final  double defaultWidth = 430;
static final double defaultHeight = 925;

  void getDimensions(double screenWidth,double screenHeight){
     width = screenWidth;
     height = screenHeight;

  }
}

extension PercentSized on int {
  double get h => ((this * Dimensions.height) / Dimensions.defaultHeight);

  double get w => ((this * Dimensions.width) / Dimensions.defaultWidth);

  double get sp =>
      ((Dimensions.width * Dimensions.height) * this) /
      (Dimensions.defaultHeight * Dimensions.defaultWidth);
}


