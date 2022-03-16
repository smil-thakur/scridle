import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class GetUsers extends StatefulWidget {
  late String code;
  GetUsers({Key? key, required this.code}) : super(key: key);

  @override
  State<GetUsers> createState() => _GetUsersState();
}

class _GetUsersState extends State<GetUsers> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> playerlist = FirebaseFirestore.instance
        .collection('ROOMS')
        .doc(widget.code)
        .collection('players')
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: playerlist,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['name']),
              subtitle: Text(data['isLeader'].toString()),
            );
          }).toList(),
        );
      },
    );
  }
}
