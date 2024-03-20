import 'package:flutter/material.dart';
import 'package:sama/model/item_card_user_model.dart';
import 'package:sama/view/users_details/widgets/user_item_card.dart';

class RowInfo extends StatelessWidget {
  const RowInfo({
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
                padding: EdgeInsets.only(
                  right: index != inforamtions.length - 1 ? 24 : 0,
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
