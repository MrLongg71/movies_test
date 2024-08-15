// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MoviesDetailState {
  MoviesDetailStatus get status => throw _privateConstructorUsedError;
  MoviesEntity? get item => throw _privateConstructorUsedError;

  /// Create a copy of MoviesDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoviesDetailStateCopyWith<MoviesDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesDetailStateCopyWith<$Res> {
  factory $MoviesDetailStateCopyWith(
          MoviesDetailState value, $Res Function(MoviesDetailState) then) =
      _$MoviesDetailStateCopyWithImpl<$Res, MoviesDetailState>;
  @useResult
  $Res call({MoviesDetailStatus status, MoviesEntity? item});
}

/// @nodoc
class _$MoviesDetailStateCopyWithImpl<$Res, $Val extends MoviesDetailState>
    implements $MoviesDetailStateCopyWith<$Res> {
  _$MoviesDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoviesDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MoviesDetailStatus,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MoviesEntity?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoviesDetailStateImplCopyWith<$Res>
    implements $MoviesDetailStateCopyWith<$Res> {
  factory _$$MoviesDetailStateImplCopyWith(_$MoviesDetailStateImpl value,
          $Res Function(_$MoviesDetailStateImpl) then) =
      __$$MoviesDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MoviesDetailStatus status, MoviesEntity? item});
}

/// @nodoc
class __$$MoviesDetailStateImplCopyWithImpl<$Res>
    extends _$MoviesDetailStateCopyWithImpl<$Res, _$MoviesDetailStateImpl>
    implements _$$MoviesDetailStateImplCopyWith<$Res> {
  __$$MoviesDetailStateImplCopyWithImpl(_$MoviesDetailStateImpl _value,
      $Res Function(_$MoviesDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoviesDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? item = freezed,
  }) {
    return _then(_$MoviesDetailStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MoviesDetailStatus,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MoviesEntity?,
    ));
  }
}

/// @nodoc

class _$MoviesDetailStateImpl implements _MoviesDetailState {
  const _$MoviesDetailStateImpl(
      {this.status = MoviesDetailStatus.loading, this.item});

  @override
  @JsonKey()
  final MoviesDetailStatus status;
  @override
  final MoviesEntity? item;

  @override
  String toString() {
    return 'MoviesDetailState(status: $status, item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoviesDetailStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, item);

  /// Create a copy of MoviesDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoviesDetailStateImplCopyWith<_$MoviesDetailStateImpl> get copyWith =>
      __$$MoviesDetailStateImplCopyWithImpl<_$MoviesDetailStateImpl>(
          this, _$identity);
}

abstract class _MoviesDetailState implements MoviesDetailState {
  const factory _MoviesDetailState(
      {final MoviesDetailStatus status,
      final MoviesEntity? item}) = _$MoviesDetailStateImpl;

  @override
  MoviesDetailStatus get status;
  @override
  MoviesEntity? get item;

  /// Create a copy of MoviesDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoviesDetailStateImplCopyWith<_$MoviesDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
