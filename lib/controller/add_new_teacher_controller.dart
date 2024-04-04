import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sama/controller/navigations_controller.dart';
import 'package:sama/core/enum/navigations_enum.dart';
import 'package:sama/core/helper/random_id.dart';
import 'package:sama/core/my_services.dart';
import 'package:sama/core/utils/validation.dart';
import 'package:sama/model/teacher_model.dart';

abstract class AddNewTeacherController extends GetxController {}

class AddNewTeacherControllerImp extends AddNewTeacherController {
  XFile? image;
  late Box box;

  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController dateOfBirth;
  late TextEditingController placeOfBirth;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController address;
  late TextEditingController university;
  late TextEditingController degree;
  late TextEditingController startDate;
  late TextEditingController endDate;
  late TextEditingController city;
  late TextEditingController about;
  late TextEditingController expiration;
  GlobalKey<FormState> key = GlobalKey<FormState>();
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

  List<List<String? Function(String?)?>> validationTeacherColumn1 = [];
  List<List<String? Function(String?)?>> validationTeacherColumn2 = [];
  List<List<String? Function(String?)?>> validationEducationTeacherColumn1 = [];
  List<List<String? Function(String?)?>> validationEducationTeacherColumn2 = [];
  final TeacherModel? teacher;

  AddNewTeacherControllerImp({this.teacher});

  Future<void> saveFileToLocal(XFile file) async {
    file.saveTo("C:/Users/Ayman_Alkhatib/Desktop/${file.name}");
  }

  Future addNewTeacher() async {
    // if (key.currentState!.validate()) {

    TeacherModel teacherModel = TeacherModel(
      id: teacher?.id ?? generateUniqueNumber(),
      firstName: firstName.text,
      lastName: lastName.text,
      dateOfBirth: dateOfBirth.text,
      placeOfBirth: placeOfBirth.text,
      email: email.text,
      phone: phone.text,
      address: address.text,
      university: university.text,
      degree: degree.text,
      startDate: startDate.text,
      endDate: endDate.text,
      city: city.text,
      about: about.text,
      expiration: expiration.text,
      image: image?.path,
    );

    if (teacher != null) {
      final items = box.values.toList();
      for (int i = 0; i < items.length; i++) {
        if (items[i] is TeacherModel && items[i].id == teacher!.id) {
          await box.putAt(i, teacherModel);
        }
      }
    } else {
      await box.add(teacherModel);
    }

    Get.find<NavigationControllerImp>()
        .replaceLastWidget(NavigationEnum.Teachers);

    // await box.clear();
    // print(box.values.whereType<StudentModel>());
    // }
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
    firstName = TextEditingController(text: teacher?.firstName ?? "Ayman");
    lastName = TextEditingController(text: teacher?.lastName ?? "Smith");
    dateOfBirth =
        TextEditingController(text: teacher?.dateOfBirth ?? "1990-01-01");
    placeOfBirth = TextEditingController(text: teacher?.placeOfBirth ?? "City");
    email =
        TextEditingController(text: teacher?.email ?? "example@example.com");
    phone = TextEditingController(text: teacher?.phone ?? "123-456-7890");
    address =
        TextEditingController(text: teacher?.address ?? "123 Main Street");
    university = TextEditingController(
        text: teacher?.university ?? "Example University");
    degree = TextEditingController(text: teacher?.degree ?? "Bachelor's");
    startDate = TextEditingController(text: teacher?.startDate ?? "2010-09-01");
    endDate = TextEditingController(text: teacher?.endDate ?? "2014-06-01");
    city = TextEditingController(text: teacher?.city ?? "New York");
    about = TextEditingController(text: teacher?.about ?? "No thing");
    expiration = TextEditingController(text: teacher?.expiration ?? "No thing");

    image = teacher?.image != null && teacher!.image!.isNotEmpty
        ? XFile(teacher!.image!)
        : null;

    titleTeacherColumn1 = [
      "First Name *",
      "Email *",
      "Address *",
      "Date of Birth *"
    ];
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

    validationTeacherColumn1 = [
      [Validation.length],
      [Validation.validateEmail],
      [Validation.length],
      [Validation.dateFormat]
    ];
    validationTeacherColumn2 = [
      [Validation.length],
      [Validation.isPhoneNumberValid],
    ];
    validationEducationTeacherColumn1 = [
      [Validation.length],
      [Validation.dateFormat, Validation.dateFormat]
    ];
    validationEducationTeacherColumn2 = [
      [Validation.length],
      [Validation.isPhoneNumberValid],
    ];

    textControllerTeacherColumn1 = [
      [firstName],
      [email],
      [address],
      [dateOfBirth]
    ];
    textControllerTeacherColumn2 = [
      [lastName],
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

    box =   MyAppServices().box;

    super.onInit();
  }
}
