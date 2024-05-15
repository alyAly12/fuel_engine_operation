
import 'package:activation_app/core/utils/app_colors.dart';
import 'package:activation_app/core/utils/assets_manager.dart';
import 'package:activation_app/features/pairing_feature/presentation/widgets/partner_login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_login_button.dart';
import 'custom_operation_button.dart';
import 'operation_login_view.dart';


class PairingViewBody extends StatefulWidget {
  const PairingViewBody({super.key});

  @override
  State<PairingViewBody> createState() => _PairingViewBodyState();
}

class _PairingViewBodyState extends State<PairingViewBody> with TickerProviderStateMixin{
  late TabController controller;

  List<Widget> tabItems = [
    const CustomOperationButton(),
    const CustomLoginButton()
  ];
  List<Widget> tabView = [
   const OperationLoginView(),
    const PartnerLoginView()
  ];
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Animate(
      child: Padding(
        padding: const EdgeInsets.only(top: 40,left: 5,right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(AssetsManager.appLogo),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TabBar(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                tabAlignment: TabAlignment.fill,
                splashFactory: NoSplash.splashFactory,
                unselectedLabelColor: AppColors.lightTitleColor,
                labelColor:AppColors.lightTitleColor,
                splashBorderRadius: BorderRadius.circular(14),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.transparent,
                indicatorWeight: 0,
                labelStyle: const TextStyle(color: AppColors.redColor),
                unselectedLabelStyle: const TextStyle(color: AppColors.lightTitleColor),
                indicator: BoxDecoration(
                  border: Border.all(color: AppColors.appBarColor),
                  borderRadius: BorderRadius.circular(0),
                  shape: BoxShape.rectangle,
                  color: AppColors.redColor,
                ),
                controller: controller,
                tabs: tabItems,
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TabBarView(clipBehavior: Clip.none, controller: controller, children: tabView),
              ),
            )
          ],
        ).animate().slide(
            begin: const Offset(0, 2),
            end: const Offset(0, 0),
            duration: const Duration(milliseconds:300)
        ),
      ),
    );
  }
}
