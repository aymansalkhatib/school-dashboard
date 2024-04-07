import 'package:flutter/material.dart';
import 'package:sama/core/shared/user_stack_widget.dart';
import 'package:sama/model/item_card_user_model.dart';

class UserCardInfo extends StatelessWidget {
  const UserCardInfo({
    super.key,
    required this.name,
    this.image,
    required this.mask,
    required this.informations,
    required this.imageDefault,
  });
  final String name;
  final String imageDefault;
  final String? image;
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
              imageDefault: imageDefault,
              constraints: constraints,
              mask: mask,
              inforations: informations,
              name: name,
              subtitle: "admin",
              image: image),
        );
      }),
    );
  }
}
