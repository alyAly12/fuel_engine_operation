import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../component/custom_dotted_camera_container.dart';
import '../component/custom_text_widget.dart';
import '../utils/app_dialog.dart';

class PickImageFunction extends StatelessWidget {
  const PickImageFunction({super.key, required this.pickedImage, required this.image, this.imagePickerFun, this.removeTheImage, required this.file, required this.title, this.titleColor});
  final XFile? pickedImage;
  final String image;
  final Function()? imagePickerFun;
  final Function()?removeTheImage;
  final String? file;
  final String title;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return    Column(
      children: [
        if (pickedImage == null) ...[
          CustomDottedCameraContainer(
            color: Colors.grey,
            image: image,
            onTap:imagePickerFun,
          ),]else ...[
          GestureDetector(
            onTap: (){
              DialogsServices.appDialog(
                  context: context,
                  title: 'Want to Change image',
                  fct: (){
                    removeTheImage!();
                  }
              );
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.transparent),
              child: ClipOval(
                child: Image.file(
                  File(file!) ,
                  filterQuality: FilterQuality.high,
                  // cacheHeight: 66,
                  // cacheWidth: 50,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),],
        CustomTextWidget(title: title,color:titleColor?? Colors.white,fontSize: 8.sp,fontWeight: FontWeight.w500,)
      ],
    );
  }
}