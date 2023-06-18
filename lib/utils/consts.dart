import 'package:rx_mobile_team/widgets/technology.dart';

import '../widgets/project.dart';

const email = 'simplemobileapptools@gmail.com';
const mailtoUrl = 'mailto:$email';

const phone = '+84989112136';
const telPhoneUrl = 'tel:$phone';

const mapUrl = 'https://goo.gl/maps/aoDYRcdtpvexwKGw7';
const githubUrl = 'https://github.com/rx-mobile-team';
const telegramUrl = 'https://t.me/PetrusXXXX';

const List<ProjectModel> projectsData = [
  ProjectModel(
    project: 'Slide show',
    description:
        'An application for making video slideshows with music and photos, '
        'creating video stories, editing videos with photos and music. '
        'Using many effects/fitler/frame/sticker for video.'
        'Using FFMPEG library for video processing, '
        'Android Media Muxer, Android MediaCodec API OpenGL ES 2.0 for video rendering.',
    appPhotos: 'assets/images/slideshow.png',
    projectLink: '',
    techUsed: [
      Technology.android,
      Technology.kotlin,
      Technology.reactiveX,
      Technology.firebase,
      Technology.opengl,
      Technology.ffmpeg,
    ],
    buttonText: 'Private link',
  ),
  ProjectModel(
    project: 'Quiz app',
    description:
        'An quiz application, very useful for learning languages or other school subjects. '
        'The application has many features such as: multiple choice questions, true/false questions, '
        'fill in the blank questions, match the column questions, drag/drop questions, '
        'listening questions.',
    appPhotos: 'assets/images/quizapp.png',
    projectLink: '',
    techUsed: [
      Technology.flutter,
      Technology.dart,
      Technology.reactiveX,
      Technology.firebase,
      Technology.bloc,
    ],
    buttonText: 'Private link',
  ),
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
  ProjectModel(
    project: 'VDone',
    description:
        'A new online Video social network. This app allows you to live broadcast your special moments, chat live with friends or make video calls.',
    appPhotos: 'assets/images/vline.png',
    projectLink: 'https://play.google.com/store/apps/details?id=com.app.vdone',
    techUsed: [
      Technology.flutter,
      Technology.dart,
      Technology.reactiveX,
      Technology.firebase,
      Technology.agora,
      Technology.bloc,
    ],
    buttonText: 'Play Store',
  ),
];
