# ARCHITECTURE.md

# MARTOLA - Architecture Documentation

## Purpose

Este documento define a arquitectura software da aplicación MARTOLA.

O seu obxectivo é proporcionar unha guía clara para:

- Organización do código.
- Separación de responsabilidades.
- Escalabilidade futura.
- Mantemento do proxecto.
- Coherencia entre módulos.
- Apoio á elaboración da memoria final.

---

# Architecture Overview

MARTOLA utiliza unha arquitectura baseada en MVVM simplificado combinada co Repository Pattern.

Fluxo principal:

```text
View
  ↓
ViewModel
  ↓
Repository
  ↓
DatabaseService / External Service
  ↓
SQLite / API
```

A arquitectura segue un enfoque Local First.

---

# Current Implementation State

A arquitectura está actualmente aplicada aos módulos de hortas, especies, plantas e evolución das plantas.

A composición principal realízase en `main.dart`.

```text
main.dart
  ↓
DatabaseService
  ↓
Repositories concretos
  ↓
ViewModels
  ↓
MultiProvider
  ↓
Views
```

Actualmente están integrados:

```text
GardensViewModel
PlantSpeciesViewModel
PlantsViewModel
PlantEvolutionViewModel
```

Todos eles estenden `ChangeNotifier`.

As implementacións SQLite activas son:

```text
SQLiteGardenRepository
SQLitePlantSpeciesRepository
SQLiteGardenPlantRepository
SQLitePlantEvolutionRecordRepository
```

Todos os Repositories SQLite comparten a mesma instancia de `DatabaseService`.

A base de datos utiliza actualmente:

```text
version: 3
```

Táboas implementadas:

```text
gardens
plant_species
garden_plants
plant_evolution_records
```

Migracións comprobadas:

```text
v1 → v2
v2 → v3
```

A arquitectura xa soporta o seguinte fluxo funcional:

```text
Garden
  ↓
GardenPlant
  ↓
PlantEvolutionRecord
```

coa relación adicional:

```text
PlantSpecies
  ↓
GardenPlant
```

---

# Architecture Layers

## Model Layer

Responsable de representar as entidades do dominio.

Non debe conter:

- Widgets.
- Navegación.
- Consultas SQL directas.
- Chamadas HTTP directas.
- Lóxica visual.

Modelos actualmente implementados:

- `Garden`
- `PlantSpecies`
- `GardenPlant`
- `PlantEvolutionRecord`

Modelos previstos:

- `User`
- `WeatherRecord`
- `GardenLayoutItem`

Os modelos manteñen, na medida do posible, un carácter inmutable.

As actualizacións realízanse creando novas instancias.

---

## Model Mapping

Os modelos poden proporcionar:

```text
toMap()
fromMap()
```

para converter entre o dominio e SQLite.

### Identifiers

No dominio:

```dart
String? id
```

En SQLite:

```text
INTEGER PRIMARY KEY AUTOINCREMENT
```

A conversión queda encapsulada na capa Repository ou no mapping do modelo.

### Dates

No dominio:

```dart
DateTime
```

En SQLite:

```text
TEXT ISO 8601
```

### Optional fields

Os campos opcionais do dominio poden persistirse como:

```text
NULL
```

Exemplo:

```text
PlantEvolutionRecord.height
PlantEvolutionRecord.notes
```

---

# View Layer

A View é responsable de:

- Mostrar información.
- Capturar interaccións.
- Manter estado local de interface.
- Executar navegación cando coñece o fluxo.
- Delegar operacións de dominio nos ViewModels.

Non debe conter:

- SQL.
- Acceso directo á base de datos.
- Lóxica persistente.
- Regras de negocio complexas.

Pantallas actualmente implementadas:

## General

- `HomeScreen`
- `DashboardScreen`

## Gardens

- `GardensScreen`
- `GardenDetailsScreen`
- `CreateGardenScreen`
- `EditGardenScreen`

## Plants

- `PlantListScreen`
- `AddPlantScreen`
- `PlantDetailsScreen`
- `EditPlantScreen`

