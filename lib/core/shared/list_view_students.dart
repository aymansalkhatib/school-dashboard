import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';

class ListViewStudents extends StatelessWidget {
  const ListViewStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        const Icon(Icons.arrow_left, size: 50, color: AppColors.primaryPurple),
        SizedBox(
          height: 55,
          width: 178,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
              width: 52,
              decoration: BoxDecoration(
                  color: index == 1 ? AppColors.primaryPurple : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      width: index == 1 ? 2 : 0, color: index == 1 ? AppColors.primaryPurple : AppColors.darkGray )),
              child: Center(
                child: Text(
                  "${index + 1}",
                  style: AppFontStyle.styleBold18(context)
                      .copyWith(color: index == 1 ? Colors.white : Colors.black),
                ),
              ),
            ),
          ),
        ),
        const Icon(
          Icons.arrow_right,
          size: 50,
          color: AppColors.primaryPurple,
        ),
      ],
    );
  }
}
