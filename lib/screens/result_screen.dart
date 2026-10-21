import 'package:flutter/material.dart';

import '../providers/quiz_provider.dart';
import '../utils/app_tema.dart';
import '../utils/responsive.dart';

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
          child: _scoreCard(r, quiz),
        ),
      ),
    );
  }
}
