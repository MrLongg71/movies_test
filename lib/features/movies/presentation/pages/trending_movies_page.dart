import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injector/injection_container.dart';
import '../blocs/trending_movies/trending_movies_bloc.dart';
import '../blocs/trending_movies/trending_movies_event.dart';
import '../blocs/trending_movies/trending_movies_state.dart';

class TrendingMoviesPage extends StatefulWidget {
  const TrendingMoviesPage({super.key});

  @override
  State<TrendingMoviesPage> createState() => _TrendingMoviesPageState();
}

class _TrendingMoviesPageState extends State<TrendingMoviesPage> {
  final TrendingMoviesBloc _bloc = getIt<TrendingMoviesBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(const OnGetTrendingMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter TDD Clean Architecture'),
      ),
      body: BlocProvider.value(
        value: _bloc,
        child: BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state.status == TrendingMoviesStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              itemCount: state.items.length,
              itemBuilder: (_, index) => InkWell(
                // onTap: () => Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => TrendingMoviesDetailPage(
                //       id: state.items[index].id ?? -1,
                //     ),
                //   ),
                // ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  margin: const EdgeInsets.only(top: 12),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Expanded(
                  //       flex: 2,
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Image.network(
                  //           state.items[index].thumbnail ?? '',
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 6),
                  //     Expanded(
                  //       flex: 8,
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             state.items[index].title ?? '',
                  //           ),
                  //           const SizedBox(height: 3),
                  //           Text(
                  //             '${state.items[index].price ?? ''}',
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
