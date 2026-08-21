# DATABASE_DESIGN.md

# MARTOLA - Database Design

## Purpose

Este documento define o modelo de datos da aplicación MARTOLA.

O seu obxectivo é:

-   Documentar as entidades principais.
-   Definir as relacións entre táboas.
-   Servir como guía para SQLite.
-   Facilitar futuras migracións.
-   Apoiar a elaboración da memoria final do proxecto.
-   Distinguir entre o modelo obxectivo da aplicación e o esquema físico
    realmente implementado en cada fase.

------------------------------------------------------------------------

# Database Technology

## Selected Database

SQLite

## Motivation

SQLite foi seleccionada debido a:

-   Integración sinxela con Flutter.
-   Funcionamento local sen servidor.
-   Bo rendemento en dispositivos móbiles e escritorio.
-   Simplicidade de implementación.
-   Adecuación ao enfoque Local First.
-   Posibilidade de evolucionar posteriormente cara a solucións cloud.

A infraestrutura utilizada actualmente inclúe:

-   `sqflite`
-   `sqflite_common_ffi`
-   `path`
-   `path_provider`

------------------------------------------------------------------------

# Entity Relationship Overview

Modelo obxectivo:

``` text
users
│
└── gardens
     │
     ├── garden_plants
     │      │
     │      └── plant_evolution_records
     │
     ├── weather_records
     │
     ├── garden_layout_items
     │
     └── tasks

plant_species
│
└── garden_plants
```

Relacións implementadas actualmente:

``` text
gardens
   │
   │ 1:N
   ▼
garden_plants
   ▲
   │ N:1
   │
plant_species

garden_plants
   │
   │ 1:N
   ▼
plant_evolution_records
garden_layout_items
tasks
```

------------------------------------------------------------------------

# Conceptual Entities

## users

Representa os usuarios da aplicación.

### Fields

  Field           Type      Description
  --------------- --------- ---------------
  id              INTEGER   Primary Key
  name            TEXT      User name
  email           TEXT      Email address
  password_hash   TEXT      Password hash
  created_at      TEXT      Creation date

### Status

⬜ Non implementada no esquema físico actual.

------------------------------------------------------------------------

## gardens

Representa unha horta ou xardín.

### Target Fields

  Field         Type      Description
  ------------- --------- -------------------------------
  id            INTEGER   Primary Key
  user_id       INTEGER   User owner
  name          TEXT      Garden name
  description   TEXT      Optional description
  location      TEXT      Location name
  area          REAL      Surface area in square metres
  latitude      REAL      Geographic latitude
  longitude     REAL      Geographic longitude
  created_at    TEXT      Creation date

### Current Implemented Fields

-   `id`
-   `name`
-   `location`
-   `area`
-   `latitude`
-   `longitude`

`latitude` e `longitude` son opcionais para manter compatibilidade con hortas creadas antes da xeocodificación.

------------------------------------------------------------------------

## plant_species

Información xeral dunha especie vexetal.

### Target Fields

  Field                   Type
  ----------------------- ---------
  id                      INTEGER
  common_name             TEXT
  scientific_name         TEXT
  plant_type              TEXT
  watering_frequency      TEXT
  sunlight                TEXT
  soil_type               TEXT
  ideal_temperature_min   REAL
  ideal_temperature_max   REAL
  notes                   TEXT

### Current Implemented Fields

-   `id`
-   `common_name`
-   `scientific_name`

Outros campos incorporaranse só cando sexan necesarios para o MVP ou
futuras ampliacións.

------------------------------------------------------------------------

## garden_plants

Representa unha planta concreta dentro dunha horta.

### Target Fields

  Field           Type
  --------------- ---------
  id              INTEGER
  garden_id       INTEGER
  species_id      INTEGER
  custom_name     TEXT
  planting_date   TEXT
  status          TEXT
  notes           TEXT
  created_at      TEXT

### Current Implemented Fields

