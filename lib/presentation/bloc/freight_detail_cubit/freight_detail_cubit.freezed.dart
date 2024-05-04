// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freight_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FreightDetailState {
  bool get loading => throw _privateConstructorUsedError;
  FreightEntity get freight => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FreightDetailStateCopyWith<FreightDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreightDetailStateCopyWith<$Res> {
  factory $FreightDetailStateCopyWith(
          FreightDetailState value, $Res Function(FreightDetailState) then) =
      _$FreightDetailStateCopyWithImpl<$Res, FreightDetailState>;
  @useResult
  $Res call({bool loading, FreightEntity freight});
}

/// @nodoc
class _$FreightDetailStateCopyWithImpl<$Res, $Val extends FreightDetailState>
    implements $FreightDetailStateCopyWith<$Res> {
  _$FreightDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? freight = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      freight: null == freight
          ? _value.freight
          : freight // ignore: cast_nullable_to_non_nullable
              as FreightEntity,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FreightDetailStateImplCopyWith<$Res>
    implements $FreightDetailStateCopyWith<$Res> {
  factory _$$FreightDetailStateImplCopyWith(_$FreightDetailStateImpl value,
          $Res Function(_$FreightDetailStateImpl) then) =
      __$$FreightDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, FreightEntity freight});
}

/// @nodoc
class __$$FreightDetailStateImplCopyWithImpl<$Res>
    extends _$FreightDetailStateCopyWithImpl<$Res, _$FreightDetailStateImpl>
    implements _$$FreightDetailStateImplCopyWith<$Res> {
  __$$FreightDetailStateImplCopyWithImpl(_$FreightDetailStateImpl _value,
      $Res Function(_$FreightDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? freight = null,
  }) {
    return _then(_$FreightDetailStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      freight: null == freight
          ? _value.freight
          : freight // ignore: cast_nullable_to_non_nullable
              as FreightEntity,
    ));
  }
}

/// @nodoc

class _$FreightDetailStateImpl implements _FreightDetailState {
  const _$FreightDetailStateImpl({this.loading = false, required this.freight});

  @override
  @JsonKey()
  final bool loading;
  @override
  final FreightEntity freight;

  @override
  String toString() {
    return 'FreightDetailState(loading: $loading, freight: $freight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FreightDetailStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.freight, freight) || other.freight == freight));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, freight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FreightDetailStateImplCopyWith<_$FreightDetailStateImpl> get copyWith =>
      __$$FreightDetailStateImplCopyWithImpl<_$FreightDetailStateImpl>(
          this, _$identity);
}

abstract class _FreightDetailState implements FreightDetailState {
  const factory _FreightDetailState(
      {final bool loading,
      required final FreightEntity freight}) = _$FreightDetailStateImpl;

  @override
  bool get loading;
  @override
  FreightEntity get freight;
  @override
  @JsonKey(ignore: true)
  _$$FreightDetailStateImplCopyWith<_$FreightDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
