// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'table_column_size.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TableColumnSize {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int flex) flex,
    required TResult Function(double size) fixed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int flex)? flex,
    TResult Function(double size)? fixed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int flex)? flex,
    TResult Function(double size)? fixed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FlexTableColumn value) flex,
    required TResult Function(FixedTableColumn value) fixed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FlexTableColumn value)? flex,
    TResult Function(FixedTableColumn value)? fixed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FlexTableColumn value)? flex,
    TResult Function(FixedTableColumn value)? fixed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableColumnSizeCopyWith<$Res> {
  factory $TableColumnSizeCopyWith(
          TableColumnSize value, $Res Function(TableColumnSize) then) =
      _$TableColumnSizeCopyWithImpl<$Res>;
}

/// @nodoc
class _$TableColumnSizeCopyWithImpl<$Res>
    implements $TableColumnSizeCopyWith<$Res> {
  _$TableColumnSizeCopyWithImpl(this._value, this._then);

  final TableColumnSize _value;
  // ignore: unused_field
  final $Res Function(TableColumnSize) _then;
}

/// @nodoc
abstract class _$$FlexTableColumnCopyWith<$Res> {
  factory _$$FlexTableColumnCopyWith(
          _$FlexTableColumn value, $Res Function(_$FlexTableColumn) then) =
      __$$FlexTableColumnCopyWithImpl<$Res>;
  $Res call({int flex});
}

/// @nodoc
class __$$FlexTableColumnCopyWithImpl<$Res>
    extends _$TableColumnSizeCopyWithImpl<$Res>
    implements _$$FlexTableColumnCopyWith<$Res> {
  __$$FlexTableColumnCopyWithImpl(
      _$FlexTableColumn _value, $Res Function(_$FlexTableColumn) _then)
      : super(_value, (v) => _then(v as _$FlexTableColumn));

  @override
  _$FlexTableColumn get _value => super._value as _$FlexTableColumn;

  @override
  $Res call({
    Object? flex = freezed,
  }) {
    return _then(_$FlexTableColumn(
      flex == freezed
          ? _value.flex
          : flex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FlexTableColumn implements FlexTableColumn {
  const _$FlexTableColumn(this.flex);

  @override
  final int flex;

  @override
  String toString() {
    return 'TableColumnSize.flex(flex: $flex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlexTableColumn &&
            const DeepCollectionEquality().equals(other.flex, flex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(flex));

  @JsonKey(ignore: true)
  @override
  _$$FlexTableColumnCopyWith<_$FlexTableColumn> get copyWith =>
      __$$FlexTableColumnCopyWithImpl<_$FlexTableColumn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int flex) flex,
    required TResult Function(double size) fixed,
  }) {
    return flex(this.flex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int flex)? flex,
    TResult Function(double size)? fixed,
  }) {
    return flex?.call(this.flex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int flex)? flex,
    TResult Function(double size)? fixed,
    required TResult orElse(),
  }) {
    if (flex != null) {
      return flex(this.flex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FlexTableColumn value) flex,
    required TResult Function(FixedTableColumn value) fixed,
  }) {
    return flex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FlexTableColumn value)? flex,
    TResult Function(FixedTableColumn value)? fixed,
  }) {
    return flex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FlexTableColumn value)? flex,
    TResult Function(FixedTableColumn value)? fixed,
    required TResult orElse(),
  }) {
    if (flex != null) {
      return flex(this);
    }
    return orElse();
  }
}

abstract class FlexTableColumn implements TableColumnSize {
  const factory FlexTableColumn(final int flex) = _$FlexTableColumn;

  int get flex => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$FlexTableColumnCopyWith<_$FlexTableColumn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FixedTableColumnCopyWith<$Res> {
  factory _$$FixedTableColumnCopyWith(
          _$FixedTableColumn value, $Res Function(_$FixedTableColumn) then) =
      __$$FixedTableColumnCopyWithImpl<$Res>;
  $Res call({double size});
}

/// @nodoc
class __$$FixedTableColumnCopyWithImpl<$Res>
    extends _$TableColumnSizeCopyWithImpl<$Res>
    implements _$$FixedTableColumnCopyWith<$Res> {
  __$$FixedTableColumnCopyWithImpl(
      _$FixedTableColumn _value, $Res Function(_$FixedTableColumn) _then)
      : super(_value, (v) => _then(v as _$FixedTableColumn));

  @override
  _$FixedTableColumn get _value => super._value as _$FixedTableColumn;

  @override
  $Res call({
    Object? size = freezed,
  }) {
    return _then(_$FixedTableColumn(
      size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$FixedTableColumn implements FixedTableColumn {
  const _$FixedTableColumn(this.size);

  @override
  final double size;

  @override
  String toString() {
    return 'TableColumnSize.fixed(size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FixedTableColumn &&
            const DeepCollectionEquality().equals(other.size, size));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(size));

  @JsonKey(ignore: true)
  @override
  _$$FixedTableColumnCopyWith<_$FixedTableColumn> get copyWith =>
      __$$FixedTableColumnCopyWithImpl<_$FixedTableColumn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int flex) flex,
    required TResult Function(double size) fixed,
  }) {
    return fixed(size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int flex)? flex,
    TResult Function(double size)? fixed,
  }) {
    return fixed?.call(size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int flex)? flex,
    TResult Function(double size)? fixed,
    required TResult orElse(),
  }) {
    if (fixed != null) {
      return fixed(size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FlexTableColumn value) flex,
    required TResult Function(FixedTableColumn value) fixed,
  }) {
    return fixed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FlexTableColumn value)? flex,
    TResult Function(FixedTableColumn value)? fixed,
  }) {
    return fixed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FlexTableColumn value)? flex,
    TResult Function(FixedTableColumn value)? fixed,
    required TResult orElse(),
  }) {
    if (fixed != null) {
      return fixed(this);
    }
    return orElse();
  }
}

abstract class FixedTableColumn implements TableColumnSize {
  const factory FixedTableColumn(final double size) = _$FixedTableColumn;

  double get size => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$FixedTableColumnCopyWith<_$FixedTableColumn> get copyWith =>
      throw _privateConstructorUsedError;
}
