import 'package:activation_app/core/exceptions/failure.dart';
import 'package:activation_app/features/splash_feature/domain/entities/splash_reponse_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SplashRepository{
  Future<Either<Failure,SplashResponseEntity>>splashSettings(SplashResponseEntity splashResponseEntity);
}