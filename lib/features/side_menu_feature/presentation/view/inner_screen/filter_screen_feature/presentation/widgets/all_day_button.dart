import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../../../core/utils/app_strings.dart';
class AllDayButton extends StatelessWidget {
  const AllDayButton({super.key, required this.buttonColor, required this.titleColor, required this.border, required this.onTap});
  final Color buttonColor;
  final Color titleColor;
  final BoxBorder border;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
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
          padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.5.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextWidget(
                title: AppStrings.today,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color:titleColor,
              ),
              const SizedBox(width: 5,),
              CustomTextWidget(
                  title: AppStrings.allDay,
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