import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/today_custom_text_field.dart';
import 'package:flutter/material.dart';

class TodayFilter extends StatelessWidget {
  const TodayFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TodayCustomTextField()
      ],
    );
  }
}
