import 'package:flutter/material.dart';
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
      height: 60,
      width:80,
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
          CustomTextWidget(title: firstTitle,fontSize: 12,color: AppColors.appBarColor,),
          CustomTextWidget(title: secTitle,fontSize: 14,color: AppColors.appBarColor,fontWeight: FontWeight.w500,),
        ],
      ),
    );
  }
}