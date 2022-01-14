// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'table_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TableValueTearOff {
  const _$TableValueTearOff();

  TableData<T> data<T>(List<T> data) {
    return TableData<T>(
      data,
    );
  }

  TableLoading<T> loading<T>() {
    return TableLoading<T>();
  }

  TableEmpty<T> empty<T>() {
    return TableEmpty<T>();
  }

  TableError<T> error<T>(Object err) {
    return TableError<T>(
      err,
    );
  }
}

/// @nodoc
const $TableValue = _$TableValueTearOff();

/// @nodoc
mixin _$TableValue<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> data) data,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Object err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<T> data)? data,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> data)? data,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TableData<T> value) data,
    required TResult Function(TableLoading<T> value) loading,
    required TResult Function(TableEmpty<T> value) empty,
    required TResult Function(TableError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TableData<T> value)? data,
    TResult Function(TableLoading<T> value)? loading,
    TResult Function(TableEmpty<T> value)? empty,
    TResult Function(TableError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TableData<T> value)? data,
    TResult Function(TableLoading<T> value)? loading,
    TResult Function(TableEmpty<T> value)? empty,
    TResult Function(TableError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableValueCopyWith<T, $Res> {
  factory $TableValueCopyWith(
          TableValue<T> value, $Res Function(TableValue<T>) then) =
      _$TableValueCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$TableValueCopyWithImpl<T, $Res>
    implements $TableValueCopyWith<T, $Res> {
  _$TableValueCopyWithImpl(this._value, this._then);

  final TableValue<T> _value;
  // ignore: unused_field
  final $Res Function(TableValue<T>) _then;
}

/// @nodoc
abstract class $TableDataCopyWith<T, $Res> {
  factory $TableDataCopyWith(
          TableData<T> value, $Res Function(TableData<T>) then) =
      _$TableDataCopyWithImpl<T, $Res>;
  $Res call({List<T> data});
}

/// @nodoc
class _$TableDataCopyWithImpl<T, $Res> extends _$TableValueCopyWithImpl<T, $Res>
    implements $TableDataCopyWith<T, $Res> {
  _$TableDataCopyWithImpl(
      TableData<T> _value, $Res Function(TableData<T>) _then)
      : super(_value, (v) => _then(v as TableData<T>));

  @override
  TableData<T> get _value => super._value as TableData<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(TableData<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$TableData<T> implements TableData<T> {
  const _$TableData(this.data);

  @override
  final List<T> data;

  @override
  String toString() {
    return 'TableValue<$T>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableData<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $TableDataCopyWith<T, TableData<T>> get copyWith =>
      _$TableDataCopyWithImpl<T, TableData<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> data) data,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Object err) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<T> data)? data,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object err)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> data)? data,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object err)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TableData<T> value) data,
    required TResult Function(TableLoading<T> value) loading,
    required TResult Function(TableEmpty<T> value) empty,
    required TResult Function(TableError<T> value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TableData<T> value)? data,
    TResult Function(TableLoading<T> value)? loading,
    TResult Function(TableEmpty<T> value)? empty,
    TResult Function(TableError<T> value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TableData<T> value)? data,
    TResult Function(TableLoading<T> value)? loading,
    TResult Function(TableEmpty<T> value)? empty,
    TResult Function(TableError<T> value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class TableData<T> implements TableValue<T> {
  const factory TableData(List<T> data) = _$TableData<T>;

  List<T> get data;
  @JsonKey(ignore: true)
  $TableDataCopyWith<T, TableData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableLoadingCopyWith<T, $Res> {
  factory $TableLoadingCopyWith(
          TableLoading<T> value, $Res Function(TableLoading<T>) then) =
      _$TableLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$TableLoadingCopyWithImpl<T, $Res>
    extends _$TableValueCopyWithImpl<T, $Res>
    implements $TableLoadingCopyWith<T, $Res> {
  _$TableLoadingCopyWithImpl(
      TableLoading<T> _value, $Res Function(TableLoading<T>) _then)
      : super(_value, (v) => _then(v as TableLoading<T>));

  @override
  TableLoading<T> get _value => super._value as TableLoading<T>;
}

/// @nodoc

class _$TableLoading<T> implements TableLoading<T> {
  const _$TableLoading();

  @override
  String toString() {
    return 'TableValue<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TableLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> data) data,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Object err) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<T> data)? data,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object err)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> data)? data,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object err)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TableData<T> value) data,
    required TResult Function(TableLoading<T> value) loading,
    required TResult Function(TableEmpty<T> value) empty,
    required TResult Function(TableError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TableData<T> value)? data,
    TResult Function(TableLoading<T> value)? loading,
    TResult Function(TableEmpty<T> value)? empty,
    TResult Function(TableError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TableData<T> value)? data,
    TResult Function(TableLoading<T> value)? loading,
    TResult Function(TableEmpty<T> value)? empty,
    TResult Function(TableError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TableLoading<T> implements TableValue<T> {
  const factory TableLoading() = _$TableLoading<T>;
}

/// @nodoc
abstract class $TableEmptyCopyWith<T, $Res> {
  factory $TableEmptyCopyWith(
          TableEmpty<T> value, $Res Function(TableEmpty<T>) then) =
      _$TableEmptyCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$TableEmptyCopyWithImpl<T, $Res>
    extends _$TableValueCopyWithImpl<T, $Res>
    implements $TableEmptyCopyWith<T, $Res> {
  _$TableEmptyCopyWithImpl(
      TableEmpty<T> _value, $Res Function(TableEmpty<T>) _then)
      : super(_value, (v) => _then(v as TableEmpty<T>));

  @override
  TableEmpty<T> get _value => super._value as TableEmpty<T>;
}

/// @nodoc

class _$TableEmpty<T> implements TableEmpty<T> {
  const _$TableEmpty();

  @override
  String toString() {
    return 'TableValue<$T>.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TableEmpty<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> data) data,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Object err) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<T> data)? data,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object err)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> data)? data,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object err)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TableData<T> value) data,
    required TResult Function(TableLoading<T> value) loading,
    required TResult Function(TableEmpty<T> value) empty,
    required TResult Function(TableError<T> value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TableData<T> value)? data,
    TResult Function(TableLoading<T> value)? loading,
    TResult Function(TableEmpty<T> value)? empty,
    TResult Function(TableError<T> value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TableData<T> value)? data,
    TResult Function(TableLoading<T> value)? loading,
    TResult Function(TableEmpty<T> value)? empty,
    TResult Function(TableError<T> value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class TableEmpty<T> implements TableValue<T> {
  const factory TableEmpty() = _$TableEmpty<T>;
}

/// @nodoc
abstract class $TableErrorCopyWith<T, $Res> {
  factory $TableErrorCopyWith(
          TableError<T> value, $Res Function(TableError<T>) then) =
      _$TableErrorCopyWithImpl<T, $Res>;
  $Res call({Object err});
}

/// @nodoc
class _$TableErrorCopyWithImpl<T, $Res>
    extends _$TableValueCopyWithImpl<T, $Res>
    implements $TableErrorCopyWith<T, $Res> {
  _$TableErrorCopyWithImpl(
      TableError<T> _value, $Res Function(TableError<T>) _then)
      : super(_value, (v) => _then(v as TableError<T>));

  @override
  TableError<T> get _value => super._value as TableError<T>;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(TableError<T>(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as Object,
    ));
  }
}

/// @nodoc

class _$TableError<T> implements TableError<T> {
  const _$TableError(this.err);

  @override
  final Object err;

  @override
  String toString() {
    return 'TableValue<$T>.error(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableError<T> &&
            const DeepCollectionEquality().equals(other.err, err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(err));

  @JsonKey(ignore: true)
  @override
  $TableErrorCopyWith<T, TableError<T>> get copyWith =>
      _$TableErrorCopyWithImpl<T, TableError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> data) data,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Object err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<T> data)? data,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> data)? data,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TableData<T> value) data,
    required TResult Function(TableLoading<T> value) loading,
    required TResult Function(TableEmpty<T> value) empty,
    required TResult Function(TableError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TableData<T> value)? data,
    TResult Function(TableLoading<T> value)? loading,
    TResult Function(TableEmpty<T> value)? empty,
    TResult Function(TableError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TableData<T> value)? data,
    TResult Function(TableLoading<T> value)? loading,
    TResult Function(TableEmpty<T> value)? empty,
    TResult Function(TableError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TableError<T> implements TableValue<T> {
  const factory TableError(Object err) = _$TableError<T>;

  Object get err;
  @JsonKey(ignore: true)
  $TableErrorCopyWith<T, TableError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
