import 'package:activation_app/features/side_menu_feature/presentation/screens/inner_screen/profile_feature/data/models/user_model.dart';

class UserDataModel {
  UserModel? user;

  UserDataModel({this.user});

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    user: json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
  );
}