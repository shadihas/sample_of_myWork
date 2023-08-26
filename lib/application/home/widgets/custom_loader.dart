import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.lightBlueColor,
      ),
    );
  }
}
