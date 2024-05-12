import 'package:activation_app/core/utils/app_route.dart';
import 'package:activation_app/features/home_feature/presentation/widgets/vehicle_detail_image_row.dart';
import 'package:activation_app/features/home_feature/presentation/widgets/vehicle_details_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';


class DetailsModalSheet extends StatelessWidget {
  const DetailsModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding:  const EdgeInsets.symmetric(vertical: 30,horizontal:25 ),
      child: Column(
        children: [
          Row(
            children: [
              CustomTextWidget(title: AppStrings.vehicleDetails,color: AppColors.darkGrey,fontSize: 14,),
              const Spacer(),
              SvgPicture.asset(AssetsManager.errorLogo),
              const SizedBox(width: 10,),
              GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push(AppRoute.kReportIssueView);
                  },
                  child: CustomTextWidget(title: AppStrings.report,color: AppColors.redColor,fontSize: 12,)),
            ],
          ),
          const SizedBox(height: 40,),
          const VehicleDetailsRow(),
          const SizedBox(height: 40,),
          const VehicleDetailImageRow()
        ],
      ),
    ) ;
  }
}
