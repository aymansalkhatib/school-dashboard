import 'package:flutter/material.dart';
import 'package:sama/model/class_model.dart';
import 'package:sama/view/classes/widgets/classes_grid_view_item.dart';

class ClassesGridView extends StatelessWidget {
  const ClassesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: classesModel.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.sizeOf(context).width > 1200 ? 4 : 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(4.0),
          child: ClassesGridViewItem(index: index),
        );
      },
    );
  }
}
