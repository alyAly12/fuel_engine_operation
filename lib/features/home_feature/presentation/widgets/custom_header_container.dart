import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_route.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';

class CustomHeaderContainer extends StatelessWidget {
  const CustomHeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.zero,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: (){
                    GoRouter.of(context).push(AppRoute.kSideMenuView);
                  },
                  icon: const Icon(Icons.menu,size: 30,color: AppColors.appBarColor,)),
              SizedBox(width: 2.w,),
              CircleAvatar(
                radius: 4.h,
                backgroundColor: Colors.transparent,
                child: Image.asset(AssetsManager.partnerImage),
              ),
              SizedBox(width: 2.w,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(title: AppStrings.welcome,color: AppColors.orderNumberColor,fontSize: 9.sp,),
                  CustomTextWidget(title: 'Ahmed Sami',color: AppColors.darkGrey,fontSize: 12.sp,),
                ],
              ),
              const Spacer(),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 2.w),
                child: GestureDetector(
                  onTap: (){
                   GoRouter.of(context).push(AppRoute.kNotificationView);
                  },
                  child: Badge(
                      label: const Text('3'),
                      smallSize: 1.6.h,
                      largeSize: 2.h,
                      backgroundColor: AppColors.redColor,
                      child: const Icon(Icons.notifications,size: 30,color: AppColors.appBarColor,)),
                ),
              ),

            ],),

          Padding(
            padding:  EdgeInsets.only(bottom: 1.5.h),
            child: CustomTextWidget(title: AppStrings.lastActive,color: AppColors.lightTitleColor,),
          )
        ],
      ),
    );
  }
}