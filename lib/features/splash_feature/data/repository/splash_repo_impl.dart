import 'package:activation_app/core/exceptions/failure.dart';
import 'package:activation_app/core/exceptions/server_exceptions.dart';
import 'package:activation_app/features/splash_feature/data/data_source/splash_data_source.dart';
import 'package:activation_app/features/splash_feature/domain/entities/splash_reponse_entity.dart';
import 'package:activation_app/features/splash_feature/domain/repository/splash_repository.dart';
import 'package:dartz/dartz.dart';

class SplashRepoImpl implements SplashRepository {
  SplashRemoteDataSource splashRemoteDataSource;

  SplashRepoImpl(this.splashRemoteDataSource);

  @override
  Future<Either<Failure, SplashResponseEntity>> splashSettings(
      SplashResponseEntity splashResponseEntity) async {
    try {
      final reqUrl =
          await splashRemoteDataSource.settings(splashResponseEntity);
      return right(reqUrl);
    } on ServerException {
      return left(const ServerFailure('error'));
    }
  }
}
