import 'package:flutter/material.dart';

class CheckboxSlidableTheme {
  static final CheckboxSlidableTheme defaults = CheckboxSlidableTheme(
    curve: Curves.easeIn,
    indicatorWidth: 8.0,
    duration: const Duration(milliseconds: 200),
  );

  final Color? backgroundColor;
  final double? indicatorWidth;
  final Color? activeColor;
  final Color? checkColor;
  final Duration? duration;
  final Curve? curve;
  CheckboxSlidableTheme({
    this.backgroundColor,
    this.activeColor,
    this.checkColor,
    this.duration,
    this.curve,
    this.indicatorWidth,
  });

  CheckboxSlidableTheme copyWith({
    Color? backgroundColor,
    Color? activeColor,
    Color? checkColor,
    Duration? duration,
    double? indicatorWidth,
    Curve? curve,
  }) {
    return CheckboxSlidableTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      activeColor: activeColor ?? this.activeColor,
      checkColor: checkColor ?? this.checkColor,
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      indicatorWidth: indicatorWidth ?? this.indicatorWidth,
    );
  }

  CheckboxSlidableTheme merge(CheckboxSlidableTheme other) {
    return CheckboxSlidableTheme(
      backgroundColor: backgroundColor ?? other.backgroundColor,
      activeColor: activeColor ?? other.activeColor,
      checkColor: checkColor ?? other.checkColor,
      duration: duration ?? other.duration,
      curve: curve ?? other.curve,
      indicatorWidth: indicatorWidth ?? other.indicatorWidth,
    );
  }

  @override
  String toString() {
    return 'CheckboxSlidableTheme(backgroundColor: $backgroundColor, activeColor: $activeColor, checkColor: $checkColor, duration: $duration, curve: $curve)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CheckboxSlidableTheme &&
        other.backgroundColor == backgroundColor &&
        other.activeColor == activeColor &&
        other.checkColor == checkColor &&
        other.duration == duration &&
        other.curve == curve;
  }

  @override
  int get hashCode {
    return backgroundColor.hashCode ^
        activeColor.hashCode ^
        checkColor.hashCode ^
        duration.hashCode ^
        curve.hashCode;
  }
}
