import 'package:activation_app/core/base_use_cases/base_use_case.dart';
import 'package:activation_app/core/exceptions/failure.dart';
import 'package:activation_app/features/pairing_feature/domain/entities/login_request_entity.dart';
import 'package:activation_app/features/pairing_feature/domain/entities/login_response_entity.dart';
import 'package:activation_app/features/pairing_feature/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements UseCase<LoginResponseEntity,LoginRequestEntity>{
  final LoginRepository loginRepository;
  LoginUseCase(this.loginRepository);

  @override
  Future<Either<Failure, LoginResponseEntity>> call(LoginRequestEntity loginRequestEntity)async {
   return await loginRepository.login(loginRequestEntity);
  }

}