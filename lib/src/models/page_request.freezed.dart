// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'page_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PageRequestTearOff {
  const _$PageRequestTearOff();

  _PageRequest call(
      {int? sortColumnIndex,
      required int offset,
      bool? sortAscending,
      required int pageSize}) {
    return _PageRequest(
      sortColumnIndex: sortColumnIndex,
      offset: offset,
      sortAscending: sortAscending,
      pageSize: pageSize,
    );
  }
}

/// @nodoc
const $PageRequest = _$PageRequestTearOff();

/// @nodoc
mixin _$PageRequest {
  int? get sortColumnIndex => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  bool? get sortAscending => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PageRequestCopyWith<PageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageRequestCopyWith<$Res> {
  factory $PageRequestCopyWith(
          PageRequest value, $Res Function(PageRequest) then) =
      _$PageRequestCopyWithImpl<$Res>;
  $Res call(
      {int? sortColumnIndex, int offset, bool? sortAscending, int pageSize});
}

/// @nodoc
class _$PageRequestCopyWithImpl<$Res> implements $PageRequestCopyWith<$Res> {
  _$PageRequestCopyWithImpl(this._value, this._then);

  final PageRequest _value;
  // ignore: unused_field
  final $Res Function(PageRequest) _then;

  @override
  $Res call({
    Object? sortColumnIndex = freezed,
    Object? offset = freezed,
    Object? sortAscending = freezed,
    Object? pageSize = freezed,
  }) {
    return _then(_value.copyWith(
      sortColumnIndex: sortColumnIndex == freezed
          ? _value.sortColumnIndex
          : sortColumnIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      sortAscending: sortAscending == freezed
          ? _value.sortAscending
          : sortAscending // ignore: cast_nullable_to_non_nullable
              as bool?,
      pageSize: pageSize == freezed
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PageRequestCopyWith<$Res>
    implements $PageRequestCopyWith<$Res> {
  factory _$PageRequestCopyWith(
          _PageRequest value, $Res Function(_PageRequest) then) =
      __$PageRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? sortColumnIndex, int offset, bool? sortAscending, int pageSize});
}

/// @nodoc
class __$PageRequestCopyWithImpl<$Res> extends _$PageRequestCopyWithImpl<$Res>
    implements _$PageRequestCopyWith<$Res> {
  __$PageRequestCopyWithImpl(
      _PageRequest _value, $Res Function(_PageRequest) _then)
      : super(_value, (v) => _then(v as _PageRequest));

  @override
  _PageRequest get _value => super._value as _PageRequest;

  @override
  $Res call({
    Object? sortColumnIndex = freezed,
    Object? offset = freezed,
    Object? sortAscending = freezed,
    Object? pageSize = freezed,
  }) {
    return _then(_PageRequest(
      sortColumnIndex: sortColumnIndex == freezed
          ? _value.sortColumnIndex
          : sortColumnIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      sortAscending: sortAscending == freezed
          ? _value.sortAscending
          : sortAscending // ignore: cast_nullable_to_non_nullable
              as bool?,
      pageSize: pageSize == freezed
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PageRequest implements _PageRequest {
  _$_PageRequest(
      {this.sortColumnIndex,
      required this.offset,
      this.sortAscending,
      required this.pageSize});

  @override
  final int? sortColumnIndex;
  @override
  final int offset;
  @override
  final bool? sortAscending;
  @override
  final int pageSize;

  @override
  String toString() {
    return 'PageRequest(sortColumnIndex: $sortColumnIndex, offset: $offset, sortAscending: $sortAscending, pageSize: $pageSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PageRequest &&
            const DeepCollectionEquality()
                .equals(other.sortColumnIndex, sortColumnIndex) &&
            const DeepCollectionEquality().equals(other.offset, offset) &&
            const DeepCollectionEquality()
                .equals(other.sortAscending, sortAscending) &&
            const DeepCollectionEquality().equals(other.pageSize, pageSize));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sortColumnIndex),
      const DeepCollectionEquality().hash(offset),
      const DeepCollectionEquality().hash(sortAscending),
      const DeepCollectionEquality().hash(pageSize));

  @JsonKey(ignore: true)
  @override
  _$PageRequestCopyWith<_PageRequest> get copyWith =>
      __$PageRequestCopyWithImpl<_PageRequest>(this, _$identity);
}

abstract class _PageRequest implements PageRequest {
  factory _PageRequest(
      {int? sortColumnIndex,
      required int offset,
      bool? sortAscending,
      required int pageSize}) = _$_PageRequest;

  @override
  int? get sortColumnIndex;
  @override
  int get offset;
  @override
  bool? get sortAscending;
  @override
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$PageRequestCopyWith<_PageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
