import 'package:flutter/material.dart';
import '../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';


class VehicleDetailsRow extends StatelessWidget {
  const VehicleDetailsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 15.5,
          backgroundColor: Colors.grey,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.greyColor,
          ),
        ),
        const SizedBox(width: 30,),
        Padding(
          padding:  const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget(
                title: AppStrings.vehicle,
                fontSize: 12,
                color: AppColors.vehicleColor,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(height: 10,),
              const CustomTextWidget(
                title: '7403-RUN',
                fontSize: 14,
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding:  const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                const CircleAvatar(
                  radius: 5,
                  backgroundColor: AppColors.activeColor,
                ),
                const SizedBox(width: 10,),
                CustomTextWidget(
                  title: AppStrings.activated,
                  fontSize: 12,
                  color: AppColors.vehicleColor,
                  fontWeight: FontWeight.w400,
                ),
              ],),
              const SizedBox(height: 10,),
              const CustomTextWidget(
                title: 'Sun Jul 9, 2023 @10:14 am',
                fontSize: 10,
                color: AppColors.lightTitleColor,
                fontWeight: FontWeight.w300,
              )
            ],
          ),
        ),
      ],
    );
  }
}
