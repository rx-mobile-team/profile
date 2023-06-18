// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http_client_hoc081098/http_client_hoc081098.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rx_mobile_team/home_bloc.dart';
import 'package:rx_mobile_team/home_page.dart';
import 'package:rx_mobile_team/theme_bloc.dart';

const Color kPrimaryColor = Color(0xFF7d1c4e);
const Color kBackgroundColor = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColor = Color.fromARGB(255, 243, 22, 22);
const Color kCaptionColor = Color(0xFF7F8C93);

const countUrl =
    'https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Frx-mobile-team%2Fprofile&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com';

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

  final loggingInterceptor = SimpleLoggingInterceptor(
    SimpleLogger(level: SimpleLogLevel.basic),
  );

  final client = SimpleHttpClient(
    client: http.Client(),
    timeout: const Duration(seconds: 10),
    requestInterceptors: [
      loggingInterceptor.requestInterceptor,
    ],
    responseInterceptors: [
      loggingInterceptor.responseInterceptor,
    ],
  );

  runApp(
    Provider<SimpleHttpClient>.value(
      client,
      child: BlocProvider<HomeBloc>(
        initBloc: (context) => HomeBloc(),
        child: BlocProvider<ThemeBloc>(
          initBloc: (context) => ThemeBloc(),
          child: const MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return RxStreamBuilder<ThemeMode>(
      stream: context.get<ThemeBloc>().themeMode$,
      builder: (context, mode) {
        return MaterialApp(
          title: 'Rx Mobile Team',
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
