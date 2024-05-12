
import 'package:activation_app/core/utils/app_strings.dart';
import 'package:activation_app/features/side_menu_feature/presentation/screens/inner_screen/filter_screen_feature/presentation/widgets/today_filter_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_filter_header.dart';

class FilterScreenBody extends StatelessWidget {
  const FilterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
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
