import 'package:flutter/material.dart';
import 'package:sama/view/users/widgets/avatar_with_background.dart';
import 'package:sama/view/users/widgets/user_info.dart';

class UserCardInfo extends StatelessWidget {
  const UserCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1000 / 400,
      child: Column(
        children: [
          Expanded(child: AvatarWithBackground()),
          Expanded(flex: 2, child: UserInfo()),
        ],
      ),
    );
  }
}
