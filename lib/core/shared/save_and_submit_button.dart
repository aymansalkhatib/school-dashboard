import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/shared/custom_button.dart';

class SaveAndSubmitButton extends StatelessWidget {
  const SaveAndSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButton(
          text: "Save as Draft",
          onPressed: () {},
        ),
        const SizedBox(width: 24),
        CustomButton(
          text: "Submit",
          color: AppColors.primaryPurple,
          colorText: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }
}
