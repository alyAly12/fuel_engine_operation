import 'dart:convert';

import 'package:activation_app/core/exceptions/server_exceptions.dart';
import 'package:activation_app/core/services/network_service.dart';
import 'package:activation_app/core/utils/end_points.dart';
import 'package:activation_app/features/pairing_feature/domain/entities/login_request_entity.dart';

import '../models/login_response_model.dart';

abstract class LoginDataSource {
  Future<LoginResponseModel> login(LoginRequestEntity loginRequestEntity);
}

class LoginDataSourceImpl implements LoginDataSource {
  final NetworkService _service;

  LoginDataSourceImpl({required NetworkService service}) : _service = service;

  @override
  Future<LoginResponseModel> login(
      LoginRequestEntity loginRequestEntity) async {
    final response = await _service.unAuthedDio.post(EndPoints.settingEndPoint,
        data: jsonEncode(loginRequestEntity.toJson()));
    if (response.statusCode == 201 ||
        response.statusCode == 200 &&
            (response.data as Map<String, dynamic>)["status"] == true) {
      final Map<String,dynamic>responseData = response.data;
      return Future.value(
        LoginResponseModel.fromJson(responseData),
      );
    }else{
      throw ServerException(
          message:  (response.data as Map<String, dynamic>)["message"],
          statusCode:response.statusCode??0,
      );
    }
  }
}
