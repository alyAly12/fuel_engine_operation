import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../component/custom_text_widget.dart';
import '../component/subtitle_text_widget.dart';
import 'app_colors.dart';



class DialogsServices
{
  static Future<void>appDialog({required BuildContext context,
    required String title,
    required Function fct,
    bool isError = true
  })async{
    return await showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14)
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: SizedBox(),
            contentPadding: EdgeInsets.symmetric(vertical:5.h,horizontal: 2.h),
            title:  Center(child: CustomTextWidget(title: title,fontSize: 10.sp,fontWeight: FontWeight.w500,maxLines: 1,)),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 3.h,),
                  Visibility(
                    visible: isError,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: Colors.grey
                          )
                      ),
                      child: TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          }, child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SubTitleWidget(subTitle: 'Cancel',color: Color(0xff545e69),fontSize: 10.sp,),
                      )),
                    ),
                  ),
                  SizedBox(width: 2.w,),
                  TextButton(onPressed: (){
                    fct();
                    Navigator.pop(context);
                  }, child:  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.activeColor
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SubTitleWidget(subTitle: 'Change',color: Colors.white,fontSize: 10.sp,),
                      ))),
                  SizedBox(width: 6.h,),
                ],
              )
            ],
          );
        });
  }

  static Future<void>warningDialog({required BuildContext context,
    required String title,
    required Function fct,
    bool isError = true
  })async{
    return await showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: const SizedBox(),
            contentPadding: EdgeInsets.symmetric(vertical:2.h,horizontal: 2.h),
            title:  Center(child: CustomTextWidget(title: title,fontSize: 15.sp,fontWeight: FontWeight.w500,maxLines: 1,)),
            actions: [
              Center(
                child: GestureDetector(
                  onTap: (){
                    fct();
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 15.h,
                      height: 5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.activeColor
                      ),
                      child: Center(child: SubTitleWidget(subTitle: 'Ok',color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.bold,))),
                ),
              ),

            ],
          );
        });
  }
}