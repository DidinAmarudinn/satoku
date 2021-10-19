import 'package:happy_pet/constants/assets_path.dart';

class HeaderModel {
  final String name;
  final String imageName;
  HeaderModel(this.name, this.imageName);
}

List<HeaderModel> mockHeader = [
  HeaderModel("Chat With Doctor", kimageChatDoctor),
  HeaderModel("Petshop", kimagePetshop),
  HeaderModel("Book Appointment", kimageBook),
  HeaderModel("Community", kimageCommunity),
];
