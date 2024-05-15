import 'package:activation_app/core/services/network_service.dart';
import 'package:activation_app/core/utils/end_points.dart';
import 'package:activation_app/features/side_menu_feature/presentation/screens/inner_screen/profile_feature/data/models/profile_info_response_model.dart';
import 'package:activation_app/features/side_menu_feature/presentation/screens/inner_screen/profile_feature/domain/entity/profile_info_response_entity.dart';


import '../../../../../../../../core/exceptions/server_exceptions.dart';

abstract class ProfileInfoDataSource {
  Future< ProfileInfoResponseModel> profileInfo(
      ProfileInfoResponseEntity profileInfoResponseEntity);
}

class ProfileInfoDataSourceImpl implements ProfileInfoDataSource {
  final NetworkService _service;

  ProfileInfoDataSourceImpl({required NetworkService service})
      : _service = service;

  @override
  Future< ProfileInfoResponseModel> profileInfo(
      ProfileInfoResponseEntity profileInfoResponseEntity) async {
    final response =
        await _service.unAuthedDio.get(EndPoints.profileInfoEndPoint);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = response.data;
      return ProfileInfoResponseModel.fromJson(responseData);
    }else {
      throw ServerException(
          message: (response.data as Map<String, dynamic>)["message"],
          statusCode: response.statusCode ?? 0);
    }
  }
}
