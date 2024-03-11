import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/app_colors.dart';
import 'custom_text_widget.dart';


class CustomGradientContainer extends StatelessWidget {
  const CustomGradientContainer({super.key, required this.color, required this.firstTitle, required this.secTitle});
  final List<Color>color;
  final String firstTitle;
  final String secTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width:20.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: color)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextWidget(title: firstTitle,fontSize: 10.sp,color: AppColors.appBarColor,),
          CustomTextWidget(title: secTitle,fontSize: 12.sp,color: AppColors.appBarColor,fontWeight: FontWeight.w500,),
        ],
      ),
    );
  }
}