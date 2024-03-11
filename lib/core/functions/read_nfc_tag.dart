import 'dart:io' show Platform;
import 'package:activation_app/core/component/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:go_router/go_router.dart';
import '../utils/app_route.dart';


void readNFCTag(BuildContext context) async {
  var selectedZoneId;
  var availability = await FlutterNfcKit.nfcAvailability;
  if (availability != NFCAvailability.available) {
    showCustomSnackBar(context, 'NFC not available');
    return;
  }
  await FlutterNfcKit.finish();

  if (Platform.isAndroid) {
    showCustomSnackBar(context, 'Scanning Nfc Tag');
  }

  var tag = await FlutterNfcKit.poll(
      timeout: const Duration(seconds: 50),
      iosMultipleTagMessage: "Multiple tags found!",
      iosAlertMessage: "Scan your tag");

  if (tag.ndefAvailable!) {
    var result = await FlutterNfcKit.readNDEFRecords(cached: false);
    var record = result.isEmpty ? null : result.first;
    String zoneId = record.toString().split("=").last;
    selectedZoneId = zoneId;
    debugPrint(selectedZoneId);
  }

  if (Platform.isAndroid ) {
    GoRouter.of(context).push(AppRoute.kVehicleActivationScreen);
    showCustomSnackBar(context, 'Tag ID:${selectedZoneId}');
    await Future.delayed(Duration(seconds: 1));
    await FlutterNfcKit.finish();
  } else if(selectedZoneId != selectedZoneId){
    await FlutterNfcKit.finish();
  }
}