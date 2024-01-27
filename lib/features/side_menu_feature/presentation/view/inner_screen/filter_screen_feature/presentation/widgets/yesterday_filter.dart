import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/yesterday_container.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../../../core/functions/pick_time.dart';
import '../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../core/utils/app_strings.dart';
import 'custom_filter_text_field.dart';


class YesterdayCustomContainer extends StatefulWidget {
  const YesterdayCustomContainer({
    super.key, required this.yesterdayToController, required this.yesterdayFromController,
  });
  final TextEditingController yesterdayToController;
  final TextEditingController yesterdayFromController;

  @override
  State<YesterdayCustomContainer> createState() => _YesterdayCustomContainerState();
}

class _YesterdayCustomContainerState extends State<YesterdayCustomContainer> {
  bool _yesterdayPressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YesterdayContainer(
          buttonColor: _yesterdayPressed ? AppColors.redColor : Colors.white,
          titleColor:
          _yesterdayPressed ? Colors.white : AppColors.appBarColor,
          border: _yesterdayPressed
              ? Border.all(color: Colors.transparent, width: 0.7)
              : Border.all(color: AppColors.orderNumberColor, width: 0.7),
          onTap: () {
            setState(() {
              _yesterdayPressed = !_yesterdayPressed;
            });
          },
        ),
        SizedBox(height: 2.h,),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: CustomFilterTextField(
                enabled: _yesterdayPressed,
                controller: widget.yesterdayFromController,
                fillColor: _yesterdayPressed?Colors.white:const Color(0xffe6eaee),
                labelText: AppStrings.from,
                onTap: ()async{
                  await pickTime(controller: widget.yesterdayFromController, context: context);
                  setState(() {});
                },
              ),
            ),
            SizedBox(width: 4.w,),
            Flexible(
              flex: 1,
              child: CustomFilterTextField(
                enabled: _yesterdayPressed,
                controller: widget.yesterdayToController,
                fillColor: _yesterdayPressed?Colors.white:const Color(0xffe6eaee),
                labelText: AppStrings.to,
                onTap: ()async{
                  await pickTime(controller: widget.yesterdayToController, context: context);
                  setState(() {});
                },
              ),
            ),
            Flexible(
                flex: 1,
                child: SizedBox(width: 4.w,)),
          ],
        ),
      ],
    );
  }
}
