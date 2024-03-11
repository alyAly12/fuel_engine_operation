import 'package:activation_app/core/component/custom_text_button.dart';
import 'package:activation_app/core/utils/app_route.dart';
import 'package:activation_app/core/utils/app_strings.dart';
import 'package:activation_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';

class SideMenuScreen extends StatelessWidget {
  const SideMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: (){
                  GoRouter.of(context).pop();
                },
                child: SvgPicture.asset(AssetsManager.closeIcon)),
            SizedBox(
              height: 10.h,
            ),
            CustomTextButton(
              title: AppStrings.home,
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRoute.kHomeView);
              },
            ),
            // CustomTextButton(
            //   title: AppStrings.setting,
            //   onPressed: () {
            //   //   TODO: add setting screen
            //   },
            // ),
            CustomTextButton(
              title: AppStrings.profile,
              onPressed: () {
               GoRouter.of(context).pushReplacement(AppRoute.kProfileScreen);
              },
            ),
            CustomTextButton(
              title: AppStrings.history,
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRoute.kEmptyView);
              },
            ),
            CustomTextButton(
              title: AppStrings.help,
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRoute.kHelpView);
              },
            ),
            CustomTextButton(
              title: AppStrings.aboutTheApp,
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRoute.kAboutAppView);
              },
            ),
            CustomTextButton(
              title: AppStrings.logOut,
              onPressed: () {
                //   TODO: add logout fun
              },
              textColor: AppColors.redColor,
            ),
            SizedBox(
              height: 10.h,
            ),
            const CustomTextWidget(
              title: 'SyarahApp Operation v1.20 @2023',
              color: AppColors.orderNumberColor,
            )
          ],
        ),
      ),
    );
  }
}
