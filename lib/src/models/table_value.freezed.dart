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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$TableDataCopyWith<T, $Res> {
  factory _$$TableDataCopyWith(
          _$TableData<T> value, $Res Function(_$TableData<T>) then) =
      __$$TableDataCopyWithImpl<T, $Res>;
  $Res call({List<T> data});
}

/// @nodoc
class __$$TableDataCopyWithImpl<T, $Res>
    extends _$TableValueCopyWithImpl<T, $Res>
    implements _$$TableDataCopyWith<T, $Res> {
  __$$TableDataCopyWithImpl(
      _$TableData<T> _value, $Res Function(_$TableData<T>) _then)
      : super(_value, (v) => _then(v as _$TableData<T>));

  @override
  _$TableData<T> get _value => super._value as _$TableData<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$TableData<T>(
      data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$TableData<T> implements TableData<T> {
  const _$TableData(final List<T> data) : _data = data;

  final List<T> _data;
  @override
  List<T> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'TableValue<$T>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableData<T> &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$TableDataCopyWith<T, _$TableData<T>> get copyWith =>
      __$$TableDataCopyWithImpl<T, _$TableData<T>>(this, _$identity);

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
  const factory TableData(final List<T> data) = _$TableData<T>;

  List<T> get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$TableDataCopyWith<T, _$TableData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TableLoadingCopyWith<T, $Res> {
  factory _$$TableLoadingCopyWith(
          _$TableLoading<T> value, $Res Function(_$TableLoading<T>) then) =
      __$$TableLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$TableLoadingCopyWithImpl<T, $Res>
    extends _$TableValueCopyWithImpl<T, $Res>
    implements _$$TableLoadingCopyWith<T, $Res> {
  __$$TableLoadingCopyWithImpl(
      _$TableLoading<T> _value, $Res Function(_$TableLoading<T>) _then)
      : super(_value, (v) => _then(v as _$TableLoading<T>));

  @override
  _$TableLoading<T> get _value => super._value as _$TableLoading<T>;
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
        (other.runtimeType == runtimeType && other is _$TableLoading<T>);
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
abstract class _$$TableEmptyCopyWith<T, $Res> {
  factory _$$TableEmptyCopyWith(
          _$TableEmpty<T> value, $Res Function(_$TableEmpty<T>) then) =
      __$$TableEmptyCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$TableEmptyCopyWithImpl<T, $Res>
    extends _$TableValueCopyWithImpl<T, $Res>
    implements _$$TableEmptyCopyWith<T, $Res> {
  __$$TableEmptyCopyWithImpl(
      _$TableEmpty<T> _value, $Res Function(_$TableEmpty<T>) _then)
      : super(_value, (v) => _then(v as _$TableEmpty<T>));

  @override
  _$TableEmpty<T> get _value => super._value as _$TableEmpty<T>;
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
        (other.runtimeType == runtimeType && other is _$TableEmpty<T>);
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
abstract class _$$TableErrorCopyWith<T, $Res> {
  factory _$$TableErrorCopyWith(
          _$TableError<T> value, $Res Function(_$TableError<T>) then) =
      __$$TableErrorCopyWithImpl<T, $Res>;
  $Res call({Object err});
}

/// @nodoc
class __$$TableErrorCopyWithImpl<T, $Res>
    extends _$TableValueCopyWithImpl<T, $Res>
    implements _$$TableErrorCopyWith<T, $Res> {
  __$$TableErrorCopyWithImpl(
      _$TableError<T> _value, $Res Function(_$TableError<T>) _then)
      : super(_value, (v) => _then(v as _$TableError<T>));

  @override
  _$TableError<T> get _value => super._value as _$TableError<T>;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_$TableError<T>(
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
            other is _$TableError<T> &&
            const DeepCollectionEquality().equals(other.err, err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(err));

  @JsonKey(ignore: true)
  @override
  _$$TableErrorCopyWith<T, _$TableError<T>> get copyWith =>
      __$$TableErrorCopyWithImpl<T, _$TableError<T>>(this, _$identity);

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
  const factory TableError(final Object err) = _$TableError<T>;

  Object get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$TableErrorCopyWith<T, _$TableError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
