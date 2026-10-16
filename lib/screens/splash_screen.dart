import 'package:flutter/material.dart';

import '../utils/responsive.dart';
import '../utils/app_tema.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _scale = Tween<double>(
      begin: 0.6,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final r = context.r;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/header_pattern.png'),
            fit: BoxFit.cover,
          ),
        ),

        child: Center(
          child: FadeTransition(
            opacity: _fade,
            child: ScaleTransition(
              scale: _scale,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: r.sp(38),
                    height: r.sp(38),
                  ),
                  SizedBox(height: r.gap),
                  Text(
                    'Politika Indonesia',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: r.font(9),
                    ),
                  ),

                  SizedBox(height: r.gap * 0.3),
                  Text(
                    'Uji wawasan politikmu',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w500,
                      fontSize: r.font(4),
                    ),
                  ),
                  SizedBox(height: r.gap * 2),
                  SizedBox(
                    width: r.sp(7),
                    height: r.sp(7),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: r.sp(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
