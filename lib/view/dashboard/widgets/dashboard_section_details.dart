import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/model/dashboard_item_model.dart';
import 'package:sama/view/dashboard/widgets/dashboard_item.dart';

class DashboardSectionDetails extends StatelessWidget {
  const DashboardSectionDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(46 * getScaleFactor(context)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
              dashboardItemsModel.length,
              (index) => DashboardItem(
                    dashboardItemModel: dashboardItemsModel[index],
                  ))
        ],
      ),
    );
  }
}
