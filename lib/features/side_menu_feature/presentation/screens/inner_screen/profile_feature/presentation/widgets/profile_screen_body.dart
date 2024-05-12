import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
          height: 50,
          color: Colors.white,
          child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AssetsManager.person,
                  height: 24,
                ),
                const SizedBox(width: 5,),
                const CustomTextWidget(
                  title: 'Ahmed Ali',
                  color: AppColors.lightTitleColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                const Spacer(),
                const Icon(Icons.phone,color: AppColors.lightTitleColor,size: 20,),
                const SizedBox(width: 5,),
                const CustomTextWidget(
                  title: '09543213844',
                  fontSize: 12,
                  color: AppColors.lightTitleColor,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
          child: Row(
            children: [
              CustomTextWidget(title: AppStrings.status,fontWeight: FontWeight.w500,color: AppColors.lightTitleColor,fontSize: 14,),
              const Spacer(),
              Container(
                height: 30,
                width: 120.h,
                decoration: BoxDecoration(
                    color: AppColors.activeColor,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Center(
                  child: CustomTextWidget(title: AppStrings.active,color: Colors.white,fontWeight: FontWeight.w600,fontSize: 14,),
                ),
              )

            ],
          ),
        ),
      ],
    );
  }
}
