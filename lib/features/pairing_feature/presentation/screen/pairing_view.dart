import 'package:activation_app/features/pairing_feature/domain/use_case/login_use_case.dart';
import 'package:activation_app/features/pairing_feature/presentation/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/service_locator.dart';
import '../widgets/pairing_view_body.dart';


class PairingScreen extends StatelessWidget {
  const PairingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(sl<LoginUseCase>()),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: const Scaffold(
          backgroundColor: Colors.white,
          body: PairingViewBody(),
        ),
      ),
    );
  }
}
