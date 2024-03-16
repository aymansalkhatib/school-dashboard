import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/view/trailing_classes/widgets/details_sections.dart';

class TrailingClasses extends StatelessWidget {
  const TrailingClasses({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40 * getScaleFactor(context)),
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Details", style: AppFontStyle.styleBold32(context)),
          const SizedBox(height: 8),
          ...List.generate(
              5,
              (index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: DetailsSections(),
                  ))
        ],
      ),
    );
  }
}
