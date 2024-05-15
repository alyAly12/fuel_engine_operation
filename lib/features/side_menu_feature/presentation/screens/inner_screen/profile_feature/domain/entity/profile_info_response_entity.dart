import '../../data/models/user_data_model.dart';

class ProfileInfoResponseEntity{
  UserDataModel? data;
  String? message;
  List<dynamic>? error;
  bool? status;

  ProfileInfoResponseEntity({this.data, this.message, this.error, this.status});
}