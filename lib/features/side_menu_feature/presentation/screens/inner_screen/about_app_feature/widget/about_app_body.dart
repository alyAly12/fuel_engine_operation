import 'package:activation_app/core/component/custom_text_widget.dart';
import 'package:activation_app/core/utils/app_colors.dart';
import 'package:activation_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutAppBody extends StatelessWidget {
  const AboutAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal:20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(AssetsManager.appLogo),
          const SizedBox(
            height: 30,
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: CustomTextWidget(
              title: 'Activation App v1.20 @2023',
              color: AppColors.appBarColor,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 30,),
          const CustomTextWidget(title: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
            maxLines: 9,
            fontSize: 12,
          )
        ],
      ),
    );
  }
}
