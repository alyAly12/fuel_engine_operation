import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:geolocator/geolocator.dart';


part 'connection_check_event.dart';
part 'connection_check_state.dart';

class ConnectionCheckBloc
    extends Bloc<ConnectionCheckEvent, ConnectionCheckState> {
  StreamSubscription? _subscription;
  StreamSubscription<ServiceStatus>? serviceStatusStream;
  ConnectionCheckBloc() : super(ConnectionCheckInitial()) {
    on<ConnectionCheckEvent>((event, emit) async {
      if (event is NotConnectedEvent) {
        emit(NotConnectedState(Colors.red, Icons.close,
            message: 'Internet Disconnected'));
      } else if (event is ConnectedEvent) {
        emit(ConnectedState(
            color: Colors.green,
            icon: Icons.check,
            message: 'Internet Connected'));
      }
      else if (event is LocationChangedEvent) {
        emit(LocationConnectedState(color: Colors.green, icon: Icons.check, message: 'Location on'));
      }else if(event is LocationNotChangedEvent){
        emit(LocationNotConnectedState(Colors.red, Icons.close, message: 'Location Off'));
      }
      if (event is NfcCheckEvent) {
        await checkNfc(emit);
      }
    });
    serviceStatusStream = Geolocator.getServiceStatusStream().listen(
            (ServiceStatus status) {
          if(status == ServiceStatus.enabled){
            add(LocationChangedEvent());
          }else if(status == ServiceStatus.disabled){
            add(LocationNotChangedEvent());
          }
        });
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        add(NotConnectedEvent());
      } else if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        add(ConnectedEvent());
      }
    });
  }

  @override
  Future<void> close() {
    serviceStatusStream!.cancel();
    _subscription!.cancel();
    return super.close();
  }

  checkNfc(Emitter<ConnectionCheckState> emit) async {
    var isNfcAvailable = await FlutterNfcKit.nfcAvailability;
    if (isNfcAvailable != NFCAvailability.available) {
      emit(
        NfcNotAvailabilityState(
            isAvailable: false,
            message: 'NFC disconnected',
            color: Colors.red,
            icon: Icons.close),
      );
    } else if (isNfcAvailable == await NFCAvailability.available) {
      emit(NfcAvailabilityState(
          isAvailable: true,
          message: 'NFC Connected',
          color: Colors.green,
          icon: Icons.check));
    }
  }
}
