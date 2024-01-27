import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../utils/assets_manager.dart';
import 'custom_text_widget.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({
    super.key,
    required this.productType,
    required this.buttonColor,
    required this.titleColor,
    required this.border,
    required this.onTap,
    required this.radius,
    this.textSize =11,
    this.textWeight=FontWeight.w600, this.showIcon =false,
  });
  final String productType;
  final Color buttonColor;
  final Color titleColor;
  final BoxBorder border;
  final Function onTap;
  final BorderRadiusGeometry radius;
  final double textSize;
  final FontWeight? textWeight;
  final bool showIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: radius, border: border),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 9.w,vertical: 1.4.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextWidget(
                title: productType,
                fontSize: textSize,
                fontWeight: textWeight,
                color: titleColor,
              ),
              SizedBox(width: 1.w,),
              Visibility(
                  visible:showIcon ,
                  child: SvgPicture.asset(AssetsManager.rightSign,height: 1.h,))
            ],
          ),
        ),
      ),
    );
  }
}
