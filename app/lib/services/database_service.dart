import 'dart:io';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseService {
  Database? _database;

  DatabaseFactory get _databaseFactory {
    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      return databaseFactoryFfi;
    }

    return databaseFactory;
  }

  Future<Database> _openDatabase() async {
    final directory = await getApplicationDocumentsDirectory();

    final databasePath = join(
      directory.path,
      'martola.db',
    );

    final database = await _databaseFactory.openDatabase(
      databasePath,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            '''
            CREATE TABLE gardens (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL,
              location TEXT NOT NULL,
              area REAL NOT NULL
            )
            ''',
          );
        }
      )
    );

    return database;
  }

  Future<Database> get database async {
    _database ??= await _openDatabase();

    return _database!;
  }
}