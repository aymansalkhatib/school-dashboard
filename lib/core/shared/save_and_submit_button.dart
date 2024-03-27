import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/shared/custom_button.dart';

class SaveAndSubmitButton extends StatelessWidget {
  const SaveAndSubmitButton(
      {super.key, this.onPressedSubbmit, this.onPressedCancel});
  final void Function()? onPressedSubbmit;
  final void Function()? onPressedCancel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButton(
          text: "Cancel",
          onPressed: onPressedCancel,
        ),
        const SizedBox(width: 24),
        CustomButton(
          text: "Submit",
          color: AppColors.primaryPurple,
          colorText: Colors.white,
          onPressed: onPressedSubbmit,
        ),
      ],
    );
  }
}
