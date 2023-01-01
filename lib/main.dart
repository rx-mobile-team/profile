import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoc081098_portfolio/home_bloc.dart';
import 'package:hoc081098_portfolio/home_page.dart';
import 'package:hoc081098_portfolio/theme_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

const Color kPrimaryColor = Color(0xFF7d1c4e);
const Color kBackgroundColor = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColor = Color.fromARGB(255, 243, 22, 22);
const Color kCaptionColor = Color(0xFF7F8C93);

final lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(),
  primaryColor: const Color(0xFF7d1c4e),
  iconTheme: const IconThemeData(color: kPrimaryColor),
  primarySwatch: Colors.pink,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
  ),
  textTheme: GoogleFonts.notoSansTextTheme(),
);

final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromRGBO(20, 33, 47, 1.0),
  colorScheme: const ColorScheme.dark(),
  primarySwatch: Colors.yellow,
  primaryColor: const Color(0xFFFFD800),
  iconTheme: IconThemeData(color: Colors.grey[400]),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.black),
    ),
  ),
  textTheme: GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  runApp(
    BlocProvider<HomeBloc>(
      initBloc: (context) => HomeBloc(),
      child: BlocProvider<ThemeBloc>(
        initBloc: (context) => ThemeBloc(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RxStreamBuilder<ThemeMode>(
      stream: context.get<ThemeBloc>().themeMode$,
      builder: (context, mode) {
        return MaterialApp(
          title: 'hoc081098.dev',
          theme: mode == ThemeMode.dark ? darkTheme : lightTheme,
          builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(450, name: MOBILE),
              ResponsiveBreakpoint.resize(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: TABLET),
              ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ResponsiveBreakpoint.resize(2460, name: '4K'),
            ],
            background: Container(
              color: kBackgroundColor,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const MyHomePage(),
        );
      },
    );
  }
}
