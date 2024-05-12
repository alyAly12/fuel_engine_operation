import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../utils/app_colors.dart';
import '../utils/app_route.dart';
import '../utils/app_strings.dart';
import '../utils/assets_manager.dart';
import 'custom_rounded_column_button.dart';
import 'custom_text_widget.dart';

class CustomIssueSentSuccess extends StatelessWidget {
  const CustomIssueSentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h,vertical: 15.h),
        child: Column(
          children: [
            Lottie.asset(AssetsManager.check,height: 17.h,animate:false ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextWidget(
              title: AppStrings.issue,
              fontSize: 20.sp,
              color:AppColors.appBarColor,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextWidget(
              title: AppStrings.sent,
              fontSize: 20.sp,
              color:AppColors.appBarColor,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomRoundedColumnButton(
                    onTap: () {
                      GoRouter.of(context).pushReplacement(AppRoute.kScanScreen);
                    },
                    height: 3.5.h,
                    titleColor: AppColors.appBarColor,
                    color: AppColors.pieChartColor,
                    image: AssetsManager.addIcon2,
                    text: AppStrings.newOrder),
                SizedBox(width: 10.w,),
                CustomRoundedColumnButton(
                    onTap: () {
                      GoRouter.of(context).pushReplacement(AppRoute.kHomeView);
                    },
                    height: 3.5.h,
                    titleColor: AppColors.appBarColor,
                    color: AppColors.blackCoat,
                    image: AssetsManager.house,
                    text: AppStrings.home)
              ],
            )
          ],
        ),
      ),
    );
  }
}
