import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/core/widgets/empty_data_widget.dart';

import '../../../../core/navigation/route_names.dart';
import '../../../../core/navigation/routes.dart';
import '../blocs/search_movies/search_movies_bloc.dart';
import 'movie_card.dart';

class SearchMoviesResult extends StatelessWidget {
  const SearchMoviesResult({
    super.key,
    required this.searchMoviesBloc,
  });

  final SearchMoviesBloc searchMoviesBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: searchMoviesBloc,
      child: BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
        bloc: searchMoviesBloc,
        builder: (context, state) {
          if (state.status == SearchMoviesStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == SearchMoviesStatus.success) {
            return state.items.isEmpty
                ? const EmptyDataWidget()
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    separatorBuilder: (_, idx) => const SizedBox(height: 12),
                    itemCount: state.items.length,
                    itemBuilder: (_, index) => MovieCard(
                      onTap: (int? id) {
                        assert(id != null);
                        Routes.instance.navigateTo(
                          RouteName.movieDetail,
                          arguments: {
                            'id': id,
                          },
                        );
                      },
                      movieEntity: state.items[index],
                    ),
                  );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
