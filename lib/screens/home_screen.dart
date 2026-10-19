import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/dummy_questions.dart';
import '../models/questions.dart';
import '../providers/quiz_provider.dart';
import '../utils/app_tema.dart';
import '../utils/responsive.dart';
import '../widgets/stat_card.dart';
import '../widgets/hero_banner.dart';
import '../widgets/category_chip.dart';
import '../utils/app_routes.dart';
import '../widgets/primary_button.dart';
import '../widgets/info_tile.dart';

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

  void _startNew() {
    context.read<QuizProvider>().startQuiz(category: _selected);
    Navigator.pushNamed(context, AppRoutes.quiz);
  }

  void _continue() => Navigator.pushNamed(context, AppRoutes.quiz);

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

          //kategori
          SizedBox(height: r.gap * 1.5),
          Text(
            'Pilih Kategori',
            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.w700,
              fontSize: r.font(4.6),
            ),
          ),
          SizedBox(height: r.gap * 0.8),
          Wrap(
            spacing: r.gap * 0.6,
            runSpacing: r.gap * 0.6,
            children: [
              CategoryChip(
                label: 'Semua',
                icon: Icons.apps_rounded,
                selected: _selected == null,
                onTap: () => setState(() => _selected = null),
              ),
              for (final c in QuizCategory.values)
                CategoryChip(
                  label: c.label,
                  icon: c.icon,
                  selected: _selected == c,
                  onTap: () => setState(() => _selected = c),
                ),
            ],
          ),

          SizedBox(height: r.gap * 1.5),
          if (inProgress) ...[
            PrimaryButton(
              label: 'Lanjutkan Kuis (${quiz.answeredCount}/${quiz.total})',
              icon: Icons.play_arrow_rounded,
              onPressed: _continue,
            ),
            SizedBox(height: r.gap * 0.7),
            PrimaryButton(
              label: 'Mulai Ulang',
              icon: Icons.refresh_rounded,
              outlined: true,
              onPressed: _startNew,
            ),
          ] else
            PrimaryButton(
              label: 'Mulai Kuis',
              icon: Icons.rocket_launch_rounded,
              onPressed: _startNew,
            ),

          SizedBox(height: r.gap * 1.5),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(r.gap),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(r.radius),
              boxShadow: AppTheme.softShadow,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cara Bermain',
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w700,
                    fontSize: r.font(4),
                  ),
                ),

                SizedBox(height: r.gap * 0.7),
                const InfoTile(
                  icon: Icons.touch_app_rounded,
                  text: 'Pilih satu jawaban untuk setiap soal.',
                ),
                const InfoTile(
                  icon: Icons.lightbulb_rounded,
                  text: 'Lihat penjelasan setelah menjawab.',
                ),
                const InfoTile(
                  icon: Icons.save_rounded,
                  text: 'Progres tersimpan walau layar diputar atau pindah halaman.',
                ),
              ],
            ),
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
