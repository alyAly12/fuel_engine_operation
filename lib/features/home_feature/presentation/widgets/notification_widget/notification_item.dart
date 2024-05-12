import 'package:activation_app/core/component/custom_text_widget.dart';
import 'package:activation_app/core/utils/app_colors.dart';
import 'package:activation_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.containerColor});
final Color containerColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        border: Border.all(
          color:AppColors.containerColor,
          width: 2
        )
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 3.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.notifications_outlined,
              size: 3.h,
            ),
            SizedBox(
              width: 3.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  title: AppStrings.systemRequirement,
                  color: AppColors.darkGrey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 1.h,
                ),
                 CustomTextWidget(
                  title: 'New update in refund policy',
                  color: AppColors.lightTitleColor,
                  fontSize: 10.sp,
                ),
                SizedBox(
                  height: 1.h,
                ),
                 CustomTextWidget(
                  title: '2 days ago',
                  color: AppColors.lightTitleColor,
                  fontSize: 10.sp,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
