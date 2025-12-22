import 'package:quiz_app/models/questions_model.dart';

const questionsData = [
  QuestionsModel(
    question: "What are the main building blocks of Flutter UIs?",
    answers: ["Widgets", "Components", "Blocks", "Functions"],
  ),
  QuestionsModel(
    question: "Which language is used to write Flutter apps?",
    answers: ["Dart", "Java", "Kotlin", "Javascript"],
  ),
  QuestionsModel(
    question:
        'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    answers: [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuestionsModel(
    question: 'What happens if you change data in a StatelessWidget?',
    answers: [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuestionsModel(
    question: 'How should you update data inside of StatefulWidgets?',
    answers: [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
];
