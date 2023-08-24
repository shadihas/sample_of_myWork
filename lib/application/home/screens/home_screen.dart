import 'package:flutter/material.dart';
import 'package:tech_t/router/app_router.dart';

import '../../../core/utils/utils.dart';
import '../widgets/clear_text_button.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_home_button.dart';
import '../widgets/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController homeTextEditingController = TextEditingController();
    return
    Scaffold(
  appBar: customAppBar(title: "Home"),
  body: SingleChildScrollView(
    child: Column(
      children: [
        
        SizedBox(
          // 80 is the appBar height 
          height: (Dimensions.screenHeight/2)-80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 50.h, bottom: 50.h, left: 20.w, right: 20.w),
                child: CustomTextField(
                  homeTextEditingController: homeTextEditingController,
                  hintText: "Enter your name",
                ),
              ),
              Text(
                "Your name",
                style: AppFontStyle.appTextStyle(color: AppColors.blackColor),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
        SizedBox(
          height: (Dimensions.screenHeight/2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const ClearTextButton(),
              SizedBox(height: 20.h),
              CustomHomeButton(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRouter.animationsScreen);
                },
                buttonColor: AppColors.darkBlueColor,
                text: "Go to page 1",
              ),
              SizedBox(height: 20.h),
              CustomHomeButton(
                onTap: () {
                 Navigator.of(context).pushNamed(AppRouter.pokemonsScreen);
                },
                buttonColor: AppColors.lightBlueColor,
                text: "Go to page 2",
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ],
    ),
  ),
);

  }
}





