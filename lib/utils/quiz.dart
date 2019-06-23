import 'questions.dart';

class Quiz {
  List<Question> _questions;
  int _currentQuestionIndex = -1;
  int _score = 0;

  Quiz(this._questions) {
    _questions.shuffle();
  }

  int get score => _score;

  int get currentQuestionIndex => _currentQuestionIndex;

  List<Question> get questions => _questions;

  int get length => questions.length;

  int get gestionNumber => currentQuestionIndex + 1;

  Question get nextQuestion {
    _currentQuestionIndex++;
    if (_currentQuestionIndex >= length) {
      return null;
    } else {
      return _questions[_currentQuestionIndex];
    }
  }

  void answer(bool isCorrect) {
    if (isCorrect) _score++;
  }
}
