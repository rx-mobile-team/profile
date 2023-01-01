import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/provider/theme.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:my_portfolio/utils/screen_helper.dart';
import 'package:my_portfolio/utils/utils.dart';

import '../main.dart';
import '../utils/screen_helper.dart';

class LinkModel {
  final String title;
  final String url;

  LinkModel(this.title, this.url);
}

class TechnologyModel {
  final String name;
  final String logo;

  TechnologyModel(this.name, this.logo);
}

class TechnologyConstants {
  static TechnologyModel python =
      TechnologyModel("Python", AppConstants.pythonImage);
  static TechnologyModel php = TechnologyModel("Python", AppConstants.phpImage);
  static TechnologyModel flutter =
      TechnologyModel("Flutter", AppConstants.flutterImage);
  static TechnologyModel flask =
      TechnologyModel("Flask", AppConstants.flaskImage);
  static TechnologyModel firebase =
      TechnologyModel("Firebase", AppConstants.firebaseImage);
  static TechnologyModel razorPay =
      TechnologyModel("Razor Pay", AppConstants.razorPayImage);
  static TechnologyModel cPlus =
      TechnologyModel("C++", AppConstants.cPlusImage);
  static TechnologyModel javascript =
      TechnologyModel("Javascript", AppConstants.javascriptImage);
  static TechnologyModel swift =
      TechnologyModel("Swift", AppConstants.swiftImage);
  static TechnologyModel sceneKit =
      TechnologyModel("SceneKit", AppConstants.sceneKitImage);

  static List<TechnologyModel> technologyLearned = [
    flutter,
    swift,
    cPlus,
    python,
    javascript,
    flask
  ];
}

class ProjectModel {
  final String project;
  final String title;
  final String description;
  final String appPhotos;
  final String projectLink;
  final List<TechnologyModel> techUsed;
  List<LinkModel>? links = [];
  final String? buttonText;

  ProjectModel({
    required this.project,
    required this.title,
    required this.description,
    required this.appPhotos,
    required this.projectLink,
    required this.techUsed,
    this.buttonText,
    this.links,
  });

  static List<ProjectModel> projects = [
    ProjectModel(
      project: "Flutter App",
      title: "Smart Store App",
      description:
          "The Idea came during the pandemics to solve the issue of social distancing in supermarkets.",
      appPhotos: AppConstants.smartStoreImage,
      projectLink: "https://github.com/AgnelSelvan/Smart-Store-Mobile-App",
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.firebase,
        TechnologyConstants.flask,
        TechnologyConstants.python,
        TechnologyConstants.razorPay
      ],
      buttonText: "Github Link",
    ),
    ProjectModel(
      project: "Swift App",
      title: "Cross The Road Game",
      description: "Cross the Road game developed using Swift and SceneKit",
      appPhotos: AppConstants.crossTheRoadImage,
      projectLink: "https://github.com/AgnelSelvan/Cross-the-road",
      techUsed: [
        TechnologyConstants.swift,
        TechnologyConstants.sceneKit,
      ],
      buttonText: "Github Link",
    ),
    ProjectModel(
      project: "Flutter App",
      title: "News Up App",
      description:
          "This application is used basically for viewing different news. Launched the app in Amazon AppStore",
      appPhotos: AppConstants.newsUpImage,
      projectLink: "https://www.amazon.com/gp/product/B08669JDX7",
      techUsed: [
        TechnologyConstants.flutter,
      ],
    ),
    ProjectModel(
      project: "Flutter App",
      title: "Music Lab",
      description:
          "A Simple Music Player App. Launched the app in Amazon AppStore",
      appPhotos: AppConstants.musicLabImage,
      projectLink: "https://www.amazon.com/gp/product/B08WL2XFGW",
      techUsed: [
        TechnologyConstants.flutter,
      ],
    ),
    ProjectModel(
      project: "PHP Website",
      title: "Computer Store",
      description:
          "This is a complete online e-commerce website of selling computer and seperate admin panel is built for handling the order request and only payement is added.",
      appPhotos: AppConstants.computerStoreImage,
      projectLink: "https://github.com/AgnelSelvan/computer-store.git",
      techUsed: [
        TechnologyConstants.php,
        TechnologyConstants.razorPay,
      ],
    ),
    ProjectModel(
      project: "Python",
      title: "Personal Face and Emotion Recognition",
      description:
          "The model will recognize each face and identify their name based on the trained model. CNN is used for training the dataset.",
      appPhotos: AppConstants.personalFaceImage,
      projectLink: "https://github.com/AgnelSelvan/Emotion-Recognition.git",
      techUsed: [
        TechnologyConstants.python,
      ],
    ),
  ];

  static List<ProjectModel> demos = [
    ProjectModel(
      project: "Flutter App",
      title: "Flutter Web Portfolio",
      description: "",
      appPhotos: AppConstants.portfolioGif,
      projectLink: "https://github.com/AgnelSelvan/Flutter-Web-Portfolio",
      techUsed: [],
      buttonText: "Github Link",
    ),
  ];
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
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: projects
              .map((e) => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: _buildProject(width, e)))
              .toList(),
        ),
      ),
    );
  }

  Center _buildProject(double width, ProjectModel projectModel) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: width,
            child: Consumer(builder: (context, ref, _) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: ref.watch(themeProvider).isDarkMode
                        ? const Color.fromARGB(75, 12, 12, 7)
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(5)),
                child: Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    SizedBox(
                      width: ScreenHelper.isMobile(context)
                          ? width * 0.9
                          : width * 0.46,
                      child: Image.asset(
                        projectModel.appPhotos,
                        width: constraints.maxWidth > 720.0 ? null : 350.0,
                        height: 250,
                      ),
                    ),

                    const SizedBox(
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: ScreenHelper.isMobile(context)
                          ? width * 0.9
                          : width * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            projectModel.project,
                            style: GoogleFonts.josefinSans(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            projectModel.title,
                            style: GoogleFonts.josefinSans(
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                              fontSize: 28.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            projectModel.description,
                            style: const TextStyle(
                              color: kCaptionColor,
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
                                  "Technologies Used",
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
                                      color:
                                          e.logo == AppConstants.razorPayImage
                                              ? Colors.white
                                              : null,
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
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 48.0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 28.0,
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Utilty.openUrl(projectModel.projectLink);
                                    },
                                    child: Center(
                                      child: Text(
                                        (projectModel.buttonText ??
                                                "Explore MORE")
                                            .toUpperCase(),
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
            }),
          );
        },
      ),
    );
  }
}
