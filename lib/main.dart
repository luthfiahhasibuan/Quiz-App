import 'package:flutter/material.dart';

import 'utils/app_tema.dart';

void main() {
  runApp(
    MaterialApp(
      theme: AppTheme.light,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 120, height: 120, color: AppColors.primary),
              const SizedBox(height: 16),
              Container(
                width: 120,
                height: 40,
                color: AppColors.primary.o(0.2),
              ),
              const SizedBox(height: 16),
              const Text(
                'Kuis Politika Indonesia',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              const Text(
                'Uji pengetahuanmu mengenai sejarah, konstitusi, lembaga negara, dan demokrasi di Indonesia',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
