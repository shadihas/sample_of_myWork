
import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';

class ClearTextButton extends StatelessWidget {
  const ClearTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.delete,
            color: AppColors.darkRedColor,
          ),
          Text(
            "Clear text",
            style: AppFontStyle.appTextStyle(color: AppColors.darkRedColor)
          )
        ],
      ),
    );
  }
}

