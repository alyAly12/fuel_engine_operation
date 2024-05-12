import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'last_active_item.dart';


class LastActiveList extends StatelessWidget {
  const LastActiveList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding:  const EdgeInsets.only(top: 10),
        itemBuilder: (context,index){
          return const LastActiveListItem();
        },
        separatorBuilder: (context,index){
          return const SizedBox(height: 1,);
        },
        itemCount: 10);
  }
}