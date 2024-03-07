import 'package:flutter/material.dart';
import 'package:sama/view/users/widgets/user_stack_widget.dart';

class UserCardInfo extends StatelessWidget {
  const UserCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1000 / 400,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
          ),
          child: UserStackWidget(constraints: constraints),
        );
      }),
    );
  }
}
