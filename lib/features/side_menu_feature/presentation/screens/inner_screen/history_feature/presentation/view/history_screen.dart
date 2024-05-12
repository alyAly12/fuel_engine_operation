import 'package:activation_app/core/component/custom_regular_appBar.dart';
import 'package:activation_app/core/utils/app_route.dart';
import 'package:activation_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../../core/utils/app_colors.dart';
import '../widget/history_screen_body.dart';


class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight),
          child: CustomRegularAppBar(
            backColor: Colors.white,
              mainTitle: AppStrings.history,
              actionTitle: AppStrings.back,
          ),),
      floatingActionButton: Padding(
        padding:  EdgeInsets.only(bottom: 5.h),
        child: FloatingActionButton(
          onPressed: (){
          GoRouter.of(context).push(AppRoute.kFilterView);
          },
          backgroundColor: AppColors.backGroundColor,
          child: const Icon(Icons.search,size: 30,color:AppColors.darkGrey,),
        ),
      ),

      backgroundColor: Colors.white,
      body: const HistoryScreenBody(),
    );
  }
}
