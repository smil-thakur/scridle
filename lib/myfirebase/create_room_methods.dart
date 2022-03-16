import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scridle/mymodels/myplayers.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirebaseCreateRoom {
  late String code;
  late Myplayers player;
  FirebaseCreateRoom({required this.code, required this.player});
  CollectionReference rooms = FirebaseFirestore.instance.collection('ROOMS');
  List<Myplayers> listofplayer = [];

  Future<void> createRoom() {
    listofplayer.add(player);
    return rooms
        .doc(code)
        .set({'rounds': "2", 'size': "size", 'code': code})
        .then((value) => print("room added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> registerPlayer() {
    return rooms
        .doc(code)
        .collection('players')
        .doc(player.name)
        .set({'name': player.name, 'isLeader': player.isleader});
  }
}
