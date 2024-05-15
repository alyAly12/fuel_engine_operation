import 'package:activation_app/core/base_use_cases/base_use_case.dart';
import 'package:activation_app/core/exceptions/failure.dart';
import 'package:activation_app/features/splash_feature/domain/entities/splash_reponse_entity.dart';
import 'package:activation_app/features/splash_feature/domain/repository/splash_repository.dart';
import 'package:dartz/dartz.dart';

class SplashUseCase
    implements UseCase<SplashResponseEntity, SplashResponseEntity> {
  final SplashRepository splashRepository;

  SplashUseCase(this.splashRepository);

  @override
  Future<Either<Failure, SplashResponseEntity>> call(
      SplashResponseEntity splashResponseEntity) async {
    return await splashRepository.splashSettings(splashResponseEntity);
  }
}