-   `id`
-   `garden_id`
-   `species_id`
-   `custom_name`
-   `planting_date`

------------------------------------------------------------------------

## plant_evolution_records

Representa un rexistro histórico da evolución dunha planta concreta.

### Current Implemented Fields

  Field      Type      Null   Description
  ---------- --------- ------ --------------------------------
  id         INTEGER   No     Primary Key
  plant_id   INTEGER   No     Foreign Key to `garden_plants`
  date       TEXT      No     Record date in ISO 8601
  height     REAL      Yes    Optional plant height
  notes      TEXT      Yes    Optional notes

### Domain Model

``` dart
class PlantEvolutionRecord {
  final String? id;
  final String plantId;
  final DateTime date;
  final double? height;
  final String? notes;
}
```

### Domain Semantics

-   `id == null` pode indicar que o rexistro aínda non foi persistido.
-   `height == null` significa que non se realizou unha medición de
    altura.
-   `notes == null` significa que non se rexistraron notas.

A ausencia de altura ou notas é válida no dominio.

### Possible Future Fields

O deseño inicial contemplaba tamén campos como:

-   `growth_stage`
-   `health_status`
-   `has_flowers`
-   `has_fruits`
-   `photo_path`

Non forman parte da implementación actual.

As fotografías quedan fóra do primeiro incremento do módulo de evolución
porque implican xestión adicional de ficheiros e rutas.

------------------------------------------------------------------------

## weather_records

Histórico meteorolóxico.

### Target Fields

  Field                 Type
  --------------------- ---------
  id                    INTEGER
  garden_id             INTEGER
  record_date           TEXT
  temperature           REAL
  humidity              REAL
  rainfall              REAL
  wind_speed            REAL
  weather_description   TEXT
  source                TEXT

### Status

⬜ Non implementada.

O módulo meteorolóxico actual utiliza `WeatherData` para representar
datos obtidos desde OpenWeather, pero non persiste esas respostas nesta
táboa. `weather_records` queda reservada para o futuro histórico
meteorolóxico asociado ás hortas.

------------------------------------------------------------------------

## garden_layout_items

Elementos visuais do deseño dunha horta.

### Target Fields

  Field             Type
  ----------------- ---------
  id                INTEGER
  garden_id         INTEGER
  garden_plant_id   INTEGER
  x_position        REAL
  y_position        REAL
  width             REAL
  height            REAL
  rotation          REAL
  color             TEXT
  icon              TEXT

### Current Implemented Fields

-   `id`
-   `garden_id`
-   `garden_plant_id`
-   `x_position`
-   `y_position`

As coordenadas `x_position` e `y_position` persístense normalizadas, polo que a disposición non depende das dimensións concretas da pantalla. `garden_plant_id` é único para impedir que unha mesma planta apareza máis dunha vez no deseño.

### Current Physical Schema

``` sql
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
```

### Status

✅ Implementada desde SQLite v5.

Os campos obxectivo `width`, `height`, `rotation`, `color` e `icon` quedan como posibles ampliacións futuras.

------------------------------------------------------------------------

## tasks

Representa tarefas sinxelas de mantemento ou seguimento creadas polo usuario.

### Current Implemented Fields

-   `id`
-   `title`
-   `is_completed`

`is_completed` almacénase en SQLite como `INTEGER` (`0` ou `1`) e represéntase no dominio como `bool`.

### Status

✅ Implementada desde SQLite v6.

------------------------------------------------------------------------

# Relationship Summary

Modelo obxectivo:

``` text
users 1:N gardens

gardens 1:N garden_plants

plant_species 1:N garden_plants

garden_plants 1:N plant_evolution_records

gardens 1:N weather_records

gardens 1:N garden_layout_items

garden_plants 1:1 garden_layout_items

As tarefas do MVP son independentes e non teñen actualmente clave foránea cara a unha horta ou planta.
```

Relacións fisicamente implementadas:

