import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/history_feature/presentation/widget/custom_gradient_row.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/history_feature/presentation/widget/history_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:sizer/sizer.dart';


class HistoryScreenBody extends StatelessWidget {
  const HistoryScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(left: 3.w,right: 3.w,top: 4.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft:Radius.circular(8) ,topRight:Radius.circular(8) ),
          color: Colors.white,
          boxShadow: <BoxShadow>[
           BoxShadow(
             color:  Colors.grey.shade300,
             blurRadius: 10.0,
           )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
              child: const CustomGradientRow(),
            ),
             Expanded(child: ScrollShadow(
              color: Colors.grey.shade300,
                child: const HistoryListItem()))
          ],
        ),
      ),
    );
  }
}
