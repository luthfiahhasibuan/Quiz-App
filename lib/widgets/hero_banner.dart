import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({
    super.key,
    required this.title,
    required this.subtitle,
    this.expand = false,
  });

  final String title;
  final String subtitle;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final r = context.r;
    final radius = Radius.circular(r.radius * 2);
    return Container(
      width: double.infinity,
      height: expand ? double.infinity : null,
      padding: EdgeInsets.fromLTRB(
        r.pad,
        r.padding.top + r.gap,
        r.pad,
        r.gap * 1.5,
      ),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/header_pattern.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: r.isLandscape
            ? BorderRadius.only(topRight: radius, bottomRight: radius)
            : BorderRadius.only(bottomLeft: radius, bottomRight: radius),
      ),

      child: Column(
        mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: r.sp(r.isLandscape ? 24 : 26),
            height: r.sp(r.isLandscape ? 24 : 26),
          ),
          SizedBox(height: r.gap * 0.6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: r.font(7),
            ),
          ),
          SizedBox(height: r.gap * 0.2),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withAlpha(220),
              fontSize: r.font(3.5),
            ),
          ),
        ],
      ),
    );
  }
}
