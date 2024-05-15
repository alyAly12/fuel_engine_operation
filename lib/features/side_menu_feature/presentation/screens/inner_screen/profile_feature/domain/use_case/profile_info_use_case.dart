import 'package:activation_app/core/base_use_cases/base_use_case.dart';
import 'package:activation_app/core/exceptions/failure.dart';
import 'package:activation_app/features/side_menu_feature/presentation/screens/inner_screen/profile_feature/domain/entity/profile_info_response_entity.dart';
import 'package:activation_app/features/side_menu_feature/presentation/screens/inner_screen/profile_feature/domain/repository/profile_info_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileInfoUseCase
    implements UseCase<ProfileInfoResponseEntity, ProfileInfoResponseEntity> {
  final ProfileInfoRepository profileInfoRepository;

  ProfileInfoUseCase(this.profileInfoRepository);

  @override
  Future<Either<Failure, ProfileInfoResponseEntity>> call(
      ProfileInfoResponseEntity params) async {
    return await profileInfoRepository.profileInfo(params);
  }
}
