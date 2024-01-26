import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';

class VehicleDetailImageRow extends StatelessWidget {
  const VehicleDetailImageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 2,
          child: Container(
            height: 20.h,
            width: 40.w,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: AppColors.cancelTitleColor
              ),
              color: Colors.transparent,
              boxShadow: const[
                BoxShadow(
                  color:AppColors.cancelTitleColor,
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: Image.asset(AssetsManager.plates,fit: BoxFit.cover,),
          ),
        ),
        SizedBox(width: 5.w,),
        Card(
          elevation: 2,
          child: Container(
            height: 20.h,
            width: 40.w,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: AppColors.cancelTitleColor
              ),
              color: Colors.transparent,
              // boxShadow: [
              //   BoxShadow(
              //     color:AppColors.cancelTitleColor,
              //     blurRadius: 10.0,
              //   ),
              // ],
            ),
            child: Image.asset(AssetsManager.carImage,fit: BoxFit.cover,),
          ),
        ),
      ],
    );
  }
}
