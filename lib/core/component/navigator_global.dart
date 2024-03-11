import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:toastification/toastification.dart';

import '../utils/app_colors.dart';
import '../utils/app_consts.dart';

class GlobalNavigator {
  static showAlertDialog({required String text,required IconData goIcon,required Color bkColor,required Color iconColor}) {
    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:bkColor ,
          contentPadding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.w),
          content: Container(
            height: 5.h,
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SvgPicture.asset('assets/images/4g.svg'),
                const SizedBox(width: 2,),
                Text(text),
                const SizedBox(width: 2,),
                Icon(goIcon,color: iconColor,),
                const SizedBox(width: 1,),
                const VerticalDivider(thickness: 1,color: Colors.grey,),
                TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, child: const Text('ok'))
              ],
            ),
          ),

        );
      },
    );
  }
  static showNotificationDialog({required String text,required IconData goIcon,required Color bkColor,required Color iconColor}){

    toastification.show(
      context:navigatorKey.currentContext!,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(days: 1),
      title: const Text('Check Connection'),
      // you can also use RichText widget for title and description parameters
      description: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text( text,style: const TextStyle(color: AppColors.appBarColor)),
          const Text('Ok')
        ],),
      alignment: Alignment.bottomRight,
      direction: TextDirection.ltr,
      icon:  Icon(goIcon),
      primaryColor: iconColor,
      backgroundColor: bkColor,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: false,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: true,
      pauseOnHover: false,
      dragToClose: true,
      applyBlurEffect: true,
    );
  }
}