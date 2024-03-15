import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;
}
