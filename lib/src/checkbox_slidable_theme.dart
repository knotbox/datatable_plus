import 'package:flutter/material.dart';

class CheckboxSlidableTheme {
  static final CheckboxSlidableTheme defaults = CheckboxSlidableTheme(
    curve: Curves.easeIn,
    indicatorWidth: 8.0,
    duration: const Duration(milliseconds: 200),
  );

  final double? indicatorWidth;
  final Color? activeColor;

  final Duration? duration;
  final Curve? curve;
  CheckboxSlidableTheme({
    this.activeColor,
    this.duration,
    this.curve,
    this.indicatorWidth,
  });

  CheckboxSlidableTheme copyWith({
    Color? activeColor,
    Color? checkColor,
    Duration? duration,
    double? indicatorWidth,
    Curve? curve,
  }) {
    return CheckboxSlidableTheme(
      activeColor: activeColor ?? this.activeColor,
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      indicatorWidth: indicatorWidth ?? this.indicatorWidth,
    );
  }

  CheckboxSlidableTheme merge(CheckboxSlidableTheme other) {
    return CheckboxSlidableTheme(
      activeColor: activeColor ?? other.activeColor,
      duration: duration ?? other.duration,
      curve: curve ?? other.curve,
      indicatorWidth: indicatorWidth ?? other.indicatorWidth,
    );
  }

  @override
  String toString() {
    return 'CheckboxSlidableTheme(activeColor: $activeColor,  duration: $duration, curve: $curve)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CheckboxSlidableTheme &&
        other.activeColor == activeColor &&
        other.duration == duration &&
        other.curve == curve;
  }

  @override
  int get hashCode {
    return activeColor.hashCode ^ duration.hashCode ^ curve.hashCode;
  }
}
