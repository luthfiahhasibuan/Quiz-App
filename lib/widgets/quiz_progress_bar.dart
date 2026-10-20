import 'package:flutter/material.dart';

import '../utils/app_tema.dart';
import '../utils/responsive.dart';

/// Progress bar beranimasi dengan label (reusable).
class QuizProgressBar extends StatelessWidget {
  const QuizProgressBar({
    super.key,
    required this.value,
    required this.label,
    this.trackColor,
    this.fillColor = AppColors.accent,
    this.textColor = Colors.white,
  });

  /// Nilai 0.0 - 1.0.
  final double value;
  final String label;
  final Color? trackColor;
  final Color fillColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final r = context.r;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: value.clamp(0.0, 1.0)),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
          builder: (context, v, _) => ClipRRect(
            borderRadius: BorderRadius.circular(r.radius),
            child: LinearProgressIndicator(
              value: v,
              minHeight: r.sp(2.2),
              backgroundColor: trackColor ?? Colors.white.o(0.25),
              valueColor: AlwaysStoppedAnimation<Color>(fillColor),
            ),
          ),
        ),
        SizedBox(height: r.gap * 0.4),
        Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: r.font(3),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
