import 'package:activation_app/core/exceptions/failure.dart';
import 'package:activation_app/core/exceptions/server_exceptions.dart';
import 'package:activation_app/features/pairing_feature/data/data_source/login_data_source.dart';
import 'package:activation_app/features/pairing_feature/domain/entities/login_request_entity.dart';
import 'package:activation_app/features/pairing_feature/domain/entities/login_response_entity.dart';
import 'package:activation_app/features/pairing_feature/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepoImpl implements LoginRepository{
  final LoginDataSource _loginDataSource;

  LoginRepoImpl({required LoginDataSource loginDataSource}):_loginDataSource=loginDataSource;

  @override
  Future<Either<Failure, LoginResponseEntity>> login(LoginRequestEntity loginRequestEntity)async {
    try{
      final reqUrl = await _loginDataSource.login(loginRequestEntity);
      return right(reqUrl);
    }on ServerException{
      return left(const ServerFailure('error'));
    }
  }

}