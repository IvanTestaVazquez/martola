# DATABASE_DESIGN.md

# MARTOLA - Database Design

## Purpose

Este documento define o modelo de datos da aplicación MARTOLA.

O seu obxectivo é:

- Documentar as entidades principais.
- Definir as relacións entre táboas.
- Servir como guía para SQLite.
- Facilitar futuras migracións.
- Apoiar a elaboración da memoria final do proxecto.

**---**

# Database Technology

## Selected Database

SQLite

## Motivation

SQLite foi seleccionada debido a:

- Integración sinxela con Flutter.
- Funcionamento local sen servidor.
- Bo rendemento en dispositivos móbiles.
- Simplicidade de implementación.
- Posibilidade de evolucionar posteriormente cara a solucións cloud.

**---**

# Entity Relationship Overview

users
│
└── gardens
     │
     ├── garden_plants
     │      │
     │      └── plant_evolution_records
     │
     ├── weather_records
     │
     └── garden_layout_items

plant_species
│
└── garden_plants

**---**

# Entities

## users

Representa os usuarios da aplicación.

### Fields

\| Field | Type | Description |
\|---------|---------|---------|
\| id | INTEGER | Primary Key |
\| name | TEXT | User name |
\| email | TEXT | Email address |
\| password_hash | TEXT | Password hash |
\| created_at | TEXT | Creation date |

### Relationships

- One user can own multiple gardens.

**---**

## gardens

Representa unha horta ou xardín.

### Fields

\| Field       | Type    | Description |
\| ----------- | ------- | ----------- |
\| id          | INTEGER | Primary Key |
\| user_id     | INTEGER | User owner |
\| name        | TEXT    | Garden name |
\| description | TEXT    | Optional description |
\| location    | TEXT    | Location name |
\| area        | REAL    | Surface area in square metres |
\| latitude    | REAL    | Geographic latitude |
\| longitude   | REAL    | Geographic longitude |
\| created_at  | TEXT    | Creation date |

### Relationships

- Belongs to one user.
- Contains multiple plants.
- Contains weather records.
- Contains layout elements.

**---**

## plant_species

Información xeral dunha especie vexetal.

### Fields

\| Field | Type |
\|---------|---------|
\| id | INTEGER |
\| common_name | TEXT |
\| scientific_name | TEXT |
\| plant_type | TEXT |
\| watering_frequency | TEXT |
\| sunlight | TEXT |
\| soil_type | TEXT |
\| ideal_temperature_min | REAL |
\| ideal_temperature_max | REAL |
\| notes | TEXT |

### Relationships

- One species can be used by multiple plants.

**---**

## garden_plants

Representa unha planta concreta dentro dunha horta.

### Fields

\| Field | Type |
\|---------|---------|
\| id | INTEGER |
\| garden_id | INTEGER |
\| species_id | INTEGER |
\| custom_name | TEXT |
\| planting_date | TEXT |
\| status | TEXT |
\| notes | TEXT |
\| created_at | TEXT |

### Relationships

- Belongs to one garden.
- References one species.
- Has multiple evolution records.

**---**

## plant_evolution_records

Histórico de evolución dunha planta.

### Fields

\| Field | Type |
\|---------|---------|
\| id | INTEGER |
\| garden_plant_id | INTEGER |
\| record_date | TEXT |
\| height_cm | REAL |
\| growth_stage | TEXT |
\| health_status | TEXT |
\| has_flowers | INTEGER |
\| has_fruits | INTEGER |
\| notes | TEXT |
\| photo_path | TEXT |

### Relationships

- Belongs to one plant.

**---**

## weather_records

Histórico meteorolóxico.

### Fields

\| Field | Type |
\|---------|---------|
\| id | INTEGER |
\| garden_id | INTEGER |
\| record_date | TEXT |
\| temperature | REAL |
\| humidity | REAL |
\| rainfall | REAL |
\| wind_speed | REAL |
\| weather_description | TEXT |
\| source | TEXT |

### Relationships

- Belongs to one garden.

**---**

## garden_layout_items

Elementos visuais do deseño dunha horta.

### Fields

\| Field | Type |
\|---------|---------|
\| id | INTEGER |
\| garden_id | INTEGER |
\| garden_plant_id | INTEGER |
\| x_position | REAL |
\| y_position | REAL |
\| width | REAL |
\| height | REAL |
\| rotation | REAL |
\| color | TEXT |
\| icon | TEXT |

