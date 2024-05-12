import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../../../core/utils/app_colors.dart';


class SelectVehicleWidget extends StatelessWidget {
  const SelectVehicleWidget({super.key, required this.title, required this.controller});
final String title;
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          title: title,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          color:AppColors.appBarColor,),
        SizedBox(height: 1.h,),
        Padding(
          padding:  EdgeInsets.only(right: 8.w),
          child: TextFormField(
            controller:controller ,
            decoration:  InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: AppColors.orderNumberColor,
                    width: 0.5
                ),
                borderRadius: BorderRadius.circular(8)
              ),
              enabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(
            color: AppColors.orderNumberColor,
                width:0.5
            ),
                  borderRadius: BorderRadius.circular(8)
          ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: AppColors.redColor,
                    width:0.5
                ),
                  borderRadius: BorderRadius.circular(8)
              ),
            ),
          ),
        )

      ],
    );
  }
}
