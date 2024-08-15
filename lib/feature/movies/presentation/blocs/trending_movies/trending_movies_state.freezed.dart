// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TrendingMoviesState {
  TrendingMoviesStatus get status => throw _privateConstructorUsedError;
  List<MoviesEntity> get items => throw _privateConstructorUsedError;

  /// Create a copy of TrendingMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrendingMoviesStateCopyWith<TrendingMoviesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingMoviesStateCopyWith<$Res> {
  factory $TrendingMoviesStateCopyWith(
          TrendingMoviesState value, $Res Function(TrendingMoviesState) then) =
      _$TrendingMoviesStateCopyWithImpl<$Res, TrendingMoviesState>;
  @useResult
  $Res call({TrendingMoviesStatus status, List<MoviesEntity> items});
}

/// @nodoc
class _$TrendingMoviesStateCopyWithImpl<$Res, $Val extends TrendingMoviesState>
    implements $TrendingMoviesStateCopyWith<$Res> {
  _$TrendingMoviesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrendingMoviesState
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
              as TrendingMoviesStatus,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MoviesEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrendingMoviesStateImplCopyWith<$Res>
    implements $TrendingMoviesStateCopyWith<$Res> {
  factory _$$TrendingMoviesStateImplCopyWith(_$TrendingMoviesStateImpl value,
          $Res Function(_$TrendingMoviesStateImpl) then) =
      __$$TrendingMoviesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TrendingMoviesStatus status, List<MoviesEntity> items});
}

/// @nodoc
class __$$TrendingMoviesStateImplCopyWithImpl<$Res>
    extends _$TrendingMoviesStateCopyWithImpl<$Res, _$TrendingMoviesStateImpl>
    implements _$$TrendingMoviesStateImplCopyWith<$Res> {
  __$$TrendingMoviesStateImplCopyWithImpl(_$TrendingMoviesStateImpl _value,
      $Res Function(_$TrendingMoviesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrendingMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? items = null,
  }) {
    return _then(_$TrendingMoviesStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TrendingMoviesStatus,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MoviesEntity>,
    ));
  }
}

/// @nodoc

class _$TrendingMoviesStateImpl implements _TrendingMoviesState {
  const _$TrendingMoviesStateImpl(
      {this.status = TrendingMoviesStatus.loading,
      final List<MoviesEntity> items = const []})
      : _items = items;

  @override
  @JsonKey()
  final TrendingMoviesStatus status;
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
    return 'TrendingMoviesState(status: $status, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingMoviesStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_items));

  /// Create a copy of TrendingMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendingMoviesStateImplCopyWith<_$TrendingMoviesStateImpl> get copyWith =>
      __$$TrendingMoviesStateImplCopyWithImpl<_$TrendingMoviesStateImpl>(
          this, _$identity);
}

abstract class _TrendingMoviesState implements TrendingMoviesState {
  const factory _TrendingMoviesState(
      {final TrendingMoviesStatus status,
      final List<MoviesEntity> items}) = _$TrendingMoviesStateImpl;

  @override
  TrendingMoviesStatus get status;
  @override
  List<MoviesEntity> get items;

  /// Create a copy of TrendingMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrendingMoviesStateImplCopyWith<_$TrendingMoviesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
