import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../utils/app_tema.dart';
import '../utils/responsive.dart';
import '../utils/app_routes.dart';
import '../widgets/primary_button.dart';
import '../widgets/stat_card.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  Widget _scoreCard(Responsive r, QuizProvider quiz) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(r.pad),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(r.radius * 1.5),
        boxShadow: AppTheme.softShadow,
      ),
      child: Column(
        children: [
          Image.asset('assets/images/trophy.png', height: r.sp(20)),
          SizedBox(height: r.gap * 0.4),
          Text(
            quiz.grade,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: r.font(6),
            ),
          ),
          SizedBox(height: r.gap),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: quiz.score / 100),
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeOutCubic,
            builder: (context, value, _) {
              return SizedBox(
                width: r.sp(36),
                height: r.sp(36),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: value,
                      strokeWidth: r.sp(3),
                      backgroundColor: Colors.white.o(0.2),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.accent,
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${(value * 100).round()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: r.font(11),
                              height: 1.1,
                            ),
                          ),
                          Text(
                            'dari 100',
                            style: TextStyle(
                              color: Colors.white.withAlpha(210),
                              fontSize: r.font(3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: r.gap * 0.6),
          Text(
            'Skor terbaikmu: ${quiz.bestScore}',
            style: TextStyle(
              color: AppColors.accent,
              fontWeight: FontWeight.w600,
              fontSize: r.font(3.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stats(Responsive r, QuizProvider quiz) {
    return Row(
      children: [
        Expanded(
          child: StatCard(
            icon: Icons.check_circle_rounded,
            label: 'Benar',
            value: '${quiz.correctCount}',
            color: AppColors.success,
          ),
        ),
        SizedBox(width: r.gap * 0.8),
        Expanded(
          child: StatCard(
            icon: Icons.cancel_rounded,
            label: 'Salah',
            value: '${quiz.wrongCount}',
            color: AppColors.error,
          ),
        ),
        SizedBox(width: r.gap * 0.8),
        Expanded(
          child: StatCard(
            icon: Icons.remove_circle_outline_rounded,
            label: 'Kosong',
            value: '${quiz.unansweredCount}',
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }

  Widget _buttons(BuildContext context, Responsive r, QuizProvider quiz) {
    return Column(
      children: [
        PrimaryButton(
          label: 'Ulangi Kuis',
          icon: Icons.replay_rounded,
          onPressed: () {
            quiz.startQuiz(category: quiz.filter);
            Navigator.pushReplacementNamed(context, AppRoutes.quiz);
          },
        ),
        SizedBox(height: r.gap * 0.7),
        PrimaryButton(
          label: 'Kembali ke Beranda',
          icon: Icons.home_rounded,
          outlined: true,
          onPressed: () {
            quiz.reset();
            Navigator.popUntil(context, ModalRoute.withName(AppRoutes.home));
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final r = context.r;
    final quiz = context.watch<QuizProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hasil Kuis',
          style: TextStyle(
            fontSize: r.font(4.8),
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(r.pad),
          child: Column(
            children: [
              _scoreCard(r, quiz),
              SizedBox(height: r.gap),
              _stats(r, quiz),
              SizedBox(height: r.gap * 1.2),
              _buttons(context, r, quiz),
            ],
          ),
        ),
      ),
    );
  }
}
