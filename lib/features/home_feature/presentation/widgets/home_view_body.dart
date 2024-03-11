import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import 'custom_header_container.dart';
import 'last_active_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 7.h,),
         const CustomHeaderContainer(),
        Padding(
          padding:  EdgeInsets.only(top: 3.h,bottom: 3.h),
          child: CustomTextWidget(title: AppStrings.lastActive,color: AppColors.lightTitleColor,fontWeight: FontWeight.w400,),
        ),
           Expanded(child: ScrollShadow(
             size: 15,
            color: Colors.grey.shade300,
              child: const LastActiveList()))
      ],
    );
  }
}



