import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/component/custom_text_widget.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets_manager.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
    children: [
    SvgPicture.asset(AssetsManager.partnerLogo),
    const SizedBox(width: 2,),
    CustomTextWidget(title: AppStrings.partner)
    ],
    ),);
  }
}
