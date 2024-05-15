part of 'profile_info_bloc.dart';

@immutable
abstract class ProfileInfoState {}

class ProfileInfoInitial extends ProfileInfoState {}

class ProfileInfoLoadingState extends ProfileInfoState {}

class ProfileInfoSuccessState extends ProfileInfoState {
  final ProfileInfoResponseEntity profileInfoResponseEntity;

  ProfileInfoSuccessState(this.profileInfoResponseEntity);
}

class ProfileInfoFailureState extends ProfileInfoState {
  final String errorMessage;

  ProfileInfoFailureState(this.errorMessage);
}
