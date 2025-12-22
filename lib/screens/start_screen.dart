import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/reusable_widgets/custom_text.dart';
import 'package:quiz_app/reusable_widgets/gradient_scaffold.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/quiz-logo.png",
              height: 350,
              width: 350,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            CustomText(
              text: "Learn Flutter the fun way!",
              color: Colors.white,
              fontSize: 28,
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
               style:OutlinedButton.styleFrom(
                side:const BorderSide(
                  color:Color.fromRGBO(150, 212, 253, 1),
                
                ),
                foregroundColor: Colors.white
              ),
              onPressed: () => context.go("/questions", extra:true), //.go replaces the prvious with this screen
              label: CustomText(text:"Start Quiz"),
              icon: Icon(Icons.arrow_right_alt),
            ),
          ],
        ),
      ),
    );
  }
}
