import 'package:flutter/material.dart';
import '../../../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../core/utils/app_strings.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Card(
            elevation: 1,
            color: Colors.white,
            child: Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 15.5,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.greyColor,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Padding(
                    padding:  const EdgeInsets.symmetric(vertical: 1),
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
                  const Padding(
                    padding:  EdgeInsets.symmetric(vertical: 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        CustomTextWidget(
                          title: 'Sun Jul 9, 2023 @10:14 am',
                          fontSize: 12,
                          color: AppColors.lightTitleColor,
                          fontWeight: FontWeight.w300,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
