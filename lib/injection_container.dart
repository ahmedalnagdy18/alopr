import 'package:alopr/features/authentication/data/data_source/auth_data_source.dart';
import 'package:alopr/features/authentication/data/repository_imp/auth_repository_imp.dart';
import 'package:alopr/features/authentication/domain/repository/auth_repository.dart';
import 'package:alopr/features/authentication/domain/usecase/login_usecase.dart';
import 'package:alopr/features/authentication/domain/usecase/register_usecase.dart';
import 'package:alopr/features/home/data/data_source/home_data_source.dart';
import 'package:alopr/features/home/data/repository_imp/home_repository_imp.dart';
import 'package:alopr/features/home/domain/repository/home_repository.dart';
import 'package:alopr/features/home/domain/usecase/complete_profile_usecase.dart';
import 'package:alopr/features/home/domain/usecase/get_user_completed_data.dart';
import 'package:alopr/features/home/domain/usecase/patients_usecase.dart';
import 'package:alopr/features/home/domain/usecase/upload_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
// Usecases

  sl.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(repository: sl()));

  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(repository: sl()));

  sl.registerLazySingleton<CompleteProfileUsecase>(
      () => CompleteProfileUsecase(repository: sl()));

  sl.registerLazySingleton<PatientsUsecase>(
      () => PatientsUsecase(repository: sl()));

  sl.registerLazySingleton<UploadUsecase>(
      () => UploadUsecase(repository: sl()));

  sl.registerLazySingleton<GetUserCompletedData>(
      () => GetUserCompletedData(repository: sl()));

// Repository

  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImp(remoteDataSource: sl()));

  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImp(homeDataSource: sl()));

// DataSource

  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSource());

  sl.registerLazySingleton<HomeDataSource>(() => HomeDataSource());
}
