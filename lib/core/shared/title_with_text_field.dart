import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/shared/custom_text_from_feild.dart';

class TitleWithTextField extends StatelessWidget {
  const TitleWithTextField({
    super.key,
    required this.hint,
    required this.title,
    this.maxLines = 1,
    this.controller,
    this.validators,
  });
  final List<String> hint;
  final String title;
  final int maxLines;
  final List<TextEditingController>? controller;
  final List<String? Function(String?)?>? validators;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFontStyle.styleBold18(context),
        ),
        // Container(
        //   color: Colors.red,
        //   child: SizedBox(
        //     height: 16 * getScaleFactor(context),
        //     child: const CircleAvatar(),
        //   ),
        // ),
        Row(
          children: [
            ...List.generate(
                hint.length,
                (index) => Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: index != hint.length - 1 ? 24 * getScaleFactor(context) : 0, bottom: 16),
                        child: CustomTextFromFeild(
                          hint: hint[index],
                          controller: controller?[index],
                          maxLines: maxLines,
                          validator: validators?[index],
                        ),
                      ),
                    ))
          ],
        ),
      ],
    );
  }
}
