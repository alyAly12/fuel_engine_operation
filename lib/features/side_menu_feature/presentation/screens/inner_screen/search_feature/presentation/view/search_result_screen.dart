import 'package:activation_app/core/component/custom_regular_appBar.dart';
import 'package:activation_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../core/utils/app_route.dart';
import '../widgets/search_result_screen.dart';


class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: Padding(
        padding:  EdgeInsets.only(bottom: 5.h),
        child: FloatingActionButton(
          onPressed: (){
            GoRouter.of(context).push(AppRoute.kFilterView);
          },
          backgroundColor: AppColors.backGroundColor,
          child: const Icon(Icons.filter_list_outlined,size: 30,color:AppColors.darkGrey,),
        ),
      ),
      appBar: PreferredSize(preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight),
          child: CustomRegularAppBar(
              mainTitle: AppStrings.history,
              actionTitle: AppStrings.home,),),
      body: const SearchResultBody(),
    );
  }
}
