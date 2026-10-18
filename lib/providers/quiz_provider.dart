import 'dart:math';

import 'package:flutter/foundation.dart';

import '../data/dummy_questions.dart';
import '../models/questions.dart';

class QuizProvider extends ChangeNotifier {
  QuizProvider() {
    _questions = List.of(dummyQuestions);
  }

  late List<Question> _questions;

  /// Jawaban pengguna per soal: null = belum dijawab
  late List<int?> _answers = List.filled(_questions.length, null);

  int _currentIndex = 0;
  int _bestScore = 0;
  bool _started = false;
  bool _finished = false;
  QuizCategory? _filter;

  List<Question> get questions => List.unmodifiable(_questions);
  List<int?> get answers => List.unmodifiable(_answers);
  int get currentIndex => _currentIndex;
  int get total => _questions.length;
  Question get currentQuestion => _questions[_currentIndex];
  int? get currentAnswer => _answers[_currentIndex];
  bool get started => _started;
  bool get finished => _finished;
  int get bestScore => _bestScore;
  QuizCategory? get filter => _filter;

  bool get isFirst => _currentIndex == 0;
  bool get isLast => _currentIndex == _questions.length - 1;
  bool get isCurrentAnswered => _answers[_currentIndex] != null;

  //getter hasil hitung
  int get answeredCount => _answers.where((a) => a != null).length;
  double get progress => total == 0 ? 0 : answeredCount / total;

  int get correctCount {
    var c = 0;
    for (var i = 0; i < _questions.length; i++) {
      if (_answers[i] == _questions[i].correctIndex) c++;
    }
    return c;
  }

  int get wrongCount => answeredCount - correctCount;
  int get unansweredCount => total - answeredCount;

  /// Skor skala 0-100.
  int get score => total == 0 ? 0 : ((correctCount / total) * 100).round();

  bool isCorrect(int index) =>
      _answers[index] == _questions[index].correctIndex;

  //mulai kuis baru
  void startQuiz({QuizCategory? category, bool shuffle = true}) {
    final base = category == null
        ? List.of(dummyQuestions)
        : dummyQuestions.where((q) => q.category == category).toList();
    if (shuffle) base.shuffle(Random());
    _questions = base;
    _answers = List.filled(_questions.length, null);
    _currentIndex = 0;
    _filter = category;
    _started = true;
    _finished = false;
    notifyListeners();
  }

  void resume() {
    if (!_started) startQuiz();
  }

  void selectAnswer(int optionIndex) {
    //jawaban dikunci
    if (_answers[_currentIndex] != null) return;
    _answers[_currentIndex] = optionIndex;
    notifyListeners();
  }

  void goTo(int index) {
    if (index < 0 || index >= total) return;
    _currentIndex = index;
    notifyListeners();
  }

  void next() => goTo(_currentIndex + 1);
  void previous() => goTo(_currentIndex - 1);

  void finish() {
    _finished = true;
    if (score > _bestScore) _bestScore = score;
    notifyListeners();
  }

  // Hapus progres dan kembali ke keadaan awal
  void reset() {
    _started = false;
    _finished = false;
    _currentIndex = 0;
    _filter = null;
    _questions = List.of(dummyQuestions);
    _answers = List.filled(_questions.length, null);
    notifyListeners();
  }

  //teks predikat berdasarkan skor
  String get grade {
    if (score >= 90) return 'Luar Biasa!';
    if (score >= 70) return 'Bagus Sekali!';
    if (score >= 50) return 'Cukup Baik';
    return 'Ayo Belajar Lagi';
  }
}
