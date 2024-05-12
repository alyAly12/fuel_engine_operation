import 'package:flutter/material.dart';

import '../widgets/filter_screen_body.dart';


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
