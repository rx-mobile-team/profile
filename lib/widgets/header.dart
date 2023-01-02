import 'package:flutter/material.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rx_mobile_team/home_bloc.dart';
import 'package:rx_mobile_team/utils/globals.dart';
import 'package:rx_mobile_team/utils/screen_helper.dart';
import 'package:rx_mobile_team/widgets/theme_switcher.dart';
import 'package:responsive_framework/responsive_framework.dart';

final headerItems = <HeaderItem>[
  HeaderItem(title: 'Home', iconData: Icons.home, onTap: () {}),
  HeaderItem(title: 'About', iconData: Icons.info, onTap: () {}),
  HeaderItem(title: 'Members', iconData: Icons.person, onTap: () {}),
  HeaderItem(title: 'Services', iconData: Icons.school, onTap: () {}),
  HeaderItem(title: 'Our work', iconData: Icons.work, onTap: () {}),
  HeaderItem(title: 'Contact', iconData: Icons.email, onTap: () {}),
  HeaderItem(title: 'Theme', iconData: Icons.light_mode_outlined, onTap: () {}),
];

class HeaderItem {
  final String title;
  final IconData? iconData;
  final VoidCallback onTap;

  HeaderItem({
    required this.title,
    required this.iconData,
    required this.onTap,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HeaderItem &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          iconData == other.iconData &&
          onTap == other.onTap;

  @override
  int get hashCode => title.hashCode ^ iconData.hashCode ^ onTap.hashCode;
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: () => const _DesktopHeader(),
      mobile: () => const _MobileHeader(),
      tablet: () => const _TabletHeader(),
    );
  }
}

class _DesktopHeader extends StatelessWidget {
  const _DesktopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const _TabletHeader();
  }
}

class _HeaderLogo extends StatelessWidget {
  const _HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ClipOval(
        child: Image.asset(
          'assets/images/logo.png',
          height: 64,
        ),
      ),
    );
  }
}

class _HeaderName extends StatelessWidget {
  const _HeaderName({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: RichText(
        text: TextSpan(
          text: 'Rx Mobile Team',
          style: GoogleFonts.josefinSans(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}

class _MobileHeader extends StatelessWidget {
  const _MobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.93),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const _HeaderLogo(),
            const SizedBox(width: 16.0),
            const Expanded(child: _HeaderName()),
            GestureDetector(
              onTap: () =>
                  Globals.shared.scaffoldKey.currentState?.openEndDrawer(),
              child: const Icon(
                Icons.menu,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TabletHeader extends StatelessWidget {
  const _TabletHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.93),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenHelper.isDesktop(context) ? 24 : 16.0,
          vertical: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            _HeaderLogo(),
            SizedBox(width: 16.0),
            _HeaderName(),
            Spacer(),
            _HeaderRow(),
          ],
        ),
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          for (final item in headerItems)
            item.title == 'Theme'
                ? const ThemeSwitcher()
                : MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      margin: EdgeInsets.only(
                        right: ResponsiveWrapper.of(context).isDesktop
                            ? 20.0
                            : 15.0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          item.onTap();
                          context.get<HomeBloc>().scrollTo(item);
                        },
                        child: Text(
                          item.title,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
        ],
      ),
    );
  }
}
