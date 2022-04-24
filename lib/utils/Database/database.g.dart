// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StudentDAO? _studentDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Student` (`rollNo` TEXT, `firstName` TEXT, `lastName` TEXT, `email` TEXT, `division` TEXT, `contactNo` INTEGER NOT NULL, `standard` INTEGER NOT NULL, PRIMARY KEY (`rollNo`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StudentDAO get studentDAO {
    return _studentDAOInstance ??= _$StudentDAO(database, changeListener);
  }
}

class _$StudentDAO extends StudentDAO {
  _$StudentDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _studentInsertionAdapter = InsertionAdapter(
            database,
            'Student',
            (Student item) => <String, Object?>{
                  'rollNo': item.rollNo,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'email': item.email,
                  'division': item.division,
                  'contactNo': item.contactNo,
                  'standard': item.standard
                },
            changeListener),
        _studentUpdateAdapter = UpdateAdapter(
            database,
            'Student',
            ['rollNo'],
            (Student item) => <String, Object?>{
                  'rollNo': item.rollNo,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'email': item.email,
                  'division': item.division,
                  'contactNo': item.contactNo,
                  'standard': item.standard
                },
            changeListener),
        _studentDeletionAdapter = DeletionAdapter(
            database,
            'Student',
            ['rollNo'],
            (Student item) => <String, Object?>{
                  'rollNo': item.rollNo,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'email': item.email,
                  'division': item.division,
                  'contactNo': item.contactNo,
                  'standard': item.standard
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Student> _studentInsertionAdapter;

  final UpdateAdapter<Student> _studentUpdateAdapter;

  final DeletionAdapter<Student> _studentDeletionAdapter;

  @override
  Stream<List<Student>> getAllStudent() {
    return _queryAdapter.queryListStream('SELECT * FROM Student',
        mapper: (Map<String, Object?> row) => Student(
            rollNo: row['rollNo'] as String?,
            firstName: row['firstName'] as String?,
            lastName: row['lastName'] as String?,
            email: row['email'] as String?,
            contactNo: row['contactNo'] as int,
            standard: row['standard'] as int,
            division: row['division'] as String?),
        queryableName: 'Student',
        isView: false);
  }

  @override
  Stream<Student?> getAllStudentById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Student WHERE id=?1',
        mapper: (Map<String, Object?> row) => Student(
            rollNo: row['rollNo'] as String?,
            firstName: row['firstName'] as String?,
            lastName: row['lastName'] as String?,
            email: row['email'] as String?,
            contactNo: row['contactNo'] as int,
            standard: row['standard'] as int,
            division: row['division'] as String?),
        arguments: [id],
        queryableName: 'Student',
        isView: false);
  }

  @override
  Stream<List<Student?>> getAllStudentByName() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM Student WHERE firstName= \"Niraj\"',
        mapper: (Map<String, Object?> row) => Student(
            rollNo: row['rollNo'] as String?,
            firstName: row['firstName'] as String?,
            lastName: row['lastName'] as String?,
            email: row['email'] as String?,
            contactNo: row['contactNo'] as int,
            standard: row['standard'] as int,
            division: row['division'] as String?),
        queryableName: 'Student',
        isView: false);
  }

  @override
  Future<void> deleteAllStudent() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Student');
  }

  @override
  Future<void> insertStudent(Student student) async {
    await _studentInsertionAdapter.insert(student, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateStudent(Student student) async {
    await _studentUpdateAdapter.update(student, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteStudent(Student student) async {
    await _studentDeletionAdapter.delete(student);
  }
}
