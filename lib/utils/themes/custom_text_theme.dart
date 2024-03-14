import 'package:flutter/material.dart';

var textTheme = TextTheme(
    titleLarge: _titleLarge(),
    titleMedium: _titleMedium(),
    bodyMedium: _bodyMedium(),
    labelLarge: _labelLarge(),
    labelMedium: _labelMedium(),
    labelSmall: _labelSmall());

TextStyle _titleLarge() => const TextStyle(
    fontSize: 28, fontWeight: FontWeight.w600, letterSpacing: 1.3);

TextStyle _titleMedium() => const TextStyle(
    fontSize: 28, fontWeight: FontWeight.w500, letterSpacing: 1.3);

TextStyle _bodyMedium() =>
    const TextStyle(fontSize: 20, fontWeight: FontWeight.normal);

TextStyle _labelLarge() => const TextStyle(
    fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.8);

TextStyle _labelMedium() => const TextStyle(
    fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 1.0);

TextStyle _labelSmall() => const TextStyle(
    fontSize: 20, fontWeight: FontWeight.w300, letterSpacing: 0.6);
