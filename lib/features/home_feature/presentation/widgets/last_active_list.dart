import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'last_active_item.dart';


class LastActiveList extends StatelessWidget {
  const LastActiveList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.only(top: 1),
        itemBuilder: (context,index){
          return const LastActiveListItem();
        },
        separatorBuilder: (context,index){
          return SizedBox(height: 0.1.h,);
        },
        itemCount: 10);
  }
}