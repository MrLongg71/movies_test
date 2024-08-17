import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/exceptions/app_exception.dart';
import '../../../../core/navigation/route_names.dart';
import '../../../../core/navigation/routes.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/empty_data_widget.dart';
import '../../domain/entities/movie_entity.dart';
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
          switch (state.status) {
            case SearchMoviesStatus.loading:
              return const Center(child: CircularProgressIndicator());

            case SearchMoviesStatus.success:
              return _buildSuccessContent(state.items);
            case SearchMoviesStatus.failure:
              return _buildFailureContent(state.appException);
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildSuccessContent(List<MovieEntity> items) {
    return items.isEmpty
        ? const EmptyDataWidget()
        : ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            separatorBuilder: (_, idx) => const SizedBox(height: 12),
            itemCount: items.length,
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
              movieEntity: items[index],
            ),
          );
  }

  Widget _buildFailureContent(AppException? appException) {
    if (appException?.err.statusCode == ErrorConstants.networkErrorCode) {
      return const CustomErrorWidget.network();
    }
    return CustomErrorWidget(
      errMsg: appException?.err.statusMessage,
    );
  }
}
