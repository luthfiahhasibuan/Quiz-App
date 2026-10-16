import 'package:flutter/material.dart';

import '../utils/responsive.dart';
import '../utils/app_tema.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
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
            ],
          ),
        ),
      ),
    );
  }
}
