import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';
import 'utils/app_routes.dart';
import 'utils/app_tema.dart';

void main() {
  runApp(const KuisApp());
}

class KuisApp extends StatelessWidget {
  const KuisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Politika Indonesia',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (_) => const SplashScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
      },
    );
  }
}
