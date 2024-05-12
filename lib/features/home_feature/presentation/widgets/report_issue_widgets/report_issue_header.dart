import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/component/custom_text_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class ReportIssueHeader extends StatelessWidget {
  const ReportIssueHeader({super.key, required this.headerIssue});
final String headerIssue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextWidget(
          title: headerIssue,
          fontSize: 15,
          color: AppColors.darkGrey,
          fontWeight: FontWeight.w400,
        ),
        const Spacer(),
        GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: CustomTextWidget(
              title: AppStrings.cancel,
              fontSize: 12,
              color: AppColors.appBarColor,
              fontWeight: FontWeight.w400,
            )),
      ],
    );
  }
}
