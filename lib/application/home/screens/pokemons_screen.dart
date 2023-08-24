import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tech_t/application/home/widgets/custom_app_bar.dart';
import 'package:tech_t/core/utils/utils.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(title: "pokemons"),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
        return
        
         Container(
          margin: EdgeInsets.only(top: 30.h, right: 20.w, left: 20.w), 
          height: 150.h, 
          decoration: BoxDecoration(
             color: AppColors.wightColor,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 3,
                color: AppColors.lightGreyTextColor
              )
            ]
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container( 
             height: 150.h,
             width: 150.h,
             decoration: BoxDecoration(
              color: AppColors.lightGreyTextColor,
              borderRadius: BorderRadius.circular(14)
             ),

              )
              
              ,Padding(
                padding:  EdgeInsets.all(10.w),
                child: Text("Pokemon name" ,style: AppFontStyle.appTextStyle(color: AppColors.blackColor),),
              )
           
            ],
          ),
        );
     
     
      },),
    );
  }
}