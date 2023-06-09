import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash/src/features/signin/presentation/bloc/signin_bloc.dart';
import 'package:splash/src/features/signin/presentation/pages/signin_page.dart';
import 'package:splash/src/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:splash/src/features/splash/presentation/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool showSplash = prefs.getBool('showSplash') ?? true;

  runApp(MyApp(showSplash: showSplash));
}

class MyApp extends StatelessWidget {
  final bool showSplash;

  const MyApp({super.key, required this.showSplash});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SignInBloc(),
        ),
        BlocProvider(
          create: (_) => SignUpBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: showSplash ? const SplashPage() : const SignInPage(),
        // home: WelcomePage(),
      ),
    );
  }
}
