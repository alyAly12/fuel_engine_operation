import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';

class StartScanButton extends StatelessWidget {
  const StartScanButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.topCenter,
        child: CustomTextWidget(
          title: AppStrings.start,
          color: AppColors.lightTitleColor,
          fontWeight: FontWeight.normal,
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
