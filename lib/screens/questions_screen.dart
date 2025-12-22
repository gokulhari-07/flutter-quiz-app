import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/reusable_widgets/custom_text.dart';
import 'package:quiz_app/reusable_widgets/gradient_scaffold.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQueNumber = 0;
  List<String> chosenAnswers = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) { //.addPostFrameCallback will be executed only after the current screen finishes building ie; after build method of this screen got executed. code running order: initState()>> build()>>layout>> paint>> post-frame callback
      /*
      WidgetsBinding.instance:
        Think of it as Flutter's engine controller. 
        It manages:
        build phases
        layout
        paint
        frame scheduling
        You normally don’t touch it, except for cases like this.
      */
      final extra = GoRouterState.of(context).extra;//.extra is the data passed during navigation.
      // 👇 if opened directly or refreshed
      if (extra == null) {
        context.go("/");
      }
      //Overall logic behind the above code:-
      //After the screen finishes rendering:
      //If this screen was opened without proper navigation data:
      //Kick the user back to the start screen

    });
  }

  void answerButtonAction(String answer) {
//🔹 What is State in Flutter?
// State = data that can change over time and affects what the UI shows.
// That’s it.
// 🧠 One-line definition (remember this)
// 👉 If changing a value should change the UI, that value is STATE.
// eg:  int currentQueNumber = 0; is a state , when it changes, the question on screen changes.
// final currentQuestion = questionsData[currentQueNumber]; This is not a state. Its derived from a state. Can be recalculated anytime. Does not change by itself.

    if (currentQueNumber == questionsData.length - 1) {
      return context.go("/results", extra: [...chosenAnswers, answer]);
    }
     setState(() {
      chosenAnswers=[...chosenAnswers, answer]; //chosenAnswers is STATE. Any change to state must be inside setState so Flutter knows to rebuild when needed (now or in future). (as of now it might not give much sense but in future code expansion, its needed to avoid unnecssary bugs and according to flutter rule this is better)
      //reason y i didnt use .add method to add answers to the chosenAnswers list:
      //.add() changes the same list in memory (mutation).
      //Creating a new list replaces the state, which is safer, predictable, and future-proof.
      //Therefore replace lists instead of mutating them to avoid hidden bugs.
      //🧠Simple rule to remember: If it’s state: don’t mutate it, replace it — and do it inside setState.
      currentQueNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questionsData[currentQueNumber];
    /*reason behind y currentQuestion kept inside the build:
 Short answer (core idea):
      currentQuestion is derived UI data, so it belongs inside build()

Long answer (very important)
🔑 Flutter rule you must remember:

Only store STATE as fields.
Derived values go inside build().

What is STATE in your screen?
int currentQueNumber = 0;


✔ This is state
✔ It changes over time
✔ It triggers rebuilds

What is currentQuestion?
final currentQuestion = questionsData[currentQueNumber];


❌ NOT state
✔ It is derived from state
✔ It can be recalculated anytime
✔ It does not change independently

So it must not be stored as a class variable.
    */
    return GradientScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text:currentQuestion.question, color:Colors.white, fontSize: 25, fontWeight: FontWeight.w900 , alignment: TextAlign.center,),
            const SizedBox(height:10),
            ...currentQuestion.getShuffledAnswers().map(
              (answer) => Padding(
                padding: const EdgeInsets.symmetric(vertical:3.0),
                child: OutlinedButton(
                  style:OutlinedButton.styleFrom(
                    side:const BorderSide(
                  color: Color.fromARGB(255, 1, 53, 95)
                
                ),
                  padding: EdgeInsets.symmetric(horizontal:40, vertical:10),  
                  backgroundColor: const Color.fromARGB(255, 1, 53, 95)
                ),
                  onPressed: () {
                    answerButtonAction(answer);
                  },
                  child: CustomText(text:answer, color:Colors.white, fontWeight: FontWeight.w900,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
