import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider = NotifierProvider<ThemeModeProvider, ThemeMode>(
  () => ThemeModeProvider(),
);

class ThemeModeProvider extends Notifier<ThemeMode> {
  //represent initial value
  @override
  build() {
    return ThemeMode.system;
  }

  void setThemeMode(ThemeMode mode) {
    state = mode;
  }

  void toggleThemeMode() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
