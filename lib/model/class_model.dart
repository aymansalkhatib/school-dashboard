import 'package:sama/core/constants/assets.dart';

class ClassModel {
  final String grade;
  final String educationLevel;
  final String image;
  final String romanNumerals;

  ClassModel({
    required this.grade,
    required this.educationLevel,
    required this.image,
    required this.romanNumerals,
  });
}

List<ClassModel> classesModel = [
  ClassModel(
      romanNumerals: 'I',
      grade: "Grade 1",
      educationLevel: "Primary School",
      image: Assets.numbers1),
  ClassModel(
      romanNumerals: 'II',
      grade: "Grade 2",
      educationLevel: "Primary School",
      image: Assets.numbers2),
  ClassModel(
      romanNumerals: 'III',
      grade: "Grade 3",
      educationLevel: "Primary School",
      image: Assets.numbers3),
  ClassModel(
      romanNumerals: 'IV',
      grade: "Grade 4",
      educationLevel: "Primary School",
      image: Assets.numbers4),
  ClassModel(
      romanNumerals: 'V',
      grade: "Grade 5",
      educationLevel: "Primary School",
      image: Assets.numbers5),
  ClassModel(
      romanNumerals: 'VI',
      grade: "Grade 6",
      educationLevel: "Primary School",
      image: Assets.numbers6),
  ClassModel(
      romanNumerals: 'VII',
      grade: "Grade 7",
      educationLevel: "Intermediate School",
      image: Assets.numbers7),
  ClassModel(
      romanNumerals: 'VIII',
      grade: "Grade 8",
      educationLevel: "Intermediate School",
      image: Assets.numbers8),
  ClassModel(
      romanNumerals: 'IX',
      grade: "Grade 9",
      educationLevel: "Intermediate School",
      image: Assets.numbers9),
  ClassModel(
      romanNumerals: 'X',
      grade: "Grade 10",
      educationLevel: "Secondary School",
      image: Assets.numbers10),
  ClassModel(
      romanNumerals: 'XI',
      grade: "Grade 11",
      educationLevel: "Secondary School",
      image: Assets.numbers11),
  ClassModel(
      romanNumerals: 'XII',
      grade: "Grade 12",
      educationLevel: "Secondary School",
      image: Assets.numbers12),
];
