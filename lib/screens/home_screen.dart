import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Soal: ${quiz.total}'),
            Text('Terjawab: ${quiz.answeredCount}'),
            Text('Sudah mulai: ${quiz.started}'),
            ElevatedButton(
              onPressed: () => context.read<QuizProvider>().startQuiz(),
              child: const Text('Tes: mulai kuis'),
            ),
            ElevatedButton(
              onPressed: () => context.read<QuizProvider>().selectAnswer(0),
              child: const Text('Tes: jawab pilihan A'),
            ),
          ],
        ),
      ),
    );
  }
}
