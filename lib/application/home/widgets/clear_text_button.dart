import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';

class ClearTextButton extends StatelessWidget {
  const ClearTextButton({
    super.key,
    required this.onTap,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.delete,
            color: AppColors.darkRedColor,
          ),
          Text("Clear text",
              style: AppFontStyle.appTextStyle(color: AppColors.darkRedColor))
        ],
      ),
    );
  }
}
