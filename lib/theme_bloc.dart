import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';
import 'package:rxdart_ext/state_stream.dart';

class ThemeBloc extends DisposeCallbackBaseBloc {
  final StateStream<ThemeMode> themeMode$;
  final Func1<bool, void> changeThemeMode;
  final Func0<void> toggleThemeMode;

  ThemeBloc._({
    required this.themeMode$,
    required this.changeThemeMode,
    required this.toggleThemeMode,
    required Func0<void> dispose,
  }) : super(dispose);

  factory ThemeBloc() {
    final themeModeS = StateSubject(ThemeMode.light);

    return ThemeBloc._(
      themeMode$: themeModeS,
      changeThemeMode: (v) =>
          themeModeS.add(v ? ThemeMode.dark : ThemeMode.light),
      toggleThemeMode: () => themeModeS.add(themeModeS.value == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark),
      dispose: themeModeS.close,
    );
  }
}
