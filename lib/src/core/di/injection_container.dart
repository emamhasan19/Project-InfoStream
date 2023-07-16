import 'package:get_it/get_it.dart';
import 'package:info_stream/src/core/network/rest_client.dart';
import 'package:info_stream/src/features/navigation_drawer/data/data_sources/drawer_remote_data_source.dart';
import 'package:info_stream/src/features/navigation_drawer/data/data_sources/drawer_remote_data_source_impl.dart';
import 'package:info_stream/src/features/navigation_drawer/data/repositories/drawer_repository_impl.dart';
import 'package:info_stream/src/features/navigation_drawer/domain/repositories/drawer_repository.dart';
import 'package:info_stream/src/features/navigation_drawer/domain/use_cases/drawer_use_cases.dart';
import 'package:info_stream/src/features/navigation_drawer/presentation/bloc/drawer_bloc.dart';
import 'package:info_stream/src/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:info_stream/src/features/profile/data/datasource/profile_remote_data_source_impl.dart';
import 'package:info_stream/src/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:info_stream/src/features/profile/domain/repositories/profile_repositories.dart';
import 'package:info_stream/src/features/profile/domain/use_cases/profile_use_case.dart';
import 'package:info_stream/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:info_stream/src/features/signin/data/data_sources/sign_in_remote_data_source.dart';
import 'package:info_stream/src/features/signin/data/data_sources/sign_in_remote_data_source_impl.dart';
import 'package:info_stream/src/features/signin/data/repositories/sign_in_repository_impl.dart';
import 'package:info_stream/src/features/signin/domain/repositories/sign_in_repositories.dart';
import 'package:info_stream/src/features/signin/domain/use_cases/sign_in_use_case.dart';
import 'package:info_stream/src/features/signin/presentation/bloc/signin_bloc.dart';
import 'package:info_stream/src/features/signup/data/data_sources/signup_remote_data_source.dart';
import 'package:info_stream/src/features/signup/data/data_sources/signup_remote_data_source_impl.dart';
import 'package:info_stream/src/features/signup/data/repositories/signup_repository_impl.dart';
import 'package:info_stream/src/features/signup/domain/repositories/signup_repositories.dart';
import 'package:info_stream/src/features/signup/domain/use_cases/signup_use_case.dart';
import 'package:info_stream/src/features/signup/presentation/bloc/signup_bloc.dart';

part 'bloc.dart';
part 'data_source.dart';
part 'repository.dart';
part 'use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Bloc
  await _initBlocs();

  /// Use Case
  await _initUseCases();

  /// Repository
  await _initRepositories();

  /// Datasource
  await _initDataSources();

  /// Externals
  final restClient = RestClient();
  sl.registerLazySingleton(
    () => restClient,
  );
}
