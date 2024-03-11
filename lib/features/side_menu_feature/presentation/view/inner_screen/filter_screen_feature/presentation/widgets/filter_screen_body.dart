
import 'package:activation_app/core/utils/app_strings.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/custom_filter_header.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/today_filter_container.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class FilterScreenBody extends StatelessWidget {
  const FilterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFilterHeader(headTitle:  AppStrings.historyFilter,),
               const TodayFilterContainer(),

          ],
        ),
      ),
    );
  }
}
