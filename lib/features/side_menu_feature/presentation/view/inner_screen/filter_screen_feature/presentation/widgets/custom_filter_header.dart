import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../../../core/utils/assets_manager.dart';

class CustomFilterHeader extends StatelessWidget {
  const CustomFilterHeader({super.key, required this.headTitle});
final String headTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(title:headTitle,fontSize: 15.sp,),
          GestureDetector(
              onTap: (){
                GoRouter.of(context).pop();
              },
              child: SvgPicture.asset(AssetsManager.closeIcon,height: 20,))
        ],
      ),
    );
  }
}
