import 'package:activation_app/features/splash_feature/presentation/screens/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.white,
      body: SplashViewBody(),
    );
  }
}