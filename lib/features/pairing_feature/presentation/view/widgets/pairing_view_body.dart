
import 'package:activation_app/core/component/custom_log_button.dart';
import 'package:activation_app/core/component/custom_pairing_text_field.dart';
import 'package:activation_app/core/component/custom_text_widget.dart';
import 'package:activation_app/core/utils/app_colors.dart';
import 'package:activation_app/core/utils/app_strings.dart';
import 'package:activation_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_route.dart';
import '../../../../../core/utils/auth_validator.dart';
import 'custom_toggle_buttons.dart';

class PairingViewBody extends StatefulWidget {
  const PairingViewBody({super.key});

  @override
  State<PairingViewBody> createState() => _PairingViewBodyState();
}

class _PairingViewBodyState extends State<PairingViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController userNameController;
  late TextEditingController passWordController;
  late FocusNode passNode;
  late FocusNode userNode;
  bool obscureText = true;

  @override
  void initState() {
    userNameController =TextEditingController();
    passWordController=TextEditingController();
    passNode =FocusNode();
    userNode =FocusNode();
    super.initState();
  }
  @override
  void dispose() {
     userNameController.dispose();
     userNode.dispose();
    super.dispose();
  }

  Future<void> loginFct() async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      GoRouter.of(context).pushReplacement(AppRoute.kEmptyHomeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      child: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(top: 15.h,left: 5.h,right: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(AssetsManager.appLogo),
              SizedBox(
                height: 6.h,
              ),
              const CustomToggleButtons(),
              SizedBox(
                height: 6.h,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(title: AppStrings.userName,fontSize: 10.sp,),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomPairingTextField(
                        actionType: TextInputAction.next,
                        keyType: TextInputType.multiline,
                        controller: userNameController,
                        focusNode: userNode,
                        obscureText: false,
                        validator: (value) {
                          return AuthValidator.userNameValidator(value);
                        },
                        onSaved: (value){
                          userNameController.text=value!;
                        },
                        onFieldSubmitted: (value) {
                          // loginFct();
                        }, hintTitle: AppStrings.name,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomTextWidget(title: AppStrings.passWord,fontSize: 10.sp,),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomPairingTextField(
                        actionType: TextInputAction.done,
                        suffixVisible: true,
                        keyType: TextInputType.number,
                        controller: passWordController,
                        focusNode: passNode,
                        obscureText: obscureText,
                        validator: (value) {
                          return AuthValidator.passWordValidator(value);
                        },
                          suffixOnPressed: () {
                            setState(() {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            });
                          },
                        onSaved: (value){
                          userNameController.text=value!;
                        },
                        onFieldSubmitted: (value) {
                          loginFct();
                        }, hintTitle: AppStrings.passWord,
                      ),
                    ],
                  ),),
              SizedBox(height: 2.h,),
              Align(
                  alignment: Alignment.topRight,
                  child: CustomTextWidget(title: AppStrings.forgetPass,fontSize: 10.sp,color: AppColors.redColor,)),
              SizedBox(
                height: 10.h,
              ),
              CustomLogButton(
                  onPressed: (){
                    loginFct();
                  },
                  color:AppColors.redColor,
                  title: AppStrings.login,
                  textWeight: FontWeight.w500,
                  showIcon: false
              )
            ],
          ).animate().slide(
              begin: const Offset(0, 2),
              end: const Offset(0, 0),
              duration: const Duration(milliseconds:300)
          ),
        ),
      ),
    );
  }
}
