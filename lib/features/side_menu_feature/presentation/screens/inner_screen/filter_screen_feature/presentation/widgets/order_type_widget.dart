import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/component/custom_text_widget.dart';

class OrderTypeWidget extends StatelessWidget {
  const OrderTypeWidget({super.key, required this.type, required this.onTap, required this.buttonColor, required this.titleColor, required this.border,});
  final String type;
  final Function onTap;
  final Color buttonColor;
  final Color titleColor;
  final BoxBorder border;
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: (){
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(20),
              border: border
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 11.w,vertical: 1.2.h),
            child: CustomTextWidget(title: type,fontSize: 9.sp,fontWeight: FontWeight.w600,color:titleColor,),
          ),
        ),
      );
  }
}
