import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/history_feature/presentation/widget/history_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HistoryListItem extends StatelessWidget {
  const HistoryListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding:  EdgeInsets.only(top: 1.h),
        itemBuilder: (context,index){
          return const HistoryItem();
        },
        separatorBuilder: (context,index){
          return SizedBox(height: 0.1.h,);
        },
        itemCount: 10);
  }
}
