import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/enum/transaction_type.dart';
import 'package:sama/core/helper/random_id.dart';
import 'package:sama/core/my_services.dart';
import 'package:sama/model/finance_model.dart';
import 'package:sama/model/student_model.dart';

abstract class FinanceController extends GetxController {}

class FinanceControllerImp extends FinanceController {
  late Box box;
  String? selectedTransactionType;
  String? selectedStudent;
  List<StudentModel> students = [];
  List<StudentModel> unPaidStudent = [];
  List<double> remainingBalance = [];
  late TextEditingController textEditControllerQuantity;
  late TextEditingController textEditControllerNote;
  resetController() async {
    selectedTransactionType = null;
    selectedStudent = null;
    students = [];
    unPaidStudent = [];
    remainingBalance = [];
    textEditControllerQuantity = TextEditingController();
    textEditControllerNote = TextEditingController();
    await fillListStudent();
    fillUnPaid();
  }

  fillListStudent() {
    students = box.values.whereType<StudentModel>().toList();
    update();
  }

  void dialogTransaction() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return const TransactionDialog();
      },
    );
  }

  addTransaction() async {
    StudentModel? student;
    if (selectedStudent != null) {
      student = students.firstWhere((e) => "${e.firstName} ${e.parentName} ${e.lastName}" == selectedStudent);
    }
    await box.add(
      FinanceModel(
          id: generateUniqueNumber(),
          date: DateTime.now(),
          studentModel: student,
          quantity: textEditControllerQuantity.text,
          transactionType: selectedTransactionType!),
    );
    fillUnPaid();
    Get.back();
    update();
  }

  fillUnPaid() {
    unPaidStudent = [];
    remainingBalance = [];
    List<FinanceModel> transaction = box.values.whereType<FinanceModel>().toList();
    for (int i = 0; i < students.length; i++) {
      double amount = 0;
      for (int j = 0; j < transaction.length; j++) {
        if (transaction[j].studentModel?.id == students[i].id) {
          amount += double.tryParse(transaction[j].quantity) ?? 0;
        }
      }
      if (amount < 1000) {
        remainingBalance.add(1000 - amount);
        unPaidStudent.add(students[i]);
      }
    }
    update();
    print("up");
  }

  @override
  void onInit() async {
    box = MyAppServices().box;
    await resetController();
    super.onInit();
  }
}

class TransactionDialog extends StatelessWidget {
  const TransactionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FinanceControllerImp>(builder: (controller) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text('New Transaction', style: AppFontStyle.styleSemiBold28(context)),
        content: SingleChildScrollView(
          child: SizedBox(
            width: 350,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListBody(
                children: <Widget>[
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 48,
                    child: CustomDropDownSearch(
                      title: 'select transaction type',
                      list: TransactionType.values.map((e) => e.name).toList(),
                      onChanged: (p0) {
                        controller.selectedTransactionType = p0;
                        controller.update();
                      },
                    ),
                  ),
                  const SizedBox(height: 18),
                  controller.selectedTransactionType != "PAYMENT"
                      ? const SizedBox()
                      : SizedBox(
                          height: 48,
                          child: CustomDropDownSearch(
                            title: "Choose a new student",
                            list: controller.students
                                .map((e) => "${e.firstName} ${e.parentName} ${e.lastName}")
                                .toList(),
                            onChanged: (p0) {
                              controller.selectedStudent = p0;
                              controller.update();
                            },
                          ),
                        ),
                  SizedBox(height: controller.selectedTransactionType != "PAYMENT" ? 0 : 18),
                  SizedBox(
                    height: 48,
                    child: CustomTextFormDialog(
                      textEditController: controller.textEditControllerQuantity,
                      hint: 'Quantity',
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    height: 48,
                    child: CustomTextFormDialog(
                      textEditController: controller.textEditControllerNote,
                      hint: 'Note',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel', style: TextStyle(color: AppColors.errorRed)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Submit', style: TextStyle(color: AppColors.secondaryGreen)),
            onPressed: () async {
              if (controller.selectedTransactionType == null) {
                Get.snackbar(
                  'Error',
                  'Please select a type',
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM,
                );
                return;
              }
              if (controller.selectedTransactionType == "PAYMENT" && controller.selectedStudent == null) {
                Get.snackbar(
                  'Error',
                  'Please select a student',
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM,
                );
                return;
              }
              if ((double.tryParse(controller.textEditControllerQuantity.text.toString()) ?? 0) == 0) {
                Get.snackbar(
                  'Error',
                  'Please enter a valid quantity',
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM,
                );
                return;
              }
              await controller.addTransaction();
            },
          ),
        ],
      );
    });
  }
}

class CustomTextFormDialog extends StatelessWidget {
  const CustomTextFormDialog({
    super.key,
    required this.textEditController,
    required this.hint,
  });

  final TextEditingController textEditController;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 12),
        hintText: hint,
        hintStyle: AppFontStyle.styleRegular16(context).copyWith(color: AppColors.darkGray),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textBlack, width: 1.2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textBlack, width: 1.2),
        ),
      ),
      keyboardType: TextInputType.number,
      style: const TextStyle(color: AppColors.textBlack),
    );
  }
}

class CustomDropDownSearch extends StatefulWidget {
  final List<String> list;
  final void Function(String?)? onChanged;
  final String title;
  const CustomDropDownSearch({super.key, required this.list, this.onChanged, required this.title});

  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      items: widget.list,
      popupProps: PopupProps.menu(
        showSelectedItems: true,
        searchFieldProps: const TextFieldProps(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              gapPadding: 0,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
          ),
        ),
        disabledItemFn: (String s) {
          return s.startsWith('I');
        },
      ),
      dropdownButtonProps: const DropdownButtonProps(color: AppColors.primaryPurple),
      onChanged: widget.onChanged,
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: AppFontStyle.styleRegular16(context).copyWith(color: AppColors.darkGray),
        dropdownSearchDecoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textBlack, width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textBlack, width: 1.2),
          ),
        ),
      ),
      selectedItem: widget.title,
    );
  }
}