### Relationships

- Belongs to one garden.
- References one plant.

**---**

# Relationship Summary

users 1:N gardens

gardens 1:N garden_plants

plant_species 1:N garden_plants

garden_plants 1:N plant_evolution_records

gardens 1:N weather_records

gardens 1:N garden_layout_items

garden_plants 1:1 garden_layout_items

**---**

# SQLite Type Mapping

\| SQLite | Dart |
\|----------|----------|
\| INTEGER | int |
\| TEXT | String |
\| REAL | double |
\| INTEGER (0/1) | bool |
\| TEXT (ISO Date) | DateTime |

**---**

# Current SQLite Implementation

O modelo descrito neste documento representa o deseño previsto da base de datos completa de MARTOLA.

A implementación real da base de datos realizarase de maneira incremental a medida que se desenvolvan os diferentes módulos da aplicación.

Actualmente está implementada a infraestrutura SQLite v2 e a persistencia completa dos módulos de hortas, especies e plantas.

## Database

A base de datos local utiliza:

    martola.db

A apertura e creación da base de datos está centralizada en:

    DatabaseService

A versión actual da base de datos é:

    version: 2

A versión 2 introduce a primeira ampliación real do esquema SQLite de MARTOLA.

A evolución realizada é:

    version 1
        │
        │ migración v1 → v2
        ▼
    version 2

A migración conserva os datos existentes da táboa `gardens` e incorpora as táboas necesarias para iniciar o módulo de plantas.

## Implemented Tables

Actualmente están implementadas as seguintes táboas:

    gardens
    plant_species
    garden_plants

### gardens

Representa as hortas e xardíns creados polo usuario.

O esquema físico actual é:

    CREATE TABLE gardens (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      location TEXT NOT NULL,
      area REAL NOT NULL
    )

Actualmente están implementados:

- `id`
- `name`
- `location`
- `area`

Permanecen previstos para fases posteriores:

- `user_id`
- `description`
- `latitude`
- `longitude`
- `created_at`

### plant_species

Representa o catálogo de especies vexetais que poden ser utilizadas polas plantas dunha horta.

O esquema físico actual é:

    CREATE TABLE plant_species (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      common_name TEXT NOT NULL,
      scientific_name TEXT NOT NULL
    )

A primeira implementación é deliberadamente mínima.

Actualmente están implementados:

- `id`
- `common_name`
- `scientific_name`

Outros campos definidos no modelo obxectivo incorporaranse progresivamente cando sexan necesarios.

A táboa dispón ademais dun pequeno catálogo inicial local utilizado polo MVP.

`DatabaseService` comproba durante a apertura da base de datos se `plant_species` está baleira. Só nese caso insire as especies iniciais, evitando duplicados nos sucesivos arranques da aplicación.

### garden_plants

Representa unha planta concreta pertencente a unha horta.

O esquema físico actual é:

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

Actualmente están implementados:

- `id`
- `garden_id`
- `species_id`
- `custom_name`
- `planting_date`

`garden_id` relaciona cada planta coa horta á que pertence.

`species_id` relaciona cada planta coa súa especie.

A data de plantación almacénase como `TEXT` en formato ISO 8601 e represéntase mediante `DateTime` no modelo Dart.

## Referential Integrity

A versión 2 introduce as primeiras claves foráneas da base de datos.

As relacións implementadas son:

    gardens
       │
       │ 1:N
       ▼
    garden_plants
       ▲
       │ N:1
       │
    plant_species

SQLite require que a comprobación de claves foráneas estea activada para cada conexión.

`DatabaseService` realiza esta configuración mediante:

    PRAGMA foreign_keys = ON

### Garden deletion

A relación:

    garden_plants.garden_id
        ↓
    gardens.id

utiliza:

    ON DELETE CASCADE

Se unha horta é eliminada, SQLite elimina automaticamente as plantas asociadas a ela.

Este comportamento foi comprobado mediante unha proba transaccional:

    plantas antes de eliminar a horta: 1
    plantas despois de eliminar a horta: 0

### Plant species deletion

A relación:

    garden_plants.species_id
        ↓
    plant_species.id

utiliza:

    ON DELETE RESTRICT

Unha especie non pode ser eliminada mentres exista algunha planta que a utilice.

