import 'package:hive/hive.dart';

class StudentModel {
  int id;
  String? image;
  late String firstName;
  late String lastName;
  late String dateOfBirth;
  late String placeOfBirth;
  late String email;
  late String phone;
  late String address;
  late String parentName;
  late String parentAddress;
  late String parentEmail;
  late String parentPhone;
  late DateTime createdAt; // New field for timestamp
  late String section; // New field for section
  late String grade; // New field for grade
  late String typeapid; // New field for typeapid

  StudentModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.email,
    required this.phone,
    required this.address,
    required this.parentName,
    required this.parentAddress,
    required this.parentEmail,
    required this.parentPhone,
    required this.section,
    required this.grade,
    required this.typeapid,
    this.image,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now(); // Set default value
}

class StudentModelAdapter extends TypeAdapter<StudentModel> {
  @override
  final int typeId = 0;

  @override
  StudentModel read(BinaryReader reader) {
    return StudentModel(
      id: reader.readInt(),
      firstName: reader.readString(),
      lastName: reader.readString(),
      dateOfBirth: reader.readString(),
      placeOfBirth: reader.readString(),
      email: reader.readString(),
      phone: reader.readString(),
      address: reader.readString(),
      parentName: reader.readString(),
      parentAddress: reader.readString(),
      parentEmail: reader.readString(),
      parentPhone: reader.readString(),
      section: reader.readString(),
      grade: reader.readString(),
      typeapid: reader.readString(),
      image: reader.readString(),
      createdAt: DateTime.parse(reader.readString()),
    );
  }

  @override
  void write(BinaryWriter writer, StudentModel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.firstName);
    writer.writeString(obj.lastName);
    writer.writeString(obj.dateOfBirth);
    writer.writeString(obj.placeOfBirth);
    writer.writeString(obj.email);
    writer.writeString(obj.phone);
    writer.writeString(obj.address);
    writer.writeString(obj.parentName);
    writer.writeString(obj.parentAddress);
    writer.writeString(obj.parentEmail);
    writer.writeString(obj.parentPhone);
    writer.writeString(obj.section);
    writer.writeString(obj.grade);
    writer.writeString(obj.typeapid);
    writer.writeString(obj.image ?? "");
    writer.writeString(obj.createdAt.toIso8601String());
  }
}
