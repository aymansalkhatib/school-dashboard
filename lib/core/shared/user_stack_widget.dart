import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/view_student_controller.dart';
import 'package:sama/model/item_card_user_model.dart';
import 'package:sama/core/utils/circle_button_with_border.dart';
import 'package:sama/view/users_details/widgets/avatar_with_background.dart';
import 'package:sama/view/users_details/widgets/user_info.dart';

class UserStackWidget extends GetView<ViewStudentController> {
  const UserStackWidget({
    super.key,
    required this.mask,
    required this.inforations,
    required this.name,
    required this.subtitle,
    required this.imageDefault,
    required this.constraints,
    this.image,
  });
  final BoxConstraints constraints;
  final String mask;
  final List<ItemCardUserModel> inforations;
  final String name;
  final String imageDefault;
  final String subtitle;
  final String? image;
  @override
  Widget build(BuildContext context) {
    double top = 32 * MediaQuery.sizeOf(context).width / 1700;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        AvatarWithBackground(height: constraints.maxHeight / 3, mask: mask),
        Positioned(
          top: constraints.maxHeight / 3,
          child: UserInfo(
            constraints: constraints,
            inforamtions: inforations,
            name: name,
            subtitle: subtitle,
          ),
        ),
        Positioned(
          top: top,
          left: top,
          child: CircleButtonWithBorder(
            image: image,
            imageDefault: imageDefault,
          ),
        ),
      ],
    );
  }
}
