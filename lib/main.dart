import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:info_stream/src/core/bloc_providers/bloc_providers.dart';
import 'package:info_stream/src/core/routes/route_generator.dart';
import 'package:info_stream/src/core/routes/routes.dart';
import 'package:info_stream/src/core/text_constants.dart';
import 'package:info_stream/src/core/values.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/core/di/injection_container.dart' as di;

void main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool showSplash = prefs.getBool('showSplash') ?? true;

  runApp(MyApp(showSplash: showSplash));
}

class MyApp extends StatelessWidget {
  final bool showSplash;
  const MyApp({
    super.key,
    required this.showSplash,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(Values.defaultWidth, Values.defaultHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: GlobalBlocProviders().providers,
          child: MaterialApp(
            title: TextConstants.appName,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: RouteGenerator.generateRoute,
            // initialRoute: Routes.splash,
            initialRoute: showSplash ? Routes.splash : Routes.signIn,
          ),
        );
      },
    );
  }
}