## Plant Evolution

- `PlantEvolutionListScreen`
- `AddPlantEvolutionRecordScreen`
- `PlantEvolutionDetailsScreen`
- `EditPlantEvolutionRecordScreen`

## Provisional

- `TasksScreen`
- `CreateTaskScreen`

As Views manteñen localmente:

- `TextEditingController`
- `FormState`
- valores seleccionados
- datas temporais
- outros datos propios da interacción

---

# Presentation Widgets

Os widgets reutilizables deben limitarse, sempre que sexa posible, á presentación e á comunicación de eventos.

Exemplos:

## Dashboard

- `WeatherCard`
- `GardenCard`
- `TasksCard`
- `QuickActionsCard`

## Gardens

- `GardenListItem`

As interaccións comunícanse mediante callbacks cando isto evita acoplamento coa navegación.

Exemplo:

```dart
final VoidCallback onPressed;
```

ou:

```dart
final void Function(Garden) onTap;
```

---

# ViewModel Layer

Responsable de:

- Estado compartido.
- Coordinación entre Views e Repositories.
- Operacións de carga.
- Actualización de coleccións.
- Notificación de cambios mediante `notifyListeners()`.
- Consulta síncrona sobre datos xa cargados.

---

## GardensViewModel

Mantén:

```dart
final List<Garden> _gardens = [];
```

Operacións:

```text
loadGardens()
addGarden()
getGardenById()
updateGarden()
removeGarden()
```

Depende de:

```text
GardenRepository
```

---

## PlantSpeciesViewModel

Mantén:

```dart
final List<PlantSpecies> _species = [];
```

Operacións:

```text
loadSpecies()
addSpecies()
getSpeciesById()
updateSpecies()
removeSpecies()
```

Depende de:

```text
PlantSpeciesRepository
```

O catálogo é global dentro do estado actual da aplicación.

---

## PlantsViewModel

Mantén:

```dart
String? _currentGardenId;
final List<GardenPlant> _plants = [];
```

Operacións:

```text
loadPlants(gardenId)
addPlant()
getPlantById()
updatePlant()
removePlant()
```

Depende de:

```text
GardenPlantRepository
```

`_currentGardenId` contextualiza o estado.

Isto evita acumular nunha mesma colección plantas de diferentes hortas.

---

## PlantEvolutionViewModel

Mantén:

```dart
String? _currentPlantId;
final List<PlantEvolutionRecord> _records = [];
```

Operacións:

```text
loadRecords(plantId)
addRecord()
getRecordById()
updateRecord()
removeRecord()
```

Depende de:

```text
PlantEvolutionRecordRepository
```

`_currentPlantId` contextualiza os rexistros da planta seleccionada.

Isto segue o mesmo patrón usado previamente en `PlantsViewModel`.

---

# State Scope

MARTOLA distingue entre diferentes tipos de estado.

## Local State

Pertence a unha única pantalla.

Exemplos:

```text
TextEditingController
FormState
_selectedSpeciesId
_date
```

## Shared Global State

Exemplo:

```text
PlantSpeciesViewModel
```

## Shared Contextual State

Exemplos:

```text
PlantsViewModel
→ plantas da horta actual

PlantEvolutionViewModel
→ rexistros da planta actual
```

Compartido non implica necesariamente cargar todos os datos da aplicación.

---

# Repository Layer

Responsable de abstraer o acceso e manipulación dos datos.

Os ViewModels dependen de contratos, non de implementacións concretas.

Contratos actuais:

```text
GardenRepository
PlantSpeciesRepository
GardenPlantRepository
PlantEvolutionRecordRepository
```

Implementacións:

```text
SQLiteGardenRepository
SQLitePlantSpeciesRepository
SQLiteGardenPlantRepository
SQLitePlantEvolutionRecordRepository
```

Implementación alternativa:

```text
MemoryGardenRepository
```

---

# Repository Responsibilities

## GardenRepository

