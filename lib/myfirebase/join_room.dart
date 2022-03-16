import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirebaseJoinRoom {
  late String code;
  late String name;
  late bool isroomvalid = false;
  FirebaseJoinRoom({required this.code, required this.name});
  Future<String> joinroom() async {
    String res = "unsucessfull";
    print(code);
    await firestore
        .collection('ROOMS')
        .where('code', isEqualTo: code)
        .get()
        .then((value) =>
            value.size == 0 ? isroomvalid = false : isroomvalid = true);

    if (isroomvalid) {
      await firestore
          .collection('ROOMS')
          .doc(code)
          .collection('players')
          .doc(name)
          .set({'name': name, 'isLeader': false});
      res = "success";
      print(res);
      return res;
    } else {
      print(res);
      return res;
    }
  }
}
