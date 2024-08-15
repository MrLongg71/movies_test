import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injector/injection_container.dart';
import '../blocs/movies_detail/movies_detail_bloc.dart';
import '../blocs/movies_detail/movies_detail_event.dart';
import '../blocs/movies_detail/movies_detail_state.dart';

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
      appBar: AppBar(
        title: const Text('Movies Detail'),
      ),
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

              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  children: [
                  //   Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Image.network(
                  //       state.item?.thumbnail ?? '',
                  //     ),
                  //   ),
                  //   Text(state.item?.title ?? ''),
                  //   Text(state.item?.description ?? ''),
                  //   Text(state.item?.category ?? ''),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
