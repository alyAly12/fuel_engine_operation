import 'package:activation_app/features/home_feature/presentation/widgets/report_issue_widgets/issue_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class IssueTypeList extends StatefulWidget {
  const IssueTypeList({super.key});

  @override
  State<IssueTypeList> createState() => _IssueTypeListState();
}

class _IssueTypeListState extends State<IssueTypeList> {
  bool _wrongImage = false;
  bool _other = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IssueTypeWidget(
          type: AppStrings.wrongImage,
          onTap: () {
            setState(() {
              _wrongImage =! _wrongImage;
            });
          },
          buttonColor: _wrongImage ? AppColors.redColor : Colors.white,
          titleColor:
          _wrongImage ? Colors.white : AppColors.appBarColor,
          border: _wrongImage
              ? Border.all(color: Colors.transparent, width: 0.7)
              : Border.all(
              color: AppColors.orderNumberColor, width: 0.7),
        ),
        SizedBox(
          width: 3.w,
        ),
        IssueTypeWidget(
          type: AppStrings.other,
          onTap: () {
            setState(() {
              _other=!_other;
            });
          },
          buttonColor: _other ? AppColors.redColor : Colors.white,
          titleColor: _other ? Colors.white : AppColors.appBarColor,
          border: _other
              ? Border.all(color: Colors.transparent, width: 0.7)
              : Border.all(
              color: AppColors.orderNumberColor, width: 0.7),
        )
      ],
    );
  }
}
