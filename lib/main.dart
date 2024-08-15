import 'package:flutter/material.dart';

import 'core/injector/injection_container.dart';
import 'features/movies/presentation/pages/trending_movies_page.dart';

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
      title: 'Movies app demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TrendingMoviesPage(),
    );
  }
}
