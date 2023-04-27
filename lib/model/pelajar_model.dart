import 'dart:async';
import 'package:sqflite/sqflite.dart';

class StudentModel {
  FutureOr<void> onCreate(Database db, int version) {
    String sqlRawPelajar = '''
    
    CREATE TABLE IF NOT EXISTS siswa(
    id_siswa INTEGER PRIMARY KEY NOT NULL,
    first_name TEXT(20),
    last_name TEXT(20),
    gender TEXT(6),
    grade TEXT(3),
    address TEXT(45),
    mobile_phone TEXT(13),
    hobbies TEXT
    );
    ''';

    String sqlRawGuru = '''
    
    CREATE TABLE IF NOT EXISTS guru(
    id_guru INTEGER PRIMARY KEY NOT NULL,
    first_name TEXT(20),
    last_name TEXT(20),
    birthday TEXT(20),
    mobile_phone TEXT(13),
    gender TEXT(6),
    mata_pelajaran TEXT,
    address TEXT(45),
    );
    ''';

    String sqlRawLogin = '''
    CREATE TABLE IF NOT EXISTS login(
    id_login INTEGER PRIMARY KEY NOT NULL,
    username TEXT(20),
    password TEXT(20)
    );
    ''';

    db.execute(sqlRawPelajar);
    db.execute(sqlRawGuru);
    db.execute(sqlRawLogin);
  }

  Future<void> onConfigure(Database db){}
  Future<void> onDowngrade(Database db, int oldVersion, int newVersion) {}
  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) {}
}