import 'package:floor/floor.dart';
import 'package:task_2/utils/Database/entity/Student.dart';

@dao
abstract class StudentDAO {
  @Query('SELECT * FROM Student')
  Stream<List<Student>> getAllStudent();

  @Query('SELECT * FROM Student WHERE id=:id')
  Stream<Student?> getAllStudentById(int id);

  @Query('SELECT * FROM Student WHERE firstName= "Niraj"')
  Stream<List<Student?>> getAllStudentByName();

  @Query('DELETE FROM Student')
  Future<void> deleteAllStudent();

  @insert
  Future<void> insertStudent(Student student);

  @update 
  Future<void> updateStudent(Student student);

  @delete 
  Future<void> deleteStudent(Student student);
}
