import 'package:flutter/material.dart';

class CustomThemeExtensions extends ThemeExtension<CustomThemeExtensions> {
  final Color? brandColor;
  final Color? subtleTextColor;

  const CustomThemeExtensions({
    required this.brandColor,
    required this.subtleTextColor,
  });

  @override
  CustomThemeExtensions copyWith({
    Color? brandColor,
    Color? subtleTextColor,
  }) {
    return CustomThemeExtensions(
      brandColor: brandColor ?? this.brandColor,
      subtleTextColor: subtleTextColor ?? this.subtleTextColor,
    );
  }

  @override
  CustomThemeExtensions lerp(
    ThemeExtension<CustomThemeExtensions>? other,
    double t,
  ) {
    if (other is! CustomThemeExtensions) return this;
    return CustomThemeExtensions(
      brandColor: Color.lerp(brandColor, other.brandColor, t),
      subtleTextColor: Color.lerp(subtleTextColor, other.subtleTextColor, t),
    );
  }
}
