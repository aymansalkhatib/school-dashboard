import 'package:flutter/material.dart';
import 'package:sama/view/users/widgets/avatar_user.dart';
import 'package:sama/view/users/widgets/avatar_with_background.dart';
import 'package:sama/view/users/widgets/user_info.dart';

class UserStackWidget extends StatelessWidget {
  const UserStackWidget({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AvatarWithBackground(constraints: constraints),
        Positioned(
          top: constraints.maxHeight / 3,
          child: UserInfo(constraints: constraints),
        ),
        const Positioned(
          top: 30,
          left: 32,
          child: AvatarUser(),
        ),
      ],
    );
  }
}
