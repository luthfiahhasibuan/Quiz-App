import 'package:flutter/material.dart';

import '../utils/app_tema.dart';
import '../utils/responsive.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.outlined = false,
    this.color = AppColors.primary,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool outlined;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final r = context.r;
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(r.radius),
    );

    final padding = EdgeInsets.symmetric(
      vertical: r.gap * 0.85,
      horizontal: r.gap * 1.2,
    );
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, size: r.font(5)),
          SizedBox(width: r.gap * 0.5),
        ],
        Flexible(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: r.font(3.8),
            ),
          ),
        ),
      ],
    );

    final button = outlined
        ? OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: color,
              side: BorderSide(color: color, width: 1.5),
              shape: shape,
              padding: padding,
            ),
            child: content,
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: shape,
              padding: padding,
            ),
            child: content,
          );

    return SizedBox(width: double.infinity, child: button);
  }
}
