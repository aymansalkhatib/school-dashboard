import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';

class TitleWithMonth extends StatelessWidget {
  const TitleWithMonth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "School Calendar",
          style: AppFontStyle.styleBold24(context).copyWith(fontSize: 24 * getScaleFactor(context)),
        ),
        SizedBox(width: 20 * getScaleFactor(context)),
        Row(
          children: [
            Text(
              "March 2021",
              style: AppFontStyle.styleRegular18(context).copyWith(fontSize: 18 * getScaleFactor(context)),
            ),
            const SizedBox(width: 3),
            Transform.rotate(
                angle: 22 / 7 * 2,
                child: SvgPicture.asset(
                  Assets.iconsDropdown,
                  width: 26 * getScaleFactor(context),
                ))
          ],
        ),
      ],
    );
  }
}
