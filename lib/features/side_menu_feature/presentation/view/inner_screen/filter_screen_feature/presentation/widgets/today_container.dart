import 'package:activation_app/core/functions/pick_time.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/all_day_button.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/custom_filter_text_field.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/today_date_container.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../core/utils/app_strings.dart';

class TodayContainer extends StatefulWidget {
  const TodayContainer({
    super.key, required this.toController, required this.fromController,
  });
final TextEditingController toController;
final TextEditingController fromController;

  @override
  State<TodayContainer> createState() => _TodayContainerState();
}

class _TodayContainerState extends State<TodayContainer> {


   bool todayPressed  =false;
   bool allDayPressed  = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TodayDateContainer(
          buttonColor: todayPressed ? AppColors.redColor : Colors.white,
          titleColor:
          todayPressed ? Colors.white : AppColors.appBarColor,
          border: todayPressed
              ? Border.all(color: Colors.transparent, width: 0.7)
              : Border.all(color: AppColors.orderNumberColor, width: 0.7),
          onTap: () {
            setState(() {
              todayPressed =! todayPressed;
            });
          }, containerName:AppStrings.today,
        ),
        SizedBox(height: 2.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 1,
              child: CustomFilterTextField(
                  enabled: todayPressed,
                  controller: widget.toController,
                  fillColor: todayPressed?Colors.white:const Color(0xffe6eaee),
                  labelText: AppStrings.from,
                onTap: ()async{
                  await pickTime(controller: widget.toController, context: context);
                  setState(() {});
                },
              ),
            ),
            SizedBox(width: 2.w,),
            Flexible(
              flex: 1,
              child: CustomFilterTextField(
                enabled: todayPressed,
                controller: widget.fromController,
                fillColor: todayPressed?Colors.white:const Color(0xffe6eaee),
                labelText: AppStrings.to,
                onTap: ()async{
                  await pickTime(controller: widget.fromController, context: context);
                  setState(() {});
                },
              ),
            ),
            SizedBox(width:2.w ,),
            Flexible(
              flex: 1,
              child: AllDayButton(
                buttonColor:allDayPressed ? AppColors.redColor : Colors.white,
                titleColor:
                allDayPressed ? Colors.white : AppColors.appBarColor,
                border: allDayPressed
                    ? Border.all(color: Colors.transparent, width: 0.7)
                    : Border.all(color: AppColors.orderNumberColor, width: 0.7),
                onTap: () {
                  setState(() {
                    allDayPressed = !allDayPressed;
                  });
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
