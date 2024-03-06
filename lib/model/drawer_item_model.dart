import 'package:sama/constants/assets.dart';

class DrawerItemModel {
  final String title;
  final String icon;

  DrawerItemModel({required this.title, required this.icon});
}

List<DrawerItemModel> drawerItem = [
  DrawerItemModel(title: 'Dashboard', icon: Assets.iconsHome),
  DrawerItemModel(title: 'Students', icon: Assets.iconsStudent),
  DrawerItemModel(title: 'Teachers', icon: Assets.iconsTeacher),
  DrawerItemModel(title: 'Event', icon: Assets.iconsCalendar),
  DrawerItemModel(title: 'Finance', icon: Assets.iconsFinance),
  DrawerItemModel(title: 'Food', icon: Assets.iconsFood),
  DrawerItemModel(title: 'User', icon: Assets.iconsUser),
  DrawerItemModel(title: 'Chat', icon: Assets.iconsChat),
  DrawerItemModel(title: 'Lastest Activity', icon: Assets.iconsActivity),
];
