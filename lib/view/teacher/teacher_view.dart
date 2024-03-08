import 'package:flutter/material.dart';
import 'package:sama/constants/assets.dart';
import 'package:sama/utils/circle_button_with_border.dart';
import 'package:sama/view/teacher/widgets/teachers_info.dart';
import 'package:sama/view/users/widgets/avatar_with_background.dart';

class Teachers extends StatelessWidget {
  const Teachers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: AspectRatio(
        aspectRatio: 1,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  //* in user aspectRatio => 1000/400
                  //* here aspectRatio 1
                  //* height / 3 / (1000 / 400)
                  // ** result same Height
                  AvatarWithBackground(
                    height: constraints.maxWidth / 3 / (1000 / 400),
                    mask: Assets.imagesMaskingTeacher,
                  ),
                  Positioned(
                    top: constraints.maxHeight / 3 / (1000 / 400),
                    child: SizedBox(width: constraints.maxWidth, child: const TeachersInfo()),
                  ),
                  const Positioned(
                    top: 30,
                    left: 32,
                    child: CircleButtonWithBorder(
                      icon: Icons.assignment_ind_rounded,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
