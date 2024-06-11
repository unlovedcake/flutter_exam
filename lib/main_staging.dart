import 'dart:async';
import 'package:flutter/foundation.dart' show PlatformDispatcher, kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_exam/app.dart';
import 'package:flutter_exam/app/enums/flavor_enum.dart';

void main() {
  runApp(
    App(
      flavor: Flavor.staging,
    ),
  );
}
