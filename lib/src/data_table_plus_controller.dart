import 'dart:async';

import 'package:flutter/material.dart' hide Action;

import 'models/controller_action.dart';

class DataTablePlusController<T> {
  final _streamController = StreamController<Action>.broadcast();

  ///Map of selected items in the table.
  ///Selected items are identified by an object given by [primaryKey] & data [T]
  final Map<Object, T> selected = {};

  ///Primary key used to store information about an item
  final Object Function(T) primaryKey;

  DataTablePlusController(this.primaryKey);

  ///A stream of actions dispatched. Each action contains a type and the index of the row.
  ///The type is one of:
  ///  - 'select'
  /// - 'unselect'
  /// - 'openSlidable'
  /// - 'closeSlidable'
  /// - 'openExpandable'
  /// - 'closeExpandable'
  /// - 'toggleExpandable'
  ///
  /// The index might be null to notify all rows of the action.
  /// Used internally to dispatch actions to the rows.
  Stream<Action> get events => _streamController.stream;

  ///Whether all rows are fully expanded
  final isFullyExpanded = ValueNotifier(false);

  ///Toggle the expanded state for a specific row
  void toggleExpandable(int index) {
    _streamController.add(
      Action(ActionType.toggleExpandable, index),
    );
  }

  ///Opens a particular expandable. [index] can be null to open all the expandables.
  void openExpandable([int? index]) {
    _streamController.add(
      Action(ActionType.openExpandable, index),
    );
    if (index == null) {
      isFullyExpanded.value = true;
    }
  }

  ///Closes a particular expandable. [index] can be null to close all the expandables.
  void closeExpandable([int? index]) {
    _streamController.add(
      Action(ActionType.closeExpandable, index),
    );
    if (index == null) {
      isFullyExpanded.value = false;
    }
  }

  ///Opens a particular slidable.
  void openSlidable(int index) {
    _streamController.add(
      Action(ActionType.openSlidable, index),
    );
  }

  ///Closes a particular slidable.
  void closeSlidable(int index) {
    _streamController.add(
      Action(ActionType.closeSlidable, index),
    );
  }

  ///Marks this row as selected, firing the onSelectionChanged callback of [DataTablePlus] and adds it to the [selected] map.
  void select(int index) {
    _streamController.add(
      Action(ActionType.select, index),
    );
  }

  ///Marks this row as unselected, firing the onSelectionChanged callback of [DataTablePlus] and removes it from the [selected] map
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
