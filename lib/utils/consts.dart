import '../widgets/project.dart';

const linkedInUrl = 'https://www.linkedin.com/in/hoc081098/';
const facebook = 'https://www.facebook.com/kotlinandroid081098/';
const githubUrl = 'https://github.com/hoc081098';
const mediumUrl = 'https://hoc081098.medium.com/';
const mailto = 'mailto:simplemobileapptools@gmail.com/';

const _assets = "assets/";
const _outputs = "outputs/";

const _svg = _assets + "svg/";
const guySvg = _svg + "guy.svg";
const personSvg = _svg + "person.svg";

const _images = _assets + "images/";

const _socialImages = _images + "social/";
const emailImage = _socialImages + "email.png";
const linkedInImage = _socialImages + "linkedin-logo.png";
const instaImage = _socialImages + "instagram.png";
const githubImage = _socialImages + "github.png";
const mediumImage = _socialImages + "medium.png";

const _techImages = _images + "technology/";
const flutterImage = _techImages + "flutter.png";
const pythonImage = _techImages + "python.png";
const phpImage = _techImages + "php.png";
const flaskImage = _techImages + "flask.png";
const firebaseImage = _techImages + "firebase.png";
const razorPayImage = _techImages + "razorpay.png";
const cPlusImage = '${_techImages}c++.png';
const swiftImage = '${_techImages}swift.png';
const sceneKitImage = _techImages + "scenekit.jpeg";
const javascriptImage = _techImages + "javascript.png";
const androidImage = _techImages + "android.png";

const _projectsImages = '${_images}projects/';
const smartStoreImage = "${_projectsImages}1.jpeg";
const crossTheRoadImage = "${_projectsImages}2.jpeg";
const newsUpImage = '${_projectsImages}3.jpeg';
const musicLabImage = _projectsImages + "4.jpeg";
const personalFaceImage = _projectsImages + "5.jpeg";
const computerStoreImage = _projectsImages + "6.jpeg";

 List<ProjectModel> projectsData = [
  ProjectModel(
    project: 'Cast to TV & Screen Mirroring',
    title: '',
    description:
    'Cast to TV. It is an ad-free product. \nScreen Mirroring is a multifunctional screen casting application with simple operation and powerful functions',
    appPhotos: 'assets/images/ic_remote_app.jpg',
    projectLink:
    'https://play.google.com/store/apps/details?id=com.vn.streamingtv.castscreen',
    techUsed: [
      TechnologyConstants.android,
      TechnologyConstants.firebase,
      TechnologyConstants.flask,
      TechnologyConstants.python,
      TechnologyConstants.razorPay
    ],
    buttonText: 'Play Store Link',
  ),
  ProjectModel(
    project: 'GPS speedometer Track distance',
    title: '',
    description: 'Cast to TV. It is an ad-free product. \nScreen Mirroring is a multifunctional screen casting application with simple operation and powerful functions',
    appPhotos: 'assets/images/ic_launcher-playstore.png',
    projectLink:
    'https://play.google.com/store/apps/details?id=com.mobileappsdev98.gpsspeedometer.distancemeter.speedtracker',
    techUsed: [
      TechnologyConstants.swift,
      TechnologyConstants.sceneKit,
    ],
    buttonText: 'Play Store Link',
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