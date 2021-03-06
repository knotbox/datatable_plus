import 'dart:async';

import 'package:flutter/material.dart' hide Action;

import 'models/controller_action.dart';

class DataTablePlusController<T> {
  final _streamController = StreamController<Action>.broadcast();

  DataTablePlusController({
    this.onSelectionChanged,
    this.onExpandedChanged,
  });

  ///Called when a row is checked/unchecked
  final void Function(int, bool, DataTablePlusController<T>)?
      onSelectionChanged;

  ///Called when a row is expanded/retracted
  final void Function(int, DataTablePlusController<T>)? onExpandedChanged;

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

  ///Whether at least one checkbox is selected
  final hasSelectedCheckbox = ValueNotifier(false);

  ///Toggle the expanded state for a specific row
  void toggleExpandable(int index) {
    _streamController.add(
      Action(ActionType.toggleExpandable, index),
    );
    onExpandedChanged?.call(
      index,
      this,
    );
  }

  ///Opens a particular expandable. [index] can be null to open all the expandables.
  void openExpandable([int? index]) {
    if (index == null) {
      isFullyExpanded.value = true;
    }
    _streamController.add(
      Action(ActionType.openExpandable, index),
    );

    if (index != null) {
      onExpandedChanged?.call(
        index,
        this,
      );
    }
  }

  ///Closes a particular expandable. [index] can be null to close all the expandables.
  void closeExpandable([int? index]) {
    if (index == null) {
      isFullyExpanded.value = false;
    }
    _streamController.add(
      Action(ActionType.closeExpandable, index),
    );

    if (index != null) {
      onExpandedChanged?.call(
        index,
        this,
      );
    }
  }

  ///Opens a particular slidable. [index] can be null to open all mounted slidables.
  void openSlidable([int? index]) {
    _streamController.add(
      Action(ActionType.openSlidable, index),
    );

    hasSelectedCheckbox.value = true;
  }

  ///Closes a particular slidable. [index] can be null to close all mounted slidables.
  void closeSlidable([int? index]) {
    _streamController.add(
      Action(ActionType.closeSlidable, index),
    );

    if (index == null) {
      hasSelectedCheckbox.value = false;
    }
  }

  ///Marks this row as selected.
  void select(int index) {
    _streamController.add(
      Action(ActionType.select, index),
    );

    onSelectionChanged?.call(
      index,
      true,
      this,
    );
  }

  ///Marks this row as unselected.
  void unselect(int index) {
    _streamController.add(
      Action(ActionType.unselect, index),
    );

    onSelectionChanged?.call(
      index,
      false,
      this,
    );
  }

  @mustCallSuper
  void dispose() {
    isFullyExpanded.dispose();
    hasSelectedCheckbox.dispose();
    _streamController.close();
  }
}
