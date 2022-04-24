import 'package:floor/floor.dart';

@entity
class Student {
  @PrimaryKey(autoGenerate: false)
  String? rollNo;

  String? firstName, lastName, email, division;
  
  final int contactNo, standard;

  Student(
      {required this.rollNo,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.contactNo,
      required this.standard,
      required this.division});
}
