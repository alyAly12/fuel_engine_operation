import 'package:activation_app/core/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'core/utils/app_colors.dart';

void main() {
  runApp(const ActivationApp());
}

class ActivationApp extends StatelessWidget {
  const ActivationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Activation-App',
          theme: ThemeData.light(useMaterial3: false).copyWith(
            iconTheme: const IconThemeData(color: AppColors.appBarColor,size: 0),
            textTheme:
            GoogleFonts.robotoTextTheme(ThemeData
                .light()
                .textTheme),
          ),
          routerConfig: AppRoute.router,
        );
      },

    );
  }
}

