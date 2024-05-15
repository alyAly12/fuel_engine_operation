import 'package:activation_app/core/exceptions/failure.dart';
import 'package:activation_app/core/exceptions/server_exceptions.dart';
import 'package:activation_app/features/side_menu_feature/presentation/screens/inner_screen/profile_feature/data/data_source/profile_info_data_source.dart';
import 'package:activation_app/features/side_menu_feature/presentation/screens/inner_screen/profile_feature/domain/entity/profile_info_response_entity.dart';
import 'package:activation_app/features/side_menu_feature/presentation/screens/inner_screen/profile_feature/domain/repository/profile_info_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileInfoRepoImpl implements ProfileInfoRepository {
  final ProfileInfoDataSource dataSource;

  ProfileInfoRepoImpl(this.dataSource);

  @override
  Future<Either<Failure, ProfileInfoResponseEntity>> profileInfo(
      ProfileInfoResponseEntity profileInfoResponseEntity) async {
    try {
      final reqUrl = await dataSource.profileInfo(profileInfoResponseEntity);
      return right(reqUrl);
    } on ServerException {
      return left(const ServerFailure('error'));
    }
  }
}