``` text
gardens 1:N garden_plants

plant_species 1:N garden_plants

garden_plants 1:N plant_evolution_records

gardens 1:N garden_layout_items

garden_plants 1:1 garden_layout_items
tasks
```

------------------------------------------------------------------------

# SQLite Type Mapping

  SQLite            Dart
  ----------------- ----------
  INTEGER           int
  TEXT              String
  REAL              double
  INTEGER (0/1)     bool
  TEXT (ISO Date)   DateTime

Os identificadores mantéñense como `String` nos modelos actuais, aínda
que SQLite utiliza `INTEGER`.

A conversión realízase na fronteira coa persistencia.

------------------------------------------------------------------------

# Current SQLite Implementation

## Database

A base de datos local utiliza:

``` text
martola.db
```

A apertura, configuración, creación e migración centralízanse en:

``` text
DatabaseService
```

## Current Version

``` text
version: 6
```

## Implemented Migrations

``` text
v1 → v2
v2 → v3
v3 → v4
v4 → v5
v5 → v6
```

Ambas migracións foron executadas e comprobadas conservando os datos
existentes.

A estratexia é acumulativa:

``` dart
if (oldVersion < 2) {
  // cambios da versión 2
}

if (oldVersion < 3) {
  // cambios da versión 3
}

if (oldVersion < 4) {
  // engade latitude e longitude a gardens
}
```

Isto permite que unha instalación antiga aplique todos os pasos
necesarios ata alcanzar a versión actual.

------------------------------------------------------------------------

# Implemented Tables

Actualmente existen:

``` text
gardens
plant_species
garden_plants
plant_evolution_records
garden_layout_items
```

## gardens

``` sql
CREATE TABLE gardens (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  location TEXT NOT NULL,
  area REAL NOT NULL,
  latitude REAL,
  longitude REAL
)
```

------------------------------------------------------------------------

## plant_species

``` sql
CREATE TABLE plant_species (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  common_name TEXT NOT NULL,
  scientific_name TEXT NOT NULL
)
```

A implementación é deliberadamente mínima.

A táboa dispón dun catálogo inicial local que se insire só cando está
baleira.

------------------------------------------------------------------------

## garden_plants

``` sql
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
```

`garden_id` relaciona cada planta coa súa horta.

`species_id` relaciona cada planta coa súa especie.

`planting_date` almacénase como `TEXT` en formato ISO 8601.

------------------------------------------------------------------------

## plant_evolution_records

``` sql
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
```

`plant_id` identifica a planta á que pertence o rexistro.

`date` é obrigatoria.

`height` e `notes` permiten `NULL`.

------------------------------------------------------------------------

## garden_layout_items

A táboa `garden_layout_items` persiste a colocación das plantas no deseño visual da horta.

``` sql
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
```

As posicións representan o centro do elemento mediante coordenadas normalizadas. A interface convérteas a píxeles segundo o tamaño dispoñible do taboleiro.

------------------------------------------------------------------------

## tasks

A táboa `tasks` persiste o módulo básico de tarefas do MVP.

``` sql
CREATE TABLE tasks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  is_completed INTEGER NOT NULL DEFAULT 0
)
```

A implementación actual mantén o módulo deliberadamente simple: unha tarefa dispón dun título e dun estado pendente/completada.

------------------------------------------------------------------------

# Referential Integrity

SQLite require activar explicitamente a comprobación das claves foráneas
para cada conexión:

``` sql
PRAGMA foreign_keys = ON
```

`DatabaseService` realiza esta configuración en `onConfigure`.

## Garden → GardenPlant

``` text
garden_plants.garden_id
        ↓
gardens.id
```

Utiliza:

``` text
ON DELETE CASCADE
```

Ao eliminar unha horta, SQLite elimina automaticamente as plantas
asociadas.

Este comportamento foi comprobado.

------------------------------------------------------------------------

## PlantSpecies → GardenPlant

``` text
garden_plants.species_id
        ↓
plant_species.id
```

Utiliza:

``` text
ON DELETE RESTRICT
```

