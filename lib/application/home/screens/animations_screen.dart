import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_t/core/utils/utils.dart';

import '../logic/animations_bloc/bloc/animations_bloc.dart';
import '../logic/text_home_bloc/bloc/text_home_bloc.dart';
import '../widgets/custom_app_bar.dart';

class AnimationsScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
     double containerSize = Dimensions.screenWidth / 1.2;
    Bloc animationsBloc = BlocProvider.of<AnimationsBloc>(context);
    return Scaffold(
      appBar: customAppBar(title: "Animations", context: context),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: Dimensions.screenHeight -(Dimensions.screenHeight* 0.11),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: BlocBuilder<TextHomeBloc, TextHomeState>(
                    builder: (context, state) {
                      return Text(
                        state.text.isEmpty ? "Your name" : state.text,
                        style:
                            AppFontStyle.appTextStyle(color: AppColors.blackColor),
                      );
                    },
                  ),
                ),
           
                BlocBuilder<AnimationsBloc, AnimationsState>(
                  builder: (context, state) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: containerSize,
                      height: containerSize,
                      decoration: BoxDecoration(
                        color: state.containerColor,
                        borderRadius: state.containerBorderRadius,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => animationsBloc.add(AnimationsChangedEvent(
                            containerBorderRadius: BorderRadius.circular(0),
                            containerColor: AppColors.darkBlueColor)),
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
                        onTap: () => animationsBloc.add(AnimationsChangedEvent(
                            containerBorderRadius: BorderRadius.circular(40),
                            containerColor: AppColors.lightBlueColor)),
                        child: Container(
                          width: 70.w,
                          height: 70.w,
                          decoration: BoxDecoration(
                            color: AppColors.lightBlueColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => animationsBloc.add(AnimationsChangedEvent(
                            containerBorderRadius:
                                BorderRadius.circular(containerSize / 2),
                            containerColor: AppColors.lightRedColor)),
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
        ),
      ),
    );
  }
}
