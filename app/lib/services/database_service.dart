import 'dart:io';

import 'package:flutter/foundation.dart' show debugPrint;
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
        version: 2,
        onConfigure: (db) async{
          await db.execute('PRAGMA foreign_keys = ON');
        },
        onCreate: (db, version) async {
          await db.execute(
            '''
            CREATE TABLE gardens (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL,
              location TEXT NOT NULL,
              area REAL NOT NULL
            )
            '''
          );
          await db.execute(
            '''
            CREATE TABLE plant_species (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              common_name TEXT NOT NULL,
              scientific_name TEXT NOT NULL
            )
            '''
          );
          await db.execute(
            '''
            CREATE TABLE garden_plants (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              garden_id INTEGER NOT NULL,
              species_id INTEGER NOT NULL,
              custom_name TEXT NOT NULL,
              planting_date TEXT NOT NULL,

              FOREIGN KEY (garden_id)
                REFERENCES gardens(id)
                ON DELETE CASCADE,

              FOREIGN KEY (species_id)
                REFERENCES plant_species(id)
                ON DELETE RESTRICT
            )
            ''',
          );
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          if (oldVersion < 2) {
            await db.execute(
              '''
              CREATE TABLE plant_species (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                common_name TEXT NOT NULL,
                scientific_name TEXT NOT NULL
              )
              ''',
            );

            await db.execute(
              '''
              CREATE TABLE garden_plants (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                garden_id INTEGER NOT NULL,
                species_id INTEGER NOT NULL,
                custom_name TEXT NOT NULL,
                planting_date TEXT NOT NULL,

                FOREIGN KEY (garden_id)
                  REFERENCES gardens(id)
                  ON DELETE CASCADE,

                FOREIGN KEY (species_id)
                  REFERENCES plant_species(id)
                  ON DELETE RESTRICT
              )
              ''',
            );
          }
        },
      )
    );

    return database;
  }

  Future<Database> get database async {
    _database ??= await _openDatabase();

    return _database!;
  }
  
}