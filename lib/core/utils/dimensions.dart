 

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
  double get h => ((this * MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height) / Dimensions.defaultHeight);

  double get w => ((this * MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width) / Dimensions.defaultWidth);

  double get sp =>
      ((MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width * MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height) * this) /
      (Dimensions.defaultHeight * Dimensions.defaultWidth);
}


