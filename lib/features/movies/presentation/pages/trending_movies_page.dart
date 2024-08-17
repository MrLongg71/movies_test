import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/core/constants/constants.dart';

import '../../../../core/injector/injection_container.dart';
import '../../../../core/navigation/route_names.dart';
import '../../../../core/navigation/routes.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_list.dart';
import '../../../../core/widgets/text_field_icon_app.dart';
import '../blocs/trending_movies/trending_movies_bloc.dart';
import '../blocs/trending_movies/trending_movies_event.dart';
import '../blocs/trending_movies/trending_movies_state.dart';
import '../widgets/movie_card.dart';

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
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildSearchField(context),
          _buildMovieList(context),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Movies app demo'),
    );
  }

  Padding _buildSearchField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFieldIconApp(
        key: const Key(IntegrationTestKeyConst.searchMoviesOnTap),
        readOnly: true,
        placeholder: 'Search movies',
        onTap: () => Routes.instance.navigateTo(RouteName.searchMovies),
      ),
    );
  }

  Widget _buildMovieList(BuildContext context) {
    return Expanded(
      child: BlocProvider.value(
        value: _bloc,
        child: BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
          bloc: _bloc,
          builder: (context, state) {
            if (_isLoading(state)) {
              return const Center(child: CircularProgressIndicator());
            }

            if (_hasError(state)) {
              return _buildErrorWidget(state);
            }

            return _buildMovieListView(state);
          },
        ),
      ),
    );
  }

  bool _isLoading(TrendingMoviesState state) {
    return state.status == TrendingMoviesStatus.loading && state.items.isEmpty;
  }

  bool _hasError(TrendingMoviesState state) {
    return state.status == TrendingMoviesStatus.failure;
  }

  Widget _buildErrorWidget(TrendingMoviesState state) {
    if (state.appException?.err.statusCode == ErrorConstants.networkErrorCode) {
      return CustomErrorWidget.network(
        onRetry: () => _bloc.add(const OnGetTrendingMoviesEvent()),
      );
    }
    return CustomErrorWidget(
      errMsg: state.appException?.err.statusMessage,
      onRetry: () => _bloc.add(const OnGetTrendingMoviesEvent()),
    );
  }

  Widget _buildMovieListView(TrendingMoviesState state) {
    return CustomList(
      isComplete: state.status != TrendingMoviesStatus.loading,
      onRefresh: () => _bloc.add(const OnGetTrendingMoviesEvent()),
      onLoadMore: () => _loadMoreMovies(state),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        separatorBuilder: (_, idx) => const SizedBox(height: 12),
        itemCount: state.items.length,
        itemBuilder: (_, index) => MovieCard(
          onTap: (int? id) => _navigateToMovieDetail(id),
          movieEntity: state.items[index],
        ),
      ),
    );
  }

  void _loadMoreMovies(TrendingMoviesState state) {
    int nextPage = (state.items.length / ApiConstants.limitRequest).round() + 1;
    _bloc.add(OnGetTrendingMoviesEvent(page: nextPage));
  }

  void _navigateToMovieDetail(int? id) {
    if (id != null) {
      Routes.instance.navigateTo(
        RouteName.movieDetail,
        arguments: {'id': id},
      );
    }
  }
}
