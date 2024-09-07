import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  String screenName = 'start-screen';
  List<String> userAnswers = [];

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      screenName = 'quiz-screen';
    });
  }

  void onAnswer(String choice) {
    userAnswers.add(choice);
    if (userAnswers.length == questions.length) {
      setState(() {
        screenName = 'results-screen';
      });
    }
  }

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < userAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].choices[0],
        'user_answer': userAnswers[i]
      });
    }
    return summaryData;
  }

  @override
  Widget build(context) {
    Widget? activeScreen = StartScreen(switchScreen);

    void restartQuiz() {
      setState(() {
        userAnswers = [];
        screenName = 'quiz-screen';
      });
    }

    if (screenName == 'quiz-screen') {
      activeScreen = QuestionsScreen(onAnswer);
    } else if (screenName == 'results-screen') {
      activeScreen = ResultsScreen(
        summaryData: summaryData,
        restartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 85, 20, 198),
                Color.fromARGB(255, 104, 16, 155),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
