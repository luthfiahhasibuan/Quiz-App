import 'package:flutter/material.dart';

import '../utils/app_tema.dart';
import '../utils/responsive.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final r = context.r;
    return Padding(
      padding: EdgeInsets.only(bottom: r.gap * 0.6),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(r.gap * 0.5),
            decoration: BoxDecoration(
              color: AppColors.primary.o(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: r.font(4.5), color: AppColors.primary),
          ),

          SizedBox(width: r.gap * 0.8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: r.font(3.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
