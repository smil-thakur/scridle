import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scridle/screens/create_room.dart';
import 'package:scridle/screens/join_room.dart';
import 'package:scridle/widgets/mybutton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff11052C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Skridle",
          style: GoogleFonts.handlee(
            fontSize: 30,
          ),
        ),
      ),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(
            color: Colors.blue,
          ),
        ),
        const SizedBox(
          height: 150,
        ),
        Text(
          "Lobby",
          style: GoogleFonts.fredokaOne(
            fontSize: 40,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Create or Join Room",
          style: GoogleFonts.fredokaOne(
            fontSize: 30,
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: "create",
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: const CreateRoom(),
                        type: PageTransitionType.rightToLeft),
                  );
                },
                child: const Mybutton(
                  text: "Create",
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: const JoinRoom(),
                      type: PageTransitionType.rightToLeft),
                );
              },
              child: const Mybutton(
                text: "Join",
              ),
            )
          ],
        ),
        Flexible(
          child: Container(),
          flex: 1,
        ),
      ]),
    );
  }
}
