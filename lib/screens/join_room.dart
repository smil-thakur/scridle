import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scridle/myfirebase/join_room.dart';
import 'package:scridle/screens/paint_screen.dart';
import 'package:scridle/utils/colors.dart';
import 'package:scridle/widgets/MyTextField.dart';
import 'package:scridle/widgets/my_appbar.dart';
import 'package:scridle/widgets/mybutton.dart';

class JoinRoom extends StatefulWidget {
  const JoinRoom({Key? key}) : super(key: key);

  @override
  State<JoinRoom> createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _roomcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(backgroundcolor),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Myappbar(heading: "Join Room"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Center(
              child: Text(
                "Enter your Name",
                style: GoogleFonts.fredokaOne(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            MyTextField(
                nameController: _namecontroller, myhintText: "Enter Your Name"),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Enter Room Code",
                style: GoogleFonts.fredokaOne(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            MyTextField(
                nameController: _roomcontroller, myhintText: "Enter Room Code"),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () async {
                FirebaseJoinRoom _joinhere = FirebaseJoinRoom(
                    code: _roomcontroller.text, name: _namecontroller.text);
                String res = await _joinhere.joinroom();
                if (res == "success") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PaintScreen(code: _roomcontroller.text)));
                } else {
                  print(res);
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Mybutton(
                  text: "Join",
                  mywidth: 130,
                ),
              ),
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
