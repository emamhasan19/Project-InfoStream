part of 'injection_container.dart';

Future<void> _initDataSources() async {
  sl.registerLazySingleton<SignInRemoteDataSource>(
    () => SignInRemoteDataSourceImp(
      restClient: sl.call(),
    ),
  );
  sl.registerLazySingleton<DrawerRemoteDataSource>(
    () => DrawerRemoteDataSourcesImpl(
      restClient: sl.call(),
    ),
  );
  sl.registerLazySingleton<ProfileDataSource>(
    () => ProfileDataSourceImp(
      restClient: sl.call(),
    ),
  );
  sl.registerLazySingleton<SignUpRemoteDataSource>(
    () => SignUpRemoteDataSourceImp(
      restClient: sl.call(),
    ),
  );
}
