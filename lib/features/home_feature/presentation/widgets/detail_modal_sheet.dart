import 'package:activation_app/core/utils/app_route.dart';
import 'package:activation_app/features/home_feature/presentation/widgets/vehicle_detail_image_row.dart';
import 'package:activation_app/features/home_feature/presentation/widgets/vehicle_details_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';


class DetailsModalSheet extends StatelessWidget {
  const DetailsModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding:  EdgeInsets.symmetric(vertical: 3.h,horizontal: 5.w),
      child: Column(
        children: [
          Row(
            children: [
              CustomTextWidget(title: AppStrings.vehicleDetails,color: AppColors.darkGrey,fontSize: 14.sp,),
              const Spacer(),
              SvgPicture.asset(AssetsManager.errorLogo),
              SizedBox(width: 1.w,),
              GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push(AppRoute.kReportIssueView);
                  },
                  child: CustomTextWidget(title: AppStrings.report,color: AppColors.redColor,fontSize: 10.sp,)),
            ],
          ),
          SizedBox(height: 4.h,),
          const VehicleDetailsRow(),
          SizedBox(height: 4.h,),
          const VehicleDetailImageRow()

        ],
      ),
    ) ;
  }
}
