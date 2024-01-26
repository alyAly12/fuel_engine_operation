import 'package:activation_app/core/utils/app_route.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/history_feature/presentation/widget/history_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../../core/utils/app_colors.dart';


class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: Padding(
        padding:  EdgeInsets.only(bottom: 5.h),
        child: FloatingActionButton(
          onPressed: (){
          GoRouter.of(context).push(AppRoute.kFilterView);
          },
          backgroundColor: Colors.white,
          child: const Icon(Icons.filter_list_outlined,size: 30,color:AppColors.darkGrey,),
        ),
      ),

      backgroundColor: Colors.white,
      body: const HistoryScreenBody(),
    );
  }
}
