import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mybutton extends StatelessWidget {
  final String text;
  final double myheight;
  final double mywidth;
  const Mybutton(
      {Key? key, required this.text, this.myheight = 50, this.mywidth = 150})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.mali(fontSize: 20),
        ),
      ),
      height: myheight,
      width: mywidth,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
