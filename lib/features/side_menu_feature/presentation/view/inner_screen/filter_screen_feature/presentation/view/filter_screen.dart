import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/widgets/filter_screen_body.dart';
import 'package:flutter/material.dart';


class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: const Scaffold(
       body:FilterScreenBody() ,
      ),
    );
  }
}
