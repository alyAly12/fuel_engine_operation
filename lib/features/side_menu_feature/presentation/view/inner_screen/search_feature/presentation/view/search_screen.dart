import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/search_feature/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';


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
