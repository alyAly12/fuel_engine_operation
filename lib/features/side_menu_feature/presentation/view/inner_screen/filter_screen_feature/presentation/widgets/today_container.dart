import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../../../core/utils/app_strings.dart';
class TodayDateContainer extends StatelessWidget {
  const TodayDateContainer({super.key, required this.buttonColor, required this.titleColor, required this.border, required this.onTap, required this.containerName});
  final Color buttonColor;
  final Color titleColor;
  final BoxBorder border;
  final Function onTap;
  final String containerName;
  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    var dateFormat = DateFormat('dd MMM').format(now);
    final String formatted =dateFormat ;
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(20),
            border:border
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 6.w,vertical: 1.5.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextWidget(
                title: containerName,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color:titleColor,
              ),
              const SizedBox(width: 5,),
              CustomTextWidget(
                  title: formatted,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color:titleColor)
            ],
          ),
        ),
      ),
    );
  }
}