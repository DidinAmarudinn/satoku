import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/models/doctor_model.dart';
import 'package:happy_pet/models/message_model.dart';
import 'package:happy_pet/services/message_service.dart';
import 'package:happy_pet/ui/components/chat_input.dart';
import 'package:happy_pet/ui/widgets/chat_bubble.dart';
import 'package:happy_pet/ui/widgets/dialog_end_chat.dart';
import 'package:happy_pet/ui/widgets/dialog_feedback.dart';
import 'package:happy_pet/ui/widgets/dialog_thankyou.dart';
import 'package:happy_pet/ui/widgets/header_chat_screen.dart';

class ChatScreen extends StatefulWidget {
  final DoctorModel doctorModel;
  const ChatScreen({Key? key, required this.doctorModel}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    MessageService().seeMsg("1_2");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    handleSendMessage(
        bool isFromUSer, String messageText, DateTime time) async {
      Map<String, dynamic> mapMessage = {
        "isFromUser": isFromUSer,
        "isRead": false,
        "messageText": messageText,
        "sendAt": time.toString()
      };

      await MessageService().sendChat(mapMessage, "1_2");
      setState(() {
        textEditingController.clear();
      });
    }

    Future<void> showDialogThank() async {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return DialogThankyou();
          });
    }

    Future<void> showDialogFeedBack() async {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return DialogFeedback(
              doctorModel: widget.doctorModel,
              onSubmit: () {
                Get.back();
                showDialogThank();
              },
            );
          });
    }

    Future<void> showDialogEnd() async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return DialogEndChat(
            openFeedback: () {
              Get.back();
              showDialogFeedBack();
            },
            onClose: () {
              Get.back();
            },
          );
        },
      );
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultMargin / 2, vertical: defaultMargin / 3),
        child: Row(
          children: [
            Expanded(
                child: ChatInput(
              textEditingController: textEditingController,
            )),
            Padding(
              padding: EdgeInsets.only(left: defaultMargin / 2),
              child: TextButton(
                onPressed: () async {
                  if (textEditingController.text.isNotEmpty) {
                    DateTime time = DateTime.now();
                    handleSendMessage(false, textEditingController.text, time);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Type a message")));
                  }
                },
                child: Container(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Icon(
                      Icons.mic,
                      size: 30,
                    ),
                  ),
                  decoration:
                      BoxDecoration(color: kbgbutton2, shape: BoxShape.circle),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            HeaderChatScreen(
                onpressed: () {
                  showDialogEnd();
                },
                namaDokter: widget.doctorModel.name ?? "",
                imageName: widget.doctorModel.imageName!),
            Expanded(
              child: Container(
                color: kbackgroundColor1,
                child: StreamBuilder<List<MessageModel>>(
                    stream: MessageService().getChats("1_2"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultMargin,
                          ),
                          children: snapshot.data!.map((e) {
                            return ChatBubble(
                                isSender: e.isFromUser ?? true,
                                text: e.message ?? "");
                          }).toList(),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
