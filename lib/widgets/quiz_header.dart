import 'package:flutter/material.dart';

import '../utils/app_tema.dart';
import '../utils/responsive.dart';
import '../widgets/quiz_progress_bar.dart';

/// Header halaman kuis: tombol kembali, nomor soal, navigator, dan progres.
class QuizHeader extends StatelessWidget {
  const QuizHeader({
    super.key,
    required this.current,
    required this.total,
    required this.answered,
    required this.categoryLabel,
    required this.onBack,
    required this.onOpenNavigator,
  });

  final int current;
  final int total;
  final int answered;
  final String categoryLabel;
  final VoidCallback onBack;
  final VoidCallback onOpenNavigator;

  @override
  Widget build(BuildContext context) {
    final r = context.r;
    return Container(
      padding: EdgeInsets.fromLTRB(
        r.pad * 0.4,
        r.padding.top + r.gap * 0.4,
        r.pad * 0.4,
        r.gap,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(r.radius * 1.5),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onBack,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: r.font(6),
                ),
                tooltip: 'Kembali',
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Soal $current dari $total',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: r.font(4.6),
                      ),
                    ),
                    Text(
                      categoryLabel,
                      style: TextStyle(
                        color: Colors.white.withAlpha(210),
                        fontSize: r.font(3),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onOpenNavigator,
                icon: Icon(
                  Icons.grid_view_rounded,
                  color: Colors.white,
                  size: r.font(6),
                ),
                tooltip: 'Daftar soal',
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: r.pad * 0.6),
            child: QuizProgressBar(
              value: total == 0 ? 0 : answered / total,
              label: '$answered dari $total soal terjawab',
            ),
          ),
        ],
      ),
    );
  }
}
