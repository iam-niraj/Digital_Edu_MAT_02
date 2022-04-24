import 'package:floor/floor.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:task_2/utils/Database/dao/StudentDAO.dart';
import 'package:task_2/utils/Database/entity/Student.dart';
part 'database.g.dart';


@Database(version: 1, entities: [Student])
abstract class AppDatabase extends FloorDatabase {
  StudentDAO get studentDAO;
}