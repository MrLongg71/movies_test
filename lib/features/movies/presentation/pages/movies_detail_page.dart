import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/core/constants/error_constants.dart';
import 'package:movies_test/features/movies/presentation/widgets/movie_detail_widget.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../../../../core/injector/injection_container.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../domain/entities/movie_detail_entity.dart';
import '../blocs/movies_detail/movies_detail_bloc.dart';
import '../blocs/movies_detail/movies_detail_event.dart';
import '../blocs/movies_detail/movies_detail_state.dart';
import '../widgets/movie_description_widget.dart';

class MoviesDetailPage extends StatefulWidget {
  const MoviesDetailPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<MoviesDetailPage> createState() => _MoviesDetailPageState();
}

class _MoviesDetailPageState extends State<MoviesDetailPage> {
  final MoviesDetailBloc _bloc = getIt<MoviesDetailBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(OnGetMoviesDetailEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocProvider.value(
      value: _bloc,
      child: BlocBuilder<MoviesDetailBloc, MoviesDetailState>(
        builder: (context, state) {
          switch (state.status) {
            case MoviesDetailStatus.loading:
              return const Center(child: CircularProgressIndicator());

            case MoviesDetailStatus.success:
              if (state.item != null) {
                return _buildSuccessContent(state.item!);
              }
              return const SizedBox();

            case MoviesDetailStatus.failure:
              return _buildFailureContent(state.appException);

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildSuccessContent(MovieDetailEntity item) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MovieDetailWidget(movieDetailEntity: item),
          MovieDescriptionWidget(desc: item.overview),
        ],
      ),
    );
  }

  Widget _buildFailureContent(AppException? appException) {
    if (appException?.err.statusCode == ErrorConstants.networkErrorCode) {
      return CustomErrorWidget.network(
        onRetry: () => _bloc.add(OnGetMoviesDetailEvent(id: widget.id)),
      );
    }
    return CustomErrorWidget(
      errMsg: appException?.err.statusMessage,
      onRetry: () => _bloc.add(OnGetMoviesDetailEvent(id: widget.id)),
    );
  }
}
