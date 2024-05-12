
import 'package:activation_app/core/component/custom_log_button.dart';
import 'package:activation_app/core/component/custom_text_widget.dart';
import 'package:activation_app/core/utils/app_colors.dart';
import 'package:activation_app/core/utils/app_route.dart';
import 'package:activation_app/core/utils/app_strings.dart';
import 'package:activation_app/features/home_feature/presentation/widgets/report_issue_widgets/issue_type_list.dart';
import 'package:activation_app/features/home_feature/presentation/widgets/report_issue_widgets/report_issue_header.dart';
import 'package:activation_app/features/home_feature/presentation/widgets/report_issue_widgets/report_issue_text_field.dart';
import 'package:activation_app/features/home_feature/presentation/widgets/vehicle_detail_image_row.dart';
import 'package:activation_app/features/home_feature/presentation/widgets/vehicle_details_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class ReportIssueScreenBody extends StatefulWidget {
  const ReportIssueScreenBody({super.key});

  @override
  State<ReportIssueScreenBody> createState() => _ReportIssueScreenBodyState();
}

class _ReportIssueScreenBodyState extends State<ReportIssueScreenBody> {
  late TextEditingController noteController;
  @override
  void initState() {
    noteController =TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
   noteController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding:EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            SizedBox(height: 9.h,),
             ReportIssueHeader(headerIssue: AppStrings.reportIssue,),
            SizedBox(height: 3.h,),
            const VehicleDetailsRow(),
            SizedBox(height: 3.h,),
            const VehicleDetailImageRow(),
            SizedBox(height: 3.h,),
            CustomTextWidget(title: AppStrings.issue,fontSize: 13.sp,color: AppColors.darkGrey,fontWeight: FontWeight.w400,),
            SizedBox(height: 3.h,),
            const IssueTypeList(),
            SizedBox(height: 4.h,),
             ReportIssueTextField(fieldTitle: AppStrings.notes, controller: noteController,),
            SizedBox(height: 4.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.w),
              child: CustomLogButton(
                  onPressed: (){
                    GoRouter.of(context).pushReplacement(AppRoute.kReportIssueSuccessView);
                  },
                  color: AppColors.redColor,
                  title: AppStrings.send,
                  textWeight: FontWeight.w500,
                  textSize: 14.sp,
                  showIcon: false
              ),
            )
          ],
        ),
      ),
    );
  }
}
