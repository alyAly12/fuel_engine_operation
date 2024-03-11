part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetConnectedState extends InternetState{
  InternetConnectedState();
}

class InternetNotConnectedState extends InternetState{

  InternetNotConnectedState();
}