Unha especie non pode eliminarse mentres exista unha planta que a
utilice.

Este comportamento foi comprobado.

------------------------------------------------------------------------

## GardenPlant → PlantEvolutionRecord

``` text
plant_evolution_records.plant_id
        ↓
garden_plants.id
```

Utiliza:

``` text
ON DELETE CASCADE
```

Ao eliminar unha planta, elimínanse automaticamente os seus rexistros de
evolución.

Esta decisión evita conservar históricos orfos dunha entidade que xa non
existe.

Unha futura funcionalidade de exportación podería permitir conservar esa
información fóra da base funcional antes da eliminación.

------------------------------------------------------------------------

## Garden / GardenPlant → GardenLayoutItem

`garden_layout_items.garden_id` referencia `gardens.id` con `ON DELETE CASCADE`.

`garden_layout_items.garden_plant_id` referencia `garden_plants.id` tamén con `ON DELETE CASCADE`.

Isto garante que ao eliminar unha horta ou unha planta desaparezan automaticamente os elementos de layout asociados. A restrición `UNIQUE (garden_plant_id)` garante que cada planta dispoña como máximo dunha única posición no deseño.

------------------------------------------------------------------------

# Identifiers

As táboas implementadas utilizan:

``` text
INTEGER PRIMARY KEY AUTOINCREMENT
```

SQLite xera automaticamente o identificador durante os `INSERT`.

Nos modelos Dart actuais utilízase:

``` dart
String? id;
```

Por este motivo, os Repositories realizan as conversións necesarias.

Exemplo:

``` text
SQLite INTEGER
    ↕
String no dominio
```

As claves foráneas tamén se converten na fronteira coa persistencia.

Exemplo:

``` dart
int.parse(plantId)
```

------------------------------------------------------------------------

# Model Mapping

## Garden

O modelo `Garden` incorpora actualmente `latitude` e `longitude` como `double?`. `toMap()` persiste ambos campos e `fromMap()` recupéraos mediante conversión segura desde `num?`:

``` dart
latitude: (map['latitude'] as num?)?.toDouble(),
longitude: (map['longitude'] as num?)?.toDouble(),
```

Isto permite que as hortas antigas sen coordenadas continúen sendo válidas.

``` text
Garden
  ↓ toMap()
Map<String, Object?>
  ↓
SQLite
```

e:

``` text
SQLite
  ↓
Map<String, Object?>
  ↓ fromMap()
Garden
```

------------------------------------------------------------------------

## GardenPlant

Convértense:

``` text
gardenId  → INTEGER
speciesId → INTEGER
```

A data utiliza:

``` text
DateTime
  ↓ toIso8601String()
TEXT
  ↓ DateTime.parse()
DateTime
```

------------------------------------------------------------------------

## PlantSpecies

Utiliza igualmente:

-   `toMap()`
-   `fromMap()`

------------------------------------------------------------------------

## PlantEvolutionRecord

`toMap()` non inclúe `id`.

Converte:

``` text
plantId → INTEGER
date    → TEXT ISO 8601
height  → REAL ou NULL
notes   → TEXT ou NULL
```

`fromMap()` converte de novo:

``` text
id       → String
plant_id → String
date     → DateTime
height   → double?
notes    → String?
```

Para `height` utilízase unha conversión compatible con `INTEGER`, `REAL`
ou `NULL`:

``` dart
(map['height'] as num?)?.toDouble()
```

------------------------------------------------------------------------

## GardenLayoutItem

O modelo mantén:

``` text
id
gardenId
gardenPlantId
xPosition
yPosition
```

`toMap()` converte `gardenId` e `gardenPlantId` a `INTEGER` para SQLite e persiste as coordenadas como `REAL`.

`fromMap()` recupera os identificadores como `String` e converte `x_position` e `y_position` a `double`.

------------------------------------------------------------------------

## Task

