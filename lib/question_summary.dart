import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((e) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: e['is_correct'] as bool
                      ? const Color.fromARGB(255, 23, 166, 154)
                      : const Color.fromARGB(255, 229, 71, 161),
                  child: Center(
                    child: Text(
                      ((e['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e['question_text'] as String,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        e['user_answer'] as String,
                        style: GoogleFonts.lato(
                          color: e['is_correct'] as bool
                              ? const Color.fromARGB(255, 23, 166, 154)
                              : const Color.fromARGB(255, 229, 71, 161),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        e['correct_answer'] as String,
                        style: GoogleFonts.lato(
                          color: e['is_correct'] as bool
                              ? const Color.fromARGB(255, 23, 166, 154)
                              : const Color.fromARGB(255, 229, 71, 161),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
