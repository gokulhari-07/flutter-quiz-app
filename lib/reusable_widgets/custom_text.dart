import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/* 
While creating reusable widgets, instead of creating helper fns, creating class tht extends statelesswidgets are better bcz it can optimized by giving const to its constructor fn.
Rule of thumb:
If it returns a Widget and is reused → make it a Widget class, not a function.
*/
class CustomText extends StatelessWidget { 
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.alignment,
    this.fontWeight,
  });

  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? alignment;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: alignment,
    );
  }
}
