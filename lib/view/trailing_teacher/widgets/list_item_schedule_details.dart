import 'package:flutter/material.dart';
import 'package:sama/model/schedule_details_model.dart';
import 'package:sama/view/trailing_teacher/widgets/item_schedule_details.dart';

class ListItemScheduleDetails extends StatelessWidget {
  const ListItemScheduleDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          scheduleDetailsModel.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: ItemScheduleDetails(
              scheduleDetailsModel: scheduleDetailsModel[index],
            ),
          ),
        ),
      ],
    );
  }
}
