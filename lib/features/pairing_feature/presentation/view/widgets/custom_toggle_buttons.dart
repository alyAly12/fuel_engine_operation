import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
      selectedColor: Colors.white,
      color:AppColors.lightTitleColor,
      fillColor: AppColors.redColor,
      renderBorder: true,
      borderColor: AppColors.borderContainerColor,
      borderWidth: 1,
      splashColor: Colors.transparent,
      borderRadius: BorderRadius.circular(0),
      selectedBorderColor:AppColors.redColor,
      isSelected: isSelected,
      children: [
        Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 40,vertical: 1),
          child: Row(
            children: [
              SvgPicture.asset(AssetsManager.operationLogo,),
              SizedBox(width: 2.w,),
              CustomTextWidget(title: AppStrings.operation,)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40,vertical: 1),
          child: Row(
            children: [
              SvgPicture.asset(AssetsManager.partnerLogo),
              SizedBox(width: 2.w,),
              CustomTextWidget(title: AppStrings.partner)
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