import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';

class ContactStudent extends StatelessWidget {
  const ContactStudent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 44 * getScaleFactor(context),
          height: 44 * getScaleFactor(context),
          decoration: const BoxDecoration(color: Color(0xffEDECF8), shape: BoxShape.circle),
          child: Padding(
            padding: EdgeInsets.all(9 * getScaleFactor(context)),
            child: SvgPicture.asset(Assets.iconsCall),
          ),
        ),
        SizedBox(width: 16 * getScaleFactor(context)),
        Container(
          width: 44 * getScaleFactor(context),
          height: 44 * getScaleFactor(context),
          decoration: const BoxDecoration(color: Color(0xffEDECF8), shape: BoxShape.circle),
          child: Padding(
            padding: EdgeInsets.all(9 * getScaleFactor(context)),
            child: SvgPicture.asset(Assets.iconsEmail),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
