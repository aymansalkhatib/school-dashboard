import 'package:sama/core/constants/assets.dart';
import 'package:sama/core/enum/navigations_enum.dart';

class DrawerItemModel {
  final String title;
  final String icon;
  final NavigationEnum destination;
  DrawerItemModel(this.destination, {required this.title, required this.icon});
}

List<DrawerItemModel> drawerItem = [
  DrawerItemModel(title: 'Dashboard', icon: Assets.iconsHome, NavigationEnum.Dashboard),
  DrawerItemModel(title: 'Students', icon: Assets.iconsStudent, NavigationEnum.Students),
  DrawerItemModel(title: 'Teachers', icon: Assets.iconsTeacher, NavigationEnum.Teachers),
  // DrawerItemModel(title: 'Event', icon: Assets.iconsCalendar, NavigationEnum.Event),
  // DrawerItemModel(title: 'Finance', icon: Assets.iconsFinance, NavigationEnum.Finance),
  // DrawerItemModel(title: 'Teacher', icon: Assets.iconsTeacher, NavigationEnum.NewTeacher),
  DrawerItemModel(title: 'Classes', icon: Assets.iconsClasses, NavigationEnum.Classes),
  DrawerItemModel(title: 'Users', icon: Assets.iconsUser, NavigationEnum.Users),
  // DrawerItemModel(title: 'Chat', icon: Assets.iconsChat, NavigationEnum.NewStudent),
  // DrawerItemModel(title: 'Lastest Activity', icon: Assets.iconsActivity, NavigationEnum.Lastest),
];
