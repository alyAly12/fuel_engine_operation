import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding:  EdgeInsets.symmetric(vertical: 40,horizontal:10),
        child: Form(
          key: formKey,
          child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(title: AppStrings.title,color: AppColors.orderNumberColor,fontSize: 13.sp,),
                const SizedBox(height:5),
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
                const SizedBox(height: 20,),
                CustomTextWidget(title: AppStrings.message,color: AppColors.orderNumberColor,fontSize: 13.sp,),
                const SizedBox(height: 5,),
                SizedBox(
                  height: 120,
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
                const SizedBox(height: 30,),
                SizedBox(
                  height: 50,
                  child: CustomLogButton(
                      onPressed: (){
                        sendHelp();
                      },
                      color: AppColors.redColor,
                      title: AppStrings.send,
                      textWeight: FontWeight.w500,
                      textSize: 15,
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