Este comportamento tamén foi comprobado mediante unha proba transaccional.

As probas temporais utilizaron rollback para evitar modificar permanentemente os datos da aplicación.

## Identifiers

As táboas implementadas utilizan:

    INTEGER PRIMARY KEY AUTOINCREMENT

para os seus identificadores.

SQLite é responsable de xerar automaticamente o identificador durante os `INSERT`.

Na representación actual dos modelos Dart, os identificadores mantéñense como `String?`.

Por este motivo, os Repositories SQLite encapsulan a conversión entre os identificadores `INTEGER` da base de datos e os `String` utilizados no dominio.

No caso das claves foráneas de `GardenPlant`, `toMap()` converte:

    gardenId  → int.parse(gardenId)
    speciesId → int.parse(speciesId)

e `fromMap()` realiza a conversión inversa mediante `toString()`.

Esta diferenza de representación permanece encapsulada na capa de acceso aos datos.


## Model Mapping

O modelo `Garden` incorpora conversións entre a representación utilizada pola aplicación e a utilizada pola base de datos.

Lectura desde SQLite:

    Map<String, Object?>
            ↓
    Garden.fromMap()
            ↓
          Garden

Escritura en SQLite:

          Garden
            ↓
        toMap()
            ↓
    Map<String, Object?>

`toMap()` non inclúe o identificador.

Durante un `INSERT`, SQLite xera o `id` mediante `AUTOINCREMENT`.

Durante un `UPDATE`, o identificador utilízase na condición `WHERE` para localizar a fila, pero non forma parte dos valores que se modifican.
Os novos modelos `GardenPlant` e `PlantSpecies` aplican o mesmo patrón de conversión.

`GardenPlant` utiliza:

    GardenPlant
        ↓ toMap()
    Map<String, Object?>
        ↓
    SQLite

e:

    SQLite
        ↓
    Map<String, Object?>
        ↓ GardenPlant.fromMap()
    GardenPlant

Os identificadores continúan representándose como `String` no dominio, aínda que SQLite utiliza `INTEGER`.

Por este motivo, `GardenPlant.toMap()` converte:

    gardenId  → int.parse(gardenId)
    speciesId → int.parse(speciesId)

e `GardenPlant.fromMap()` realiza a conversión inversa mediante `toString()`.

`plantingDate` utiliza:

    DateTime
        ↓ toIso8601String()
    TEXT
        ↓ DateTime.parse()
    DateTime

`PlantSpecies` utiliza tamén `toMap()` e `fromMap()` para converter entre a representación do dominio e a representación SQLite.

## Implemented CRUD Operations

As tres implementacións SQLite dispoñen actualmente das operacións persistentes necesarias para os módulos implementados.

### Gardens

`SQLiteGardenRepository` implementa:

    CREATE → addGarden()      → INSERT
    READ   → getGardens()     → SELECT
    READ   → getGardenById()  → SELECT ... WHERE
    UPDATE → updateGarden()   → UPDATE ... WHERE
    DELETE → removeGarden()   → DELETE ... WHERE

### Plant species

`SQLitePlantSpeciesRepository` implementa:

    CREATE → addSpecies()      → INSERT
    READ   → getSpecies()      → SELECT
    READ   → getSpeciesById()  → SELECT ... WHERE
    UPDATE → updateSpecies()   → UPDATE ... WHERE
    DELETE → removeSpecies()   → DELETE ... WHERE

### Garden plants

`SQLiteGardenPlantRepository` implementa:

    CREATE → addPlant()              → INSERT
    READ   → getPlantsByGardenId()   → SELECT ... WHERE garden_id
    READ   → getPlantById()          → SELECT ... WHERE id
    UPDATE → updatePlant()           → UPDATE ... WHERE
    DELETE → removePlant()           → DELETE ... WHERE

A lectura principal das plantas está contextualizada pola horta mediante `gardenId`, polo que non é necesario cargar globalmente todas as plantas da aplicación.

As operacións son asíncronas e devolven `Future`.

A persistencia do módulo de hortas foi comprobada creando, consultando, modificando e eliminando datos e verificando a súa conservación entre execucións.

Durante a sesión 15 comprobouse tamén o CRUD de especies e plantas e integrouse co fluxo real da interface mediante os seus respectivos ViewModels e Repositories.


