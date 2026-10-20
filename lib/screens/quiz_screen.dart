import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../utils/app_routes.dart';
import '../utils/app_tema.dart';
import '../utils/responsive.dart';
import '../widgets/feedback_card.dart';
import '../widgets/option_tile.dart';
import '../widgets/primary_button.dart';
import '../widgets/question_card.dart';
import '../widgets/question_navigator.dart';
import '../widgets/quiz_header.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    // Jika halaman dibuka tanpa kuis aktif, mulai kuis baru.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final quiz = context.read<QuizProvider>();
      if (!quiz.started) quiz.startQuiz();
    });
  }

  OptionStatus _statusFor(QuizProvider quiz, int index) {
    final answer = quiz.currentAnswer;
    if (answer == null) return OptionStatus.idle;
    if (index == quiz.currentQuestion.correctIndex) return OptionStatus.correct;
    if (index == answer) return OptionStatus.wrong;
    return OptionStatus.dimmed;
  }

  Future<void> _finish() async {
    final quiz = context.read<QuizProvider>();
    if (quiz.unansweredCount > 0) {
      final ok = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Selesaikan kuis?'),
          content: Text(
            'Masih ada ${quiz.unansweredCount} soal yang belum dijawab.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Kembali'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Selesaikan'),
            ),
          ],
        ),
      );
      if (ok != true) return;
    }
    if (!mounted) return;
    quiz.finish();
    Navigator.pushReplacementNamed(context, AppRoutes.result);
  }

  void _openNavigator() {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (sheetContext) => Consumer<QuizProvider>(
        builder: (ctx, quiz, _) {
          final r = ctx.r;
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(r.pad, 0, r.pad, r.pad),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daftar Soal',
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.w700,
                      fontSize: r.font(4.8),
                    ),
                  ),
                  SizedBox(height: r.gap * 0.3),
                  Text(
                    'Hijau = sudah dijawab, biru = soal saat ini.',
                    style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: r.font(3.1),
                    ),
                  ),
                  SizedBox(height: r.gap),
                  QuestionNavigator(
                    total: quiz.total,
                    current: quiz.currentIndex,
                    answers: quiz.answers,
                    onSelect: (i) {
                      quiz.goTo(i);
                      Navigator.pop(sheetContext);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final r = context.r;
    final quiz = context.watch<QuizProvider>();

    if (!quiz.started || quiz.total == 0) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final question = quiz.currentQuestion;
    final answered = quiz.isCurrentAnswered;

    final questionCard = QuestionCard(
      number: quiz.currentIndex + 1,
      question: question,
    );

    final options = Column(
      children: [
        for (var i = 0; i < question.options.length; i++)
          OptionTile(
            letter: String.fromCharCode(65 + i),
            text: question.options[i],
            status: _statusFor(quiz, i),
            onTap: () => context.read<QuizProvider>().selectAnswer(i),
          ),
      ],
    );

    final feedback = FeedbackCard(
      visible: answered,
      correct: answered && quiz.isCorrect(quiz.currentIndex),
      explanation: question.explanation,
    );

    final Widget content = r.isLandscape
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(r.pad),
                  child: questionCard,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(r.pad),
                  child: Column(children: [options, feedback]),
                ),
              ),
            ],
          )
        : SingleChildScrollView(
            padding: EdgeInsets.all(r.pad),
            child: Column(
              children: [
                questionCard,
                SizedBox(height: r.gap),
                options,
                feedback,
              ],
            ),
          );

    final bottomBar = Container(
      padding: EdgeInsets.fromLTRB(
        r.pad,
        r.gap * 0.8,
        r.pad,
        r.gap * 0.8 + r.padding.bottom,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x142347A8),
            blurRadius: 12,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          if (!quiz.isFirst) ...[
            Expanded(
              child: PrimaryButton(
                label: 'Sebelumnya',
                icon: Icons.chevron_left_rounded,
                outlined: true,
                onPressed: quiz.previous,
              ),
            ),
            SizedBox(width: r.gap * 0.8),
          ],
          Expanded(
            flex: 2,
            child: quiz.isLast
                ? PrimaryButton(
                    label: 'Selesai',
                    icon: Icons.flag_rounded,
                    color: AppColors.success,
                    onPressed: _finish,
                  )
                : PrimaryButton(
                    label: answered ? 'Lanjut' : 'Lewati',
                    icon: Icons.chevron_right_rounded,
                    onPressed: quiz.next,
                  ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          QuizHeader(
            current: quiz.currentIndex + 1,
            total: quiz.total,
            answered: quiz.answeredCount,
            categoryLabel: quiz.filter?.label ?? 'Semua Kategori',
            onBack: () => Navigator.maybePop(context),
            onOpenNavigator: _openNavigator,
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: KeyedSubtree(
                key: ValueKey<int>(quiz.currentIndex),
                child: content,
              ),
            ),
          ),
          bottomBar,
        ],
      ),
    );
  }
}
