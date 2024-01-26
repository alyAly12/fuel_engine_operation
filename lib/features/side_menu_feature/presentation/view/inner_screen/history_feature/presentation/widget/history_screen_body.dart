import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/history_feature/presentation/widget/history_list_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../home_feature/presentation/widgets/custom_header_container.dart';

class HistoryScreenBody extends StatelessWidget {
  const HistoryScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 6.h,),
        const CustomHeaderContainer(),
        const Expanded(child: HistoryListItem())
      ],
    );
  }
}
