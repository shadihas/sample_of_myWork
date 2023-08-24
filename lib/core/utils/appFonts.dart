

part of utils;

class AppFontSize{
     static const double miniSize = 14;
  static const double mediumSize = 16; 
  static const double bigSize = 20;
  static const double appBarTitle = 20;
  static const double bigTitle = 25;

}

class AppFontFamily{
  static const String interRegular = "inter-R";
  static const String interBold = "inter-B";
  static const String interMedium = "inter-M";
  static const String interThin = "inter-TH";
}

class AppFontStyle{
  static  TextStyle appTextStyle({required Color color}) {
     return TextStyle(
                        fontFamily: AppFontFamily.interRegular,
                        fontSize: AppFontSize.bigSize,
                        color:color);
  } 
}