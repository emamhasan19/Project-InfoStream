import 'package:flutter/material.dart';
import 'package:info_stream/src/core/routes/routes.dart';
import 'package:info_stream/src/features/home/presentation/pages/home_page.dart';
import 'package:info_stream/src/features/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:info_stream/src/features/on_boarding/presentation/pages/splash_page.dart';
import 'package:info_stream/src/features/on_boarding/presentation/pages/welcome_page.dart';
import 'package:info_stream/src/features/profile/presentation/pages/profile_page.dart';
import 'package:info_stream/src/features/signin/presentation/pages/signin_page.dart';
import 'package:info_stream/src/features/signup/presentation/pages/signup_page.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );

      case Routes.welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomePage(),
        );

      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingPage(),
        );

      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpPage(),
        );

      case Routes.signIn:
        return MaterialPageRoute(
          builder: (_) => const SignInPage(),
        );

      case Routes.profile:
        return MaterialPageRoute(
          builder: (_) => ProfilePage(),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => HomePage(
              apiToken:
                  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NTdmMTE3N2QyN2Y5OTBlYmJlM2I0NSIsIm5hbWUiOiJDTSBQdW5rIiwiYXZhdGFyIjoiLy93d3cuZ3JhdmF0YXIuY29tL2F2YXRhci9iNzE5YjMzMzEzMGJkMDM1MmNjMDE3NGRhN2MwMTI1Nj9zPTIwMCZyPXBnJmQ9bW0iLCJpYXQiOjE2ODcyNTcyOTgsImV4cCI6MTY4NzI2MDg5OH0.JQQiekpxg95jnIV8W6bQz1nxXeN76VsPs8S3tdevjDI'),
        );

      default:
        return null;
    }
  }
}
