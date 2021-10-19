import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:happy_pet/models/list_chat_model.dart';
import 'package:happy_pet/models/message_model.dart';

class MessageService {
  Future<void> createRoomChat(chatRoom, String userIDdoctorID) async {
    FirebaseFirestore.instance
        .collection("messages")
        .doc(userIDdoctorID)
        .set(chatRoom)
        .then((value) {
      print("success create roomchat");
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> sendChat(mapMessage, String userIDdoctorID) async {
    FirebaseFirestore.instance
        .collection("messages")
        .doc(userIDdoctorID)
        .collection("messages")
        .doc()
        .set(mapMessage)
        .then((value) {
      print("success send message");
    }).catchError((e) {
      print(e);
    });
  }

  Stream<List<MessageModel>> getChats(String chatRoomId) {
    try {
      return FirebaseFirestore.instance
          .collection("messages")
          .doc(chatRoomId)
          .collection("messages")
          .orderBy(
            'sendAt',
          )
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());
          return MessageModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();

        result.sort(
          (MessageModel a, MessageModel b) => a.sendAt!.compareTo(b.sendAt!),
        );
        seeMsg(chatRoomId);
     return result;
      });
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
  Stream<List<MessageModel>> getLastChat(String chatRoomId) {
    try {
      return FirebaseFirestore.instance
          .collection("messages")
          .doc(chatRoomId)
          .collection("messages")
          .orderBy(
            'sendAt',
          )
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());
          return MessageModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();

        result.sort(
          (MessageModel a, MessageModel b) => a.sendAt!.compareTo(b.sendAt!),
        );
     return result;
      });
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<void> seeMsg(String chatRoomId) async{
     final query = await FirebaseFirestore.instance
        .collection('messages')
        .doc(chatRoomId)
        .collection('messages')
        .where('isRead', isEqualTo: false)
        .get();

    query.docs.forEach((doc) {
      doc.reference.update({'isRead': true});
    });
}

  Stream<List<ListChatModel>> getListChat(int userId) {
    try {
      return FirebaseFirestore.instance
          .collection("messages")
          .where("userId", isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<ListChatModel>((DocumentSnapshot message) {
          print(message.data());
          return ListChatModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();
        print(result[0].userImage);
        return result;
      });
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
  

  Stream<int> getUnreadChats(String chatRoomId) {
    try {
      return FirebaseFirestore.instance
          .collection("messages")
          .doc(chatRoomId)
          .collection("messages").where("isRead", isEqualTo: false)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());
          return MessageModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();

       

        return result.length;
      });
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
