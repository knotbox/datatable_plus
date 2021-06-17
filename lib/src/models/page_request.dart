import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_request.freezed.dart';

@freezed
class PageRequest with _$PageRequest {
  factory PageRequest({
    int? sortColumnIndex,
    required int offset,
    bool? sortAscending,
    required int pageSize,
  }) = _PageRequest;
}