O modelo de tarefa mantén un identificador opcional, un título e o estado de completado. Na fronteira con SQLite, o booleano convértese entre `bool` e `INTEGER` (`0`/`1`).

------------------------------------------------------------------------

# Implemented Repository Operations

## Gardens

`SQLiteGardenRepository`:

``` text
CREATE → addGarden()
READ   → getGardens()
READ   → getGardenById()
UPDATE → updateGarden()
DELETE → removeGarden()
```

------------------------------------------------------------------------

## Plant Species

`SQLitePlantSpeciesRepository`:

``` text
CREATE → addSpecies()
READ   → getSpecies()
READ   → getSpeciesById()
UPDATE → updateSpecies()
DELETE → removeSpecies()
```

------------------------------------------------------------------------

## Garden Plants

`SQLiteGardenPlantRepository`:

``` text
CREATE → addPlant()
READ   → getPlantsByGardenId()
READ   → getPlantById()
UPDATE → updatePlant()
DELETE → removePlant()
```

A lectura principal está contextualizada mediante `gardenId`.

------------------------------------------------------------------------

## Plant Evolution Records

`SQLitePlantEvolutionRecordRepository`:

``` text
CREATE → addRecord()
READ   → getRecordsByPlantId()
READ   → getRecordById()
UPDATE → updateRecord()
DELETE → removeRecord()
```

A lectura principal está contextualizada mediante `plantId`.

Os rexistros poden ordenarse por data para representar correctamente o
historial.

------------------------------------------------------------------------

## Garden Layout Items

`SqliteGardenLayoutRepository`:

``` text
CREATE → addItem()
READ   → getItemsByGardenId()
UPDATE → updateItem()
DELETE → removeItem()
```

Durante o arrastre, `GardenLayoutViewModel` actualiza a posición en memoria. A escritura en SQLite realízase ao finalizar o arrastre, evitando actualizacións persistentes continuas durante `onPanUpdate`.

------------------------------------------------------------------------

## Tasks

O Repository SQLite de tarefas permite cargar, crear, actualizar o estado e eliminar tarefas segundo as operacións utilizadas polo módulo actual.

------------------------------------------------------------------------

# CRUD Verification

## Gardens

Comprobouse:

-   CREATE.
-   READ.
-   UPDATE.
-   DELETE.
-   Persistencia entre reinicios.

## Plant Species

Comprobouse o CRUD contra SQLite.

## Garden Plants

Comprobouse:

-   CREATE.
-   READ BY GARDEN.
-   READ BY ID.
-   UPDATE.
-   DELETE.
-   `ON DELETE CASCADE`.
-   `ON DELETE RESTRICT` no fluxo relacionado coas especies.

## Plant Evolution Records

Comprobouse directamente contra SQLite:

``` text
CREATE               ✅
READ BY PLANT        ✅
READ BY ID           ✅
UPDATE               ✅
DELETE               ✅
AFTER DELETE = null  ✅
```

Tamén se comprobou o CRUD completo desde a interface mediante
`PlantEvolutionViewModel`.

## Garden Layout Items

Comprobouse desde a interface:

-   Engadir unha planta ao deseño.
-   Recuperar os elementos dunha horta.
-   Mover individualmente os elementos.
-   Persistir a posición final.
-   Recuperar as posicións entre reinicios.
-   Retirar unha planta do deseño.
-   Integridade mediante `ON DELETE CASCADE`.
-   Unicidade mediante `UNIQUE (garden_plant_id)`.

## Tasks

Comprobouse desde a interface:

-   Crear tarefas.
-   Recuperalas desde SQLite.
-   Marcalas como completadas ou pendentes.
-   Eliminalas.
-   Persistencia entre reinicios.
-   Actualización reactiva do contador de tarefas pendentes no Dashboard.

------------------------------------------------------------------------

# Database Evolution

## Version 1

Contiña:

``` text
gardens
```

------------------------------------------------------------------------

## Version 2

Engadiu:

``` text
plant_species
garden_plants
```

e as primeiras claves foráneas.

