import 'package:flutter/material.dart';
import 'package:movies_test/core/navigation/route_names.dart';
import 'package:movies_test/core/navigation/routes.dart';
import 'package:movies_test/core/utils/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Debouncer(milliseconds: 300).run(
        () => Routes.instance.navigateTo(RouteName.trendingMovies),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
