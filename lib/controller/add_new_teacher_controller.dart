import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sama/core/helper/random_id.dart';
import 'package:sama/core/my_services.dart';
import 'package:sama/model/teacher_model.dart';

abstract class AddNewTeacherController extends GetxController {}

class AddNewTeacherControllerImp extends AddNewTeacherController {
  XFile? image;
  late Box box;

  late TextEditingController firstName;
  late TextEditingController lastname;
  late TextEditingController dateOfBrith;
  late TextEditingController placeOfBrith;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController address;
  late TextEditingController university;
  late TextEditingController degree;
  late TextEditingController startDate;
  late TextEditingController endDate;
  late TextEditingController city;

  List<String> titleTeacherColumn1 = [];
  List<String> titleTeacherColumn2 = [];
  List<String> titleEducationTeacherColumn1 = [];
  List<String> titleEducationTeacherColumn2 = [];

  List<List<String>> hintTeacherColumn1 = [];
  List<List<String>> hintTeacherColumn2 = [];
  List<List<String>> hintEducationTeacherColumn1 = [];
  List<List<String>> hintEducationTeacherColumn2 = [];

  List<List<TextEditingController>> textControllerTeacherColumn1 = [];
  List<List<TextEditingController>> textControllerTeacherColumn2 = [];
  List<List<TextEditingController>> textControllerEducationTeacherColumn2 = [];
  List<List<TextEditingController>> textControllerEducationTeacherColumn1 = [];

  Future<void> saveFileToLocal(XFile file) async {
    file.saveTo("C:/Users/Ayman_Alkhatib/Desktop/${file.name}");
  }

  Future addNewTeacher() async {
    TeacherModel teacher = TeacherModel(
      id: generateUniqueNumber(),
      firstName: 'John',
      lastName: 'Doe',
      dateOfBirth: '2000-01-01',
      placeOfBirth: 'New York',
      email: 'john.doe@example.com',
      phone: '123-456-7890',
      address: '123 Main St, New York, USA',
      university: 'New York University',
      degree: 'Bachelor of Science',
      startDate: '2000-01-01',
      endDate: '2000-01-01',
      city: 'New York',
      image: 'C:/Users/Ayman_Alkhatib/Desktop/goals-habits-tracking-app_52683-44673.jpg',
    );

    await box.add(teacher);
    // await box.clear();
    // print(box.values.whereType<StudentModel>());
  }

  void pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = pickedFile;
      update();
    }
  }

  void removeImage() async {
    image = null;
    update();
  }

  dropImage(detail) async {
    for (final file in detail.files) {
      String extension = file.path.split('.').last.toLowerCase();
      if (extension == 'png' || extension == 'jpg') {
        image = await file;
        update();
        return;
      }
    }
  }

  @override
  void onInit() async {
    firstName = TextEditingController();
    lastname = TextEditingController();
    dateOfBrith = TextEditingController();
    placeOfBrith = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    address = TextEditingController();
    university = TextEditingController();
    degree = TextEditingController();
    startDate = TextEditingController();
    endDate = TextEditingController();
    city = TextEditingController();

    titleTeacherColumn1 = ["First Name *", "Email *", "Address *", "Date of Birth *"];
    titleTeacherColumn2 = ["Last Name *", "Phone *"];
    titleEducationTeacherColumn1 = ["University *", "Start & End Date *"];
    titleEducationTeacherColumn2 = ["Degree *", "City *"];

    hintTeacherColumn1 = [
      ["First Name"],
      ["Email"],
      [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      ],
      ["24 Februari 1997"]
    ];
    hintTeacherColumn2 = [
      ["Last Name"],
      ["+963912345678"],
    ];
    hintEducationTeacherColumn1 = [
      ["University Akademi Historia"],
      ["September 2013", "September 2017"],
    ];
    hintEducationTeacherColumn2 = [
      ["History Major"],
      ["Yogyakarta, Indonesia"],
    ];

    textControllerTeacherColumn1 = [
      [firstName],
      [email],
      [address],
      [dateOfBrith]
    ];

    textControllerTeacherColumn2 = [
      [lastname],
      [phone],
    ];
    textControllerEducationTeacherColumn1 = [
      [university],
      [startDate, endDate],
    ];
    textControllerEducationTeacherColumn2 = [
      [degree],
      [city],
    ];
    box = await MyAppServices().information;

    super.onInit();
  }
}
