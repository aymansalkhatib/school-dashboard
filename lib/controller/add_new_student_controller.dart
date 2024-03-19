import 'package:get/get.dart';
import 'package:sama/core/enum/enum_pament.dart';

abstract class AddNewStudentController extends GetxController {
  selectChoicePayment(PaymentEnum paymentEnum);
}

class AddNewStudentControllerImp extends AddNewStudentController {
  late PaymentEnum statePayment;

  @override
  void onInit() {
    statePayment = PaymentEnum.cache;
    super.onInit();
  }

  @override
  void selectChoicePayment(PaymentEnum paymentEnum) {
    statePayment = paymentEnum;
    update();
  }
}
