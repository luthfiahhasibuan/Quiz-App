import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        usesMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
