import 'package:activation_app/core/exceptions/failure.dart';
import 'package:activation_app/features/side_menu_feature/presentation/screens/inner_screen/profile_feature/domain/entity/profile_info_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileInfoRepository{
  Future<Either<Failure,ProfileInfoResponseEntity>>profileInfo(ProfileInfoResponseEntity profileInfoResponseEntity);
}