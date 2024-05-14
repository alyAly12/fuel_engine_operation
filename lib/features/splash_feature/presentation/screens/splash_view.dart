import 'package:activation_app/features/splash_feature/data/models/splash_response_model.dart';
import 'package:activation_app/features/splash_feature/domain/use_case/splash_use_case.dart';
import 'package:activation_app/features/splash_feature/presentation/bloc/splash_bloc.dart';
import 'package:activation_app/features/splash_feature/presentation/screens/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashResponseModel model = SplashResponseModel();
    return BlocProvider(
      create: (context) => SplashBloc(sl<SplashUseCase>())..add(SplashSettingEvent(model)),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SplashViewBody(),
      ),
    );
  }
}
