import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';
import 'package:sama/model/item_card_user_model.dart';
import 'package:sama/view/users/widgets/user_header.dart';
import 'package:sama/view/users/widgets/user_card_info.dart';
import 'package:sama/view/users/widgets/users_and_premissions.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const UsersHeader(),
          const SizedBox(height: 28),
          UserCardInfo(
            informations: itemCardUserModel,
            mask: Assets.imagesMasking,
            name: "Nabila Azalea",
          ),
          const SizedBox(height: 40),
          const Spacer(),
          const UsersAndPremissions(),
        ],
      ),
    );
  }
}
