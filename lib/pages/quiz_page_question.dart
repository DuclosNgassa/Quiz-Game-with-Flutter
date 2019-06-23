import 'package:flutter/material.dart';
import '../utils/questions.dart';
import '../utils/quiz.dart';
import '../ui/answer_button.dart';
import '../ui/question_text.dart';
import '../ui/correct_wrong_overlay.dart';
import 'score_page.dart';

class QuizPageQuestion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizPageQuestionState();
  }
}

class QuizPageQuestionState extends State<QuizPageQuestion> {
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("1 + 1 = 2", true),
    new Question("Kamerun liegt in Europa", false),
    new Question("deutschland ist ein schönes Land", true),
    new Question("1 + 1 = 6", false),
    new Question("Flutter is awesome", true),
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();

    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.gestionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            children: <Widget>[
              AnswerButton(true, () => handleAnswer(true)),
              QuestionText(questionText, questionNumber),
              AnswerButton(false, () => handleAnswer(false)),
            ],
          ),
          overlayShouldBeVisible == true
              ? new CorrectWrongOverlay(isCorrect, () {
                  if (quiz.length == questionNumber) {
                    Navigator.of(context).pushAndRemoveUntil(
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new ScorePage(quiz.score, quiz.length)),
                        (Route route) => route == null);
                    return;
                  }
                  currentQuestion = quiz.nextQuestion;
                  this.setState(() {
                    overlayShouldBeVisible = false;
                    questionText = currentQuestion.question;
                    questionNumber = quiz.gestionNumber;
                  });
                })
              : new Container(),
        ],
      ),
    );
  }
}
