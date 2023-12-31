import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';

class CustomHomeButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Function()? onTap;
  const CustomHomeButton(
      {super.key,
      required this.text,
      required this.buttonColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: Dimensions.screenWidth / 1.1,
        height: 57,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: buttonColor),
        child: Text(text,
            style: AppFontStyle.appTextStyle(color: AppColors.wightColor)),
      ),
    );
  }
}
