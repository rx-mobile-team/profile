import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoc081098_portfolio/main.dart';
import 'package:hoc081098_portfolio/theme_bloc.dart';
import 'package:hoc081098_portfolio/utils/screen_helper.dart';
import 'package:hoc081098_portfolio/utils/utils.dart';
import 'package:hoc081098_portfolio/widgets/technology.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class LinkModel {
  final String title;
  final String url;

  LinkModel(this.title, this.url);
}

class ProjectModel {
  final String project;
  final String description;
  final String appPhotos;
  final String projectLink;
  final List<Technology> techUsed;
  List<LinkModel>? links = [];
  final String? buttonText;

  ProjectModel({
    required this.project,
    required this.description,
    required this.appPhotos,
    required this.projectLink,
    required this.techUsed,
    this.buttonText,
    this.links,
  });
}

class ProjectSection extends StatelessWidget {
  final List<ProjectModel> projects;

  const ProjectSection({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: () => _buildUi(kDesktopMaxWidth, context),
      tablet: () => _buildUi(kTabletMaxWidth, context),
      mobile: () => _buildUi(getMobileMaxWidth(context), context),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
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
            'Our work',
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
            'Here are some of our projects',
            style: GoogleFonts.josefinSans(
              color: kCaptionColor,
              fontSize: 15.0,
            ),
          ),
          SizedBox(
            height: ScreenHelper.isDesktop(context) ? 50 : 20,
          ),
          Column(
            children: projects
                .map((e) => Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: _buildProject(width, e)))
                .toList(),
          )
        ],
      ),
    );
  }

  Center _buildProject(double width, ProjectModel projectModel) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: width,
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
                  child: Row(
                    children: [
                      Image.asset(
                        projectModel.appPhotos,
                        width: ScreenHelper.isMobile(context) ? 100.0 : 256.0,
                        height: ScreenHelper.isMobile(context) ? 100.0 : 256.0,
                      ),
                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      Expanded(
                        // width: ScreenHelper.isMobile(context)
                        //     ? width * 0.9
                        //     : width * 0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              projectModel.project,
                              style: GoogleFonts.josefinSans(
                                fontWeight: FontWeight.w900,
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              projectModel.description,
                              style: const TextStyle(
                                height: 1.5,
                                fontSize: 15.0,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            projectModel.techUsed.isEmpty
                                ? Container()
                                : Text(
                                    'Technologies Used',
                                    style: GoogleFonts.josefinSans(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16.0,
                                    ),
                                  ),
                            Wrap(
                              children: projectModel.techUsed
                                  .map((e) => Container(
                                        margin: const EdgeInsets.all(10),
                                        width: 25,
                                        // color: e.logo == razorPayImage
                                        //     ? Colors.white
                                        //     : null,
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
                                      onPressed: () {
                                        openUrl(projectModel.projectLink);
                                      },
                                      child: Center(
                                        child: Text(
                                          (projectModel.buttonText ??
                                              'Explore MORE'),
                                          style: const TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                      // Expanded(
                      //   flex: constraints.maxWidth > 720.0 ? 1 : 0,
                      //   child: ,
                      // )
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
}
