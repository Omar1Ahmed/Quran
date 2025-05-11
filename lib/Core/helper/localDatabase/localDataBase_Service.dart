import 'dart:io'; // For Directory
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:quran/Core/helper/localDatabase/Recitations_Helper.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalDatabaseService {
  Future<void> init();
  Future<Database> get database;
}

class SQLiteService implements LocalDatabaseService {
  static const _dbName = 'QuranDB.db';
  Database? _db;

  final List<String> _sqlFiles = [
    RecitationsHelper.hafsHelper.SqlfilePath,
  ];

  @override
  Future<void> init() async {
    final dbDir = await getDatabasesPath();
    final path = join(dbDir, _dbName);

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        for (final file in _sqlFiles) {
          final sqlScript = await rootBundle.loadString(file);
          final commands = sqlScript.split(';');
          for (final cmd in commands) {
            final sql = cmd.trim();
            if (sql.isNotEmpty) {
              await db.execute(sql);
            }
          }
        }
      },
    );
  }

  @override
  Future<Database> get database async {
    if (_db == null) {
      await init();
    }
    return _db!;
  }
}
