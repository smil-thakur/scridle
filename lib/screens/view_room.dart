import 'package:flutter/material.dart';
import 'package:scridle/utils/colors.dart';
import '../widgets/my_appbar.dart';

class ViewRoom extends StatefulWidget {
  final String title;
  // const ViewRoom({Key? key, required this.title}) : super(key: key);

  ViewRoom({
    required this.title,
  });

  @override
  State<ViewRoom> createState() => _ViewRoomState();
}

class _ViewRoomState extends State<ViewRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(backgroundcolor),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Myappbar(heading: "Room"),
      ),
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(color: Colors.blue),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(4.0),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: [
                buildListTile(title: "Smil"),
                buildListTile(title: "Casa"),
                buildListTile(title: "Bieber"),
                buildListTile(title: "Bsdk"),
                buildListTile(title: "Bsdk"),
                buildListTile(title: "Bsdk"),
                buildListTile(title: "Bsdk"),
                buildListTile(title: "Bsdk"),
                buildListTile(title: "Smil"),
                buildListTile(title: "Casa"),
                buildListTile(title: "Bieber"),
                buildListTile(title: "Bsdk"),
                buildListTile(title: "Bsdk"),
                buildListTile(title: "Bsdk"),
                buildListTile(title: "Bsdk"),
                buildListTile(title: "Bsdk"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile({
    required String title,
  }) =>
      ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(
            title[0].toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      );
// }
}
