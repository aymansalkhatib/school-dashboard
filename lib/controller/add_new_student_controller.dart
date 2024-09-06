import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sama/controller/finance_controller.dart';
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
  AddNewStudentControllerImp({this.student});

  late Box box;
  late PaymentEnum statePayment;
  String grade = levels[levels.length - 1];
  XFile? image;
  final StudentModel? student;

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
                Get.find<NavigationControllerImp>()
                    .replaceLastWidget(NavigationEnum.Classes, info: {
                  "isActive": (int.tryParse(grade.substring(grade.length - 2).trim()) ?? 1) - 1
                });
              },
            ),
          ),
        );
      } else {
        StudentModel studentModel = StudentModel(
          id: student?.id ?? generateUniqueNumber(),
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
        if (student != null) {
          final items = box.values.toList();
          for (int i = 0; i < items.length; i++) {
            if (items[i] is StudentModel && items[i].id == student!.id) {
              await box.putAt(i, studentModel);
            }
          }
        } else {
          await box.add(studentModel);
        }
        Get.find<NavigationControllerImp>().replaceLastWidget(NavigationEnum.Students);
      }
    }
    Get.find<FinanceControllerImp>().resetController();
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
    sections = box.values.whereType<SectionModel>().where((e) {
      return value.contains(e.level) && value.contains(e.grade);
    }).toList();
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
    statePayment = PaymentEnum.cache;
    initListAndController();
    box = MyAppServices().box;
    if (student == null) {
      setGrade(levels[levels.length - 1]);
    }
    super.onInit();
  }

  void initListAndController() {
    firstName = TextEditingController(text: student?.firstName ?? 'Ayman');
    lastName = TextEditingController(text: student?.lastName ?? 'Smith');
    dateOfBirth = TextEditingController(text: student?.dateOfBirth ?? '2000-01-01');
    placeOfBirth = TextEditingController(text: student?.placeOfBirth ?? 'New York');
    parentName = TextEditingController(text: student?.parentName ?? 'John Doe');
    email = TextEditingController(text: student?.email ?? 'example@example.com');
    phone = TextEditingController(text: student?.phone ?? '0968381111');
    address = TextEditingController(text: student?.address ?? '123 Main St');
    parentEmail = TextEditingController(text: student?.parentEmail ?? 'parent@example.com');
    parentPhone = TextEditingController(text: student?.parentPhone ?? '0968381111');
    parentAddress = TextEditingController(text: student?.parentAddress ?? '456 Elm St');

    image =
        student?.image != null && student!.image!.isNotEmpty ? XFile(student!.image!) : null;
    grade = student?.grade ?? grade;
    activeSection = student?.section ?? activeSection;

    if (student != null) {
      if (student!.typeapid == PaymentEnum.cache.name) {
        statePayment = PaymentEnum.cache;
      } else {
        statePayment = PaymentEnum.debit;
      }
    }

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
