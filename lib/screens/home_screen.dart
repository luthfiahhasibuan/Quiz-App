import 'package:flutter/material.dart';

import '../data/dummy_questions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Beranda: ${dummyQuestions.length} soal')),
    );
  }
}
