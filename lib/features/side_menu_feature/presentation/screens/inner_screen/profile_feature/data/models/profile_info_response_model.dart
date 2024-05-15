import 'package:activation_app/features/side_menu_feature/presentation/screens/inner_screen/profile_feature/data/models/user_data_model.dart';
import 'package:activation_app/features/side_menu_feature/presentation/screens/inner_screen/profile_feature/domain/entity/profile_info_response_entity.dart';

class ProfileInfoResponseModel extends ProfileInfoResponseEntity {
  ProfileInfoResponseModel({data, message, error, status})
      : super(data: data, message: message, error: error, status: status);

  factory ProfileInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileInfoResponseModel(
        data: json['data'] == null
            ? null
            : UserDataModel.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
        error: json['error'] as List<dynamic>?,
        status: json['status'] as bool?,
      );
}
