import 'package:freezed_annotation/freezed_annotation.dart';

part 'controller_action.freezed.dart';

enum ActionType {
  toggleExpandable,
  openExpandable,
  closeExpandable,
  openSlidable,
  closeSlidable,
  select,
  unselect,
}

@freezed
class Action with _$Action {
  factory Action(ActionType type, int? index) = _Action;
}
