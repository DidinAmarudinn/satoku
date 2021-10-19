class MessageModel {
  String? message;
  bool? isRead;
  String? sendAt;
  bool? isFromUser;

  MessageModel({this.message, this.isRead, this.isFromUser, this.sendAt});

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['messageText'];
    sendAt = json['sendAt'];
    isRead = json['isRead'];
    isFromUser = json['isFromUser'];
  }

  Map<String, dynamic> toJson() {
    return {
      'messageText': message,
      "sendAt": sendAt,
      "isRead": isRead,
      "isFromUser": isFromUser
    };
  }
}
