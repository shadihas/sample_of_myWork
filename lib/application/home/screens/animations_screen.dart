import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_t/core/utils/utils.dart';

import '../logic/text_home_bloc/bloc/text_home_bloc.dart';
import '../widgets/custom_app_bar.dart';

class AnimationsScreen extends StatefulWidget {
  @override
  _AnimationsScreenState createState() => _AnimationsScreenState();
}

class _AnimationsScreenState extends State<AnimationsScreen> {
  double containerSize = Dimensions.screenWidth/1.2;
  BorderRadiusGeometry containerBorderRadius = BorderRadius.circular(0);
  Color containerColor = AppColors.darkBlueColor; 

  void animateContainer(int buttonIndex) {
    setState(() {
      switch (buttonIndex) {
        case 1: 
          containerColor = AppColors.darkBlueColor;
          containerBorderRadius = BorderRadius.circular(0);
          break;
        case 2: 
          containerColor = AppColors.lightBlueColor;
          containerBorderRadius = BorderRadius.circular(40);
          break;
        case 3: 
          containerColor = AppColors.lightRedColor;
          containerBorderRadius = BorderRadius.circular(containerSize/2);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Animations"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Padding(
             padding:  EdgeInsets.only(top: 40.h),
             child:BlocBuilder<TextHomeBloc, TextHomeState>(
                    builder: (context, state) {
                      return Text(
                       state.text.isEmpty ? "Your name" : state.text,
                        style: AppFontStyle.appTextStyle(
                            color: AppColors.blackColor),
                      );
                    },
                  ),
           ),

            AnimatedContainer( 
              duration: Duration(seconds: 1),
              width: containerSize,
              height: containerSize,
              decoration: BoxDecoration( 
                color: containerColor,
                borderRadius: containerBorderRadius,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 40.h , horizontal: 30.w),
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => animateContainer(1),
                    child: Container(
                       width: 70.w,
                height: 70.w,
                decoration: BoxDecoration( 
                  color: AppColors.darkBlueColor,
                  borderRadius: BorderRadius.circular(0),
                ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => animateContainer(2),
                    child:  Container(
                       width: 70.w,
                height: 70.w,
                decoration: BoxDecoration( 
                  color: AppColors.lightBlueColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => animateContainer(3),
                    child: Container(
                       width: 70.w,
                height: 70.w,
                decoration: BoxDecoration( 
                  color: AppColors.lightRedColor,
                  borderRadius: BorderRadius.circular(35.w),
                ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



