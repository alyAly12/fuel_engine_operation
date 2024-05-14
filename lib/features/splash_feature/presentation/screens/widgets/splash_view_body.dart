import 'package:activation_app/core/component/custom_text_widget.dart';
import 'package:activation_app/features/splash_feature/presentation/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_route.dart';
import '../../../../../core/utils/assets_manager.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashSuccessState) {
          Future.delayed(const Duration(seconds: 3), () {
            GoRouter.of(context).pushReplacement(AppRoute.kPairingView);
          });
        } else if (state is SplashFailureState) {
          Fluttertoast.showToast(msg: state.errorMessage);
        }
      },
      child: Animate(
        child: Stack(children: [
          Positioned(
              top: 170,
              left: 0.h,
              child:
                  SvgPicture.asset(AssetsManager.backGroundImage, height: 270)),
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
                    height: 40,
                  ),
                ),
                const SizedBox(height: 30,),
                BlocBuilder<SplashBloc, SplashState>(
                  builder: (context, state) {
                    if (state is SplashSuccessState) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextWidget(
                            title:
                                '${state.splashResponseEntity.splashData!.channelName} V${state.splashResponseEntity.splashData!.lastWorkingVer} ${state.splashResponseEntity.splashData!.copyRight}',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightTitleColor,
                          )
                        ],
                      );
                    } else if (state is SplashFailureState) {
                      return CustomTextWidget(title: state.errorMessage);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )
              ],
            ),
          ),
        ]),
      ),
    ).animate(delay: const Duration(seconds: 2));
  }
}
