import 'package:activation_app/features/scan_feature/presentation/widgets/scan_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: ()async {
              GoRouter.of(context).pop();
              await Future.delayed(const Duration(seconds: 1));
              // await FlutterNfcKit.finish();
            },
            child: CustomTextWidget(
              title: AppStrings.cancel,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.lightTitleColor,
            ),),
        ],
      ),
      body: const ScanViewBody(),
    );
  }
}
