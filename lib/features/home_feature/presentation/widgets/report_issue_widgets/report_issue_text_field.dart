import 'package:activation_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/component/custom_text_widget.dart';


class ReportIssueTextField extends StatelessWidget {
  const ReportIssueTextField({super.key, required this.fieldTitle, required this.controller});
final String fieldTitle;
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(title:fieldTitle,fontSize: 10.sp,color: AppColors.welcomeScript,fontWeight: FontWeight.w400,),
          SizedBox(height: 1.h,),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              enabled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.cancelTitleColor,
                  width: 1
                )
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.cancelTitleColor,
                      width: 1
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
