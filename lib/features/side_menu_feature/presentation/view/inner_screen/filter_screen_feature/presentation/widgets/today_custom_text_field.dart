import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/all_day_button.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/custom_filter_text_field.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/today_container.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../core/utils/app_strings.dart';

class TodayCustomTextField extends StatefulWidget {
  const TodayCustomTextField({
    super.key,
  });


  @override
  State<TodayCustomTextField> createState() => _TodayCustomTextFieldState();
}

class _TodayCustomTextFieldState extends State<TodayCustomTextField> {
  late TextEditingController toController;
  late TextEditingController fromController;
  @override
  void initState() {
    toController =TextEditingController();
    fromController =TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    toController.dispose();
    fromController.dispose();
    super.dispose();
  }

  bool _todayPressed = false;
  bool _allDayPressed =false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TodayDateContainer(
          buttonColor: _todayPressed ? AppColors.redColor : Colors.white,
          titleColor:
          _todayPressed ? Colors.white : AppColors.appBarColor,
          border: _todayPressed
              ? Border.all(color: Colors.transparent, width: 0.7)
              : Border.all(color: AppColors.orderNumberColor, width: 0.7),
          onTap: () {
            setState(() {
              _todayPressed = !_todayPressed;
            });
          },
        ),
        SizedBox(height: 2.h,),
        Row(

          children: [
            Flexible(
              flex: 1,
              child: CustomFilterTextField(
                  enabled: _todayPressed,
                  controller: toController,
                  fillColor: _todayPressed?Colors.white:const Color(0xffe6eaee),
                  labelText: AppStrings.from,
                onTap: ()async{},
              ),
            ),
            SizedBox(width: 4.w,),
            Flexible(
              flex: 1,
              child: TextFormField(
                enabled:_todayPressed ,
                readOnly: true,
                showCursor: false,
                onTap:  ()async {
                  TimeOfDay _dateTime = TimeOfDay.now();
                  FocusScope.of(context).requestFocus(FocusNode());
                  TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: _dateTime,
                      initialEntryMode: TimePickerEntryMode.dial
                  );
                  if(picked != null && picked != _dateTime){
                    fromController.text = picked.format(context).toString();
                    setState(() {
                      _dateTime = picked;
                    });
                  }else{
                    _dateTime;
                  }
                } ,
                controller:fromController,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                    fillColor: _todayPressed?Colors.white:Color(0xffe6eaee),
                    filled: true,
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 18,10,0),
                    labelText:AppStrings.to,
                    labelStyle: const TextStyle(
                        color: AppColors.orderNumberColor,
                        fontSize: 13
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: AppColors.orderNumberColor
                        )
                    )
                ),
              ),
            ),
            Flexible(

              child: AllDayButton(
                buttonColor: _allDayPressed ? AppColors.redColor : Colors.white,
                titleColor:
                _allDayPressed ? Colors.white : AppColors.appBarColor,
                border: _allDayPressed
                    ? Border.all(color: Colors.transparent, width: 0.7)
                    : Border.all(color: AppColors.orderNumberColor, width: 0.7),
                onTap: () {
                  setState(() {
                    _allDayPressed = !_allDayPressed;
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
