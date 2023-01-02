import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoc081098_portfolio/utils/consts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../main.dart';
import '../utils/screen_helper.dart';
import '../utils/utils.dart';

class FooterItem {
  final IconData iconData;
  final String title;
  final String text1;
  final String text2;
  final VoidCallback? onTap;

  FooterItem({
    this.onTap,
    required this.iconData,
    required this.title,
    required this.text1,
    required this.text2,
  });
}

final List<FooterItem> footerItems = [
  FooterItem(
      iconData: Icons.location_on,
      title: 'ADDRESS',
      text1: 'Nam Tu Liem, Ha Noi',
      text2: 'VietNam',
      onTap: () {
        openUrl('https://goo.gl/maps/aoDYRcdtpvexwKGw7');
      }),
  FooterItem(
      iconData: Icons.phone,
      title: 'PHONE',
      text1: '+84989112136',
      text2: '',
      onTap: () {
        openUrl('tel:+84989112136');
      }),
  FooterItem(
      iconData: Icons.mail,
      title: 'EMAIL',
      text1: 'simplemobileapptools@gmail.com',
      text2: '',
      onTap: () {
        openUrl(mailto);
      }),
  FooterItem(
      iconData: Icons.sms,
      title: 'TELEGRAM',
      text1: 'https://t.me/PetrusXXXX',
      text2: '',
      onTap: () {
        openUrl('https://t.me/PetrusXXXX');
      })
];

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: () => _buildUi(kDesktopMaxWidth, context),
      tablet: () => _buildUi(kTabletMaxWidth, context),
      mobile: () => _buildUi(getMobileMaxWidth(context), context),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: footerItems
                      .map(
                        (footerItem) => MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: InkWell(
                            onTap: footerItem.onTap,
                            child: SizedBox(
                              width: ScreenHelper.isMobile(context)
                                  ? constraints.maxWidth / 2.0 - 20.0
                                  : constraints.maxWidth / 4.0 - 20.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        footerItem.iconData,
                                        color: Theme.of(context).primaryColor,
                                        size: 28,
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        footerItem.title,
                                        style: GoogleFonts.josefinSans(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '${footerItem.text1}\n',
                                          style: const TextStyle(
                                            color: kCaptionColor,
                                            height: 1.8,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '${footerItem.text2}\n',
                                          style: const TextStyle(
                                            color: kCaptionColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Developed in 💛 with Love',
                      style: TextStyle(
                        color: kCaptionColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    ),
  );
}
