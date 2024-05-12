import 'package:flutter/material.dart';

import '../widgets/search_view_body.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
