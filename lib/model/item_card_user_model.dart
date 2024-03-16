import 'package:sama/core/constants/assets.dart';

class ItemCardUserModel {
  final String title;
  final String icon;
  final String body;

  ItemCardUserModel({required this.title, required this.icon, required this.body});
}

List<ItemCardUserModel> itemCardUserModel = [
  ItemCardUserModel(title: "Location", icon: Assets.iconsLocation, body: "Damascuse,Arbin"),
  // ItemCardUserModel(title: "Location", icon: Assets.iconsLocation, body: "Damascuse,Arbin"),
  ItemCardUserModel(title: "Phone", icon: Assets.iconsCall, body: "+963968381625"),
  ItemCardUserModel(title: "Email", icon: Assets.iconsEmail, body: "ayman@gmail.com"),
];
