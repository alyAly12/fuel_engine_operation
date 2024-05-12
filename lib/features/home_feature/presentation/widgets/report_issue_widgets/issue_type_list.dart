import 'package:activation_app/features/home_feature/presentation/widgets/report_issue_widgets/issue_type_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class IssueTypeList extends StatefulWidget {
  const IssueTypeList({super.key});

  @override
  State<IssueTypeList> createState() => _IssueTypeListState();
}

class _IssueTypeListState extends State<IssueTypeList> {
  bool _nfcDamage = false;
  bool _nfcNotWell = false;
  bool _nfcDedicate =false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: IssueTypeWidget(
                type: AppStrings.nfcDamage,
                onTap: () {
                  setState(() {
                    _nfcDamage =! _nfcDamage;
                  });
                },
                buttonColor: _nfcDamage ? AppColors.redColor : Colors.white,
                titleColor:
                _nfcDamage ? Colors.white : AppColors.appBarColor,
                border: _nfcDamage
                    ? Border.all(color: Colors.transparent, width: 0.7)
                    : Border.all(
                    color: AppColors.orderNumberColor, width: 0.7),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 1,
              child: IssueTypeWidget(
                type: AppStrings.nfcNotWell,
                onTap: () {
                  setState(() {
                    _nfcNotWell=!_nfcNotWell;
                  });
                },
                buttonColor: _nfcNotWell ? AppColors.redColor : Colors.white,
                titleColor: _nfcNotWell ? Colors.white : AppColors.appBarColor,
                border: _nfcNotWell
                    ? Border.all(color: Colors.transparent, width: 0.7)
                    : Border.all(
                    color: AppColors.orderNumberColor, width: 0.7),
              ),
            )
          ],
        ),
        SizedBox(height: 10,),
        IssueTypeWidget(
          type: AppStrings.nfcDedicate,
          onTap: () {
            setState(() {
              _nfcDedicate=!_nfcDedicate;
            });
          },
          buttonColor: _nfcDedicate ? AppColors.redColor : Colors.white,
          titleColor: _nfcDedicate ? Colors.white : AppColors.appBarColor,
          border: _nfcDedicate
              ? Border.all(color: Colors.transparent, width: 0.7)
              : Border.all(
              color: AppColors.orderNumberColor, width: 0.7),
        )
      ],
    );
  }
}
