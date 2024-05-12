import 'package:flutter/material.dart';
import 'history_item.dart';

class HistoryListItem extends StatelessWidget {
  const HistoryListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding:  const EdgeInsets.only(top: 10),
        itemBuilder: (context,index){
          return const HistoryItem();
        },
        separatorBuilder: (context,index){
          return const SizedBox(height: 10,);
        },
        itemCount: 10);
  }
}
