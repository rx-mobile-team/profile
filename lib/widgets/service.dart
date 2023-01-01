import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../utils/screen_helper.dart';
import '../main.dart';
import '../theme_bloc.dart';

class DesignProcess {
  final String title;
  final String imagePath;
  final String subtitle;

  DesignProcess({
    required this.title,
    required this.imagePath,
    required this.subtitle,
  });
}

class NameIconColor {
  final String title;
  final IconData iconData;
  final Color color;

  NameIconColor(
      {required this.title, required this.iconData, required this.color});
}

final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: 'Learn',
    imagePath: 'assets/images/learn.png',
    subtitle: '',
  ),
  DesignProcess(
    title: 'Develop',
    imagePath: 'assets/images/develop.png',
    subtitle: '',
  ),
  DesignProcess(
    title: 'Document It',
    imagePath: 'assets/images/blog.png',
    subtitle: '',
  ),
];

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  static final whatIDo = [
    NameIconColor(
      title: 'Mobile App Development',
      iconData: Icons.mobile_friendly,
      color: Colors.green[400]!,
    ),
    NameIconColor(
      title: 'Backend Development',
      iconData: Icons.web,
      color: Colors.yellow[400]!,
    ),
    NameIconColor(
      title: 'Technical Blog Writer',
      iconData: Icons.article,
      color: Colors.blue[400]!,
    ),
    NameIconColor(
      title: 'Github Open Source',
      iconData: Icons.code,
      color: Colors.orange[400]!,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ScreenHelper(
        desktop: () => _buildUi(context, kDesktopMaxWidth),
        tablet: () => _buildUi(context, kTabletMaxWidth),
        mobile: () => _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'What We Do?',
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w900,
              height: 1.3,
              fontSize: 35.0,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'We may not be perfect, but We are surely of some help',
            style: GoogleFonts.josefinSans(
              color: kCaptionColor,
              fontSize: 15.0,
            ),
          ),
          SizedBox(
            height: ScreenHelper.isDesktop(context) ? 50 : 20,
          ),
          RxStreamBuilder<ThemeMode>(
            builder: (context, themeMode) {
              return Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: whatIDo
                      .map((e) => Container(
                            height: 200,
                            width: 200,
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color:  themeMode == ThemeMode.dark
                                  ? const Color.fromARGB(75, 12, 12, 7)
                                  : Colors.grey[50],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: themeMode == ThemeMode.dark
                                        ? Colors.grey[900]
                                        : Colors.grey[200],
                                    borderRadius: BorderRadius.circular(80),
                                  ),
                                  child: Icon(
                                    e.iconData,
                                    color: e.color,
                                    size: 52,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  e.title,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.josefinSans(
                                    color: themeMode == ThemeMode.dark
                                        ? Colors.grey[400]
                                        : Colors.grey[800],
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                )
                              ],
                            ),
                          ))
                      .toList());
            },
            stream: context.bloc<ThemeBloc>().themeMode$,
          ),

        ],
      ),
    );
  }
}
