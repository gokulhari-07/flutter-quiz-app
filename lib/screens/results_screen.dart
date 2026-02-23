import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/reusable_widgets/custom_text.dart';
import 'package:quiz_app/reusable_widgets/gradient_scaffold.dart';
import 'package:quiz_app/widgets/results_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra;

    if (extra == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go("/");
      });

      return const SizedBox.shrink();
    }

    final chosenAnswers = extra as List<String>; // GoRouter `extra` is seen here as Object?/dynamic, so we 
    //cast it to `List<String>` even though QuestionsScreen sends a List<String>.
    final totalQuestions = questionsData.length;
    final totalCorrectCount = questionsData.asMap().entries.where((entry) {
      final correctAnswer = entry.value.answers[0];
      final userAnswer = chosenAnswers[entry.key];
      return correctAnswer == userAnswer;
    }).length;

    return GradientScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text:
                  "You answered $totalCorrectCount out of $totalQuestions questions correctly!",
              alignment: TextAlign.center,
              color: Colors.white,
              fontSize: 30,
            ),
            const SizedBox(height: 25),

            SizedBox(
              height: 450,
              child: SingleChildScrollView(
                child: Column(
                  children: questionsData
                      .asMap()
                      .entries
                      .map(
                        (entry) => ResultsSummary(
                          question: entry.value.question,
                          correctAnswer: entry.value.answers[0],
                          index: entry.key,
                          chosenAnswer: chosenAnswers[entry.key],
                        ),
                      )
                      .toList(),
                  /*
                          🧠 Step 0 — The Problem
                          You have a list:
                          final list = ['A', 'B', 'C'];
                          You want:
                          value → 'A'
                          index → 0
                          But map() gives only value 👇
                          list.map((item) {
                            // ❌ no index here
                          });
                          
                          So Dart gives us a tool 👉 asMap()
                          
                          🧩 Step 1 — What exactly is asMap()?
                          🔹 List → Map conversion
                          list.asMap()
                          Becomes 👇
                          {
                            0: 'A',
                            1: 'B',
                            2: 'C'
                          }
                          📌 Index becomes the KEY
                          📌 Value stays the VALUE
                          
                          🧩 Step 2 — What is entries?
                          Maps have entries (key–value pairs).
                          list.asMap().entries
                          This gives:
                          [
                            MapEntry(0, 'A'),
                            MapEntry(1, 'B'),
                            MapEntry(2, 'C'),
                          ]
                          Each entry contains:
                          entry.key → index
                          entry.value → item
                          
                          🧩 Step 3 — Using map() on entries
                          Now you can do this:
                          list.asMap().entries.map((entry) {
                            print(entry.key);   // index
                            print(entry.value); // value
                          });
                          */
                ),
              ),
            ),
            const SizedBox(height:20),
            OutlinedButton(
              onPressed: () {
                context.go("/");
              },
              style:OutlinedButton.styleFrom(
                side:const BorderSide(
                  color:Color.fromRGBO(150, 212, 253, 1),
                
                ),
                foregroundColor: Colors.white
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.restart_alt_outlined),
                  const SizedBox(width: 3,),
                  CustomText(text:"Restart Quiz"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
