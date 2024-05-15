import 'package:activation_app/features/pairing_feature/data/models/login_data.dart';

class LoginResponseEntity{
  LoginData? data;
  String? message;
  List<dynamic>? error;
  bool? status;

  LoginResponseEntity({this.data, this.message, this.error, this.status});

}