import 'package:activation_app/core/functions/pick_time.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/custom_filter_text_field.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/today_date_container.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/yesterday_container.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../../../core/component/custom_decorated_line.dart';
import '../../../../../../../../core/component/custom_key_board.dart';
import '../../../../../../../../core/component/custom_log_button.dart';
import '../../../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../core/utils/app_route.dart';
import '../../../../../../../../core/utils/app_strings.dart';
import 'history_filtration_plate.dart';

class TodayContainer extends StatefulWidget {
  const TodayContainer({
    super.key,
  });

  @override
  State<TodayContainer> createState() => _TodayContainerState();
}

class _TodayContainerState extends State<TodayContainer> {
  late TextEditingController toController;
  late TextEditingController fromController;
  late TextEditingController yesterdayFromController;
  late TextEditingController yesterdayToController;
  late TextEditingController vehicleNumber;
  late TextEditingController vehicleCharacter;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late FocusNode numberNode;
  late FocusNode letterNode;

  @override
  void initState() {
    fromController = TextEditingController();
    toController = TextEditingController();
    yesterdayFromController = TextEditingController();
    yesterdayToController = TextEditingController();
    vehicleNumber = TextEditingController();
    vehicleCharacter = TextEditingController();
    numberNode = FocusNode();
    letterNode = FocusNode();
    letterNode.addListener(() {
      _onFocusChange();
    });

    super.initState();
  }

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    yesterdayFromController.dispose();
    yesterdayToController.dispose();
    vehicleNumber.dispose();
    vehicleCharacter.dispose();
    numberNode.dispose();
    letterNode
      ..removeListener(() {
        _onFocusChange();
      })
      ..dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  bool todayPressed = false;
  bool _yesterdayPressed = false;

  Future<void> applyFunction() async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      if (toController.text.isEmpty &&
          fromController.text.isEmpty &&
          yesterdayFromController.text.isEmpty &&
          yesterdayToController.text.isEmpty) {
        Fluttertoast.showToast(
            msg: "Please select a time",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColors.appBarColor,
            textColor: Colors.white,
            fontSize: 16.0);
        return;
      }
      GoRouter.of(context).pushReplacement(AppRoute.kSearchResultScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TodayDateContainer(
            buttonColor: todayPressed ? AppColors.redColor : Colors.white,
            titleColor: todayPressed ? Colors.white : AppColors.appBarColor,
            border: todayPressed
                ? Border.all(color: Colors.transparent, width: 0.7)
                : Border.all(color: AppColors.orderNumberColor, width: 0.7),
            onTap: () {
              setState(() {
                todayPressed = !todayPressed;
              });
            },
            containerName: AppStrings.today,
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: CustomFilterTextField(
                  enabled: todayPressed,
                  controller: fromController,
                  fillColor:
                      todayPressed ? Colors.white : const Color(0xffe6eaee),
                  labelText: AppStrings.from,
                  onTap: () async {
                    await pickTime(controller: fromController, context: context);
                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              Flexible(
                flex: 1,
                child: CustomFilterTextField(
                  enabled: todayPressed,
                  controller: toController,
                  fillColor:
                      todayPressed ? Colors.white : const Color(0xffe6eaee),
                  labelText: AppStrings.to,
                  onTap: () async {
                    await pickTime(controller: toController, context: context);
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YesterdayContainer(
                buttonColor:
                    _yesterdayPressed ? AppColors.redColor : Colors.white,
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
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomFilterTextField(
                      enabled: _yesterdayPressed,
                      controller: yesterdayFromController,
                      fillColor: _yesterdayPressed
                          ? Colors.white
                          : const Color(0xffe6eaee),
                      labelText: AppStrings.from,
                      onTap: () async {
                        await pickTime(
                            controller: yesterdayFromController,
                            context: context);
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomFilterTextField(
                      enabled: _yesterdayPressed,
                      controller: yesterdayToController,
                      fillColor: _yesterdayPressed
                          ? Colors.white
                          : const Color(0xffe6eaee),
                      labelText: AppStrings.to,
                      onTap: () async {
                        await pickTime(
                            controller: yesterdayToController, context: context);
                        setState(() {});
                      },
                    ),
                  ),

                ],
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomTextWidget(
            title: AppStrings.selectVehicle,
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.appBarColor,
          ),
          SizedBox(
            height: 3.h,
          ),
          HistoryFiltrationPlateContainer(
              carNum: vehicleNumber,
              carLetter: vehicleCharacter,
              letterNode: letterNode,
              numberNode: numberNode),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 6,
                child: CustomDecoratedTextLine(title: AppStrings.numbers),
              ),
              SizedBox(
                width: 8.w,
              ),
              Flexible(
                flex: 5,
                child: CustomDecoratedTextLine(title: AppStrings.letters),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: CustomLogButton(
                onPressed: () {
                  applyFunction();
                },
                color: (todayPressed || _yesterdayPressed)
                    ? AppColors.redColor
                    : AppColors.orderNumberColor,
                title: AppStrings.search,
                textWeight: FontWeight.w500,
                showIcon: false),
          ),
          letterNode.hasFocus
              ? CustomKeyBoard(
                  controller: vehicleCharacter, focusNode: letterNode)
              : Container(),
        ],
      ),
    );
  }
}
