import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';

//TODO required
class MyPaginations extends StatelessWidget {
  const MyPaginations({
    super.key,
    this.showLength = true,
    this.next,
    this.previous,
    this.index = 1,
    this.length = 3,
    this.maxIndex = 10,
  });
  final bool showLength;
  final int index;
  final int maxIndex;
  final int length;
  final void Function()? next;

  final void Function()? previous;

  @override
  Widget build(BuildContext context) {
    List<String> numActive = [];
    numActive = List.generate(maxIndex + 3, (index) => (index + 1).toString());

    if (maxIndex == 1) {
      int start = min(index, maxIndex - 1);
      numActive = numActive.sublist(start, maxIndex + 1);
    } else {
      int start = max(0, min(index, maxIndex - 2));
      int end = min(maxIndex + 1, start + 3);
      numActive = numActive.sublist(start, end);
    }
    return Row(
      mainAxisAlignment: showLength ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (showLength)
          Flexible(
            flex: 4,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Showing ',
                        style: AppFontStyle.styleRegular16(context).copyWith(color: AppColors.darkGray)),
                    TextSpan(text: '1-5 ', style: AppFontStyle.styleRegular16(context)),
                    TextSpan(
                        text: 'from ',
                        style: AppFontStyle.styleRegular16(context).copyWith(color: AppColors.darkGray)),
                    TextSpan(text: '100 ', style: AppFontStyle.styleRegular16(context)),
                    TextSpan(
                        text: 'data',
                        style: AppFontStyle.styleRegular16(context).copyWith(color: AppColors.darkGray)),
                  ],
                ),
              ),
            ),
          ),
        if (showLength) Flexible(child: SizedBox(width: 120 * getScaleFactor(context))),
        Flexible(
          flex: 5,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: [
                Dropdown(
                  isActive: index == 0,
                  index: index,
                  maxIndex: maxIndex,
                  angle: 22 / 7 / 2,
                  onTap: next ?? () => {},
                ),
                ...List.generate(numActive.length, (index) {
                  bool isActive = (this.index + 1).toString() == numActive[index];

                  return Padding(
                    padding: EdgeInsets.only(right: index < numActive.length ? 6 : 0),
                    child: CircleAvatar(
                      radius: 24 * getScaleFactor(context),
                      backgroundColor: !isActive ? AppColors.darkGray : AppColors.primaryPurple,
                      child: CircleAvatar(
                        radius: 24 * getScaleFactor(context) - 1.7,
                        backgroundColor: isActive ? AppColors.primaryPurple : Colors.white,
                        child: Center(
                          child: Text(
                            numActive[index],
                            style: AppFontStyle.styleMedium18(context).copyWith(
                              color: !isActive ? AppColors.darkGray : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                Dropdown(
                  isActive: index == maxIndex,
                  angle: 22 / 7 / -2,
                  onTap: previous ?? () => {},
                  index: index,
                  maxIndex: maxIndex,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Dropdown extends StatelessWidget {
  const Dropdown({
    super.key,
    required this.angle,
    this.onTap,
    required this.index,
    required this.maxIndex,
    required this.isActive,
  });
  final double angle;
  final int index;
  final int maxIndex;
  final bool isActive;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(
          Assets.iconsDropdown,
          height: 32 * getScaleFactor(context),
          colorFilter:
              ColorFilter.mode(isActive ? AppColors.darkGray : AppColors.primaryPurple, BlendMode.srcIn),
        ),
      ),
    );
  }
}
