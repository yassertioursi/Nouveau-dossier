// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ValidationResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() valid,
    required TResult Function(String message) invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? valid,
    TResult? Function(String message)? invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? valid,
    TResult Function(String message)? invalid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ValidResult value) valid,
    required TResult Function(InvalidResult value) invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ValidResult value)? valid,
    TResult? Function(InvalidResult value)? invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ValidResult value)? valid,
    TResult Function(InvalidResult value)? invalid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationResultCopyWith<$Res> {
  factory $ValidationResultCopyWith(
          ValidationResult value, $Res Function(ValidationResult) then) =
      _$ValidationResultCopyWithImpl<$Res, ValidationResult>;
}

/// @nodoc
class _$ValidationResultCopyWithImpl<$Res, $Val extends ValidationResult>
    implements $ValidationResultCopyWith<$Res> {
  _$ValidationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ValidResultImplCopyWith<$Res> {
  factory _$$ValidResultImplCopyWith(
          _$ValidResultImpl value, $Res Function(_$ValidResultImpl) then) =
      __$$ValidResultImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ValidResultImplCopyWithImpl<$Res>
    extends _$ValidationResultCopyWithImpl<$Res, _$ValidResultImpl>
    implements _$$ValidResultImplCopyWith<$Res> {
  __$$ValidResultImplCopyWithImpl(
      _$ValidResultImpl _value, $Res Function(_$ValidResultImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ValidResultImpl implements ValidResult {
  const _$ValidResultImpl();

  @override
  String toString() {
    return 'ValidationResult.valid()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ValidResultImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() valid,
    required TResult Function(String message) invalid,
  }) {
    return valid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? valid,
    TResult? Function(String message)? invalid,
  }) {
    return valid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? valid,
    TResult Function(String message)? invalid,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ValidResult value) valid,
    required TResult Function(InvalidResult value) invalid,
  }) {
    return valid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ValidResult value)? valid,
    TResult? Function(InvalidResult value)? invalid,
  }) {
    return valid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ValidResult value)? valid,
    TResult Function(InvalidResult value)? invalid,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(this);
    }
    return orElse();
  }
}

abstract class ValidResult implements ValidationResult {
  const factory ValidResult() = _$ValidResultImpl;
}

/// @nodoc
abstract class _$$InvalidResultImplCopyWith<$Res> {
  factory _$$InvalidResultImplCopyWith(
          _$InvalidResultImpl value, $Res Function(_$InvalidResultImpl) then) =
      __$$InvalidResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InvalidResultImplCopyWithImpl<$Res>
    extends _$ValidationResultCopyWithImpl<$Res, _$InvalidResultImpl>
    implements _$$InvalidResultImplCopyWith<$Res> {
  __$$InvalidResultImplCopyWithImpl(
      _$InvalidResultImpl _value, $Res Function(_$InvalidResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$InvalidResultImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidResultImpl implements InvalidResult {
  const _$InvalidResultImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ValidationResult.invalid(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidResultImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidResultImplCopyWith<_$InvalidResultImpl> get copyWith =>
      __$$InvalidResultImplCopyWithImpl<_$InvalidResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() valid,
    required TResult Function(String message) invalid,
  }) {
    return invalid(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? valid,
    TResult? Function(String message)? invalid,
  }) {
    return invalid?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? valid,
    TResult Function(String message)? invalid,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ValidResult value) valid,
    required TResult Function(InvalidResult value) invalid,
  }) {
    return invalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ValidResult value)? valid,
    TResult? Function(InvalidResult value)? invalid,
  }) {
    return invalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ValidResult value)? valid,
    TResult Function(InvalidResult value)? invalid,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class InvalidResult implements ValidationResult {
  const factory InvalidResult(final String message) = _$InvalidResultImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$InvalidResultImplCopyWith<_$InvalidResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
