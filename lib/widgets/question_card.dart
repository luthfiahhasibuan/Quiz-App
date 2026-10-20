import 'package:flutter/material.dart';

import '../models/questions.dart';
import '../utils/app_tema.dart';
import '../utils/responsive.dart';

/// Kartu yang menampilkan teks soal beserta kategorinya (reusable).
class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, required this.number, required this.question});

  final int number;
  final Question question;

  @override
  Widget build(BuildContext context) {
    final r = context.r;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(r.pad),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(r.radius * 1.3),
        boxShadow: AppTheme.softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: r.gap * 0.8,
              vertical: r.gap * 0.35,
            ),
            decoration: BoxDecoration(
              color: AppColors.accent.o(0.25),
              borderRadius: BorderRadius.circular(r.radius * 2),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  question.category.icon,
                  size: r.font(4),
                  color: AppColors.primaryDark,
                ),
                SizedBox(width: r.gap * 0.3),
                Text(
                  question.category.label,
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w600,
                    fontSize: r.font(3),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: r.gap),
          Text(
            question.text,
            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.w600,
              fontSize: r.font(4.6),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
