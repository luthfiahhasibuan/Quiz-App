import 'package:flutter/material.dart' show IconData, Icons;

/// Kategori soal pada kuis.
enum QuizCategory {
  sejarah('Sejarah Politik Indonesia', Icons.history_edu_rounded),
  geografi('Pancasila Dan Konstitusi', Icons.public_rounded),
  budaya('Hak Warga Negra', Icons.palette_rounded),
  umum('Lembaga Negara', Icons.lightbulb_rounded);

  const QuizCategory(this.label, this.icon);

  final String label;
  final IconData icon;
}

class Question {
  const Question({
    required this.text,
    required this.options,
    required this.correctIndex,
    required this.category,
    required this.explanation,
  });

  final String text;
  final List<String> options;
  final int correctIndex;
  final QuizCategory category;
  final String explanation;
}
