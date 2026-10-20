import 'package:flutter/material.dart';

import '../utils/app_tema.dart';
import '../utils/responsive.dart';

/// Status visual satu pilihan jawaban.
enum OptionStatus { idle, correct, wrong, dimmed }

/// Satu baris pilihan jawaban (reusable).
class OptionTile extends StatelessWidget {
  const OptionTile({
    super.key,
    required this.letter,
    required this.text,
    required this.status,
    required this.onTap,
  });

  final String letter;
  final String text;
  final OptionStatus status;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final r = context.r;

    Color background = AppColors.surface;
    Color borderColor = AppColors.border;
    Color badgeColor = AppColors.primary.o(0.1);
    Color badgeText = AppColors.primary;
    IconData? trailing;
    double opacity = 1;

    switch (status) {
      case OptionStatus.idle:
        break;
      case OptionStatus.correct:
        background = AppColors.success.o(0.12);
        borderColor = AppColors.success;
        badgeColor = AppColors.success;
        badgeText = Colors.white;
        trailing = Icons.check_circle_rounded;
        break;
      case OptionStatus.wrong:
        background = AppColors.error.o(0.1);
        borderColor = AppColors.error;
        badgeColor = AppColors.error;
        badgeText = Colors.white;
        trailing = Icons.cancel_rounded;
        break;
      case OptionStatus.dimmed:
        opacity = 0.55;
        break;
    }

    final badgeSize = r.sp(9);
    final trailingColor = status == OptionStatus.correct
        ? AppColors.success
        : AppColors.error;

    return Opacity(
      opacity: opacity,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: EdgeInsets.only(bottom: r.gap * 0.7),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(r.radius),
          border: Border.all(color: borderColor, width: 1.6),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(r.radius),
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(r.gap * 0.9),
              child: Row(
                children: [
                  Container(
                    width: badgeSize,
                    height: badgeSize,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: badgeColor,
                      borderRadius: BorderRadius.circular(r.radius * 0.6),
                    ),
                    child: Text(
                      letter,
                      style: TextStyle(
                        color: badgeText,
                        fontWeight: FontWeight.w700,
                        fontSize: r.font(4),
                      ),
                    ),
                  ),
                  SizedBox(width: r.gap * 0.8),
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w500,
                        fontSize: r.font(3.8),
                      ),
                    ),
                  ),
                  if (trailing != null)
                    Icon(trailing, color: trailingColor, size: r.font(6)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
