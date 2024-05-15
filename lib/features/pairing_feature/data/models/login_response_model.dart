import 'package:activation_app/features/pairing_feature/domain/entities/login_response_entity.dart';

import 'login_data.dart';

class LoginResponseModel extends LoginResponseEntity {
  LoginResponseModel({data, message, error, status})
      : super(data: data, message: message, error: error, status: status);

  factory LoginResponseModel.fromJson(Map<String,dynamic>json)=>LoginResponseModel(
    data:
    json['data'] == null ? null : LoginData.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String?,
    error: json['error'] as List<dynamic>?,
    status: json['status'] as bool?,
  );
}