```text
getGardens()
addGarden()
getGardenById()
updateGarden()
removeGarden()
```

---

## PlantSpeciesRepository

```text
getSpecies()
addSpecies()
getSpeciesById()
updateSpecies()
removeSpecies()
```

---

## GardenPlantRepository

```text
getPlantsByGardenId()
addPlant()
getPlantById()
updatePlant()
removePlant()
```

A lectura principal está contextualizada por:

```text
gardenId
```

---

## PlantEvolutionRecordRepository

```text
getRecordsByPlantId()
addRecord()
getRecordById()
updateRecord()
removeRecord()
```

A lectura principal está contextualizada por:

```text
plantId
```

---

# Database Service Layer

`DatabaseService` representa a infraestrutura común de SQLite.

Responsabilidades:

- Seleccionar a factoría SQLite segundo a plataforma.
- Inicializar FFI cando sexa necesario.
- Determinar a ruta de `martola.db`.
- Abrir e reutilizar a conexión.
- Activar claves foráneas.
- Crear o esquema actual.
- Xestionar versións.
- Xestionar migracións.
- Servir a conexión aos Repositories.

Non debe conter lóxica de presentación nin responsabilidade específica dun ViewModel.

---

# SQLite Multiplatform Strategy

```text
Android
  ↓
sqflite

Windows / Linux
  ↓
sqflite_common_ffi
```

`DatabaseService` encapsula esta diferenza.

As capas superiores non necesitan coñecer a factoría utilizada.

---

# Database Path

Utilízanse:

```text
getApplicationDocumentsDirectory()
join()
```

para construír unha ruta compatible coa plataforma.

Nome da base:

```text
martola.db
```

---

# Database Versioning

## Current Version

```text
version: 3
```

## Version 1

```text
gardens
```

## Version 2

Engadiu:

```text
plant_species
garden_plants
```

## Version 3

Engadiu:

```text
plant_evolution_records
```

---

# Migration Strategy

`onCreate()` crea directamente o esquema correspondente á versión actual.

Nunha instalación nova v3:

```text
gardens
plant_species
garden_plants
plant_evolution_records
```

`onUpgrade()` utiliza migracións acumulativas:

```dart
if (oldVersion < 2) {
  // cambios v2
}

if (oldVersion < 3) {
  // cambios v3
}
```

Isto permite actualizar desde versións antigas sen perder datos.

A migración:

```text
v2 → v3
```

foi comprobada mantendo hortas e plantas xa existentes.

---

# Foreign Keys

As claves foráneas actívanse mediante:

```sql
PRAGMA foreign_keys = ON
```

en `onConfigure`.

## Garden → GardenPlant

```text
garden_plants.garden_id
        ↓
gardens.id
```

```text
ON DELETE CASCADE
```

## PlantSpecies → GardenPlant

```text
garden_plants.species_id
        ↓
plant_species.id
```

```text
ON DELETE RESTRICT
```

## GardenPlant → PlantEvolutionRecord

```text
plant_evolution_records.plant_id
        ↓
garden_plants.id
```

```text
ON DELETE CASCADE
```

Consecuencia:

```text
Eliminar Garden
→ elimina GardenPlant
→ elimina PlantEvolutionRecord
```

A especie mantense protexida se está sendo utilizada.

---

# Dependency Injection

As dependencias créanse en `main.dart`.

Fluxo conceptual:

```text
DatabaseService
  ↓
Repositories SQLite
  ↓
ViewModels
  ↓
MultiProvider
  ↓
Views
```

Exemplo simplificado:

```text
SQLitePlantEvolutionRecordRepository
              ↓
PlantEvolutionRecordRepository
              ↓
PlantEvolutionViewModel
              ↓
ChangeNotifierProvider
              ↓
Views
```

Os ViewModels non crean internamente os seus Repositories.

---

# Current Provider Composition

Conceptualmente:

```text
MultiProvider
├── GardensViewModel
├── PlantSpeciesViewModel
├── PlantsViewModel
└── PlantEvolutionViewModel
    ↓
MaterialApp
    ↓
Views
```

