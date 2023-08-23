 

part of utils;

class Dimensions{
 late double width;
 late double height;

  void getDimensions(double screenWidth,double screenHeight){
     width = screenWidth;
     height = screenHeight;
  }
}

//   extension Dimensions on int {
//   double get h => ((this * MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height) / getIt<AppStore>().defaultHeight);

//   double get w => ((this * MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width) / getIt<AppStore>().defaultWidth);

//   double get sp =>
//       ((MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width * MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height) * this) /
//       (getIt<AppStore>().defaultHeight * getIt<AppStore>().defaultWidth);
// }
