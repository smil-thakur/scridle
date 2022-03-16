import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scridle/myfirebase/create_room_methods.dart';
import 'package:scridle/mymodels/myplayers.dart';
import 'package:scridle/screens/paint_screen.dart';
import 'package:scridle/utils/colors.dart';
import 'package:scridle/widgets/MyTextField.dart';
import 'package:scridle/widgets/my_appbar.dart';
import 'package:scridle/widgets/mybutton.dart';

class CreateRoom extends StatefulWidget {
  const CreateRoom({Key? key}) : super(key: key);

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _roomcontroller = TextEditingController();
  String myroomsize = "2";
  String roomSize() {
    if (myroomsize == "16") {
      myroomsize = "2";
    } else {
      myroomsize = (int.parse(myroomsize) + 2).toString();
    }
    return myroomsize;
  }

  String myround = "4";
  String roundSize() {
    if (myround == "15") {
      myround = "4";
    } else {
      myround = (int.parse(myround) + 1).toString();
    }
    return myround;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(backgroundcolor),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Myappbar(heading: "Create Room"),
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
                "Enter Room Number",
                style: GoogleFonts.fredokaOne(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            MyTextField(
                nameController: _roomcontroller,
                myhintText: "Enter Room Number"),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Center(
                      child: Text(
                        "Max Room Size",
                        style: GoogleFonts.fredokaOne(fontSize: 15),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        setState(() {
                          roomSize();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Mybutton(
                          text: myroomsize,
                          mywidth: 90,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Center(
                      child: Text(
                        "Max no. of rounds",
                        style: GoogleFonts.fredokaOne(fontSize: 15),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        setState(() {
                          roundSize();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Mybutton(
                          text: myround,
                          mywidth: 90,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () async {
                Myplayers _playerhere =
                    Myplayers(name: _namecontroller.text, isleader: true);
                FirebaseCreateRoom _createhere = FirebaseCreateRoom(
                    code: _roomcontroller.text, player: _playerhere);
                if (_namecontroller.text.isNotEmpty &&
                    _roomcontroller.text.isNotEmpty) {
                  _createhere.createRoom();
                  _createhere.registerPlayer();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaintScreen(
                                code: _roomcontroller.text,
                              )));
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Mybutton(
                  text: "Create",
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
