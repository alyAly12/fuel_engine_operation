import 'package:activation_app/core/component/custom_regular_appBar.dart';
import 'package:activation_app/core/component/subtitle_text_widget.dart';
import 'package:activation_app/core/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/assets_manager.dart';


class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        GoRouter.of(context).pushReplacement(AppRoute.kHistoryView);
      },
      child: Scaffold(
        floatingActionButton: Padding(
          padding:EdgeInsets.only(bottom: 5.h),
          child: FloatingActionButton(
            onPressed: (){
              GoRouter.of(context).push(AppRoute.kSearchScreen);
            },
            backgroundColor: AppColors.backGroundColor,
            child: const Icon(Icons.search,size: 30,color:AppColors.darkGrey,),
          ),
        ),
        appBar: PreferredSize(
            preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight),
            child: CustomRegularAppBar(
                mainTitle: AppStrings.history,
                actionTitle: AppStrings.back)),
        body: Stack(
          children: [
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 11.h,),
                  Lottie.asset(AssetsManager.noOrderLottie,fit: BoxFit.cover,height:30.h),
                  SizedBox(height: 8.h,),
                  SubTitleWidget(subTitle: AppStrings.emptyScreenTitle,fontSize:15.sp ,color:AppColors.lightTitleColor,fontWeight: FontWeight.normal,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
