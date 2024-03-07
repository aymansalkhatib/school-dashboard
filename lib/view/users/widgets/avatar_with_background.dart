import 'package:flutter/material.dart';
import 'package:sama/constants/app_colors.dart';
import 'package:sama/constants/app_font_style.dart';
import 'package:sama/constants/assets.dart';

class AvatarWithBackground extends StatelessWidget {
  const AvatarWithBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 32, top: 32, right: 32),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.primaryPurple,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                Assets.imagesMasking,
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 164 * getScaleFactor(context),
                  height: 164 * getScaleFactor(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Container(
                      width: 164 * getScaleFactor(context) - 10,
                      height: 164 * getScaleFactor(context) - 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.lightBlue,
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }
}
