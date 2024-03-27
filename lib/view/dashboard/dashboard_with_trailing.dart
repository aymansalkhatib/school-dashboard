import 'package:flutter/material.dart';
import 'package:sama/view/Dashboard/Dashboard_view.dart';
import 'package:sama/core/utils/header_with_search.dart';
import 'package:sama/view/trailing_teacher/trailing_teacher.dart';

class DashboardWithTrailing extends StatelessWidget {
  const DashboardWithTrailing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 28),
                child: HeaderWithSearch(title: "Dashboard"),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 1180, child: Dashboard()),
                  Expanded(flex: 395, child: TrailingTeacher()),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
