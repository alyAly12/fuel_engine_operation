import 'package:activation_app/core/component/custom_regular_appBar.dart';
import 'package:activation_app/core/utils/app_strings.dart';
import 'package:activation_app/features/scan_feature/presentation/widgets/vehicle_activation_widget/vehicle_activation_body.dart';
import 'package:flutter/material.dart';

class VehicleActivationScreen extends StatelessWidget {
  const VehicleActivationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight),
            child: CustomRegularAppBar(
                mainTitle: AppStrings.vehicleActivation,
                actionTitle: AppStrings.cancel
            )
        ),
        body: const VehicleActivationBody(),
      ),
    );
  }
}
