import 'package:flutter/material.dart';
import 'package:sama/core/utils/header_with_search.dart';
import 'package:sama/view/view_all_student/widgets/list_view_students.dart';
import 'package:sama/view/view_all_student/widgets/search_with_new_student.dart';

class ViewAllStudent extends StatelessWidget {
  const ViewAllStudent({super.key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            HeaderWithSearch(title: "Students", showSearch: false),
            SizedBox(height: 40),
            SearchWithNewStudent(),
            SizedBox(height: 40),
            ListViewStudents()
          ],
        ),
      ),
    );
  }
}
