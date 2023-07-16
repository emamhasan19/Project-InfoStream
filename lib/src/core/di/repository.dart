part of 'injection_container.dart';

Future<void> _initRepositories() async {
  sl.registerLazySingleton<SignInRepository>(
    () => SignInRepositoryImp(signInRemoteDataSource: sl.call()),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(profileDataSource: sl.call()),
  );
  sl.registerLazySingleton<DrawerRepository>(
    () => DrawerRepositoryImpl(drawerRemoteDataSource: sl.call()),
  );
  sl.registerLazySingleton<SignUpRepository>(
    () => SignUpRepositoryImp(signUpRemoteDataSource: sl.call()),
  );
}
