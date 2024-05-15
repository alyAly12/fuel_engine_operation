import 'package:activation_app/core/exceptions/failure.dart';
import 'package:activation_app/features/pairing_feature/domain/entities/login_request_entity.dart';
import 'package:activation_app/features/pairing_feature/domain/entities/login_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository{
  Future<Either<Failure,LoginResponseEntity>>login(LoginRequestEntity loginRequestEntity);
}