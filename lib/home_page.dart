import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';
import 'package:flutter_disposebag/flutter_disposebag.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:rx_mobile_team/home_bloc.dart';
import 'package:rx_mobile_team/theme_bloc.dart';
import 'package:rx_mobile_team/utils/consts.dart';
import 'package:rx_mobile_team/utils/globals.dart';
import 'package:rx_mobile_team/widgets/about.dart';
import 'package:rx_mobile_team/widgets/header.dart';
import 'package:rx_mobile_team/widgets/home_info.dart';
import 'package:rx_mobile_team/widgets/measure_size.dart';
import 'package:rx_mobile_team/widgets/members.dart';
import 'package:rx_mobile_team/widgets/project.dart';
import 'package:rx_mobile_team/widgets/service.dart';
import 'package:rx_mobile_team/widgets/theme_switcher.dart';
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

  Widget extraSpacer() => RxStreamBuilder<double>(
        stream: headerHeightS,
        builder: (context, headerHeight) => SizedBox(height: headerHeight),
      );

  late final builders = [
    extraSpacer,
    () => const HomeInfo(),
    extraSpacer,
    () => const AboutSection(),
    extraSpacer,
    () => const MembersSection(),
    extraSpacer,
    () => const ServiceSection(),
    extraSpacer,
    () => const ProjectSection(projects: projectsData),
    extraSpacer,
    () => const Footer(),
    () => const SizedBox(height: 50),
  ];

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.get<HomeBloc>();

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
                    if (headerItem.title == 'Theme') {
                      final themeBloc = BlocProvider.of<ThemeBloc>(context);
                      themeBloc.changeThemeMode(
                        themeBloc.themeMode$.value == ThemeMode.dark
                            ? false
                            : true,
                      );
                      return;
                    }

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
