import 'package:activation_app/core/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../utils/app_colors.dart';
import 'custom_text_widget.dart';


class CustomRegularAppBar extends StatelessWidget {
  const CustomRegularAppBar({
    super.key, required this.mainTitle, required this.actionTitle, this.textSize, this.isVisible =true,
  });
  final String mainTitle;
  final String? actionTitle;
  final double? textSize;
  final bool? isVisible;

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: AppColors.backGroundColor,
      elevation: 0,
      actions: [
        Visibility(
          visible:true ,
          child: TextButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: CustomTextWidget(
              title: actionTitle??'',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.lightTitleColor,
            ),
          ),
        ),
      ],
      centerTitle: true,
      title: CustomTextWidget(title: mainTitle,fontSize: textSize??14.sp,color: AppColors.darkGrey,),
      leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: (){
                 GoRouter.of(context).push(AppRoute.kSideMenuView);
                },
                icon: const Icon(Icons.menu,color:AppColors.darkGrey,size: 30,)
            );
          }
      ),
    );
  }
}
