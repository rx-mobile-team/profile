import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';
import 'package:flutter_disposebag/flutter_disposebag.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:hoc081098_portfolio/home_bloc.dart';
import 'package:hoc081098_portfolio/utils/consts.dart';
import 'package:hoc081098_portfolio/utils/globals.dart';
import 'package:hoc081098_portfolio/widgets/about.dart';
import 'package:hoc081098_portfolio/widgets/header.dart';
import 'package:hoc081098_portfolio/widgets/home_info.dart';
import 'package:hoc081098_portfolio/widgets/measure_size.dart';
import 'package:hoc081098_portfolio/widgets/project.dart';
import 'package:hoc081098_portfolio/widgets/service.dart';
import 'package:hoc081098_portfolio/widgets/theme_switcher.dart';
import 'package:rxdart_ext/rxdart_ext.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'widgets/footer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with DisposeBagMixin {
  late final headerHeightS = StateSubject(100.0)..disposedBy(bag);

  @override
  void initState() {
    super.initState();

    headerHeightS
        .startWith(headerHeightS.value)
        .debug(identifier: 'headerHeight', log: debugPrint)
        .collect()
        .disposedBy(bag);
  }

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.get<HomeBloc>();

    final builders = [
      () => RxStreamBuilder<double>(
            stream: headerHeightS,
            builder: (context, headerHeight) => SizedBox(height: headerHeight),
          ),
      () => const HomeInfo(),
      () => RxStreamBuilder<double>(
            stream: headerHeightS,
            builder: (context, headerHeight) => SizedBox(height: headerHeight),
          ),
      () => const AboutSection(),
      () => RxStreamBuilder<double>(
            stream: headerHeightS,
            builder: (context, headerHeight) => SizedBox(height: headerHeight),
          ),
      () => const ServiceSection(),
      () => RxStreamBuilder<double>(
            stream: headerHeightS,
            builder: (context, headerHeight) => SizedBox(height: headerHeight),
          ),
      () => ProjectSection(projects: projectsData),
      () => RxStreamBuilder<double>(
            stream: headerHeightS,
            builder: (context, headerHeight) => SizedBox(height: headerHeight),
          ),
      () => const Footer(),
      () => const SizedBox(height: 150),
    ];

    return Scaffold(
      key: Globals.shared.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final headerItem = headerItems[index];

                return ListTile(
                  onTap: () {
                    final scaffoldState =
                        Globals.shared.scaffoldKey.currentState;
                    if (scaffoldState != null &&
                        scaffoldState.isEndDrawerOpen) {
                      Navigator.of(context).pop();
                      headerItem.onTap();
                      homeBloc.scrollTo(headerItem);
                    }
                  },
                  leading: Icon(
                    headerItem.iconData,
                  ),
                  title: Text(
                    headerItem.title,
                    style: const TextStyle(),
                  ),
                  trailing: headerItem.title == 'Theme'
                      ? const ThemeSwitcher()
                      : null,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ScrollablePositionedList.builder(
              itemPositionsListener: homeBloc.itemPositionsListener,
              itemScrollController: homeBloc.itemScrollController,
              itemCount: builders.length,
              itemBuilder: (context, index) => builders[index](),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: MeasureSize(
              child: const Header(),
              onChange: (size) => headerHeightS.value = size.height,
            ),
          ),
        ],
      ),
    );
  }
}
