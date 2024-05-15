import 'package:activation_app/core/component/custom_regular_appBar.dart';
import 'package:activation_app/core/utils/app_strings.dart';
import 'package:activation_app/features/side_menu_feature/presentation/screens/inner_screen/profile_feature/data/models/profile_info_response_model.dart';
import 'package:activation_app/features/side_menu_feature/presentation/screens/inner_screen/profile_feature/presentation/profile_bloc/profile_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/services/service_locator.dart';
import '../widgets/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileInfoResponseModel model = ProfileInfoResponseModel();
    return BlocProvider(
      create: (context) => ProfileInfoBloc(sl())..add(GetProfileInfoEvent(model)),
      child: Scaffold(
        appBar: PreferredSize(preferredSize: const Size(
            kBottomNavigationBarHeight, kBottomNavigationBarHeight),
          child: CustomRegularAppBar(
            mainTitle: AppStrings.profile,
            actionTitle: AppStrings.back,
          ),
        ),
        body: const ProfileScreenBody(),
      ),
    );
  }
}
