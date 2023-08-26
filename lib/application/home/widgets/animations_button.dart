import 'package:flutter/material.dart';
import 'package:tech_t/core/utils/utils.dart';

class AnimationsButton extends StatelessWidget {
  const AnimationsButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.borderRadius,
  });
  final BorderRadiusGeometry? borderRadius;
  final Color color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70.w,
        height: 70.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
