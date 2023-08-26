import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';

AppBar customAppBar({required String title, required BuildContext context}) {
  return AppBar(
      title: Text(title,
          style: AppFontStyle.appTextStyle(color: AppColors.wightColor)));
}
