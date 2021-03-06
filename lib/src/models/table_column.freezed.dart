// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'table_column.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TableColumn<T> {
  TableColumnSize get size => throw _privateConstructorUsedError;
  Widget get label => throw _privateConstructorUsedError;
  Widget Function(int, T) get cellBuilder => throw _privateConstructorUsedError;
  bool get canSort => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TableColumnCopyWith<T, TableColumn<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableColumnCopyWith<T, $Res> {
  factory $TableColumnCopyWith(
          TableColumn<T> value, $Res Function(TableColumn<T>) then) =
      _$TableColumnCopyWithImpl<T, $Res>;
  $Res call(
      {TableColumnSize size,
      Widget label,
      Widget Function(int, T) cellBuilder,
      bool canSort});

  $TableColumnSizeCopyWith<$Res> get size;
}

/// @nodoc
class _$TableColumnCopyWithImpl<T, $Res>
    implements $TableColumnCopyWith<T, $Res> {
  _$TableColumnCopyWithImpl(this._value, this._then);

  final TableColumn<T> _value;
  // ignore: unused_field
  final $Res Function(TableColumn<T>) _then;

  @override
  $Res call({
    Object? size = freezed,
    Object? label = freezed,
    Object? cellBuilder = freezed,
    Object? canSort = freezed,
  }) {
    return _then(_value.copyWith(
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as TableColumnSize,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as Widget,
      cellBuilder: cellBuilder == freezed
          ? _value.cellBuilder
          : cellBuilder // ignore: cast_nullable_to_non_nullable
              as Widget Function(int, T),
      canSort: canSort == freezed
          ? _value.canSort
          : canSort // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $TableColumnSizeCopyWith<$Res> get size {
    return $TableColumnSizeCopyWith<$Res>(_value.size, (value) {
      return _then(_value.copyWith(size: value));
    });
  }
}

/// @nodoc
abstract class _$$_TableColumnCopyWith<T, $Res>
    implements $TableColumnCopyWith<T, $Res> {
  factory _$$_TableColumnCopyWith(
          _$_TableColumn<T> value, $Res Function(_$_TableColumn<T>) then) =
      __$$_TableColumnCopyWithImpl<T, $Res>;
  @override
  $Res call(
      {TableColumnSize size,
      Widget label,
      Widget Function(int, T) cellBuilder,
      bool canSort});

  @override
  $TableColumnSizeCopyWith<$Res> get size;
}

/// @nodoc
class __$$_TableColumnCopyWithImpl<T, $Res>
    extends _$TableColumnCopyWithImpl<T, $Res>
    implements _$$_TableColumnCopyWith<T, $Res> {
  __$$_TableColumnCopyWithImpl(
      _$_TableColumn<T> _value, $Res Function(_$_TableColumn<T>) _then)
      : super(_value, (v) => _then(v as _$_TableColumn<T>));

  @override
  _$_TableColumn<T> get _value => super._value as _$_TableColumn<T>;

  @override
  $Res call({
    Object? size = freezed,
    Object? label = freezed,
    Object? cellBuilder = freezed,
    Object? canSort = freezed,
  }) {
    return _then(_$_TableColumn<T>(
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as TableColumnSize,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as Widget,
      cellBuilder: cellBuilder == freezed
          ? _value.cellBuilder
          : cellBuilder // ignore: cast_nullable_to_non_nullable
              as Widget Function(int, T),
      canSort: canSort == freezed
          ? _value.canSort
          : canSort // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TableColumn<T> implements _TableColumn<T> {
  _$_TableColumn(
      {this.size = const TableColumnSize.flex(1),
      required this.label,
      required this.cellBuilder,
      this.canSort = false});

  @override
  @JsonKey()
  final TableColumnSize size;
  @override
  final Widget label;
  @override
  final Widget Function(int, T) cellBuilder;
  @override
  @JsonKey()
  final bool canSort;

  @override
  String toString() {
    return 'TableColumn<$T>(size: $size, label: $label, cellBuilder: $cellBuilder, canSort: $canSort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TableColumn<T> &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            (identical(other.cellBuilder, cellBuilder) ||
                other.cellBuilder == cellBuilder) &&
            const DeepCollectionEquality().equals(other.canSort, canSort));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(label),
      cellBuilder,
      const DeepCollectionEquality().hash(canSort));

  @JsonKey(ignore: true)
  @override
  _$$_TableColumnCopyWith<T, _$_TableColumn<T>> get copyWith =>
      __$$_TableColumnCopyWithImpl<T, _$_TableColumn<T>>(this, _$identity);
}

abstract class _TableColumn<T> implements TableColumn<T> {
  factory _TableColumn(
      {final TableColumnSize size,
      required final Widget label,
      required final Widget Function(int, T) cellBuilder,
      final bool canSort}) = _$_TableColumn<T>;

  @override
  TableColumnSize get size => throw _privateConstructorUsedError;
  @override
  Widget get label => throw _privateConstructorUsedError;
  @override
  Widget Function(int, T) get cellBuilder => throw _privateConstructorUsedError;
  @override
  bool get canSort => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TableColumnCopyWith<T, _$_TableColumn<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
