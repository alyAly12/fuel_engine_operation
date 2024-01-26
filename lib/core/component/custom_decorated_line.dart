
import 'package:activation_app/core/component/subtitle_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/app_colors.dart';

class CustomDecoratedTextLine extends StatelessWidget {
  const CustomDecoratedTextLine({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5,right: 5),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 0.1.h,
              decoration: const BoxDecoration(color: AppColors.orderNumberColor),
            ),
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.center,
              child: SubTitleWidget(subTitle:title,fontSize:7.sp ,fontWeight:FontWeight.w400 ,color: AppColors.orderNumberColor,),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 0.1.h,
              decoration: const BoxDecoration(color: AppColors.orderNumberColor),
            ),
          ),
        ],
      ),
    );
  }
}
