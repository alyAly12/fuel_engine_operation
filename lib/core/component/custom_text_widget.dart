import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {super.key,
        required this.title,
        this.fontSize ,
        this.maxLines,
        this.color, this.fontWeight});
  final String title;
  final double? fontSize;
  final int? maxLines;
  final Color? color;
  final FontWeight?fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      style: TextStyle(
          color: color,
          fontSize:fontSize??12,
          fontFamily: 'Roboto',
          fontWeight: fontWeight,
          overflow: TextOverflow.ellipsis),
    );
  }
}