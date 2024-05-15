part of 'profile_info_bloc.dart';

@immutable
abstract class ProfileInfoEvent {}

class GetProfileInfoEvent extends ProfileInfoEvent {
  final ProfileInfoResponseModel profileInfoResponseModel;

  GetProfileInfoEvent(this.profileInfoResponseModel);
}
