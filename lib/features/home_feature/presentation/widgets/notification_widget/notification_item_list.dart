import 'package:activation_app/features/home_feature/presentation/widgets/notification_widget/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItemList extends StatelessWidget {
  const NotificationItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color>itemColors=[
      const Color(0xffFFFFFF),
      const Color(0xffFFFBEE),
      const Color(0xffFFFBEE),
      const Color(0xffFFFFFF),
      const Color(0xffFFFBEE),
      const Color(0xffFFFFFF),
      const Color(0xffFFFFFF),
      const Color(0xffFFFBEE),
      const Color(0xffFFFFFF),
    ];
    return Padding(
      padding:  EdgeInsets.only(top: 5.h),
      child: ListView.builder(
          itemCount: 9,
          itemBuilder: (context,index){
            return  NotificationItem(containerColor: itemColors[index],);
          }),
    );
  }
}
