import 'package:alopr/features/authentication/data/data_source/auth_data_source.dart';
import 'package:alopr/features/authentication/data/repository_imp/auth_repository_imp.dart';
import 'package:alopr/features/authentication/domain/repository/auth_repository.dart';
import 'package:alopr/features/authentication/domain/usecase/login_usecase.dart';
import 'package:alopr/features/authentication/domain/usecase/register_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
// Usecases

  sl.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(repository: sl()));

  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(repository: sl()));

// Repository

  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImp(remoteDataSource: sl()));

// DataSource

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());
}
