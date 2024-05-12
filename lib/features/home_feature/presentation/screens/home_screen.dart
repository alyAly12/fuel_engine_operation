import 'package:activation_app/core/utils/app_colors.dart';
import 'package:activation_app/core/utils/app_route.dart';
import 'package:activation_app/features/home_feature/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: Padding(
        padding:  EdgeInsets.only(bottom: 5.h),
        child: FloatingActionButton(
            onPressed: (){
              GoRouter.of(context).push(AppRoute.kScanScreen);
            },
          backgroundColor: AppColors.redColor,
          child: const Icon(Icons.add_sharp,size: 30,),
        ),
      ),

      backgroundColor: Colors.white,
      body: const HomeViewBody(),
    );
  }
}
