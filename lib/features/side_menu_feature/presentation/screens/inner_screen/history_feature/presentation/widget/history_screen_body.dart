import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'custom_gradient_row.dart';
import 'history_list_item.dart';


class HistoryScreenBody extends StatelessWidget {
  const HistoryScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.only(left: 10,right: 10,top: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft:Radius.circular(8) ,topRight:Radius.circular(8) ),
          color: Colors.white,
          boxShadow: <BoxShadow>[
           BoxShadow(
             color:  Colors.grey.shade300,
             blurRadius: 10.0,
           )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 1,vertical: 20),
              child: CustomGradientRow(),
            ),
             Expanded(child: ScrollShadow(
              color: Colors.grey.shade300,
                child: const HistoryListItem()))
          ],
        ),
      ),
    );
  }
}
