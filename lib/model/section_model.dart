import 'package:hive/hive.dart';

class SectionModel {
  late String name;
  late String level;
  late String grade;
  late int numberStudent;

  SectionModel({
    required this.name,
    required this.level,
    required this.grade,
    required this.numberStudent,
  });
}

class SectionModelAdapter extends TypeAdapter<SectionModel> {
  @override
  final int typeId = 2;

  @override
  SectionModel read(BinaryReader reader) {
    return SectionModel(
      numberStudent: reader.readInt(),
      name: reader.readString(),
      level: reader.readString(),
      grade: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, SectionModel obj) {
    writer.writeInt(obj.numberStudent);
    writer.writeString(obj.name);
    writer.writeString(obj.level);
    writer.writeString(obj.grade);
  }
}
