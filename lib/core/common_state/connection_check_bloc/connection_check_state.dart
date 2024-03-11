part of 'connection_check_bloc.dart';

@immutable
abstract class ConnectionCheckState {}

class ConnectionCheckInitial extends ConnectionCheckState {}

class ConnectedState extends ConnectionCheckState{
  final String message;
  final Color color;
  final IconData icon;

  ConnectedState( {required this.color, required this.icon, required this.message});
}

class NotConnectedState extends ConnectionCheckState{

  final String message;
  final Color color;
  final IconData icon;
  NotConnectedState(this.color, this.icon,{required this.message});
}
class LocationConnectedState extends ConnectionCheckState{
  final String message;
  final Color color;
  final IconData icon;

  LocationConnectedState(
      {required this.color, required this.icon, required this.message}
      );
}
class LocationNotConnectedState extends ConnectionCheckState{

  final String message;
  final Color color;
  final IconData icon;
  LocationNotConnectedState(this.color, this.icon,{required this.message});
}
class NfcAvailabilityState extends ConnectionCheckState {
  final bool isAvailable;
  final String message;
  final Color color;
  final IconData icon;
  NfcAvailabilityState({required this.isAvailable, required this.message, required this.color, required this.icon});
}
class NfcNotAvailabilityState extends ConnectionCheckState {
  final bool isAvailable;
  final String message;
  final Color color;
  final IconData icon;
  NfcNotAvailabilityState({required this.isAvailable, required this.message, required this.color, required this.icon});
}