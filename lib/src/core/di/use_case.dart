part of 'injection_container.dart';

Future<void> _initUseCases() async {
  sl.registerLazySingleton(
    () => SignInUseCase(signInRepository: sl.call()),
  );
  sl.registerLazySingleton(
    () => ProfileUseCase(profileRepository: sl.call()),
  );
  sl.registerLazySingleton(
    () => DrawerUseCase(drawerRepository: sl.call()),
  );
  sl.registerLazySingleton(
    () => SignUpUseCase(signUpRepository: sl.call()),
  );
}
