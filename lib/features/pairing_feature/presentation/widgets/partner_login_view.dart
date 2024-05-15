import 'package:activation_app/features/pairing_feature/domain/entities/login_request_entity.dart';
import 'package:activation_app/features/pairing_feature/presentation/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/component/custom_log_button.dart';
import '../../../../../core/component/custom_pairing_text_field.dart';
import '../../../../../core/component/custom_text_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_route.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/auth_validator.dart';
import '../../../../core/services/service_locator.dart';

class PartnerLoginView extends StatefulWidget {
  const PartnerLoginView({super.key});

  @override
  State<PartnerLoginView> createState() => _PartnerLoginViewState();
}

class _PartnerLoginViewState extends State<PartnerLoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController userNameController;
  late TextEditingController passWordController;
  late FocusNode passNode;
  late FocusNode userNode;
  bool obscureText = true;
  bool loading = false;

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
      setState(() {
        loading = true;
      });
      sl<LoginBloc>().add(LoginUserEvent(LoginRequestEntity(
          userName: userNameController.text,
          password: passWordController.text,
          type: 'partner'))
      );
      setState(() {
        loading = false;
      });
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(title: AppStrings.userName,fontSize: 12,),
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 20,
              ),
              CustomTextWidget(title: AppStrings.passWord,fontSize: 12,),
              const SizedBox(
                height: 10,
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
        const SizedBox(height: 20,),
        Align(
            alignment: Alignment.topRight,
            child: CustomTextWidget(title: AppStrings.forgetPass,fontSize: 12,color: AppColors.redColor,)),
        const SizedBox(
          height: 30,
        ),
        BlocProvider<LoginBloc>.value(
          value: sl(),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if(state is LoginSuccessState){
                Fluttertoast.showToast(
                    backgroundColor: AppColors.pieChartColor,
                    msg: 'Successfully login');
                GoRouter.of(context).pushReplacement(AppRoute.kEmptyHomeScreen);
              }else if(state is LoginFailureState){
                Fluttertoast.showToast(
                  backgroundColor: AppColors.stopColor,
                  msg: state.errorMessage.toString(),
                );
              }
            },
            builder: (context, state) {
              return loading
                  ?const Center(child: CircularProgressIndicator())
                  : CustomLogButton(
              onPressed: (){
                loginFct();
              },
              color:AppColors.redColor,
              textSize: 16,
              title: AppStrings.login,
              textWeight: FontWeight.w500,
              showIcon: false
          );
            },
          ),
        )
      ],
    );
  }
}
