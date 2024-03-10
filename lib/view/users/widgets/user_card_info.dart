import 'package:flutter/material.dart';
import 'package:sama/model/item_card_user.dart';
import 'package:sama/view/users/widgets/user_stack_widget.dart';

class UserCardInfo extends StatelessWidget {
  const UserCardInfo({
    super.key,
    required this.name,
    required this.mask,
    required this.informations,
    this.aspectRatioP1000 = 400,
  });
  final String name;
  final double aspectRatioP1000;
  final String mask;
  final List<ItemCardUserModel> informations;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1000 / aspectRatioP1000,
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
            isFoundSibTitle: aspectRatioP1000!=400
          ),
        );
      }),
    );
  }
}
