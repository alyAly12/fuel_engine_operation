import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../../../core/utils/app_strings.dart';


class YesterdayContainer extends StatelessWidget {
  const YesterdayContainer({super.key, required this.buttonColor, required this.titleColor, required this.border, required this.onTap});

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
          padding:  const EdgeInsets.symmetric(horizontal:30,vertical: 14),
          child: CustomTextWidget(
            title: AppStrings.yesterday,
            fontSize:12,
            fontWeight: FontWeight.w600,
            color:titleColor,
          ),
        ),
      ),
    );
  }
}
