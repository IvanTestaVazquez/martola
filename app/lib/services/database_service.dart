import 'dart:io';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseService {
  Future<Database>? _databaseFuture;

  DatabaseFactory get _databaseFactory {
    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      return databaseFactoryFfi;
    }

    return databaseFactory;
  }

  Future<Database> _openDatabase() async {
    final directory = await getApplicationSupportDirectory();

    final databasePath = join(
      directory.path,
      'martola.db',
    );

    final database = await _databaseFactory.openDatabase(
      databasePath,
      options: OpenDatabaseOptions(
        version: 6,
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
              area REAL NOT NULL,
              latitude REAL,
              longitude REAL
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

          await db.execute(
            '''
            CREATE TABLE plant_evolution_records (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              plant_id INTEGER NOT NULL,
              date TEXT NOT NULL,
              height REAL,
              notes TEXT,

              FOREIGN KEY (plant_id)
                REFERENCES garden_plants(id)
                ON DELETE CASCADE
            )
            ''',
          );

          await db.execute(
            '''
            CREATE TABLE garden_layout_items (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              garden_id INTEGER NOT NULL,
              garden_plant_id INTEGER NOT NULL,
              x_position REAL NOT NULL,
              y_position REAL NOT NULL,

              FOREIGN KEY (garden_id)
                REFERENCES gardens(id)
                ON DELETE CASCADE,

              FOREIGN KEY (garden_plant_id)
                REFERENCES garden_plants(id)
                ON DELETE CASCADE,

              UNIQUE (garden_plant_id)
            )
            ''',
          );

          await db.execute(
              '''
              CREATE TABLE tasks (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                title TEXT NOT NULL,
                description TEXT,
                due_date TEXT,
                is_completed INTEGER NOT NULL DEFAULT 0
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

          if (oldVersion < 3){
            await db.execute(
              '''
              CREATE TABLE plant_evolution_records (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                plant_id INTEGER NOT NULL,
                date TEXT NOT NULL,
                height REAL,
                notes TEXT,

                FOREIGN KEY (plant_id)
                  REFERENCES garden_plants(id)
                  ON DELETE CASCADE
              )
              ''',
            );
          }

          if (oldVersion < 4){
            await db.execute(
              'ALTER TABLE gardens ADD COLUMN latitude REAL',
            );

            await db.execute(
              'ALTER TABLE gardens ADD COLUMN longitude REAL',
            );
          }

          if (oldVersion < 5){
            await db.execute(
              '''
              CREATE TABLE garden_layout_items (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                garden_id INTEGER NOT NULL,
                garden_plant_id INTEGER NOT NULL,
                x_position REAL NOT NULL,
                y_position REAL NOT NULL,

                FOREIGN KEY (garden_id)
                  REFERENCES gardens(id)
                  ON DELETE CASCADE,

                FOREIGN KEY (garden_plant_id)
                  REFERENCES garden_plants(id)
                  ON DELETE CASCADE,

                UNIQUE (garden_plant_id)
              )
              ''',
            );
          }

          if (oldVersion < 6){
            await db.execute(
              '''
               CREATE TABLE tasks (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                title TEXT NOT NULL,
                description TEXT,
                due_date TEXT,
                is_completed INTEGER NOT NULL DEFAULT 0
              )
              ''',
            );
          }

        },
      ),
  );

    await _seedPlantSpecies(database);

    return database;
  }

  Future<Database> get database async {
    return _databaseFuture ??= _openDatabase();
  }

  Future<void> _seedPlantSpecies(Database db) async {
  final result = await db.rawQuery(
    'SELECT COUNT(*) AS count FROM plant_species',
  );
  final count = result.first['count'] as int;

  if (count > 0) {
    return;
  }

  await db.insert(
    'plant_species',
    {
      'common_name': 'Tomate',
      'scientific_name': 'Solanum lycopersicum',
    },
  );

  await db.insert(
    'plant_species',
    {
      'common_name': 'Leituga',
      'scientific_name': 'Lactuca sativa',
    },
  );

  await db.insert(
    'plant_species',
    {
      'common_name': 'Pemento',
      'scientific_name': 'Capsicum annuum',
    },
  );

  await db.insert(
    'plant_species',
    {
      'common_name': 'Cenoria',
      'scientific_name': 'Daucus carota',
    },
  );

  await db.insert(
    'plant_species',
    {
      'common_name': 'Amorodo',
      'scientific_name': 'Fragaria × ananassa',
    },
  );

  await db.insert(
    'plant_species',
    {
      'common_name': 'Alfábega',
      'scientific_name': 'Ocimum basilicum',
    },
  );

}
  
}