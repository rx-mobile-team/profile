import 'package:flutter/material.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rx_mobile_team/main.dart';
import 'package:rx_mobile_team/utils/consts.dart';
import 'package:rx_mobile_team/utils/screen_helper.dart';
import 'package:rx_mobile_team/utils/utils.dart';

class SocialData {
  final String assetImagePath;
  final String url;

  const SocialData({
    required this.assetImagePath,
    required this.url,
  });
}

const socialLoginItems = <SocialData>[
  SocialData(
    assetImagePath: 'assets/images/social/email.png',
    url: mailtoUrl,
  ),
  SocialData(
    assetImagePath: 'assets/images/social/github.png',
    url: githubUrl,
  ),
];

class HomeInfo extends StatelessWidget {
  const HomeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);

    return Provider<double>.value(
      height,
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: ScreenHelper(
          tablet: () => const _TabletHomeInfo(),
          mobile: () => const _MobileHomeInfo(),
          desktop: () => const _DesktopHomeInfo(),
        ),
      ),
    );
  }
}

class _MobileHomeInfo extends StatelessWidget {
  const _MobileHomeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: getMobileMaxWidth(context),
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: const Center(
        child: _NameInfo(
          isMobile: true,
        ),
      ),
    );
  }
}

class _DesktopHomeInfo extends StatelessWidget {
  const _DesktopHomeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ResponsiveWrapper(
        maxWidth: kDesktopMaxWidth,
        minWidth: kDesktopMaxWidth,
        defaultScale: false,
        child: Row(
          children: [
            const Expanded(
              child: _NameInfo(isMobile: false),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SvgPicture.asset(
                'assets/svg/guy.svg',
                semanticsLabel: 'Logo',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TabletHomeInfo extends StatelessWidget {
  const _TabletHomeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ResponsiveWrapper(
        maxWidth: kTabletMaxWidth,
        minWidth: kTabletMaxWidth,
        defaultScale: false,
        child: Row(
          children: [
            const Expanded(
              child: _NameInfo(isMobile: false),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SvgPicture.asset(
                'assets/svg/guy.svg',
                semanticsLabel: 'Logo',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _NameInfo extends StatelessWidget {
  final bool isMobile;

  const _NameInfo({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.get(),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Mobile App Solution',
                  style: GoogleFonts.josefinSans(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 18.0,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  'We are Rx Mobile Team'.toUpperCase(),
                  style: GoogleFonts.josefinSans(
                    fontSize: 36.0 * (isMobile ? 0.7 : 1.0),
                    fontWeight: FontWeight.w900,
                    height: 1.3,
                    letterSpacing: 2.3,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  'We are full-stack mobile software engineers',
                  style: TextStyle(
                    color: kCaptionColor,
                    fontSize: 15.0,
                    height: 1.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: isMobile
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.location_on,
                      color: kCaptionColor,
                      size: 14,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      'Base in Hanoi, Vietnam',
                      style: TextStyle(
                        color: kCaptionColor,
                        fontSize: 15.0,
                        height: 1.0,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: isMobile
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
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
                          onPressed: () => openUrl(mailtoUrl),
                          child: const Text(
                            "Let's Talk",
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Row(
                    mainAxisAlignment: isMobile
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.end,
                    crossAxisAlignment: isMobile
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.end,
                    children: [
                      for (final e in socialLoginItems)
                        InkWell(
                          onTap: () => openUrl(e.url),
                          child: Container(
                            width: 48,
                            height: 48,
                            margin: const EdgeInsets.all(10),
                            child: Image.asset(
                              e.assetImagePath,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
