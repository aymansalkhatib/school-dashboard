import 'package:flutter/material.dart';
import 'package:sama/core/constants/assets.dart';
import 'package:sama/core/utils/circle_button_with_border.dart';
import 'package:sama/model/teacher_model.dart';
import 'package:sama/view/teacher_details/widgets/teachers_info.dart';
import 'package:sama/view/users_details/widgets/avatar_with_background.dart';

class Teachers extends StatelessWidget {
  const Teachers({
    super.key,
    required this.teacherModel,
  });
  final TeacherModel teacherModel;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width * (1180 / 1920) - 80;
    double top = 32 * MediaQuery.sizeOf(context).width / 1700;

    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 28),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                AvatarWithBackground(
                  height: width / 3 / (1000 / 415),
                  mask: Assets.imagesMaskingTeacher,
                ),
                Positioned(
                  top: top,
                  left: top,
                  child: CircleButtonWithBorder(
                    image: teacherModel.image,
                    imageDefault: Assets.imagesTeacherDefault,
                  ),
                ),
              ],
            ),
            TeachersInfo(
              teacherModel: teacherModel,
            ),
          ],
        ),
      ),
    );
  }
}

/*

 AspectRatio(
        aspectRatio: 1,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: 800,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // in user aspectRatio => 1000/400
                  // here aspectRatio 1
                  // height / 3 / (1000 / 400)
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
*/
