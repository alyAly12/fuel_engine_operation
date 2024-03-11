import 'package:activation_app/core/component/subtitle_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../features/home_feature/presentation/widgets/custom_header_container.dart';
import '../utils/app_colors.dart';
import '../utils/app_route.dart';
import '../utils/app_strings.dart';
import '../utils/assets_manager.dart';



class EmptyHomeScreen extends StatelessWidget {
  const EmptyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).pushReplacement(AppRoute.kHomeView);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Padding(
          padding:EdgeInsets.only(bottom: 5.h),
          child: FloatingActionButton(
            onPressed: (){
              GoRouter.of(context).push(AppRoute.kScanScreen);
            },
            backgroundColor: AppColors.redColor,
            child: const Icon(Icons.add_sharp,size: 30,),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 7.h,),
            const CustomHeaderContainer(),
            SizedBox(height: 15.h,),
            Lottie.asset(AssetsManager.noOrderLottie,fit: BoxFit.cover,height:30.h),
            SizedBox(height: 8.h,),
            SubTitleWidget(subTitle: AppStrings.emptyScreenTitle,fontSize:15.sp ,color:AppColors.lightTitleColor,fontWeight: FontWeight.normal,),
          ],
        ),
      ),
    );
  }
}
