import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sama/controller/navigations_controller.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/classes.dart';
import 'package:sama/core/enum/enum_pament.dart';
import 'package:sama/core/enum/navigations_enum.dart';
import 'package:sama/core/helper/random_id.dart';
import 'package:sama/core/my_services.dart';
import 'package:sama/core/utils/validation.dart';
import 'package:sama/model/section_model.dart';
import 'package:sama/model/student_model.dart';

abstract class AddNewStudentController extends GetxController {
  selectChoicePayment(PaymentEnum paymentEnum);
}

class AddNewStudentControllerImp extends AddNewStudentController {
  late Box box;
  late PaymentEnum statePayment;
  String grade = levels[levels.length - 1];
  XFile? image;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController dateOfBirth;
  late TextEditingController placeOfBirth;
  late TextEditingController parentName;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController address;
  late TextEditingController parentEmail;
  late TextEditingController parentPhone;
  late TextEditingController parentAddress;

  List<List<TextEditingController>> textControllerStudentColumn1 = [];
  List<List<TextEditingController>> textControllerStudentColumn2 = [];
  List<List<TextEditingController>> textControllerParentStudentColumn1 = [];
  List<List<TextEditingController>> textControllerParentStudentColumn2 = [];
  List<String> titleStudentColumn1 = [];
  List<String> titleStudentColumn2 = [];
  List<String> titleParentStudentColumn1 = [];
  List<String> titleParentStudentColumn2 = [];
  List<List<String>> hintStudentColumn1 = [];
  List<List<String>> hintStudentColumn2 = [];
  List<List<String>> hintParentStudentColumn1 = [];
  List<List<String>> hintParentStudentColumn2 = [];
  List<List<String? Function(String?)?>> validationStudentColumn1 = [];
  List<List<String? Function(String?)?>> validationStudentColumn2 = [];
  List<List<String? Function(String?)?>> validationParentStudentColumn1 = [];
  List<List<String? Function(String?)?>> validationParentStudentColumn2 = [];
  List<SectionModel> sections = [];
  String? activeSection;

  Future<void> saveFileToLocal(XFile file) async {
    file.saveTo("C:/Users/Ayman_Alkhatib/Desktop/${file.name}");
  }

  void pop() {
    Get.find<NavigationControllerImp>().replaceLastWidget(NavigationEnum.Students);
  }

  Future addNewStudent() async {
    if (globalKey.currentState!.validate()) {
      if (activeSection == null) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: const Text(
              'Section is required. Please choose one. If no sections are found, create a new section.',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: AppColors.errorRed,
            action: SnackBarAction(
              label: 'Create Section',
              textColor: AppColors.lightPurple,
              onPressed: () {
                Get.find<NavigationControllerImp>().replaceLastWidget(NavigationEnum.Classes,
                    info: {"isActive": (int.tryParse(grade.substring(grade.length - 2).trim()) ?? 1) - 1});
              },
            ),
          ),
        );
      } else {
        StudentModel student = StudentModel(
          id: generateUniqueNumber(),
          firstName: firstName.text,
          lastName: lastName.text,
          dateOfBirth: dateOfBirth.text,
          placeOfBirth: placeOfBirth.text,
          email: email.text,
          phone: phone.text,
          address: address.text,
          parentName: parentName.text,
          parentAddress: parentAddress.text,
          parentEmail: parentEmail.text,
          parentPhone: parentPhone.text,
          image: image?.path,
          grade: grade,
          section: activeSection!,
          typeapid: statePayment.name,
        );

        await box.add(student);
        // await box.clear();
        // print(box.values.whereType<StudentModel>());
        Get.find<NavigationControllerImp>().replaceLastWidget(NavigationEnum.Students);
      }
    }
  }

  void pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = pickedFile;
      saveFileToLocal(pickedFile);
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
        image = file;
        saveFileToLocal(image!);

        update();
        return;
      }
    }
  }

  void setGrade(String value) {
    grade = value;
    sections = box.values
        .whereType<SectionModel>()
        .where((e) => value.contains(e.level) && value.contains(e.grade))
        .toList();
    if (sections.isNotEmpty) {
      activeSection = sections.last.name;
    } else {
      activeSection = null;
    }
    update();
  }

  setSection(String value) {
    activeSection = value;
    update();
  }

  @override
  void onInit() async {
    initListAndController();
    statePayment = PaymentEnum.cache;
    box = await MyAppServices().information;
    setGrade(levels[levels.length - 1]);

    super.onInit();
  }

  void initListAndController() {
    firstName = TextEditingController(text: 'John');
    lastName = TextEditingController(text: 'Doe');
    dateOfBirth = TextEditingController(text: '2000-01-01');
    placeOfBirth = TextEditingController(text: 'New York');
    parentName = TextEditingController(text: 'Jane Doe');
    email = TextEditingController(text: 'john@example.com');
    phone = TextEditingController(text: '0968381625');
    address = TextEditingController(text: '123 Main St, City');
    parentEmail = TextEditingController(text: 'jane@example.com');
    parentPhone = TextEditingController(text: '0968381625');
    parentAddress = TextEditingController(text: '456 Oak St, Town');

    titleStudentColumn1 = ["First Name *", "Date & Place of Brith*", "Email *", "Address *"];
    titleStudentColumn2 = ["Last Name *", "Parent Name *", "Phone"];
    titleParentStudentColumn1 = ["First Name *", "Email *", "Address *"];
    titleParentStudentColumn2 = ["Last Name *", "Phone"];

    hintStudentColumn1 = [
      ["First Name"],
      ["24 Februari 2005", "Damascus"],
      ["Email"],
      [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      ]
    ];
    hintStudentColumn2 = [
      ["Last Name"],
      ["Parent Name"],
      ["Phone"],
    ];
    hintParentStudentColumn1 = [
      ["First Name"],
      ["Email"],
      [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      ]
    ];
    hintParentStudentColumn2 = [
      ["Last Name"],
      ["Phone"],
    ];

    validationStudentColumn1 = [
      [Validation.length],
      [Validation.dateFormat, Validation.length],
      [Validation.validateEmail],
      [Validation.length]
    ];
    validationStudentColumn2 = [
      [Validation.length],
      [Validation.length],
      [Validation.isPhoneNumberValid],
      [Validation.length]
    ];
    validationParentStudentColumn1 = [
      [Validation.length],
      [Validation.validateEmail],
      [Validation.length]
    ];
    validationParentStudentColumn2 = [
      [Validation.length],
      [Validation.isPhoneNumberValid],
    ];

    textControllerStudentColumn1 = [
      [firstName],
      [dateOfBirth, placeOfBirth],
      [email],
      [address],
    ];
    textControllerStudentColumn2 = [
      [lastName],
      [parentName],
      [phone],
    ];

    textControllerParentStudentColumn1 = [
      [parentName],
      [parentEmail],
      [parentAddress],
    ];
    textControllerParentStudentColumn2 = [
      [lastName],
      [parentPhone],
    ];
  }

  @override
  void selectChoicePayment(PaymentEnum paymentEnum) {
    statePayment = paymentEnum;
    update();
  }
}
