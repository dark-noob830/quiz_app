import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> answerSelected = [];
  var activeScreen = 'start-screen';
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void chooseAnswers(String answer) {
    answerSelected.add(answer);
    if (answerSelected.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'start-screen';
    });
    answerSelected = [];
  }

  @override
  Widget build(context) {
    Widget widgetScreen = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      widgetScreen = QuestionScreen(
        onSelectedAnwer: chooseAnswers,
      );
    } else if (activeScreen == 'start-screen') {
      widgetScreen = StartScreen(switchScreen);
    } else if (activeScreen == 'results-screen') {
      widgetScreen =
          ResultsScreen(chosenAnswer: answerSelected, onRestart: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 10, 127),
                Color.fromARGB(255, 92, 21, 147),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: widgetScreen,
        ),
      ),
    );
  }
}
