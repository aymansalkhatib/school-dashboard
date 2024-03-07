import 'package:flutter/material.dart';
import 'package:sama/view/users/widgets/user_header.dart';
import 'package:sama/view/users/widgets/user_card_info.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
          UsersHeader(),
          SizedBox(height: 40),
          UserCardInfo(),
        ],
      ),
    );
  }
}
