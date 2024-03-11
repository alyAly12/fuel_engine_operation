
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../utils/app_colors.dart';
import '../utils/assets_manager.dart';
import 'custom_text_button.dart';
import 'custom_text_widget.dart';

class CheckConnectionScreen extends StatefulWidget {
  const CheckConnectionScreen(
      {super.key,});

  @override
  State<CheckConnectionScreen> createState() => _CheckConnectionScreenState();
}

class _CheckConnectionScreenState extends State<CheckConnectionScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.lightTitleColor,
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical:2.h ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            height:40.h,
            width: double.infinity,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(AssetsManager.danger,height: 70,)),
                  SizedBox(height: 3.h,),
                  CustomTextWidget(
                    title: 'Kindly check connection tools :',
                    color: AppColors.darkGrey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 3.h,),
                  CustomTextWidget(
                    title: 'Internet Connection',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color:  AppColors.darkGrey,
                  ),
                  SizedBox(height: 2.h,),
                  CustomTextWidget(
                    title: 'NFC connection',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color:  AppColors.darkGrey,
                  ),
                  SizedBox(height: 2.h,),
                  CustomTextWidget(
                    title: 'GPS location',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color:  AppColors.darkGrey,
                  ),
                  const Spacer(),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: CustomTextButton(
                          title: 'Active connection',
                          textSize: 12.sp,
                          textColor: AppColors.darkGrey,
                          onPressed: (){
                            AppSettings.openAppSettings(type: AppSettingsType.wifi,);
                          }))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}