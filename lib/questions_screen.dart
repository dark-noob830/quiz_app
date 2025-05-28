import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectedAnwer});

  final void Function(String answer) onSelectedAnwer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var indexCurrentQuestion = 0;

  void answerQuestion(String answer) {
    widget.onSelectedAnwer(answer);
    setState(() {
      indexCurrentQuestion++;
    });
  }

  @override
  Widget build(context) {
    final currentQuizQuestion = questions[indexCurrentQuestion];
    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuizQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 182, 159, 225),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 22,
            ),
            ...currentQuizQuestion.getShuffleAnswer().map((e) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnswerButton(e, () {
                  answerQuestion(e);
                }),
              );
            }),
          ],
        ),
      ),
    );
  }
}
