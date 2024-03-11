import 'package:flutter/material.dart';
import '../../../../../../../../core/component/custom_gradient_container.dart';
import '../../../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../core/utils/app_strings.dart';

class CustomGradientRow extends StatelessWidget {
  const CustomGradientRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const CustomTextWidget(
          title: 'Sun Jul 9, 2023 10:14 am - 5:00 pm',
          color:AppColors.lightTitleColor ,
          fontSize: 12,
        ),
        CustomGradientContainer(
            color: const [
              Color.fromRGBO(134, 230, 201, 1),
              Color.fromRGBO(233, 255, 251, 1),
            ],
            firstTitle: AppStrings.vehicle,
            secTitle:'120'
        )
      ],
    );
  }
}
