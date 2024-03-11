import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/component/subtitle_text_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_route.dart';
import '../../../../../core/utils/assets_manager.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToPairingScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Animate(
      child: Stack(
          children: [
            Positioned(
                bottom: 33.h, left: 0.h,
                child: SvgPicture.asset(
                    AssetsManager.backGroundImage, height: 40.h)),
            Positioned.fill(
              top: 15.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.h),
                    child: SvgPicture.asset(
                      AssetsManager.appLogo2,
                      height: 6.h,
                    ),
                  ),
                  SubTitleWidget(
                    subTitle: 'Activation App v1.20 @2023',
                    fontSize: 8.sp,
                    color: AppColors.smallTitle,
                  ),
                ],
              ),
            ),
          ]),
    ).animate(delay: const Duration(seconds: 2));
  }
  navigateToPairingScreen() {
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
          () async{
        await GoRouter.of(context).pushReplacement(AppRoute.kPairingView);
      },
    );
  }
}
