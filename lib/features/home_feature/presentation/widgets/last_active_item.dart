import 'package:activation_app/features/home_feature/presentation/widgets/detail_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class LastActiveListItem extends StatelessWidget {
  const LastActiveListItem({super.key, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showModalBottomSheet(
            context: context,
            builder: (context){
              return const DetailsModalSheet();
            });
      },
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 4.0,
              ),
            ],
          ),
          child: Card(
              elevation: 1,
              color: Colors.white,
              child: Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 20),
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
                      padding:  const EdgeInsets.symmetric(vertical: 30),
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
                          CustomTextWidget(
                            title: '7403-RUN',
                            fontSize: 14.sp,
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
                          CustomTextWidget(
                            title: 'Sun Jul 9, 2023 @10:14 am',
                            fontSize: 12.sp,
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
      ),
    );

  }
}