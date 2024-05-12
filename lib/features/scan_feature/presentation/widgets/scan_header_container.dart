import 'dart:math';
import 'package:activation_app/features/scan_feature/presentation/widgets/start_scan_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../core/functions/read_nfc_tag.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/app_route.dart';

class ScanHeaderContainer extends StatefulWidget {
  const ScanHeaderContainer({super.key});

  @override
  State<ScanHeaderContainer> createState() => _ScanHeaderContainerState();
}

class _ScanHeaderContainerState extends State<ScanHeaderContainer> {
  @override
  void initState() {
    readNFCTag(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 1 ),
      child: GestureDetector(
        onTap: (){
          GoRouter.of(context).push(AppRoute.kVehicleActivationScreen);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned(
                    child: Transform.rotate(
                        angle: -0.5 * pi,
                        child: Lottie.asset(AssetsManager.scanningSign,
                            fit: BoxFit.contain
                        )),
                  ),
                  Positioned(
                    top: 3,
                    child: SvgPicture.asset(AssetsManager.nfcCircle,fit: BoxFit.contain,),
                  ),
                  Positioned(
                    bottom: 60,
                    child: CustomTextWidget(
                      title: AppStrings.scanDevice,
                      color: AppColors.lightTitleColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  Positioned(
                    bottom: 1.h,
                    child: StartScanButton(
                      onTap:(){
                        // await startNfcReading(context);
                      },
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}