import 'package:cloud_firestore/cloud_firestore.dart';

class TokenService {
  Future<void> saveTokenUser(chatRoom, String userID) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(userID)
        .set(chatRoom)
        .then((value) {
      print("success save tokens");
    }).catchError((e) {
      print(e);
    });
  }
}
