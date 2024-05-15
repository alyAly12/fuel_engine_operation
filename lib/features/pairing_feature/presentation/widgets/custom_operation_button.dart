import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/component/custom_text_widget.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets_manager.dart';

class CustomOperationButton extends StatelessWidget {
  const CustomOperationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AssetsManager.operationLogo,),
          const SizedBox(width: 5,),
          CustomTextWidget(title: AppStrings.operation,)
        ],
      ),
    );
  }
}
