import 'package:sama/core/constants/assets.dart';

class ClassModel {
  final String grade;
  final int numberOfStudents;
  final int numberOfSections;
  final String educationLevel;
  final String image;

  ClassModel({
    required this.grade,
    required this.numberOfStudents,
    required this.numberOfSections,
    required this.educationLevel,
    required this.image,
  });
}

List<ClassModel> classesModel = [
  ClassModel(
      grade: "First Grade",
      numberOfStudents: 30,
      numberOfSections: 2,
      educationLevel: "Primary Education",
      image: Assets.numbers1),
  ClassModel(
      grade: "Second Grade",
      numberOfStudents: 28,
      numberOfSections: 2,
      educationLevel: "Primary Education",
      image: Assets.numbers2),
  ClassModel(
      grade: "Third Grade",
      numberOfStudents: 26,
      numberOfSections: 2,
      educationLevel: "Primary Education",
      image: Assets.numbers3),
  ClassModel(
      grade: "Fourth Grade",
      numberOfStudents: 25,
      numberOfSections: 2,
      educationLevel: "Primary Education",
      image: Assets.numbers4),
  ClassModel(
      grade: "Fifth Grade",
      numberOfStudents: 23,
      numberOfSections: 2,
      educationLevel: "Primary Education",
      image: Assets.numbers5),
  ClassModel(
      grade: "Sixth Grade",
      numberOfStudents: 22,
      numberOfSections: 2,
      educationLevel: "Primary Education",
      image: Assets.numbers6),
  ClassModel(
      grade: "Seventh Grade",
      numberOfStudents: 20,
      numberOfSections: 1,
      educationLevel: "Lower Secondary Education",
      image: Assets.numbers7),
  ClassModel(
      grade: "Eighth Grade",
      numberOfStudents: 20,
      numberOfSections: 1,
      educationLevel: "Lower Secondary Education",
      image: Assets.numbers8),
  ClassModel(
      grade: "Ninth Grade",
      numberOfStudents: 20,
      numberOfSections: 1,
      educationLevel: "Lower Secondary Education",
      image: Assets.numbers9),
  ClassModel(
      grade: "Tenth Grade",
      numberOfStudents: 18,
      numberOfSections: 1,
      educationLevel: "Upper Secondary Education",
      image: Assets.numbers10),
  ClassModel(
      grade: "Eleventh Grade",
      numberOfStudents: 18,
      numberOfSections: 1,
      educationLevel: "Upper Secondary Education",
      image: Assets.numbers11),
  ClassModel(
      grade: "Twelfth Grade",
      numberOfStudents: 17,
      numberOfSections: 1,
      educationLevel: "Upper Secondary Education",
      image: Assets.numbers12),
];
