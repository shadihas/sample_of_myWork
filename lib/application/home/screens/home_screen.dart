import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../core/utils/utils.dart';
import '../widgets/clear_text_button.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_home_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController homeTextEditingController = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(title: "Home"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [ 
          Column(
            children: [ 
              // Text field where the user can enter the input
              Padding(
                padding: EdgeInsets.only(
                    top: 50.h, bottom: 50.h, left: 20.w, right: 20.w),
                child: TextField(
                  controller: homeTextEditingController,
                  decoration: InputDecoration(
                      hintText: "Enter your name",
                      hintStyle: AppFontStyle.appTextStyle(color: AppColors.greyTextColor)
                          ),
                ),
              ),
           
              // Text widget, with a value changed based on the TextField input changed
              Text(
                "Your name",
                style: AppFontStyle.appTextStyle(color: AppColors.blackColor)
              ),
            ],
          ),
          Column(
            children: [
            //  Clear text button, to clear the text in the Text and TextField widgets.
              const ClearTextButton(),
            
              SizedBox(
                height: 20.h,
              ),

              CustomHomeButton(
                onTap: () {
                  
                },
                buttonColor: AppColors.darkBlueColor,
                text: "Go to page 1",
              ),
              SizedBox(
                height: 20.h,
              ),
               CustomHomeButton(
                onTap: () {
                  
                },
                buttonColor: AppColors.lightBlueColor,
                text: "Go to page 2",
              ),
               SizedBox(
                height: 20.h,
              ),
            ],
          )
        ],
      ),
    );
  }
}
