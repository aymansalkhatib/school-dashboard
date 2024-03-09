import 'package:flutter/material.dart';
import 'package:sama/constants/app_font_style.dart';
import 'package:sama/utils/custom_search.dart';
import 'package:sama/view/trailing_dashboard/widgets/trailing_dashboard_header.dart';

class TeacherHeaderWithSearch extends StatelessWidget {
  const TeacherHeaderWithSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "Teacher Details",
              style: AppFontStyle.styleBold36(context),
            ),
          ),
        ),
        const Spacer(),
        const Expanded(child: CustomSearch()),
        const SizedBox(width: 50),
        const Expanded(
            child: TrailingDashboardHeader(
          colorCircle: Colors.white,
        )),
      ],
    );
  }
}
