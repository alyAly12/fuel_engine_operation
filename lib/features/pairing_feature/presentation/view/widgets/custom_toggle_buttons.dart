import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/component/custom_text_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets_manager.dart';

class CustomToggleButtons extends StatefulWidget {
  const CustomToggleButtons({super.key});

  @override
  State<CustomToggleButtons> createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  List<bool> isSelected=[true,false];
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      selectedColor: AppColors.appBarColor,
      color:AppColors.lightTitleColor,
      fillColor: Colors.white,
      renderBorder: true,
      borderColor: AppColors.borderContainerColor,
      borderWidth: 1,
      borderRadius: BorderRadius.circular(0),
      selectedBorderColor:AppColors.appBarColor ,
      isSelected: isSelected,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 1.h),
          child: Row(
            children: [
              SvgPicture.asset(AssetsManager.operationLogo,),
              SizedBox(width: 2.w,),
              CustomTextWidget(title: AppStrings.operation,fontSize: 12.sp,)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 1.h),
          child: Row(
            children: [
              SvgPicture.asset(AssetsManager.partnerLogo),
              SizedBox(width: 2.w,),
              CustomTextWidget(title: AppStrings.partner,fontSize: 12.sp,)
            ],
          ),
        ),
      ],
      onPressed: (int newIndex) {
        setState(() {
          for (int index = 0; index < isSelected.length; index++) {
            if (index == newIndex) {
              isSelected[index] = true;
            } else {
              isSelected[index] = false;
            }
          }
        });
      },
    );
  }
}