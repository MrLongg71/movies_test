// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_movies_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchMoviesEvent {
  String? get query => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? query) onSearchMovies,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? query)? onSearchMovies,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? query)? onSearchMovies,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnSearchMovies value) onSearchMovies,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnSearchMovies value)? onSearchMovies,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnSearchMovies value)? onSearchMovies,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of SearchMoviesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchMoviesEventCopyWith<SearchMoviesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchMoviesEventCopyWith<$Res> {
  factory $SearchMoviesEventCopyWith(
          SearchMoviesEvent value, $Res Function(SearchMoviesEvent) then) =
      _$SearchMoviesEventCopyWithImpl<$Res, SearchMoviesEvent>;
  @useResult
  $Res call({String? query});
}

/// @nodoc
class _$SearchMoviesEventCopyWithImpl<$Res, $Val extends SearchMoviesEvent>
    implements $SearchMoviesEventCopyWith<$Res> {
  _$SearchMoviesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchMoviesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_value.copyWith(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnSearchMoviesImplCopyWith<$Res>
    implements $SearchMoviesEventCopyWith<$Res> {
  factory _$$OnSearchMoviesImplCopyWith(_$OnSearchMoviesImpl value,
          $Res Function(_$OnSearchMoviesImpl) then) =
      __$$OnSearchMoviesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? query});
}

/// @nodoc
class __$$OnSearchMoviesImplCopyWithImpl<$Res>
    extends _$SearchMoviesEventCopyWithImpl<$Res, _$OnSearchMoviesImpl>
    implements _$$OnSearchMoviesImplCopyWith<$Res> {
  __$$OnSearchMoviesImplCopyWithImpl(
      _$OnSearchMoviesImpl _value, $Res Function(_$OnSearchMoviesImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchMoviesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_$OnSearchMoviesImpl(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OnSearchMoviesImpl implements OnSearchMovies {
  const _$OnSearchMoviesImpl({this.query});

  @override
  final String? query;

  @override
  String toString() {
    return 'SearchMoviesEvent.onSearchMovies(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnSearchMoviesImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of SearchMoviesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnSearchMoviesImplCopyWith<_$OnSearchMoviesImpl> get copyWith =>
      __$$OnSearchMoviesImplCopyWithImpl<_$OnSearchMoviesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? query) onSearchMovies,
  }) {
    return onSearchMovies(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? query)? onSearchMovies,
  }) {
    return onSearchMovies?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? query)? onSearchMovies,
    required TResult orElse(),
  }) {
    if (onSearchMovies != null) {
      return onSearchMovies(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnSearchMovies value) onSearchMovies,
  }) {
    return onSearchMovies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnSearchMovies value)? onSearchMovies,
  }) {
    return onSearchMovies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnSearchMovies value)? onSearchMovies,
    required TResult orElse(),
  }) {
    if (onSearchMovies != null) {
      return onSearchMovies(this);
    }
    return orElse();
  }
}

abstract class OnSearchMovies implements SearchMoviesEvent {
  const factory OnSearchMovies({final String? query}) = _$OnSearchMoviesImpl;

  @override
  String? get query;

  /// Create a copy of SearchMoviesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnSearchMoviesImplCopyWith<_$OnSearchMoviesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchMoviesState {
  SearchMoviesStatus get status => throw _privateConstructorUsedError;
  List<MoviesEntity> get items => throw _privateConstructorUsedError;

  /// Create a copy of SearchMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchMoviesStateCopyWith<SearchMoviesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchMoviesStateCopyWith<$Res> {
  factory $SearchMoviesStateCopyWith(
          SearchMoviesState value, $Res Function(SearchMoviesState) then) =
      _$SearchMoviesStateCopyWithImpl<$Res, SearchMoviesState>;
  @useResult
  $Res call({SearchMoviesStatus status, List<MoviesEntity> items});
}

/// @nodoc
class _$SearchMoviesStateCopyWithImpl<$Res, $Val extends SearchMoviesState>
    implements $SearchMoviesStateCopyWith<$Res> {
  _$SearchMoviesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SearchMoviesStatus,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MoviesEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchMoviesStateImplCopyWith<$Res>
    implements $SearchMoviesStateCopyWith<$Res> {
  factory _$$SearchMoviesStateImplCopyWith(_$SearchMoviesStateImpl value,
          $Res Function(_$SearchMoviesStateImpl) then) =
      __$$SearchMoviesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SearchMoviesStatus status, List<MoviesEntity> items});
}

/// @nodoc
class __$$SearchMoviesStateImplCopyWithImpl<$Res>
    extends _$SearchMoviesStateCopyWithImpl<$Res, _$SearchMoviesStateImpl>
    implements _$$SearchMoviesStateImplCopyWith<$Res> {
  __$$SearchMoviesStateImplCopyWithImpl(_$SearchMoviesStateImpl _value,
      $Res Function(_$SearchMoviesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? items = null,
  }) {
    return _then(_$SearchMoviesStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SearchMoviesStatus,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MoviesEntity>,
    ));
  }
}

/// @nodoc

class _$SearchMoviesStateImpl implements _SearchMoviesState {
  const _$SearchMoviesStateImpl(
      {this.status = SearchMoviesStatus.loading,
      final List<MoviesEntity> items = const []})
      : _items = items;

  @override
  @JsonKey()
  final SearchMoviesStatus status;
  final List<MoviesEntity> _items;
  @override
  @JsonKey()
  List<MoviesEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'SearchMoviesState(status: $status, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchMoviesStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_items));

  /// Create a copy of SearchMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchMoviesStateImplCopyWith<_$SearchMoviesStateImpl> get copyWith =>
      __$$SearchMoviesStateImplCopyWithImpl<_$SearchMoviesStateImpl>(
          this, _$identity);
}

abstract class _SearchMoviesState implements SearchMoviesState {
  const factory _SearchMoviesState(
      {final SearchMoviesStatus status,
      final List<MoviesEntity> items}) = _$SearchMoviesStateImpl;

  @override
  SearchMoviesStatus get status;
  @override
  List<MoviesEntity> get items;

  /// Create a copy of SearchMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchMoviesStateImplCopyWith<_$SearchMoviesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
