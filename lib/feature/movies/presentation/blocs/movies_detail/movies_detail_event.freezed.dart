// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MoviesDetailEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) onStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? onStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? onStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGetMoviesDetailEvent value) onStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnGetMoviesDetailEvent value)? onStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGetMoviesDetailEvent value)? onStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of MoviesDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoviesDetailEventCopyWith<MoviesDetailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesDetailEventCopyWith<$Res> {
  factory $MoviesDetailEventCopyWith(
          MoviesDetailEvent value, $Res Function(MoviesDetailEvent) then) =
      _$MoviesDetailEventCopyWithImpl<$Res, MoviesDetailEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$MoviesDetailEventCopyWithImpl<$Res, $Val extends MoviesDetailEvent>
    implements $MoviesDetailEventCopyWith<$Res> {
  _$MoviesDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoviesDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnGetMoviesDetailEventImplCopyWith<$Res>
    implements $MoviesDetailEventCopyWith<$Res> {
  factory _$$OnGetMoviesDetailEventImplCopyWith(
          _$OnGetMoviesDetailEventImpl value,
          $Res Function(_$OnGetMoviesDetailEventImpl) then) =
      __$$OnGetMoviesDetailEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$OnGetMoviesDetailEventImplCopyWithImpl<$Res>
    extends _$MoviesDetailEventCopyWithImpl<$Res, _$OnGetMoviesDetailEventImpl>
    implements _$$OnGetMoviesDetailEventImplCopyWith<$Res> {
  __$$OnGetMoviesDetailEventImplCopyWithImpl(
      _$OnGetMoviesDetailEventImpl _value,
      $Res Function(_$OnGetMoviesDetailEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoviesDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$OnGetMoviesDetailEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OnGetMoviesDetailEventImpl implements OnGetMoviesDetailEvent {
  const _$OnGetMoviesDetailEventImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'MoviesDetailEvent.onStarted(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnGetMoviesDetailEventImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of MoviesDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnGetMoviesDetailEventImplCopyWith<_$OnGetMoviesDetailEventImpl>
      get copyWith => __$$OnGetMoviesDetailEventImplCopyWithImpl<
          _$OnGetMoviesDetailEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) onStarted,
  }) {
    return onStarted(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? onStarted,
  }) {
    return onStarted?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? onStarted,
    required TResult orElse(),
  }) {
    if (onStarted != null) {
      return onStarted(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGetMoviesDetailEvent value) onStarted,
  }) {
    return onStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnGetMoviesDetailEvent value)? onStarted,
  }) {
    return onStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGetMoviesDetailEvent value)? onStarted,
    required TResult orElse(),
  }) {
    if (onStarted != null) {
      return onStarted(this);
    }
    return orElse();
  }
}

abstract class OnGetMoviesDetailEvent implements MoviesDetailEvent {
  const factory OnGetMoviesDetailEvent({required final int id}) =
      _$OnGetMoviesDetailEventImpl;

  @override
  int get id;

  /// Create a copy of MoviesDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnGetMoviesDetailEventImplCopyWith<_$OnGetMoviesDetailEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
