import 'dart:async';

import 'package:flutter/material.dart' hide Action;

import 'models/controller_action.dart';

class DataTablePlusController<T> {
  final _streamController = StreamController<Action>.broadcast();
  final Map<int, T> selected = {};

  Stream<Action> get events => _streamController.stream;

  final isFullyExpanded = ValueNotifier(false);

  void toggleExpandable(int index) {
    _streamController.add(
      Action(ActionType.toggleExpandable, index),
    );
  }

  void openExpandable([int? index]) {
    _streamController.add(
      Action(ActionType.openExpandable, index),
    );
    if (index == null) {
      isFullyExpanded.value = true;
    }
  }

  void closeExpandable([int? index]) {
    _streamController.add(
      Action(ActionType.closeExpandable, index),
    );
    if (index == null) {
      isFullyExpanded.value = false;
    }
  }

  void openSlidable(int index) {
    _streamController.add(
      Action(ActionType.openSlidable, index),
    );
  }

  void closeSlidable(int index) {
    _streamController.add(
      Action(ActionType.closeSlidable, index),
    );
  }

  void select(int index) {
    _streamController.add(
      Action(ActionType.select, index),
    );
  }

  void unselect(int index) {
    _streamController.add(
      Action(ActionType.unselect, index),
    );
  }

  @mustCallSuper
  void dispose() {
    isFullyExpanded.dispose();
    _streamController.close();
  }
}
