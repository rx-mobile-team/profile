class Technology {
  final String name;
  final String logo;

  const Technology({
    required this.name,
    required this.logo,
  });

  static const android =
      Technology(name: 'Android', logo: 'assets/images/technology/android.png');
  static const dart =
      Technology(name: 'Dart', logo: 'assets/images/technology/dart.png');
  static const flutter =
      Technology(name: 'Flutter', logo: 'assets/images/technology/flutter.png');
  static const iOS =
      Technology(name: 'iOS', logo: 'assets/images/technology/apple.png');
  static const kotlin =
      Technology(name: 'Kotlin', logo: 'assets/images/technology/kotlin.png');
  static const swift =
      Technology(name: 'Swift', logo: 'assets/images/technology/swift.png');
  static const reactiveX =
      Technology(name: 'ReactiveX', logo: 'assets/images/technology/rx.png');
  static const firebase = Technology(
      name: 'Firebase', logo: 'assets/images/technology/firebase.png');
  static const js = Technology(
      name: 'Javascript', logo: 'assets/images/technology/javascript.png');
}

const technologyLearned = <Technology>[
  Technology.android,
  Technology.flutter,
  Technology.iOS,
  Technology.kotlin,
  Technology.swift,
  Technology.dart,
  Technology.reactiveX,
  Technology.firebase,
  Technology.js,
];