## Pending Tables

As seguintes táboas do deseño previsto aínda non están implementadas:

- `users`
- `plant_evolution_records`
- `weather_records`
- `garden_layout_items`

Serán incorporadas progresivamente cando se desenvolvan os módulos correspondentes.

## Database Evolution

A estrutura da base de datos evoluciona mediante versións e migracións cando é necesario modificar o esquema existente.

Actualmente utilízase:

    version: 2

### Version 1

A versión 1 constituíu o primeiro esquema físico de MARTOLA e incluía:

    gardens

### Version 2

A versión 2 introduce:

    plant_species
    garden_plants

e as primeiras relacións mediante claves foráneas.

A evolución do esquema é:

    v1
    │
    │ CREATE TABLE plant_species
    │ CREATE TABLE garden_plants
    ▼
    v2

### New installations

Nunha instalación nova, `onCreate` crea directamente o esquema completo correspondente á versión actual:

    gardens
    plant_species
    garden_plants

Non é necesario crear primeiro o esquema v1 e posteriormente migralo.

### Existing installations

Nunha base de datos existente en versión 1, `onUpgrade` executa a primeira migración real de MARTOLA.

A migración utiliza:

    if (oldVersion < 2) {
      // cambios introducidos na versión 2
    }

Dentro desta migración créanse:

    plant_species
    garden_plants

A táboa `gardens` non se crea novamente porque xa existe nas bases de datos v1.

A migración v1 → v2 foi executada e comprobada correctamente.

A aplicación arrancou coa base de datos actualizada e conservou os datos existentes de `gardens`.

### Migration Strategy

As futuras migracións seguirán un modelo acumulativo:

    if (oldVersion < 2) {
      // cambios da versión 2
    }

    if (oldVersion < 3) {
      // cambios da versión 3
    }

    if (oldVersion < 4) {
      // cambios da versión 4
    }

Isto permitirá que unha base de datos antiga aplique todos os cambios necesarios ata alcanzar o esquema actual.

A versión da base de datos seguirá sendo independente da versión da aplicación e só se incrementará cando exista un cambio real no esquema.

**---**

# Initial Dataset

A primeira versión da aplicación incluirá unha pequena colección de especies vexetais predefinidas:

- Tomate
- Leituga
- Pemento
- Cenoria
- Amorodo
- Albahaca

Estas especies almacenaranse localmente.

**---**

# Future Improvements

Posibles ampliacións futuras:

- API botánica externa.
- Sincronización cloud.
- Compartición de hortas.
- Sistema multiusuario.
- Fotografías almacenadas remotamente.
- Integración con sensores ambientais.

**---**

# Notes

O deseño da base de datos segue un enfoque modular e escalable.

A estrutura proposta permite implementar unha primeira versión completamente funcional utilizando SQLite e facilita futuras ampliacións sen modificar significativamente o modelo de datos.

**---**

## Current Implementation Note

A infraestrutura SQLite está actualmente implementada e operativa na versión 2.

O módulo de hortas utiliza:

    SQLiteGardenRepository
            ↓
    DatabaseService
            ↓
          SQLite
            ↓
        martola.db

A táboa `gardens` dispón dun CRUD persistente completo.

Tamén están creadas e validadas estruturalmente:

    plant_species
    garden_plants

Os modelos Dart correspondentes son:

    PlantSpecies
    GardenPlant

Ambos dispoñen de conversión entre modelos de dominio e representación SQLite mediante `toMap()` e `fromMap()`.

Están definidos os contratos:

    PlantSpeciesRepository
    GardenPlantRepository

As implementacións SQLite destes novos repositorios aínda non están desenvolvidas.

A seguinte tarefa prevista é iniciar:

    SQLitePlantSpeciesRepository

As relacións entre `gardens`, `garden_plants` e `plant_species` están protexidas mediante claves foráneas e comprobáronse os comportamentos `ON DELETE CASCADE` e `ON DELETE RESTRICT`.

`MemoryGardenRepository` mantense como implementación alternativa de `GardenRepository`, pero non constitúe o mecanismo principal de almacenamento.

A implementación continuará de maneira incremental.

O deseño completo documentado neste ficheiro representa o modelo obxectivo de MARTOLA, mentres que `Current SQLite Implementation` documenta o subconxunto que existe realmente en cada fase do desenvolvemento.