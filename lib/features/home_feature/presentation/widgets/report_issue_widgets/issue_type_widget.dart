import 'package:flutter/material.dart';
import '../../../../../core/component/custom_text_widget.dart';

class IssueTypeWidget extends StatelessWidget {
  const IssueTypeWidget({super.key, required this.type, required this.onTap, required this.buttonColor, required this.titleColor, required this.border});
  final String type;
  final Function onTap;
  final Color buttonColor;
  final Color titleColor;
  final BoxBorder border;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(30),
            border: border
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomTextWidget(title: type,fontSize: 12,fontWeight: FontWeight.w600,color:titleColor,),
          ],
        ),
      ),
    );
  }
}
