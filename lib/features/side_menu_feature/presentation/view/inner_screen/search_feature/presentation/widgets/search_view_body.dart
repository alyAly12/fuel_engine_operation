import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../../core/utils/app_strings.dart';
import '../../../filter_screen_feature/presentation/widgets/custom_filter_header.dart';

import '../../../filter_screen_feature/presentation/widgets/today_container.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             CustomFilterHeader(headTitle:  AppStrings.search,),
            const TodayContainer(),
          ],
        ),
      ),
    );
  }
}
