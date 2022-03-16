import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Myappbar extends StatelessWidget {
  const Myappbar({Key? key, required this.heading}) : super(key: key);
  final String heading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        heading,
        style: GoogleFonts.handlee(
          fontSize: 30,
        ),
      ),
    );
  }
}
