
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? _subscription;
  InternetCubit() : super(InternetInitial());

  void connected(){
    emit(InternetConnectedState());
  }
  void notConnected(){
    emit(InternetNotConnectedState());
  }

  void checkConnection()async{
    Location location = new Location();
    bool isOn = await location.serviceEnabled();
    bool isturnedon = await location.requestService();
    _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result){
      if(result == ConnectivityResult.wifi ||result == ConnectivityResult.mobile && isOn || isturnedon){
        return connected();
      }else{
        return notConnected();
      }
    });
  }
  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }

}
