import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../../core/component/custom_log_button.dart';
import '../../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../../../../../../../core/utils/auth_validator.dart';
import 'custom_help_text_field.dart';



class HelpAndSupportBody extends StatefulWidget {
  const HelpAndSupportBody({super.key});

  @override
  State<HelpAndSupportBody> createState() => _HelpAndSupportBodyState();
}

class _HelpAndSupportBodyState extends State<HelpAndSupportBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController messageController;
  late FocusNode titleNode;
  late FocusNode messageNode;

  @override
  void initState() {
    titleController =TextEditingController();
    messageController =TextEditingController();
    titleNode =FocusNode();
    messageNode =FocusNode();
    super.initState();
  }
  @override
  void dispose() {
    titleController.dispose();
    messageController.dispose();
    titleNode.dispose();
    messageNode.dispose();
    super.dispose();
  }
  Future<void>sendHelp()async{
    final _isValid = formKey.currentState!.validate();
    if(_isValid){
      // GoRouter.of(context).pushReplacement(AppRoute.kCustomSuccessScreen);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 4.h,horizontal: 2.h),
        child: Form(
          key: formKey,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h,),
                CustomTextWidget(title: AppStrings.title,color: AppColors.orderNumberColor,fontSize: 13.sp,),
                SizedBox(height: 0.1.h,),
                CustomHelpTextForm(
                  controller: titleController,
                  hintText: 'Enter',
                  fieldNode: titleNode,
                  onSubmitted:(value){
                    titleController.text == value;
                  } ,
                  validatorField:(value){
                    return AuthValidator.titleValidator(value);
                  } ,
                ),
                SizedBox(height: 5.h,),
                CustomTextWidget(title: AppStrings.message,color: AppColors.orderNumberColor,fontSize: 13.sp,),
                SizedBox(height: 0.1.h,),
                SizedBox(
                  height: 20.h,
                  child: CustomHelpTextForm(
                    maxLines: 10,
                    controller: messageController,
                    hintText: 'Message',
                    fieldNode: messageNode,
                    onSubmitted:(value){
                      messageController.text == value;
                    } ,
                    validatorField:(value){
                      return AuthValidator.messageValidator(value);
                    } ,
                  ),
                ),
                SizedBox(height: 5.h,),
                SizedBox(
                  height: 7.5.h,
                  child: CustomLogButton(
                      onPressed: (){
                        sendHelp();
                      },
                      color: AppColors.redColor,
                      title: AppStrings.send,
                      textWeight: FontWeight.w500,
                      textSize: 15.sp,
                      showIcon: true
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}