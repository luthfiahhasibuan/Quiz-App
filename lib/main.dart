import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';
import 'utils/app_routes.dart';
import 'utils/app_tema.dart';

import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const KuisApp());
}

class KuisApp extends StatelessWidget {
  const KuisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuizProvider>(
      create: (_) => QuizProvider(),
      child: MaterialApp(
        title: 'Politika Indonesia',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        initialRoute: AppRoutes.splash,
        routes: {
          AppRoutes.splash: (_) => const SplashScreen(),
          AppRoutes.home: (context) => const HomeScreen(),
          AppRoutes.quiz: (_) => const QuizScreen(),
          AppRoutes.result: (_) => const ResultScreen(),
        },
      ),
    );
  }
}
