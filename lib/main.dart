import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash/src/features/login/presentation/pages/login_page.dart';
import 'package:splash/src/features/signup/presentation/pages/signup.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
     home: showSplash ? const SplashPage() :  SignUp(),
    );
  }
}