Carga inicial:

```text
GardensViewModel
→ loadGardens()

PlantSpeciesViewModel
→ loadSpecies()
```

Carga contextual:

```text
PlantsViewModel
→ loadPlants(gardenId)

PlantEvolutionViewModel
→ loadRecords(plantId)
```

---

# Provider Usage

## context.read()

Utilizado para executar accións sen subscribirse aos cambios.

Exemplos:

```text
addGarden()
addPlant()
addRecord()
removeRecord()
```

---

## context.watch()

Utilizado cando a View depende do estado compartido.

Exemplo:

```dart
final records =
    context.watch<PlantEvolutionViewModel>().records;
```

---

## context.select()

Utilizado cando a View necesita observar un valor concreto.

Exemplos:

```text
Garden concreto
Plant concreta
PlantEvolutionRecord concreto
número de plantas
```

---

# Provider vs Persistence

Provider non é persistencia.

Separación:

```text
SQLite
→ fonte persistente

Repository
→ abstracción de acceso

ViewModel
→ estado cargado e observable

Provider
→ distribución do ViewModel

View
→ presentación e interacción
```

Pechar a aplicación non elimina os datos persistidos.

---

# Navigation Strategy

Actualmente utilízase:

```text
Navigator.push()
Navigator.pop()
MaterialPageRoute
```

Non se introducirá outra solución mentres esta cubra correctamente as necesidades do proxecto.

---

# Identity-Based Navigation

As pantallas de detalle reciben preferentemente identificadores.

## Garden

```text
GardensScreen
  ↓ gardenId
GardenDetailsScreen
  ↓
GardensViewModel.getGardenById()
```

## Plant

```text
PlantListScreen
  ↓ plantId
PlantDetailsScreen
  ↓
PlantsViewModel.getPlantById()
```

## Evolution Record

```text
PlantEvolutionListScreen
  ↓ recordId
PlantEvolutionDetailsScreen
  ↓
PlantEvolutionViewModel.getRecordById()
```

Isto permite que as pantallas de detalle obteñan a versión actual da entidade desde o estado compartido.

---

# Context Loading

Cando unha pantalla necesita establecer un contexto, utilízase `initState()`.

Exemplo conceptual:

```text
GardenDetailsScreen
→ loadPlants(gardenId)

PlantEvolutionListScreen
→ loadRecords(plantId)
```

Isto evita iniciar cargas repetidas directamente desde `build()`.

---

# Current Navigation Flow

```text
HomeScreen
  ↓
DashboardScreen
  ↓
GardensScreen
  ↓
GardenDetailsScreen
  ↓
PlantListScreen
  ↓
PlantDetailsScreen
  ↓
PlantEvolutionListScreen
  ↓
PlantEvolutionDetailsScreen
```

Fluxos secundarios:

```text
GardenDetailsScreen
├── EditGardenScreen
└── eliminar horta

PlantListScreen
└── AddPlantScreen

PlantDetailsScreen
├── EditPlantScreen
├── eliminar planta
└── PlantEvolutionListScreen

PlantEvolutionListScreen
└── AddPlantEvolutionRecordScreen

PlantEvolutionDetailsScreen
├── EditPlantEvolutionRecordScreen
└── eliminar rexistro
```

---

# Folder Structure

```text
lib/
├── core/
├── models/
├── views/
├── viewmodels/
├── repositories/
├── services/
├── database/
├── widgets/
├── utils/
└── main.dart
```

---

# Current Models

```text
models/
├── garden.dart
├── plant_species.dart
├── garden_plant.dart
└── plant_evolution_record.dart
```

---

# Current ViewModels

```text
viewmodels/
├── gardens_viewmodel.dart
├── plant_species_viewmodel.dart
├── plants_viewmodel.dart
└── plant_evolution_viewmodel.dart
```

---

# Current Repositories

