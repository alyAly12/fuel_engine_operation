import 'package:activation_app/core/component/custom_regular_appBar.dart';
import 'package:activation_app/core/component/subtitle_text_widget.dart';
import 'package:activation_app/core/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
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
          padding:const EdgeInsets.only(bottom: 15),
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
                  const SizedBox(height: 20,),
                  Lottie.asset(AssetsManager.noOrderLottie,fit: BoxFit.cover,height:200),
                  const SizedBox(height: 20,),
                  SubTitleWidget(subTitle: AppStrings.emptyScreenTitle,fontSize:15 ,color:AppColors.lightTitleColor,fontWeight: FontWeight.normal,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
