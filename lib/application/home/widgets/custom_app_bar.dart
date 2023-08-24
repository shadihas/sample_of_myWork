 import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';

AppBar customAppBar({required String title}) {
    return AppBar(
      
      backgroundColor: AppColors.lightBlueColor,
      title: Text(title,style: AppFontStyle.appTextStyle(color: AppColors.wightColor)),);
  }