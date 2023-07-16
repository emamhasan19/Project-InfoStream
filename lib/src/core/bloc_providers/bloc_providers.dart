import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_stream/src/core/di/injection_container.dart' as di;
import 'package:info_stream/src/features/navigation_drawer/presentation/bloc/drawer_bloc.dart';
import 'package:info_stream/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:info_stream/src/features/signin/presentation/bloc/signin_bloc.dart';
import 'package:info_stream/src/features/signup/presentation/bloc/signup_bloc.dart';

class GlobalBlocProviders {
  dynamic providers = [
    BlocProvider(create: (_) => di.sl<SignInBloc>()),
    BlocProvider(create: (_) => di.sl<ProfileBloc>()),
    BlocProvider(create: (_) => di.sl<DrawerBloc>()),
    BlocProvider(create: (_) => di.sl<SignUpBloc>()),
  ];
}
