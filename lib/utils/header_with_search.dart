import 'package:flutter/material.dart';
import 'package:sama/constants/app_font_style.dart';
import 'package:sama/utils/custom_search.dart';
import 'package:sama/view/trailing_Dashboard/widgets/trailing_Dashboard_header.dart';

class HeaderWithSearch extends StatelessWidget {
  const HeaderWithSearch({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(
              title,
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
