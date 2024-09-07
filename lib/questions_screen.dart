import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onAnswer, {super.key});

  final void Function(String answer) onAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentIndex = 0;

  List<String> userAnswers = [];

  void answerQuestion(String userChoice) {
    setState(() {
      currentIndex++;
    });
    widget.onAnswer(userChoice);
  }

  @override
  Widget build(context) {
    var activeQuestion = questions[currentIndex];

    return Container(
      margin: const EdgeInsets.all(30),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              activeQuestion.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 212, 132, 226),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...activeQuestion.shuffledChoices.map((choice) {
              return AnswerButton(
                label: choice,
                buttonHandler: () {
                  answerQuestion(choice);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
