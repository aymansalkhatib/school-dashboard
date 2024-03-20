import 'package:flutter/material.dart';
import 'package:sama/model/item_card_user_model.dart';
import 'package:sama/view/users_details/widgets/user_stack_widget.dart';

class UserCardInfo extends StatelessWidget {
  const UserCardInfo({
    super.key,
    required this.name,
    required this.mask,
    required this.informations,
  });
  final String name;
  final String mask;
  final List<ItemCardUserModel> informations;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1000 / 415,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: UserStackWidget(
            constraints: constraints,
            mask: mask,
            inforations: informations,
            name: name,
            subtitle: "admin",
          ),
        );
      }),
    );
  }
}
