import 'package:hive/hive.dart';
import 'package:sama/model/student_model.dart'; // Import your StudentModel class

class FinanceModel {
  final int id;
  final StudentModel? studentModel;
  final DateTime date;
  final String quantity;
  final String transactionType;
  final String? note;

  FinanceModel({
    required this.id,
    this.studentModel,
    required this.date,
    required this.quantity,
    required this.transactionType,
    this.note,
  });
}

class FinanceModelAdapter extends TypeAdapter<FinanceModel> {
  @override
  final int typeId = 3;

  @override
  FinanceModel read(BinaryReader reader) {
    return FinanceModel(
      id: reader.readInt(),
      studentModel: reader.read() as StudentModel?,
      date: DateTime.parse(reader.readString()),
      quantity: reader.readString(),
      transactionType: reader.readString(),
      note: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, FinanceModel obj) {
    writer.writeInt(obj.id);
    writer.write(obj.studentModel);
    writer.writeString(obj.date.toIso8601String());
    writer.writeString(obj.quantity);
    writer.writeString(obj.transactionType);
    writer.writeString(obj.note ?? '');
  }
}
