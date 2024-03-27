import 'package:hive/hive.dart';

class TeacherModel {
  int id;
  String? image;
  late String firstName;
  late String lastName;
  late String dateOfBirth;
  late String placeOfBirth;
  late String email;
  late String phone;
  late String address;
  late String university;
  late String degree;
  late String startDate;
  late String endDate;
  late String city;
  late String about;
  late String expiration;
  late DateTime createdAt;

  TeacherModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.email,
    required this.phone,
    required this.address,
    required this.university,
    required this.degree,
    required this.startDate,
    required this.endDate,
    required this.city,
    required this.about,
    required this.expiration,
    this.image,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now(); // Set default value
}

class TeacherModelAdapter extends TypeAdapter<TeacherModel> {
  @override
  final int typeId = 1;

  @override
  TeacherModel read(BinaryReader reader) {
    return TeacherModel(
      id: reader.readInt(),
      firstName: reader.readString(),
      lastName: reader.readString(),
      dateOfBirth: reader.readString(),
      placeOfBirth: reader.readString(),
      email: reader.readString(),
      phone: reader.readString(),
      address: reader.readString(),
      university: reader.readString(),
      degree: reader.readString(),
      startDate: reader.readString(),
      endDate: reader.readString(),
      city: reader.readString(),
      about: reader.readString(),
      expiration: reader.readString(),
      image: reader.readString(),
      createdAt: DateTime.parse(reader.readString()),
    );
  }

  @override
  void write(BinaryWriter writer, TeacherModel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.firstName);
    writer.writeString(obj.lastName);
    writer.writeString(obj.dateOfBirth);
    writer.writeString(obj.placeOfBirth);
    writer.writeString(obj.email);
    writer.writeString(obj.phone);
    writer.writeString(obj.address);
    writer.writeString(obj.university);
    writer.writeString(obj.degree);
    writer.writeString(obj.startDate);
    writer.writeString(obj.endDate);
    writer.writeString(obj.city);
    writer.writeString(obj.about);
    writer.writeString(obj.expiration);
    writer.writeString(obj.image ?? "");
    writer.writeString(obj.createdAt.toIso8601String());
  }
}
