import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';
import 'package:rx_mobile_team/theme_bloc.dart';
import 'package:rx_mobile_team/widgets/switch.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return RxStreamBuilder<ThemeMode>(
      stream: BlocProvider.of<ThemeBloc>(context).themeMode$,
      builder: (context, mode) {
        return CustomSwitch(
          value: mode == ThemeMode.dark,
          onChanged: BlocProvider.of<ThemeBloc>(context).changeThemeMode,
        );
      },
    );
  }
}
