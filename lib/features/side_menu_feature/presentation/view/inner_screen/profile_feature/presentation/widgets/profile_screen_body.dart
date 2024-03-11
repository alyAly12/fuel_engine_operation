import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../core/utils/app_strings.dart';
import '../../../../../../../../core/utils/assets_manager.dart';


class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 20.h,
          color: Colors.white,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AssetsManager.person,
                  height: 9.h,
                ),
                SizedBox(width: 4.w,),
                const CustomTextWidget(
                  title: 'Ahmed Ali',
                  color: AppColors.lightTitleColor,

                  fontWeight: FontWeight.w500,
                ),
                const Spacer(),
                Icon(Icons.phone,color: AppColors.lightTitleColor,size: 3.h,),
                SizedBox(width: 1.w,),
                const CustomTextWidget(
                  title: '09543213844',
                  color: AppColors.lightTitleColor,
                  fontWeight: FontWeight.w200,
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 3.h),
          child: Row(
            children: [
              CustomTextWidget(title: AppStrings.status,fontWeight: FontWeight.w500,color: AppColors.lightTitleColor,),
              const Spacer(),
              Container(
                height: 8.h,
                width: 20.h,
                decoration: BoxDecoration(
                    color: AppColors.activeColor,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Center(
                  child: CustomTextWidget(title: AppStrings.active,color: Colors.white,fontWeight: FontWeight.w600,),
                ),
              )

            ],
          ),
        ),
      ],
    );
  }
}
