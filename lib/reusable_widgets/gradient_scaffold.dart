import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget{
  const GradientScaffold({super.key, required this.child});

  final Widget child;
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height:double.infinity,
        width:double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 1, 68, 122), const Color.fromARGB(255, 49, 158, 247)],
            begin:Alignment.topLeft,
            end:Alignment.bottomRight,
          ),
        ),
        child:child,
      ),
    );
  }
}