import 'package:activation_app/core/component/custom_regular_appBar.dart';
import 'package:activation_app/core/utils/app_strings.dart';
import 'package:activation_app/features/side_menu_feature/presentation/screens/inner_screen/about_app_feature/widget/about_app_body.dart';
import 'package:flutter/material.dart';


class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight),
          child: CustomRegularAppBar(
              mainTitle: AppStrings.about,
              actionTitle: AppStrings.cancel,
          ),),
      body: const AboutAppBody(),
    );
  }
}
