import 'package:activation_app/core/component/custom_log_button.dart';
import 'package:activation_app/core/component/custom_text_widget.dart';
import 'package:activation_app/core/utils/app_colors.dart';
import 'package:activation_app/core/utils/app_strings.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/custom_filter_header.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/order_product_list.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/order_type_list.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/today_container.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/yesterday_filter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../../../core/utils/app_route.dart';

class FilterScreenBody extends StatefulWidget {
  const FilterScreenBody({super.key});

  @override
  State<FilterScreenBody> createState() => _FilterScreenBodyState();
}

class _FilterScreenBodyState extends State<FilterScreenBody> {
  late TextEditingController toController ;
  late TextEditingController fromController ;
  late TextEditingController yesterdayFromController ;
  late TextEditingController yesterdayToController ;
  final GlobalKey<FormState>formKey = GlobalKey<FormState>();
  @override
  void initState() {
    fromController = TextEditingController();
    toController =TextEditingController();
    yesterdayFromController = TextEditingController();
    yesterdayToController =TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
   fromController.dispose();
   toController.dispose();
   yesterdayFromController.dispose();
   yesterdayToController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Future<void>applyFunction()async{
      final isValid = formKey.currentState!.validate();
      FocusScope.of(context).unfocus();
      if(isValid){
        if(toController.text.isEmpty && fromController.text.isEmpty && yesterdayFromController.text.isEmpty && yesterdayToController.text.isEmpty){
          Fluttertoast.showToast(
              msg: "Please select a day",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor:AppColors.appBarColor,
              textColor: Colors.white,
              fontSize: 16.0
          );
          return ;
        }
        GoRouter.of(context).pushReplacement(AppRoute.kHistoryView);
      }
    }
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.w),
      child:  Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const CustomFilterHeader(),
               TodayContainer(toController: toController, fromController: fromController,),
            SizedBox(height: 5.h,),
              YesterdayCustomContainer(yesterdayToController: yesterdayToController, yesterdayFromController: yesterdayFromController,),
            SizedBox(height: 5.h,),
            CustomTextWidget(title: AppStrings.orderType,fontSize: 10.sp,fontWeight: FontWeight.w600,color: AppColors.appBarColor,),
            SizedBox(height: 2.h,),
            const OrderTypeList(),
            SizedBox(height: 5.h,),
            CustomTextWidget(title: AppStrings.product,fontSize: 10.sp,fontWeight: FontWeight.w600,color: AppColors.appBarColor,),
            SizedBox(height: 2.h,),
            const ProductTypeList(),
            SizedBox(height: 5.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.w),
              child: CustomLogButton(
                  onPressed: (){
                    applyFunction();
                  },
                  color: AppColors.orderNumberColor,
                  title: AppStrings.apply,
                  textSize: 13.sp,
                  textWeight: FontWeight.w500,
                  showIcon: false
              ),
            )
          ],
        ),
      ),
    );
  }
}