Migración:

``` text
v1
 ↓
v2
```

Foi comprobada conservando os datos existentes.

------------------------------------------------------------------------

## Version 3

Engadiu:

``` text
plant_evolution_records
garden_layout_items
tasks
```

Migración:

``` text
v2
 ↓
CREATE TABLE plant_evolution_records
 ↓
v3
```

A migración foi comprobada sobre unha base existente en v2.

Despois da actualización seguían dispoñibles todas as hortas e plantas
previamente almacenadas.

------------------------------------------------------------------------

## Version 4

Engadiu á táboa `gardens`:

``` text
latitude  REAL NULL
longitude REAL NULL
```

Migración:

``` text
v3
 ↓
ALTER TABLE gardens ADD COLUMN latitude REAL
ALTER TABLE gardens ADD COLUMN longitude REAL
 ↓
v4
```

Os campos son anulables para conservar as hortas xa existentes. A migración foi comprobada e as coordenadas das novas hortas persisten entre reinicios. Estas coordenadas obtéñense actualmente mediante xeocodificación por localidade e úsanse para consultar a meteoroloxía específica da horta.

------------------------------------------------------------------------

## Version 5

Engadiu:

``` text
garden_layout_items
```

A migración `v4 → v5` crea a nova táboa coas relacións cara a `gardens` e `garden_plants`, coordenadas normalizadas e a restrición `UNIQUE (garden_plant_id)`.

------------------------------------------------------------------------

## Version 6

Engadiu:

``` text
tasks
```

A migración `v5 → v6` incorpora a persistencia do módulo básico de tarefas.

------------------------------------------------------------------------

## New Installations

Nunha instalación nova, `onCreate()` crea directamente o esquema
completo correspondente á versión 6:

``` text
gardens
plant_species
garden_plants
plant_evolution_records
garden_layout_items
tasks
```

A táboa `gardens` inclúe tamén `latitude` e `longitude`.

Non é necesario executar as migracións históricas nunha instalación
nova.

------------------------------------------------------------------------

## Existing Installations

Unha instalación anterior que pase directamente a v6 executará acumulativamente as migracións necesarias:

``` text
oldVersion < 2
→ crea plant_species
→ crea garden_plants

oldVersion < 3
→ crea plant_evolution_records

oldVersion < 4
→ engade latitude e longitude a gardens

oldVersion < 5
→ crea garden_layout_items

oldVersion < 6
→ crea tasks
```

Unha instalación v2 executará:

``` text
oldVersion < 3
→ crea plant_evolution_records

oldVersion < 4
→ engade latitude e longitude a gardens

oldVersion < 5
→ crea garden_layout_items

oldVersion < 6
→ crea tasks
```

------------------------------------------------------------------------

## Migration Strategy

As futuras migracións manterán o modelo acumulativo:

``` dart
if (oldVersion < 2) {
  // cambios v2
}

if (oldVersion < 3) {
  // cambios v3
}

if (oldVersion < 4) {
  // cambios v4
}

if (oldVersion < 5) {
  // cambios v5
}

if (oldVersion < 6) {
  // cambios v6
}
```

A versión da base de datos é independente da versión da aplicación e só
debe incrementarse cando cambia o esquema físico.

------------------------------------------------------------------------

# Initial Dataset

A aplicación dispón actualmente dun pequeno catálogo inicial de
especies:

-   Tomate --- `Solanum lycopersicum`
-   Leituga --- `Lactuca sativa`
-   Pemento --- `Capsicum annuum`
-   Cenoria --- `Daucus carota`
-   Amorodo --- `Fragaria × ananassa`
-   Alfábega --- `Ocimum basilicum`

Antes da inserción compróbase:

``` sql
SELECT COUNT(*) AS count
FROM plant_species
```

Se existen rexistros, non se realiza o seed.

Isto evita duplicados nos sucesivos arranques.

------------------------------------------------------------------------

# Weather Module and Database Scope

