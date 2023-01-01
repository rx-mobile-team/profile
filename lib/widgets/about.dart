import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoc081098_portfolio/main.dart';
import 'package:hoc081098_portfolio/theme_bloc.dart';
import 'package:hoc081098_portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

const aboutTitle =
    'We are a Mobile Developer Team, develop applications on platforms like Android, iOS and cross-platform like Flutter';

const aboutDetails =
    '- We have 4+ years experiences to develop Android,iOS and Flutter applications. \n'
    '- Performed technical designs and implementation of 10+ complex apps. \n'
    '- Worked closely with marketing team, design team, and QC team to develop applications from scratch.\n'
    '- We have launched the apps in Play Store. \n'
    '- Always love to learn new technologies and to succeed in an environment of growth and excellence.';

class Technology {
  final String name;
  final String logo;

  const Technology({
    required this.name,
    required this.logo,
  });
}

const technologyLearned = <Technology>[
  Technology(name: 'Android', logo: 'assets/images/technology/android.png'),
  Technology(name: 'Flutter', logo: 'assets/images/technology/flutter.png'),
  Technology(name: 'iOS', logo: 'assets/images/technology/apple.png'),
  Technology(name: 'Kotlin', logo: 'assets/images/technology/kotlin.png'),
  Technology(name: 'Swift', logo: 'assets/images/technology/swift.png'),
  Technology(name: 'Dart', logo: 'assets/images/technology/dart.png'),
  Technology(name: 'ReactiveX', logo: 'assets/images/technology/rx.png'),
  Technology(name: 'Firebase', logo: 'assets/images/technology/firebase.png'),
  Technology(
      name: 'Javascript', logo: 'assets/images/technology/javascript.png'),
];

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: () => const _AboutSection(width: kDesktopMaxWidth),
      mobile: () => _AboutSection(width: getMobileMaxWidth(context)),
      tablet: () => const _AboutSection(width: kTabletMaxWidth),
    );
  }
}

class _AboutSection extends StatelessWidget {
  final double width;

  const _AboutSection({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;

          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Flex(
              direction: maxWidth > 720 ? Axis.horizontal : Axis.vertical,
              children: [
                Expanded(
                  flex: maxWidth > 720.0 ? 1 : 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'About us',
                        style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.w900,
                          height: 1.3,
                          fontSize: 35.0,
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        aboutTitle,
                        style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                          fontSize: 24.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        aboutDetails,
                        style: TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'Technology I have worked with',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: [
                          for (final e in technologyLearned)
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: RxStreamBuilder<ThemeMode>(
                                stream: context.bloc<ThemeBloc>().themeMode$,
                                builder: (context, themeMode) =>
                                    _TechnologyItem(
                                  technology: e,
                                  themeMode: themeMode,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 70.0,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 25.0,
                ),
                if (ScreenHelper.isDesktop(context) ||
                    ScreenHelper.isTablet(context))
                  Expanded(
                    flex: maxWidth > 720.0 ? 1 : 0,
                    child: SvgPicture.asset(
                      'assets/svg/person.svg',
                      width: maxWidth > 720.0 ? null : 350.0,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TechnologyItem extends StatelessWidget {
  final ThemeMode themeMode;
  final Technology technology;

  const _TechnologyItem({
    super.key,
    required this.themeMode,
    required this.technology,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            themeMode == ThemeMode.dark ? Colors.grey[800] : Colors.grey[200],
        borderRadius: BorderRadius.circular(6.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Image.asset(technology.logo),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              technology.name,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
