import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rx_mobile_team/main.dart';
import 'package:rx_mobile_team/theme_bloc.dart';
import 'package:rx_mobile_team/utils/screen_helper.dart';
import 'package:rx_mobile_team/utils/utils.dart';
import 'package:rx_mobile_team/widgets/technology.dart';

@immutable
class ProfileModel {
  final String avatarPath;
  final String name;
  final String description;
  final List<Technology> techUsed;
  final String link;
  final String cv;

  const ProfileModel({
    required this.avatarPath,
    required this.name,
    required this.description,
    required this.techUsed,
    required this.link,
    required this.cv,
  });
}

const profiles = <ProfileModel>[
  ProfileModel(
    avatarPath: 'assets/images/chung_avatar.png',
    name: 'Hoàng Anh Chung (@hoangchungk53qx1)',
    description:
        'I am a full-stack developer with 7+ years of experience developing mobile apps.\n'
        'I have developed through many complex applications related to fields such as livestream, social networking, photo editing, tools...',
    techUsed: [
      Technology.android,
      Technology.flutter,
      Technology.iOS,
      Technology.kotlin,
      Technology.swift,
      Technology.dart,
      Technology.reactiveX,
    ],
    link: 'https://hoanganhchung.vercel.app/#/',
    cv: 'https://drive.google.com/file/d/1h_RTrOIQlP0Xc0-jUc0Q6-zgeKvnHcfS/view?usp=sharing',
  ),
  ProfileModel(
    avatarPath: 'assets/images/hoc_avatar.jpg',
    name: 'Nguyễn Thái Học (@hoc081098)',
    description: 'A senior full-stack engineer,  mobile developer and backend developer.\n'
        'I have 7+ years of experience (since 2018), have a strong knowledge of Clean Architecture,'
        ' MVVM, MVI, Reactive Programming, Kotlin/Android, Dart/Flutter, iOS/Swift.\n'
        'Focus on technical, clean code, good architecture and performance.',
    techUsed: [
      Technology.android,
      Technology.flutter,
      Technology.iOS,
      Technology.kotlin,
      Technology.swift,
      Technology.dart,
      Technology.reactiveX,
    ],
    link: 'https://hoc081098.github.io/hoc081098_portfolio/',
    cv: 'https://drive.google.com/file/d/1DXCgBNq8bQTqRDhwSTfr4wAgGDNuiKw4/view',
  )
];

class MembersSection extends StatelessWidget {
  const MembersSection({super.key});

  @override
  Widget build(BuildContext context) => ScreenHelper(
        desktop: () => const _Desktop(),
        mobile: () => const _Mobile(),
        tablet: () => const _Tablet(),
      );
}

class _Tablet extends StatelessWidget {
  const _Tablet({super.key});

  @override
  Widget build(BuildContext context) =>
      _buildUi(kTabletMaxWidth * 0.85, context);
}

class _Desktop extends StatelessWidget {
  const _Desktop({super.key});

  @override
  Widget build(BuildContext context) =>
      _buildUi(kDesktopMaxWidth * 0.85, context);
}

class _Mobile extends StatelessWidget {
  const _Mobile({super.key});

  @override
  Widget build(BuildContext context) =>
      _buildUi(getMobileMaxWidth(context) * 0.85, context);
}

Widget _buildUi(double width, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const SizedBox(
        height: 20,
      ),
      Text(
        'Founder Members (@hoangchungk53qx1 and @hoc081098)',
        style: GoogleFonts.josefinSans(
          fontWeight: FontWeight.w900,
          height: 1.3,
          fontSize: 35.0,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        'Talent wins games, but teamwork and intelligence win championships.',
        style: GoogleFonts.josefinSans(
          color: kCaptionColor,
          fontSize: 15.0,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 20,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: profiles
              .map((e) => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: _buildProfile(width, e)))
              .toList(),
        ),
      ),
    ],
  );
}

Center _buildProfile(double width, ProfileModel profile) {
  return Center(
    child: LayoutBuilder(
      builder: (context, constraints) {
        final double avatarSize = ScreenHelper.isDesktop(context)
            ? 250
            : ScreenHelper.isTablet(context)
                ? 200
                : 150;

        return SizedBox(
          width: width,
          height: ScreenHelper.isMobile(context)
              ? null
              : (MediaQuery.of(context).size.height *
                  (ScreenHelper.isTablet(context) ? 0.7 : 0.6)),
          child: RxStreamBuilder<ThemeMode>(
            stream: context.bloc<ThemeBloc>().themeMode$,
            builder: (context, themeMode) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: themeMode == ThemeMode.dark
                        ? const Color.fromARGB(75, 12, 12, 7)
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(5)),
                child: Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        profile.avatarPath,
                        width: avatarSize,
                        height: avatarSize,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                      height: 20,
                    ),
                    if (ScreenHelper.isMobile(context))
                      SizedBox(
                        width: width * 0.9,
                        child: _buildColumn(context, profile),
                      )
                    else
                      Expanded(
                        child: _buildColumn(context, profile),
                      )
                  ],
                ),
              );
            },
          ),
        );
      },
    ),
  );
}

Column _buildColumn(BuildContext context, ProfileModel profile) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      if (ScreenHelper.isDesktop(context))
        SizedBox(
          height: 80,
          child: Text(
            profile.name,
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w900,
              height: 1.3,
              fontSize: 28.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
        )
      else
        SizedBox(
          height: ScreenHelper.isMobile(context) ? 100 : 80,
          child: Text(
            profile.name,
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w900,
              height: 1.3,
              fontSize: 28.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      const SizedBox(
        height: 10.0,
      ),
      SizedBox(
        height: ScreenHelper.isMobile(context)
            ? 200
            : ScreenHelper.isTablet(context)
                ? 150
                : 120,
        child: Text(
          profile.description,
          style: const TextStyle(
            color: kCaptionColor,
            height: 1.5,
            fontSize: 15.0,
          ),
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
      profile.techUsed.isEmpty
          ? Container()
          : Text(
              'Technologies Used',
              style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.w900,
                fontSize: 16.0,
              ),
            ),
      Wrap(
        children: profile.techUsed
            .map((e) => Container(
                  margin: const EdgeInsets.all(10),
                  width: 25,
                  // color:
                  //     e.logo == AppConstants.razorPayImage
                  //         ? Colors.white
                  //         : null,
                  height: 25,
                  child: Image.asset(e.logo),
                ))
            .toList(),
      ),
      const SizedBox(
        height: 25.0,
      ),
      Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 48.0,
              padding: const EdgeInsets.symmetric(
                horizontal: 28.0,
              ),
              child: TextButton(
                onPressed: () => openUrl(profile.cv),
                child: const Center(
                  child: Text(
                    'CV',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 48.0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28.0,
                ),
                child: TextButton(
                  onPressed: () => openUrl(profile.link),
                  child: const Center(
                    child: Text(
                      'MORE DETAILS',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    ],
  );
}
