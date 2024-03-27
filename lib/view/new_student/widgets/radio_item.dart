import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/enum/enum_pament.dart';

class RadioItem extends StatelessWidget {
  final PaymentEnum? groupValue;
  final void Function(PaymentEnum?)? onChanged;
  final String title;
  final PaymentEnum value;
  const RadioItem(
      {super.key,
      this.groupValue,
      this.onChanged,
      required this.title,
      required this.value});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<PaymentEnum>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(
          title,
          style: AppFontStyle.styleRegular16(context)
              .copyWith(color: AppColors.darkGray),
        ),
      ],
    );
  }
}
