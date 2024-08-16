import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/core/extensions/string_extensions.dart';
import 'package:movies_test/core/navigation/route_names.dart';
import 'package:movies_test/core/navigation/routes.dart';
import 'package:movies_test/core/themes/app_colors.dart';
import 'package:movies_test/core/themes/typography.dart';
import 'package:movies_test/core/widgets/custom_list.dart';
import 'package:movies_test/features/movies/presentation/widgets/movie_card.dart';

import '../../../../core/constants/api_constants.dart';
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
        automaticallyImplyLeading: false,
        title: const Text(
          'Movies app demo',
          style: Header3(
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: BlocProvider.value(
        value: _bloc,
        child: BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state.status == TrendingMoviesStatus.loading &&
                state.items.isNullOrEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return CustomList(
              isComplete: state.status != TrendingMoviesStatus.loading,
              onRefresh: () => _bloc.add(const OnGetTrendingMoviesEvent()),
              onLoadMore: () {
                int nextPage =
                    (state.items.length / ApiConstants.limitRequest).round() +
                        1;
                _bloc.add(OnGetTrendingMoviesEvent(page: nextPage));
              },
              child: ListView.separated(
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
              ),
            );
          },
        ),
      ),
    );
  }
}
