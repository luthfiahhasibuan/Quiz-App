import 'package:flutter/material.dart';

import '../utils/app_tema.dart';
import '../utils/responsive.dart';

/// Kartu umpan balik (benar/salah + penjelasan) setelah soal dijawab.
class FeedbackCard extends StatelessWidget {
  const FeedbackCard({
    super.key,
    required this.visible,
    required this.correct,
    required this.explanation,
  });

  final bool visible;
  final bool correct;
  final String explanation;

  @override
  Widget build(BuildContext context) {
    final r = context.r;
    final color = correct ? AppColors.success : AppColors.error;
    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      alignment: Alignment.topCenter,
      child: !visible
          ? const SizedBox(width: double.infinity)
          : Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: r.gap * 0.3),
              padding: EdgeInsets.all(r.gap),
              decoration: BoxDecoration(
                color: color.o(0.1),
                borderRadius: BorderRadius.circular(r.radius),
                border: Border.all(color: color.o(0.5)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    correct
                        ? Icons.emoji_events_rounded
                        : Icons.lightbulb_outline_rounded,
                    color: color,
                    size: r.font(6),
                  ),
                  SizedBox(width: r.gap * 0.8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          correct ? 'Jawaban benar!' : 'Kurang tepat',
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w700,
                            fontSize: r.font(4),
                          ),
                        ),
                        SizedBox(height: r.gap * 0.2),
                        Text(
                          explanation,
                          style: TextStyle(
                            color: AppColors.textDark,
                            fontSize: r.font(3.4),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
