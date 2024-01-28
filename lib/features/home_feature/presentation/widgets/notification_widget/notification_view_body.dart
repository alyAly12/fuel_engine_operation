import 'package:activation_app/features/home_feature/presentation/widgets/notification_widget/notification_item_list.dart';
import 'package:flutter/material.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        Expanded(child: NotificationItemList())
      ],
    );
  }
}
