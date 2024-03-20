import 'package:flutter/material.dart';
import 'package:sama/view/users_details/widgets/list_user_pagination.dart';
import 'package:sama/view/users_details/widgets/permissions.dart';

class UsersAndPremissions extends StatelessWidget {
  const UsersAndPremissions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: ListUserPagination()),
        SizedBox(width: 40),
        Expanded(child: Permissions()),
      ],
    );
  }
}
