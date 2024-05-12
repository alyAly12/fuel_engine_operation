import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
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
  sl.registerLazySingleton<LoginDataSource>(
    () => LoginDataSourceImpl(service: sl()),
  );
  sl.registerLazySingleton<PairingDataSource>(() => PairingDataSourceImplement(service: sl()));
  sl.registerLazySingleton<SplashRemoteDataSource>(() => SplashRemoteDataSourceImpl(service: sl()));
}

void registerUseCase() {
  sl.registerLazySingleton(
    () => LoginUseCase(sl()),
  );
  sl.registerLazySingleton(() => PairingUseCase(sl()));
  sl.registerLazySingleton(() => SplashUseCase(sl()));
}

void registerRepositories() {
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<PairingRepository>(() => PairingRepoImpl(dataSource: sl()));
  sl.registerLazySingleton<SplashRepository>(() => SplashRepoImpl(sl()));
}

void registerBloc() {
  sl.registerLazySingleton(
    () => LoginBloc(
      loginUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(() => PairingBloc(useCase: sl<PairingUseCase>()));
  sl.registerLazySingleton(() => SplashBloc(sl<SplashUseCase>()));
  sl.registerLazySingleton(() => ConnectionCheckBloc());
}
