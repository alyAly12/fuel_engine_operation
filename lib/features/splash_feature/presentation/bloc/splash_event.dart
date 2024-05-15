part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent {}

class SplashSettingEvent extends SplashEvent {
  final SplashResponseModel splashResponseModel;

  SplashSettingEvent(this.splashResponseModel);
}