```text
repositories/
├── garden_repository.dart
├── memory_garden_repository.dart
├── sqlite_garden_repository.dart
├── plant_species_repository.dart
├── sqlite_plant_species_repository.dart
├── garden_plant_repository.dart
├── sqlite_garden_plant_repository.dart
├── plant_evolution_record_repository.dart
└── sqlite_plant_evolution_record_repository.dart
```

---

# Current Services

```text
services/
└── database_service.dart
```

---

# Data Layer

## SQLite

Fonte persistente local actualmente utilizada.

## External APIs

Prevista:

- OpenWeatherMap

Posibles futuras:

- APIs botánicas.
- Servizos cloud.
- Sincronización remota.

---

# Local First Strategy

A aplicación prioriza o almacenamento local.

Beneficios:

- Funciona sen conexión.
- Menor complexidade inicial.
- Desenvolvemento incremental.
- Maior control sobre o MVP.
- Menor dependencia de infraestrutura externa.

A sincronización cloud poderá incorporarse posteriormente.

---

# Current Dependency Flow

A estrutura xeral é:

```text
View
  ↓
ViewModel
  ↓ async
Repository
  ↓
DatabaseService
  ↓
SQLite
```

Aplicada aos módulos:

```text
GardensViewModel
  ↓
GardenRepository
  ↑
SQLiteGardenRepository
```

```text
PlantSpeciesViewModel
  ↓
PlantSpeciesRepository
  ↑
SQLitePlantSpeciesRepository
```

```text
PlantsViewModel
  ↓
GardenPlantRepository
  ↑
SQLiteGardenPlantRepository
```

```text
PlantEvolutionViewModel
  ↓
PlantEvolutionRecordRepository
  ↑
SQLitePlantEvolutionRecordRepository
```

Todos os Repositories SQLite converxen en:

```text
DatabaseService
  ↓
SQLite
```

---

# Current Architectural Milestone

A arquitectura xa foi reutilizada con éxito en varios módulos.

O patrón inicial:

```text
Garden
```

foi estendido a:

```text
PlantSpecies
GardenPlant
PlantEvolutionRecord
```

sen introducir dependencias SQLite nas Views nin nos ViewModels.

Isto valida na práctica a capacidade da arquitectura para crecer mantendo responsabilidades separadas.

O módulo de evolución completado na sesión 16 utiliza exactamente a mesma estrutura:

```text
View
  ↓
PlantEvolutionViewModel
  ↓
PlantEvolutionRecordRepository
  ↓
SQLitePlantEvolutionRecordRepository
  ↓
DatabaseService
  ↓
SQLite
```

---

# Future Architecture Evolution

Posibles ampliacións:

- OpenWeatherMap.
- Repository para meteoroloxía.
- ViewModel meteorolóxico.
- Layout Designer.
- Sincronización cloud.
- Firebase ou Supabase.
- Authentication.
- Push Notifications.
- AI Services.
- Exportación de históricos.
- Xestión de ficheiros e fotografías.

Estas ampliacións só se introducirán cando exista unha necesidade funcional real.

---

# Architectural Principles

- Manter a arquitectura simple.
- Separar UI, estado e persistencia.
- Depender de abstraccións sempre que resulte útil.
- Centralizar a infraestrutura SQLite.
- Evitar acceso SQL desde Views ou ViewModels.
- Evitar ViewModels excesivamente grandes.
- Crear Repositories cunha responsabilidade clara.
- Manter estado contextual cando a colección depende dunha entidade pai.
- Utilizar identificadores para manter sincronizadas as pantallas de detalle.
- Non introducir capas adicionais sen beneficio claro.
- Priorizar funcionalidade e comprensión sobre sofisticación arquitectónica.
- Manter a documentación sincronizada co código real.

---

# Notes

A arquitectura actual é suficiente para o MVP e xa soporta varios módulos persistentes e relacionados entre si.

As futuras ampliacións deberán respectar a separación de responsabilidades definida neste documento.

O obxectivo segue sendo construír unha aplicación funcional, comprensible e mantible antes de introducir complexidade adicional.
