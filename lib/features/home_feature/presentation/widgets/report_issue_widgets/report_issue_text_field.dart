import 'package:activation_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../../core/component/custom_text_widget.dart';


class ReportIssueTextField extends StatelessWidget {
  const ReportIssueTextField({super.key, required this.fieldTitle, required this.controller});
final String fieldTitle;
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(title:fieldTitle,fontSize: 14,color: AppColors.welcomeScript,fontWeight: FontWeight.w400,),
          const SizedBox(height: 5,),
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
