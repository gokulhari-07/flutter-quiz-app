import 'package:flutter/material.dart';
import 'package:quiz_app/reusable_widgets/custom_text.dart';

class ResultsSummary extends StatelessWidget {
  const ResultsSummary({
    super.key,
    required this.index,
    required this.question,
    required this.correctAnswer,
    required this.chosenAnswer,
  });

  final int index;
  final String question;
  final String correctAnswer;
  final String chosenAnswer;

  @override
  Widget build(BuildContext context) {
    bool correct = correctAnswer == chosenAnswer;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width:3),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: correct ? Colors.green : Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 2,
                    spreadRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: CustomText(text: "${index + 1}", color: Colors.white),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: question,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 3, 36, 93),
                  ),
                  CustomText(
                    text: chosenAnswer,
                    fontWeight: FontWeight.bold,
                    color: correct
                        ? Colors.lightGreen
                        : const Color.fromARGB(255, 236, 126, 119),
                  ),
                  correct
                      ? SizedBox.shrink()
                      : CustomText(
                          text: correctAnswer,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
