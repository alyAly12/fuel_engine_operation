import 'package:activation_app/core/utils/app_colors.dart';
import 'package:activation_app/features/scan_feature/presentation/widgets/scan_header_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_route.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';

class ScanViewBody extends StatelessWidget {
  const ScanViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ScanHeaderContainer(),
          const Spacer(),
          GestureDetector(
            onTap: (){
              GoRouter.of(context).push(AppRoute.kReportChipIssueView);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AssetsManager.errorMark,),
                SizedBox(width: 1.w,),
                CustomTextWidget(title: AppStrings.reportIssue,fontSize: 10.sp,fontWeight: FontWeight.w400,color: AppColors.redColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
