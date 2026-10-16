import 'package:flutter/material.dart';

import 'utils/app_tema.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MaterialApp(theme: AppTheme.light, home: const SplashScreen()));
}
