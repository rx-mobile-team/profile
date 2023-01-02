import 'package:hoc081098_portfolio/widgets/technology.dart';

import '../widgets/project.dart';

const mailto = 'mailto:simplemobileapptools@gmail.com/';

List<ProjectModel> projectsData = [
  ProjectModel(
    project: 'Cast to TV & Screen Mirroring',
    description:
        'Cast to TV. It is an ad-free product. \nScreen Mirroring is a multifunctional screen casting application with simple operation and powerful functions',
    appPhotos: 'assets/images/ic_remote_app.jpg',
    projectLink:
        'https://play.google.com/store/apps/details?id=com.vn.streamingtv.castscreen',
    techUsed: [
      Technology.android,
      Technology.kotlin,
      Technology.reactiveX,
      Technology.firebase,
    ],
    buttonText: 'Play Store',
  ),
  ProjectModel(
    project: 'GPS speedometer Track distance',
    description:
        'GPS speedometer can track/measure speed, distance, time, your current location '
        'and show your location in map, with beautiful route',
    appPhotos: 'assets/images/ic_launcher-playstore.png',
    projectLink:
        'https://play.google.com/store/apps/details?id=com.mobileappsdev98.gpsspeedometer.distancemeter.speedtracker',
    techUsed: [
      Technology.android,
      Technology.kotlin,
      Technology.reactiveX,
      Technology.firebase,
    ],
    buttonText: 'Play Store',
  ),
  // ProjectModel(
  //   project: "Flutter App",
  //   title: "News Up App",
  //   description:
  //       "This application is used basically for viewing different news. Launched the app in Amazon AppStore",
  //   appPhotos: newsUpImage,
  //   projectLink: "https://www.amazon.com/gp/product/B08669JDX7",
  //   techUsed: [
  //     TechnologyConstants.flutter,
  //   ],
  // ),
  // ProjectModel(
  //   project: "PHP Website",
  //   title: "Computer Store",
  //   description:
  //       "This is a complete online e-commerce website of selling computer and seperate admin panel is built for handling the order request and only payement is added.",
  //   appPhotos: computerStoreImage,
  //   projectLink: "https://github.com/AgnelSelvan/computer-store.git",
  //   techUsed: [
  //     TechnologyConstants.php,
  //     TechnologyConstants.razorPay,
  //   ],
  // ),
  // ProjectModel(
  //   project: "Python",
  //   title: "Personal Face and Emotion Recognition",
  //   description:
  //       "The model will recognize each face and identify their name based on the trained model. CNN is used for training the dataset.",
  //   appPhotos: personalFaceImage,
  //   projectLink: "https://github.com/AgnelSelvan/Emotion-Recognition.git",
  //   techUsed: [
  //     TechnologyConstants.python,
  //   ],
  // ),
];
