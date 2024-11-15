import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static const int dbVersion = 3;
  static const String dbName = 'hadith_database.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    final String databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);

    Database database = await openDatabase(path);
    int version = await database.getVersion();

    if (version < dbVersion) {
      await database.close();
      await deleteDatabase(path);

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        throw Exception('Ошибка при инициализации базы данных:\n\n$e');
      }

      ByteData data = await rootBundle.load(join('assets/databases', dbName));
      List<int> bytes = data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);

      database = await openDatabase(path);
      await database.setVersion(dbVersion);
    }

    return database;
  }
}