import 'dart:async';
import 'package:flutter/foundation.dart' show PlatformDispatcher, kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_exam/app.dart';
import 'package:flutter_exam/app/enums/flavor_enum.dart';

void main() {
  runApp(
    App(
      flavor: Flavor.development,
    ),
  );
}



/*
#Run app in `dev` environment
flutter run -t lib/main_development.dart  --flavor=development

# Run app in debug mode (Picks up debug signing config)
flutter run -t lib/main_development.dart  --debug --flavor=development

# Run app in release mode (Picks up release signing config)
flutter run -t lib/main_development.dart  --release --flavor=development

# Create appBundle for Android platform. Runs in release mode by default.
flutter build appbundle -t lib/main_development.dart  --flavor=development

# Create APK for dev flavor. Runs in release mode by default.
flutter build apk -t lib/main_development.dart  --flavor=development

# Create minified APK for dev flavor.
flutter build apk -t lib/main_development.dart  --flavor=development --split-per-abi --no-shrink
*/
