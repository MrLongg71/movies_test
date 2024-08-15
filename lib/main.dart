import 'package:flutter/material.dart';

import 'core/injector/injection_container.dart';
import 'features/movies/presentation/pages/trending_movies_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TDD Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TrendingMoviesPage(),
    );
  }
}
