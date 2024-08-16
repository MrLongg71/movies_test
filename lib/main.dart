import 'package:flutter/material.dart';
import 'package:movies_test/core/themes/app_theme.dart';

import 'core/injector/injection_container.dart';
import 'core/navigation/route_names.dart';
import 'core/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Routes.instance.navigatorKey,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: RouteName.splashscreen,
      title: 'Movies app demo',
      theme: AppTheme.themeMode,
      builder: (context, widget) => widget ?? const SizedBox(),
    );
  }
}
