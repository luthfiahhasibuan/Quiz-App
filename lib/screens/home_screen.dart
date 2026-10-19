import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/dummy_questions.dart';
import '../models/questions.dart';
import '../providers/quiz_provider.dart';
import '../utils/app_tema.dart';
import '../utils/responsive.dart';
import '../widgets/stat_card.dart';
import '../widgets/hero_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuizCategory? _selected;

  int get _questionCount => _selected == null
      ? dummyQuestions.length
      : dummyQuestions.where((q) => q.category == _selected).length;

  Widget _buildContent(Responsive r, QuizProvider quiz) {
    final inProgress = quiz.started && !quiz.finished;
    final answeredText = inProgress
        ? '${quiz.answeredCount}/${quiz.total}'
        : '0/$_questionCount';

    return Padding(
      padding: EdgeInsets.all(r.pad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: StatCard(
                  icon: Icons.quiz_rounded,
                  label: 'Soal',
                  value: '$_questionCount',
                ),
              ),

              SizedBox(width: r.gap * 0.8),
              Expanded(
                child: StatCard(
                  icon: Icons.emoji_events_rounded,
                  label: 'Skor Terbaik',
                  value: '${quiz.bestScore}',
                  color: const Color(0xFFE0A100),
                ),
              ),

              SizedBox(width: r.gap * 0.8),
              Expanded(
                child: StatCard(
                  icon: Icons.task_alt_rounded,
                  label: 'Terjawab',
                  value: answeredText,
                  color: AppColors.success,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final r = context.r;
    final quiz = context.watch<QuizProvider>();
    const banner = HeroBanner(
      title: 'Politika Indonesia',
      subtitle: 'Uji wawasanmu di sini',
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [banner, _buildContent(r, quiz)]),
      ),
    );
  }
}
