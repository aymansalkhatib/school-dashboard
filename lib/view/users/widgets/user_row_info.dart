import 'package:flutter/material.dart';
import 'package:sama/model/item_card_user.dart';
import 'package:sama/view/users/widgets/user_item_card.dart';

class UserRowInfo extends StatelessWidget {
  const UserRowInfo({
    super.key,
    required this.inforamtions,
  });

  final List<ItemCardUserModel> inforamtions;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ...List.generate(
          inforamtions.length,
          (index) => Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: index != inforamtions.length - 1 ? 12 : 0,
                ),
                child: UserItemCard(
                  itemCardUserModel: inforamtions[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
