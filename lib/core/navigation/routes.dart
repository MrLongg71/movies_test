import 'package:flutter/material.dart';
import 'package:movies_test/features/movies/presentation/pages/movies_detail_page.dart';
import 'package:movies_test/features/movies/presentation/pages/trending_movies_page.dart';

import '../../features/splash/presentation/pages/splash_page.dart';
import '../utils/logger_util.dart';
import 'route_names.dart';

class Routes {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory Routes() => _instance;

  Routes._internal();

  static final Routes _instance = Routes._internal();

  static Routes get instance => _instance;

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) async {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateAndRemove(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  Future<dynamic> navigateAndReplace(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  dynamic pop({dynamic result}) {
    return navigatorKey.currentState?.pop(result);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    LOG.info('Route name: ${settings.name}');

    switch (settings.name) {
      case RouteName.splashscreen:
        return _pageRoute(
          page: const SplashPage(),
          setting: settings,
        );
      case RouteName.trendingMovies:
        return _pageRoute(
          page: const TrendingMoviesPage(),
          setting: settings,
        );
      case RouteName.movieDetail:
        Map<String, dynamic> params =
            settings.arguments as Map<String, dynamic>;
        return _pageRoute(
          page: MoviesDetailPage(
            id: params['id'],
          ),
          setting: settings,
        );
      default:
        return _emptyRoute(settings);
    }
  }

  static MaterialPageRoute _pageRoute({
    RouteSettings? setting,
    required Widget page,
  }) =>
      MaterialPageRoute(
        settings: setting,
        builder: (BuildContext context) => page,
      );

  static MaterialPageRoute _emptyRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Center(
              child: Text(
                'Back',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        body: Center(
          child: Text('No path for ${settings.name}'),
        ),
      ),
    );
  }

  BuildContext currentContext() {
    if (Routes.instance.navigatorKey.currentContext != null) {
      return Routes.instance.navigatorKey.currentContext!;
    } else {
      throw Exception('Current context not found');
    }
  }
}
