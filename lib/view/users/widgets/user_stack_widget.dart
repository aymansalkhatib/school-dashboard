import 'package:flutter/material.dart';
import 'package:sama/view/users/widgets/avatar_user.dart';
import 'package:sama/view/users/widgets/avatar_with_background.dart';

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
        AvatarWithBackground(
          height: constraints.maxHeight / 3,
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
