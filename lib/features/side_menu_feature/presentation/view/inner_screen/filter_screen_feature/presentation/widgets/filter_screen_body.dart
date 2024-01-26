import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/custom_filter_header.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/today_filter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FilterScreenBody extends StatelessWidget {
  const FilterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.w),
      child: const Column(
        children: [
         CustomFilterHeader(),
          TodayFilter()
        ],
      ),
    );
  }
}
