import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_route.dart';
import '../../../../core/utils/app_strings.dart';


class CustomHeaderContainer extends StatelessWidget {
  const CustomHeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.zero,
      color: Colors.white,
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: (){
                      GoRouter.of(context).push(AppRoute.kSideMenuView);
                    },
                    icon: const Icon(Icons.menu,size: 30,color: AppColors.appBarColor,)),
                const SizedBox(width: 15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(title: AppStrings.welcome,color: AppColors.orderNumberColor,fontSize: 10),
                    const CustomTextWidget(title: 'Ahmed Sami',color: AppColors.darkGrey,fontSize: 14),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: (){
                     GoRouter.of(context).push(AppRoute.kNotificationView);
                    },
                    child: const Badge(
                        label: Text('3'),
                        smallSize: 20,
                        largeSize: 20,
                        backgroundColor: AppColors.redColor,
                        child: Icon(Icons.notifications,size: 30,color: AppColors.appBarColor,)),
                  ),
                ),

              ],),
          ],
        ),
      ),
    );
  }
}