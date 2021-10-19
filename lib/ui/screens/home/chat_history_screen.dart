import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/models/list_chat_model.dart';
import 'package:happy_pet/models/message_model.dart';
import 'package:happy_pet/services/message_service.dart';

class ChatHistoryScreen extends StatefulWidget {
  const ChatHistoryScreen({Key? key}) : super(key: key);

  @override
  _ChatHistoryScreenState createState() => _ChatHistoryScreenState();
}

class _ChatHistoryScreenState extends State<ChatHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<List<ListChatModel>>(
          stream: MessageService().getListChat(2),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin / 2),
                  children: snapshot.data!
                      .map((e) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.doctorName ?? "",
                                style: primaryTextStyle,
                              ),
                              StreamBuilder<List<MessageModel>>(
                                  stream: MessageService().getChats(
                                      e.doctorId.toString() +
                                          "_" +
                                          e.userId.toString()),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return snapshot.data!.length > 0
                                          ? Text(snapshot
                                                  .data![
                                                      snapshot.data!.length - 1]
                                                  .message ??
                                              "")
                                          : Text("No message");
                                    } else {
                                      return SizedBox();
                                    }
                                  })
                            ],
                          ))
                      .toList());
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
