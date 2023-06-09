import 'dart:io';
import 'package:sekolahku/model/pelajar_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

StudentModelProvider _studentModelProvider;

class StudentModelProvider {
  StudentModelProvider(this.dbName, this.dbVersion);

  static StudentModelProvider getInstance() {
    if (_studentModelProvider != null &&
        _studentModelProvider is StudentModelProvider) {
      return _studentModelProvider;
    }
    _studentModelProvider = StudentModelProvider('db_sekolahku.db', 1);

    return _studentModelProvider;
  }

  final String dbName;
  final int dbVersion;
  Database _database;

  Future<Database> openDb() async {
    var databaseDirectory = await getDatabasesPath();

    try{
      await Directory(databaseDirectory).create(recursive: true);
    }catch (e){
      print('Error Database : '+e);
    }
    var path = join(databaseDirectory, dbName);
    var studentModel = StudentModel();

    _database = await openDatabase(
      path,
      version: dbVersion,
      onCreate: studentModel.onCreate,
      onConfigure: studentModel.onConfigure,
      onDowngrade: studentModel.onDowngrade,
      onUpgrade: studentModel.onUpgrade,
    );

    return _database;
  }

  Future<void> closeDb() async {
    return getDatabase().then((value) => value.close());
  }

  Future<Database> getDatabase() async {
    if(_database == null) throw 'Database is not open';
    return _database;
  }
}
