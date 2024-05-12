import 'package:activation_app/core/component/custom_regular_appBar.dart';
import 'package:activation_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../widgets/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight),
          child: CustomRegularAppBar(
              mainTitle: AppStrings.profile,
              actionTitle: AppStrings.back,
          ),
      ),
      body: const ProfileScreenBody(),
    );
  }
}
