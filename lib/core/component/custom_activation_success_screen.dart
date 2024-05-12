import 'package:activation_app/core/component/custom_regular_appBar.dart';
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

class CustomActivationSuccess extends StatelessWidget {
  const CustomActivationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight),
          child: CustomRegularAppBar(mainTitle: AppStrings.vehicleActivation,
              actionTitle: '',isVisible: false,)
      ),
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Lottie.asset(AssetsManager.check,height: 17.h,animate:false ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextWidget(
            title: AppStrings.vehicle,
            fontSize: 15.sp,
            color:AppColors.appBarColor,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTextWidget(
            title: AppStrings.activatedSuccessfully,
            fontSize: 15.sp,
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
    );
  }
}
