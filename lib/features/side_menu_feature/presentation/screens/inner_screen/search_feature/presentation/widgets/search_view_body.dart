import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding:  const EdgeInsets.symmetric(horizontal:10),
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
