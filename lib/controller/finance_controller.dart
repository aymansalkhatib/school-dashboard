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

  fillListStudent() {
    students = box.values.whereType<StudentModel>().toList();
    update();
  }

  final TextEditingController textEditControllerQuantity = TextEditingController();
  final TextEditingController textEditControllerNote = TextEditingController();
  void dialogTransaction() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return const TransactionDialog();
      },
    );
  }

  addTransaction() {
    StudentModel? student;
    if (selectedStudent != null) {
      student =
          students.where((e) => "${e.firstName} ${e.parentName} ${e.lastName}" == selectedStudent).first;
    }
    box.add(
      FinanceModel(
          id: generateUniqueNumber(),
          date: DateTime.now(),
          studentModel: student,
          quantity: textEditControllerQuantity.text,
          transactionType: selectedTransactionType!),
    );
    print("object");
  }

  @override
  void onInit() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        box = MyAppServices().box;
      },
    );
    fillListStudent();
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
            onPressed: () {
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
              controller.addTransaction();
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
  final String? title;
  const CustomDropDownSearch({super.key, required this.list, this.onChanged, this.title});

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
        baseStyle: AppFontStyle.styleRegular16(context)
            .copyWith(color: widget.title != null ? null : AppColors.darkGray),
        dropdownSearchDecoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textBlack, width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textBlack, width: 1.2),
          ),
        ),
      ),
      selectedItem: widget.title ?? "Choose a new student",
    );
  }
}
