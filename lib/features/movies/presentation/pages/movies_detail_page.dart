import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/features/movies/presentation/widgets/movie_detail_widget.dart';

import '../../../../core/injector/injection_container.dart';
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
          return BlocBuilder<MoviesDetailBloc, MoviesDetailState>(
            builder: (context, state) {
              if (state.status == MoviesDetailStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.item != null) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      MovieDetailWidget(movieDetailEntity: state.item!),
                      MovieDescriptionWidget(desc: state.item?.overview),
                    ],
                  ),
                );
              }
              return SizedBox();
            },
          );
        },
      ),
    );
  }
}
