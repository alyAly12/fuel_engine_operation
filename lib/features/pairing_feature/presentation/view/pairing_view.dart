import 'package:activation_app/features/pairing_feature/presentation/view/widgets/pairing_view_body.dart';
import 'package:flutter/material.dart';


class PairingScreen extends StatelessWidget {
  const PairingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: PairingViewBody(),
      ),
    );
  }
}
