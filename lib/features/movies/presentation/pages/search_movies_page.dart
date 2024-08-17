import 'package:flutter/material.dart';
import 'package:movies_test/core/injector/injection_container.dart';
import 'package:movies_test/core/utils/utils.dart';
import 'package:movies_test/features/movies/presentation/blocs/search_movies/search_movies_bloc.dart';
import 'package:movies_test/features/movies/presentation/widgets/search_movies_result.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/text_field_icon_app.dart';

class SearchMoviesPage extends StatefulWidget {
  const SearchMoviesPage({super.key});

  @override
  SearchMoviesPageState createState() => SearchMoviesPageState();
}

class SearchMoviesPageState extends State<SearchMoviesPage> {
  late final Debouncer _debouncer;

  final SearchMoviesBloc _searchMoviesBloc = getIt<SearchMoviesBloc>();

  @override
  void initState() {
    super.initState();
    _debouncer = Debouncer(milliseconds: 500);
  }

  @override
  void dispose() {
    super.dispose();
    _debouncer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 32,
        title: TextFieldIconApp(
          key: const Key(IntegrationTestKeyConst.searchMoviesInputKeyword),
          placeholder: 'Search movies',
          onChanged: _onSearch,
        ),
      ),
      body: SearchMoviesResult(
        searchMoviesBloc: _searchMoviesBloc,
      ),
    );
  }

  void _onSearch(String query) {
    if (query.isEmpty) return;

    _debouncer.run(
      () {
        FocusScope.of(context).unfocus();
        _searchMoviesBloc.add(
          OnSearchMovies(
            query: query.trim(),
          ),
        );
      },
    );
  }
}
