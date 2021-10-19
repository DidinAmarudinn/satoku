import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/models/doctor_model.dart';
import 'package:happy_pet/services/message_service.dart';
import 'package:happy_pet/ui/components/doctor_tile.dart';
import 'package:happy_pet/ui/components/search_bar.dart';
import 'package:happy_pet/ui/screens/chat_screen.dart';
import 'package:happy_pet/ui/widgets/bottom_dialog_selectconsult.dart';
import 'package:happy_pet/ui/widgets/dialog_info_doctor.dart';

class ListDoctorScreen extends StatefulWidget {
  const ListDoctorScreen({Key? key}) : super(key: key);

  @override
  _ListDoctorScreenState createState() => _ListDoctorScreenState();
}

class _ListDoctorScreenState extends State<ListDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    handleRoomChat(DoctorModel doctorModel) async {
      Map<String, dynamic> chatRoom = {
        "doctorId": 2,
        "doctorImage": "streamCount",
        "doctor_name": "asep sutisna",
        "isEnd": false,
        "userId": 2,
        "userImage": "zzzzzzzz",
        "user_name": "sepuloh"
      };
      await MessageService().createRoomChat(chatRoom, "2_2");
      Get.off(() => ChatScreen(doctorModel: doctorModel));
    }

    Future<void> showDialogBook(DoctorModel doctorModel) async {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogInfoDoctor(
            doctorModel: doctorModel,
            onPressed: () {
              handleRoomChat(doctorModel);
            },
          );
        },
      );
    }

    Future<void> showBottomSheetConsult(DoctorModel doctorModel) async {
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8),
            ),
          ),
          context: context,
          builder: (BuildContext context) {
            return BottomDialogSelectConsult(
              onTapNow: () {
                Get.back();
                showDialogBook(doctorModel);
              },
              onTapBook: () {},
            );
          });
    }

    _header() {
      return Padding(
        padding: EdgeInsets.fromLTRB(
            defaultMargin, defaultMargin, defaultMargin, defaultMargin / 2),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Choose a doctor and consult your problem",
                  style: primaryTextStyle.copyWith(
                      fontSize: 20, fontWeight: semiBold),
                ),
              ),
              SizedBox(
                width: defaultMargin / 2,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: kbgbutton1,
                    width: 3,
                  ),
                ),
                child: Center(
                    child: Icon(
                  Icons.person,
                  color: kbgbutton1,
                )),
              )
            ],
          ),
          SizedBox(
            height: defaultMargin / 2,
          ),
          SearchBar(),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: kbackgroundColor2,
      body: SafeArea(
          child: Column(
        children: [
          _header(),
          Expanded(
            child: ListView.builder(
                itemCount: mockDoctorModel.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showBottomSheetConsult(mockDoctorModel[index]);
                    },
                    child: DoctorTile(
                      doctorModel: mockDoctorModel[index],
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
