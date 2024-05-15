import 'package:activation_app/core/services/network_service.dart';
import 'package:activation_app/core/utils/end_points.dart';
import 'package:activation_app/features/splash_feature/domain/entities/splash_reponse_entity.dart';
import '../../../../core/exceptions/server_exceptions.dart';
import '../models/splash_response_model.dart';

abstract class SplashRemoteDataSource {
  Future<SplashResponseModel> settings(
      SplashResponseEntity splashResponseEntity);
}

class SplashRemoteDataSourceImpl implements SplashRemoteDataSource {
  final NetworkService _service;

  SplashRemoteDataSourceImpl({required NetworkService service})
      : _service = service;

  @override
  Future<SplashResponseModel> settings(
      SplashResponseEntity splashResponseEntity) async {
    final response = await _service.unAuthedDio.get(EndPoints.settingEndPoint);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = response.data;
      return SplashResponseModel.fromJson(responseData);
    } else {
      throw ServerException(
          message: (response.data as Map<String, dynamic>)["message"],
          statusCode: response.statusCode ?? 0);
    }
  }
}
