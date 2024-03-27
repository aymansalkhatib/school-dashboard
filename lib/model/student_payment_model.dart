class StudentPaymentModel {
  final String id;
  final String date;
  final String price;
  final String status;

  StudentPaymentModel(this.id, this.date, this.price, this.status);
}

List<StudentPaymentModel> studentsPaymentModel = [
  StudentPaymentModel(
      "#123456789", "2 March 2021, 13:45 PM", r"$ 50,036", "Complete"),
  StudentPaymentModel(
      "#123456789", "2 March 2021, 13:45 PM", r"$ 50,036", '''Pending   '''),
  StudentPaymentModel(
      "#123456789", "2 March 2021, 13:45 PM", r"$ 50,036", "Canceled"),
  StudentPaymentModel(
      "#123456789", "2 March 2021, 13:45 PM", r"$ 50,036", "Complete"),
  StudentPaymentModel(
      "#123456789", "2 March 2021, 13:45 PM", r"$ 50,036", "Complete"),
];
