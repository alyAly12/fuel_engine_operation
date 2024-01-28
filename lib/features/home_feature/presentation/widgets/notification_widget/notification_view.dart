import 'package:activation_app/core/component/custom_regular_appBar.dart';
import 'package:activation_app/core/utils/app_strings.dart';
import 'package:activation_app/features/home_feature/presentation/widgets/notification_widget/notification_view_body.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight),
          child: CustomRegularAppBar(
              mainTitle: AppStrings.notification,
              actionTitle: AppStrings.back
          ),),
      body: const NotificationViewBody(),
    );
  }
}
