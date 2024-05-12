import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/component/custom_text_widget.dart';

class CustomLogButton extends StatelessWidget {
  const CustomLogButton(
      {super.key,
        required this.onPressed,
        required this.color,
        required this.title,
        required this.showIcon,
         this.textSize , this.textColor =Colors.white, this.textWeight});
  final void Function() onPressed;
  final Color color;
  final String title;
  final bool showIcon;
  final double?textSize;
  final Color?textColor;
  final FontWeight? textWeight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget(
                title: title,
                fontSize:textSize??14,
                fontWeight:textWeight?? FontWeight.w300,
                color: textColor,
              ),
              Visibility(
                  visible: showIcon,
                  child: const Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.white,
                    size: 20,
                  ))
            ],
          )),
    );
  }
}
