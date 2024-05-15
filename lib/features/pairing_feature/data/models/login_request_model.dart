import 'package:activation_app/features/pairing_feature/domain/entities/login_request_entity.dart';

class LoginRequestModel extends LoginRequestEntity {
  LoginRequestModel({userName, password, type})
      : super(userName: userName, password: password, type: type);

  Map<String,dynamic>toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = userName;
    data['password'] = password;
    data['type'] = type;
    return data;
  }
}
