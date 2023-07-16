import 'package:flutter/material.dart';
import 'package:info_stream/src/core/routes/routes.dart';
import 'package:info_stream/src/core/services/local_storage/cache_service.dart';
import 'package:info_stream/src/core/widgets/logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    _decideNextScreen();
  }

  void _decideNextScreen() async {
    bool? onBoardingStatus = await CacheService.instance.getOnBoardingStatus();

    if (onBoardingStatus != null && onBoardingStatus && mounted) {
      Navigator.pushReplacementNamed(context, Routes.welcome);
    } else {
      Navigator.pushReplacementNamed(context, Routes.onBoarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Logo(logoSize: 36),
      ),
    );
  }
}
