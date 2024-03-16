import 'package:flutter/material.dart';
import 'package:sama/model/item_card_user_model.dart';
import 'package:sama/core/utils/circle_button_with_border.dart';
import 'package:sama/view/users/widgets/avatar_with_background.dart';
import 'package:sama/view/users/widgets/user_info.dart';

class UserStackWidget extends StatelessWidget {
  const UserStackWidget({
    super.key,
    required this.mask,
    required this.inforations,
    required this.name,
    required this.subtitle,
    required this.constraints,
  });
  final BoxConstraints constraints;
  final String mask;
  final List<ItemCardUserModel> inforations;
  final String name;
  final String subtitle;
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
          child: const CircleButtonWithBorder(
            icon: Icons.admin_panel_settings_outlined,
          ),
        ),
      ],
    );
  }
}
