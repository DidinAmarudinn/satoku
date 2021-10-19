import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/models/list_chat_model.dart';
import 'package:happy_pet/services/message_service.dart';

class ItemListChat extends StatelessWidget {
  final ListChatModel listChatModel;
  final String lastChat;
  final String lastTimeChat;
  final int unreadChat;
  const ItemListChat(
      {Key? key,
      required this.listChatModel,
      required this.lastChat,
      required this.unreadChat,
      required this.lastTimeChat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: EdgeInsets.symmetric(horizontal: defaultMargin/2,vertical: defaultMargin/3),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1608255780689-c4ace9fe5798?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=928&q=80"),
              ),
              SizedBox(
                width: defaultMargin / 2,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      listChatModel.doctorName ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: primaryTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    Text(
                      lastChat,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: defaultMargin / 2,
              ),
              Column(
                children: [
                  Text(
                    lastTimeChat,
                    style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: kbackgroundColor2,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: StreamBuilder<int>(
                        stream:MessageService().getUnreadChats( listChatModel.doctorId.toString() +
                                          "_" +
                                          listChatModel.userId.toString()),
                        builder:(context,snapshot)=> Text(
                          snapshot.hasData ? snapshot.data.toString() : "0",
                          style: primaryTextStyle.copyWith(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),

          SizedBox(height:defaultMargin/3,),
          Divider(),
        ],
      ),
    );
  }
}