O módulo meteorolóxico básico da sesión 17 non requiriu inicialmente cambios no esquema. Na sesión 18, a asociación da meteoroloxía a cada horta si motivou a migración `v3 → v4`, engadindo coordenadas a `gardens`.

A implementación actual consulta as condicións meteorolóxicas mediante
unha API externa e mantén os datos recibidos no estado da aplicación:

``` text
OpenWeather API
  ↓
WeatherService
  ↓
OpenWeatherRepository
  ↓
WeatherViewModel
  ↓
GardenDetailsScreen
```

O modelo:

``` text
WeatherData
```

representa a resposta meteorolóxica utilizada pola aplicación, pero
**non é actualmente unha entidade persistida en SQLite**.

Por este motivo:

-   `weather_records` continúa como táboa obxectivo non implementada.
-   A versión da base de datos é `6`.
-   A migración `v3 → v4` engadiu `latitude` e `longitude` a `gardens`.
-   Non se almacenan aínda históricos meteorolóxicos.
-   Os datos meteorolóxicos actuais pérdense ao pechar a aplicación e
    poden obterse de novo mediante a API.

A futura implementación de históricos meteorolóxicos será o momento
apropiado para valorar a creación física de `weather_records` e, se o
esquema cambia, incrementar a versión da base de datos.

------------------------------------------------------------------------

# Pending Tables

As seguintes táboas do deseño obxectivo aínda non están implementadas:

-   `users`
-   `weather_records`

Serán incorporadas cando se desenvolvan os seus módulos.

`plant_evolution_records` forma parte do esquema físico desde v3, `garden_layout_items` desde v5 e `tasks` desde v6.

------------------------------------------------------------------------

# Future Improvements

Posibles ampliacións:

-   Campos adicionais de evolución.
-   Fotografías asociadas aos rexistros.
-   Exportación de históricos.
-   Persistencia de históricos meteorolóxicos en `weather_records`.
-   Persistencia futura dos históricos meteorolóxicos asociados a unha horta concreta.
-   Posible soporte de múltiples provedores meteorolóxicos.
-   API botánica externa.
-   Sincronización cloud.
-   Compartición de hortas.
-   Sistema multiusuario.
-   Fotografías almacenadas remotamente.
-   Integración con sensores ambientais.
-   Estatísticas de crecemento.

------------------------------------------------------------------------

# Current Implementation Note

A infraestrutura SQLite está actualmente operativa na versión 6.

A arquitectura de persistencia é:

``` text
View
  ↓
ViewModel
  ↓
Repository
  ↓
DatabaseService
  ↓
SQLite
```

Implementacións activas:

``` text
SQLiteGardenRepository
SQLitePlantSpeciesRepository
SQLiteGardenPlantRepository
SQLitePlantEvolutionRecordRepository
SqliteGardenLayoutRepository
SQLiteTaskRepository
```

Táboas activas:

``` text
gardens
plant_species
garden_plants
plant_evolution_records
```

O esquema actual xa permite persistir a cadea relacional principal do
MVP:

``` text
Garden
  ↓
GardenPlant
  ↓
PlantEvolutionRecord

PlantSpecies
  ↓
GardenPlant
```

O CRUD de hortas, plantas e rexistros de evolución está integrado coa
interface e comprobado.

A base de datos seguirá evolucionando incrementalmente cando novas
funcionalidades requiran persistencia adicional, como os históricos
meteorolóxicos ou outras ampliacións. O deseño visual xa dispón de persistencia propia desde v5.

A consulta meteorolóxica segue empregando datos remotos non persistidos. O cambio de esquema da versión 5 non almacena respostas meteorolóxicas: unicamente persiste `latitude` e `longitude` en `gardens` para poder solicitar condicións meteorolóxicas contextualizadas por horta.

O deseño completo documentado neste ficheiro representa o modelo
obxectivo de MARTOLA, mentres que as seccións de implementación actual
documentan exclusivamente o esquema físico realmente existente.
