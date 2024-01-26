import 'package:activation_app/core/utils/app_dialog.dart';
import 'package:activation_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/component/custom_log_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_route.dart';
import '../../../home_feature/presentation/widgets/report_issue_widgets/issue_type_list.dart';
import '../../../home_feature/presentation/widgets/report_issue_widgets/report_issue_header.dart';
import '../../../home_feature/presentation/widgets/report_issue_widgets/report_issue_text_field.dart';

class ReportChipIssueScreen extends StatefulWidget {
  const ReportChipIssueScreen({super.key});

  @override
  State<ReportChipIssueScreen> createState() => _ReportChipIssueScreenState();
}

class _ReportChipIssueScreenState extends State<ReportChipIssueScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController noteController;
  late TextEditingController chipController;
  @override
  void initState() {
    chipController =TextEditingController();
    noteController =TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    chipController.dispose();
    noteController.dispose();
    super.dispose();
  }
  Future<void>sendIssue()async{
    final isValid = formKey.currentState!.validate();
    if(isValid){
      if(chipController.text.isEmpty){
        return DialogsServices.warningDialog(
            context: context,
            title: 'Enter Chip number',
            fct: (){});
      }
      GoRouter.of(context).pushReplacement(AppRoute.kReportIssueSuccessView);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal: 4.w),
            child: Form(
              key:formKey ,
              child: Column(
                children: [
                  SizedBox(height: 10.h,),
                   ReportIssueHeader(headerIssue: AppStrings.reportChipIssue,),
                  SizedBox(height: 6.h,),
                   ReportIssueTextField(fieldTitle: AppStrings.smartChipNumber, controller: chipController,),
                  SizedBox(height: 8.h,),
                  const IssueTypeList(),
                  SizedBox(height: 8.h,),
                   ReportIssueTextField(fieldTitle: AppStrings.notes, controller: noteController,),
                  SizedBox(height: 8.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                    child: CustomLogButton(
                        onPressed: (){
                          sendIssue();
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
          ),
        ),
      ),
    );
  }
}
