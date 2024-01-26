import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../core/utils/app_strings.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Card(
            elevation: 1,
            color: Colors.white,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 3.w),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 15.5,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.greyColor,
                    ),
                  ),
                  SizedBox(width: 3.w,),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 3.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                          title: AppStrings.vehicle,
                          fontSize: 10.sp,
                          color: AppColors.vehicleColor,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 1.h,),
                        CustomTextWidget(
                          title: '7403-RUN',
                          fontSize: 12.sp,
                          color: AppColors.darkGrey,
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 3.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 1.h,),
                        CustomTextWidget(
                          title: 'Sun Jul 9, 2023 @10:14 am',
                          fontSize: 10.sp,
                          color: AppColors.lightTitleColor,
                          fontWeight: FontWeight.w300,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
