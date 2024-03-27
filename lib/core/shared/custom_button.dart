import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text = "null",
    this.colorText,
    this.color,
    this.onPressed,
    this.iconData,
    this.svg,
    this.iconLeft = false,
    this.iconRight = false,
  });

  final String text;
  final Color? colorText;
  final Color? color;
  final void Function()? onPressed;
  final IconData? iconData;
  final Widget? svg;
  final bool iconLeft;
  final bool iconRight;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: 0,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide:
              const BorderSide(color: AppColors.primaryPurple, width: 2)),
      color: color ?? Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 18 * getScaleFactor(context),
            vertical: 18 * getScaleFactor(context)),
        child: Row(
          children: [
            iconLeft
                ? iconData != null
                    ? Padding(
                        padding: EdgeInsets.only(
                            left: !iconLeft ? 12 * getScaleFactor(context) : 0,
                            right: iconLeft ? 12 * getScaleFactor(context) : 0),
                        child: Icon(iconData),
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                            left: !iconLeft ? 12 * getScaleFactor(context) : 0,
                            right: iconLeft ? 12 * getScaleFactor(context) : 0),
                        child: svg ?? const SizedBox(),
                      )
                : const SizedBox(),
            Text(
              text,
              textAlign: TextAlign.center,
              style: AppFontStyle.styleRegular18(context)
                  .copyWith(color: colorText ?? AppColors.textBlack),
            ),
            iconRight
                ? iconData != null && !iconLeft
                    ? Padding(
                        padding: EdgeInsets.only(
                            left: !iconLeft ? 12 * getScaleFactor(context) : 0,
                            right: iconLeft ? 12 * getScaleFactor(context) : 0),
                        child: Icon(iconData),
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                            left: !iconLeft ? 12 * getScaleFactor(context) : 0,
                            right: iconLeft ? 12 * getScaleFactor(context) : 0),
                        child: svg ?? const SizedBox(),
                      )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
