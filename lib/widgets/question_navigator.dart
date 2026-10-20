import 'package:flutter/material.dart';

import '../utils/app_tema.dart';
import '../utils/responsive.dart';

/// Grid nomor soal untuk lompat antar soal (reusable).
/// Hijau = sudah dijawab, biru = soal aktif, putih = belum dijawab.
class QuestionNavigator extends StatelessWidget {
  const QuestionNavigator({
    super.key,
    required this.total,
    required this.current,
    required this.answers,
    required this.onSelect,
  });

  final int total;
  final int current;
  final List<int?> answers;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    final r = context.r;
    final boxSize = r.sp(12);
    return Wrap(
      spacing: r.gap * 0.6,
      runSpacing: r.gap * 0.6,
      children: List.generate(total, (i) {
        final isCurrent = i == current;
        final isAnswered = answers[i] != null;
        final Color fill = isCurrent
            ? AppColors.primary
            : isAnswered
            ? AppColors.success.o(0.15)
            : Colors.white;
        final Color border = isCurrent
            ? AppColors.primary
            : isAnswered
            ? AppColors.success
            : AppColors.border;
        return InkWell(
          borderRadius: BorderRadius.circular(r.radius * 0.6),
          onTap: () => onSelect(i),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: boxSize,
            height: boxSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: fill,
              borderRadius: BorderRadius.circular(r.radius * 0.6),
              border: Border.all(color: border, width: 1.5),
            ),
            child: Text(
              '${i + 1}',
              style: TextStyle(
                color: isCurrent ? Colors.white : AppColors.textDark,
                fontWeight: FontWeight.w600,
                fontSize: r.font(3.8),
              ),
            ),
          ),
        );
      }),
    );
  }
}
