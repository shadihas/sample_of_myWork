import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_t/application/home/logic/text_home_bloc/bloc/text_home_bloc.dart';
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: customAppBar(title: "Home", context: context),
        body: SingleChildScrollView(
          child: SizedBox(
            height: Dimensions.screenHeight * 0.85,
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 50.h, bottom: 50.h, left: 20.w, right: 20.w),
                      child: CustomTextField(
                        onChanged: (text) {
                          BlocProvider.of<TextHomeBloc>(context)
                              .add(TextHomeTypedEvent(text: text));
                        },
                        homeTextEditingController: homeTextEditingController,
                        hintText: "Enter your name",
                      ),
                    ),
                    BlocBuilder<TextHomeBloc, TextHomeState>(
                      builder: (context, state) {
                        return Text(
                          state.text.isEmpty ? "Your name" : state.text,
                          style: AppFontStyle.appTextStyle(
                              color: AppColors.blackColor),
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ClearTextButton(
                        onTap: () {
                          homeTextEditingController.clear();
                          BlocProvider.of<TextHomeBloc>(context)
                              .add(TextHomeClearedEvent());
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomHomeButton(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRouter.animationsScreen);
                        },
                        buttonColor: AppColors.darkBlueColor,
                        text: "Go to page 1",
                      ),
                      SizedBox(height: 20.h),
                      CustomHomeButton(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRouter.pokemonsScreen);
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
        ),
      ),
    );
  }
}
