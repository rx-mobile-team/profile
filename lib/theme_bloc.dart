import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';
import 'package:rxdart_ext/state_stream.dart';

class ThemeBloc extends DisposeCallbackBaseBloc {
  final StateStream<ThemeMode> themeMode$;
  final Func1<bool, void> changeThemeMode;

  ThemeBloc._({
    required this.themeMode$,
    required this.changeThemeMode,
    required Func0<void> dispose,
  }) : super(dispose);

  factory ThemeBloc() {
    final themeModelS = StateSubject(ThemeMode.light);

    return ThemeBloc._(
      themeMode$: themeModelS,
      changeThemeMode: (v) =>
          themeModelS.add(v ? ThemeMode.dark : ThemeMode.light),
      dispose: () => themeModelS.close(),
    );
  }
}
