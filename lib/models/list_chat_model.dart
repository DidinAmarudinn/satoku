class ListChatModel {
  int? doctorId;
  String? doctorImage;
  String? doctorName;
  int? userId;
  String? userName;
  String? userImage;
  bool? isEnd;

  ListChatModel(
      {this.doctorId,
      this.doctorImage,
      this.doctorName,
      this.userImage,
      this.userId,
      this.userName,
      this.isEnd});

  ListChatModel.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctorId'];
    doctorImage = json['doctorImage'];
    doctorName = json['doctor_name'];
    isEnd = json['isEnd'];
    userId = json['userId'];
    userName = json['user_name'];
    userImage = json['userImage'];
  }

  Map<String, dynamic> toJson() {
    return {
      "doctorId": doctorId,
      "doctorImage": doctorImage,
      "doctor_name": doctorName,
      "isEnd": isEnd,
      "userId": userId,
      "user_name": userName,
      "userImage": userImage
    };
  }
}
