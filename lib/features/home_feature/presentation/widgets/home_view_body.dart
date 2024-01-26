import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'custom_header_container.dart';
import 'last_active_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 6.h,),
         const CustomHeaderContainer(),
          const Expanded(child: LastActiveList())
      ],
    );
  }
}



