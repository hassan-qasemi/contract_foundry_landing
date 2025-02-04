import 'package:flutter/material.dart';

extension QuickThemeColor on BuildContext {
  ThemeData get themeData => Theme.of(this);

  ColorScheme get colorScheme => themeData.colorScheme;

  Color get primaryColor => colorScheme.primary;

  Color get primaryContainer => colorScheme.primaryContainer;

  Color get secondaryColor => colorScheme.secondary;

  Color get background => colorScheme.background;

  Color get surface => colorScheme.surface;

  Color get surfaceContainer => colorScheme.surfaceContainer;

  Color get surfaceTint => colorScheme.surfaceTint;

  Color get surfaceDim => colorScheme.surfaceDim;

  Color get errorColor => colorScheme.error;

  Color get onPrimary => colorScheme.onPrimary;

  Color get onPrimaryContainer => colorScheme.onPrimaryContainer;

  Color get onSecondary => colorScheme.onSecondary;

  Color get secondaryContainer => colorScheme.secondaryContainer;

  Color get onSecondaryContainer => colorScheme.onSecondaryContainer;

  Color get onBackground => colorScheme.onBackground;

  Color get onSurface => colorScheme.onSurface;

  Color get onError => colorScheme.onError;

  Color get error => colorScheme.error;

  Color get tertiary => colorScheme.tertiary;

  Color get tertiaryContainer => colorScheme.tertiaryContainer;

  Color get onTertiaryContainer => colorScheme.onTertiaryContainer;
}
