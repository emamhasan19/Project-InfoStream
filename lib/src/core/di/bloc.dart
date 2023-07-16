part of 'injection_container.dart';

Future<void> _initBlocs() async {
  sl.registerFactory(
    () => SignInBloc(signInUseCase: sl.call()),
  );
  sl.registerFactory(
    () => DrawerBloc(drawerUseCase: sl.call()),
  );
  sl.registerFactory(
    () => ProfileBloc(profileUseCase: sl.call()),
  );
  sl.registerFactory(
    () => SignUpBloc(signUpUseCase: sl.call()),
  );
}
