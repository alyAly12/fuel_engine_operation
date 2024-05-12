import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class CustomPairingTextField extends StatelessWidget {
  const CustomPairingTextField(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.obscureText,
       this.suffixOnPressed,
      this.validator,
      this.onFieldSubmitted,
      this.onSaved, required this.hintTitle,  this.suffixVisible =false, this.keyType, this.actionType});
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool obscureText;
  final void Function()? suffixOnPressed;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final String hintTitle;
  final bool suffixVisible;
  final TextInputType? keyType;
  final TextInputAction? actionType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      textInputAction: actionType,
      keyboardType: keyType,
      decoration: InputDecoration(
        hintText:hintTitle ,
        hintStyle: TextStyle(fontSize: 10.sp,color: AppColors.lightTitleColor),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffD1DBE2)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff96A6B2)),
        ),
        suffixIcon: Visibility(
          visible:suffixVisible ,
          child: IconButton(
            onPressed: suffixOnPressed,
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
            ),
          ),
        ),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: AppColors.redColor)),
        errorStyle: const TextStyle(fontSize: 14, color: AppColors.redColor),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: AppColors.redColor)),
      ),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
    );
  }
}
