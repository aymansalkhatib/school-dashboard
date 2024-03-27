import 'dart:io';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/add_new_student_controller.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/shared/custom_disconnect_contaniar.dart';

class ImageWithTitleInsideDetailsStudent extends StatelessWidget {
  const ImageWithTitleInsideDetailsStudent({
    super.key,
    this.width,
    this.height,
  });

  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Photo *",
          style: AppFontStyle.styleBold18(context),
        ),
        SizedBox(
          height: 16 * getScaleFactor(context),
        ),
        SizedBox(
          width: width,
          height: height,
          child: AspectRatio(
            aspectRatio: 1,
            child:
                GetBuilder<AddNewStudentControllerImp>(builder: (controller) {
              return GestureDetector(
                onTap: controller.pickImage,
                onDoubleTap: controller.removeImage,
                child: DropTarget(
                  onDragDone: controller.dropImage,
                  child: controller.image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.file(
                            File(controller.image!.path),
                            fit: BoxFit.cover,
                          ),
                        )
                      : CustomPaint(
                          painter: DashedRectPainter(
                            color: AppColors.darkGray,
                            dashSpace: 7,
                            dashWidth: 10,
                            strokeWidth: 1,
                            cornerRadius: 5,
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                textAlign: TextAlign.center,
                                'Drag and drop or\nclick here to\nselect file',
                                style: AppFontStyle.styleRegular14(context)
                                    .copyWith(color: AppColors.darkGray),
                              ),
                            ),
                          ),
                        ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 200,
//       height: 200,
//       child: GestureDetector(
//         onTap: () async {
//           print("object");
//           final picker = ImagePicker();

//           final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//           if (pickedFile != null) {
//             // _list.add(await pickedFile.readAsBytes());
//             // setState(() {});
//             print(pickedFile.path);
//           } else {}
//         },
//         child: DropTarget(
//           onDragDone: (detail) async {
//             for (final file in detail.files) {
//               String extension = file.path.split('.').last.toLowerCase();
//               if (extension == 'png' || extension == 'jpg') {
//                 // _list.add(await file.readAsBytes());
//                 // _saveFileToLocal(file);
//               } else {}
//             }
//             // setState(() {});

//             debugPrint('onDragDone:');
//           },
//           child: Container(
//             height: double.infinity,
//             width: double.infinity,
//             color: _list.isNotEmpty ? Colors.blue.withOpacity(0.4) : Colors.black26,
//             child: _list.isEmpty
//                 ? const Center(child: Text("Drop here"))
//                 : ListView.builder(
//                     itemCount: _list.length,
//                     itemBuilder: (context, index) {
//                       final image = Image.memory(_list[index]);
//                       return image;
//                     },
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     title: 'Flutter Demo',
//     theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
//     home: const ShowImageFromDesktopWidget(),
//   ));
// }

// class ShowImageFromDesktopWidget extends StatefulWidget {
//   const ShowImageFromDesktopWidget({Key? key}) : super(key: key);

//   @override
//   _ShowImageFromDesktopWidgetState createState() => _ShowImageFromDesktopWidgetState();
// }

// class _ShowImageFromDesktopWidgetState extends State<ShowImageFromDesktopWidget> {
//   String _imagePath = "";

//   @override
//   void initState() {
//     super.initState();
//     _loadImagePath();
//   }

//   Future<void> _loadImagePath() async {
//     // Replace 'ayman.png' with the name of your image file
//     const String imageFileName = 'goals-habits-tracking-app_52683-44673.jpg';

//     // Get the desktop directory
//     final String desktopPath = await _getDesktopPath();

//     // Construct the full file path
//     final String imagePath = '$desktopPath/$imageFileName';
//     log(desktopPath);
//     setState(() {
//       _imagePath = imagePath;
//     });
//   }

//   Future<String> _getDesktopPath() async {
//     // Get the desktop directory path
//     final String userProfile = Platform.environment['USERPROFILE'] ?? '';
//     final String desktopPath = '$userProfile\\Desktop';
//     return desktopPath;
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_imagePath.isEmpty) {
//       return Container(); // Placeholder widget while image path is being loaded
//     } else {
//       return SizedBox(
//         width: 100,
//         height: 100,
//         child: Image.file(
//           File(_imagePath),
//           fit: BoxFit.cover,
//         ),
//       );
//     }
//   }
// }
