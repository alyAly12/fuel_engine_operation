import 'package:activation_app/features/pairing_feature/data/data_source/login_data_source.dart';
import 'package:activation_app/features/pairing_feature/data/repository/login_repo_impl.dart';
import 'package:activation_app/features/pairing_feature/domain/repository/login_repository.dart';
import 'package:activation_app/features/pairing_feature/domain/use_case/login_use_case.dart';
import 'package:activation_app/features/pairing_feature/presentation/login_bloc/login_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import '../../features/splash_feature/data/data_source/splash_data_source.dart';
import '../../features/splash_feature/data/repository/splash_repo_impl.dart';
import '../../features/splash_feature/domain/repository/splash_repository.dart';
import '../../features/splash_feature/domain/use_case/splash_use_case.dart';
import '../../features/splash_feature/presentation/bloc/splash_bloc.dart';
import 'api_services.dart';
import 'network_service.dart';

final sl = GetIt.instance; // sl = service locator

void init() {
  sl.registerLazySingleton<ApiServices>(() => ApiServices(Dio()));
  sl.registerLazySingleton<NetworkService>(
    NetworkService.new,
  );
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  ); // data source
  registerRemoteDataSource();
  registerRepositories();
  registerUseCase();
  registerBloc();
}

void registerRemoteDataSource() {
  sl.registerLazySingleton<SplashRemoteDataSource>(() => SplashRemoteDataSourceImpl(service: sl()));
  sl.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl(service: sl()));
}

void registerUseCase() {

  sl.registerLazySingleton(() => SplashUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
}

void registerRepositories() {
  sl.registerLazySingleton<SplashRepository>(() => SplashRepoImpl(sl()));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepoImpl(loginDataSource: sl()));
}

void registerBloc() {

  sl.registerLazySingleton(() => SplashBloc(sl<SplashUseCase>()));
  sl.registerLazySingleton(() => LoginBloc(sl<LoginUseCase>()));

}
