# ARCHITECTURE.md

# MARTOLA - Architecture Documentation

## Purpose

Este documento define a arquitectura software da aplicación MARTOLA.

O seu obxectivo é proporcionar unha guía clara para:

-   Organización do código.
-   Separación de responsabilidades.
-   Escalabilidade futura.
-   Mantemento do proxecto.
-   Coherencia entre módulos.
-   Apoio á elaboración da memoria final.

------------------------------------------------------------------------

# Architecture Overview

MARTOLA utiliza unha arquitectura baseada en MVVM simplificado combinada
co Repository Pattern.

Fluxo principal:

``` text
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

------------------------------------------------------------------------

# Current Implementation State

A arquitectura está actualmente aplicada aos módulos de hortas,
especies, plantas, evolución das plantas, meteoroloxía, xeocodificación e deseño visual da horta.

A composición principal realízase en `main.dart`.

``` text
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

``` text
GardensViewModel
PlantSpeciesViewModel
PlantsViewModel
PlantEvolutionViewModel
WeatherViewModel
GeocodingViewModel
GardenLayoutViewModel
```

Todos eles estenden `ChangeNotifier`.

As implementacións SQLite activas son:

``` text
SQLiteGardenRepository
SQLitePlantSpeciesRepository
SQLiteGardenPlantRepository
SQLitePlantEvolutionRecordRepository
SqliteGardenLayoutRepository
OpenWeatherRepository
OpenWeatherGeocodingRepository
GardenLayoutRepository
```

Todos os Repositories SQLite comparten a mesma instancia de
`DatabaseService`.

A base de datos utiliza actualmente:

``` text
version: 5
```

Táboas implementadas:

``` text
gardens
plant_species
garden_plants
plant_evolution_records
garden_layout_items
```

Migracións comprobadas:

``` text
v1 → v2
v2 → v3
v3 → v4
v4 → v5
```

A arquitectura xa soporta o seguinte fluxo funcional:

``` text
Garden
  ↓
GardenPlant
  ↓
PlantEvolutionRecord
```

coa relación adicional:

``` text
PlantSpecies
  ↓
GardenPlant
```

------------------------------------------------------------------------

# Architecture Layers

## Model Layer

Responsable de representar as entidades do dominio.

Non debe conter:

-   Widgets.
-   Navegación.
-   Consultas SQL directas.
-   Chamadas HTTP directas.
-   Lóxica visual.

Modelos actualmente implementados:

-   `Garden`
-   `PlantSpecies`
-   `GardenPlant`
-   `PlantEvolutionRecord`
-   `WeatherData`
-   `GeocodingResult`
-   `GardenLayoutItem`

Modelos previstos:

-   `User`
-   `WeatherRecord`

Os modelos manteñen, na medida do posible, un carácter inmutable.

As actualizacións realízanse creando novas instancias.

------------------------------------------------------------------------

## Model Mapping

Os modelos poden proporcionar:

``` text
toMap()
fromMap()
```

para converter entre o dominio e SQLite.

### Identifiers

No dominio:

``` dart
String? id
```

En SQLite:

``` text
INTEGER PRIMARY KEY AUTOINCREMENT
```

A conversión queda encapsulada na capa Repository ou no mapping do
modelo.

### Dates

No dominio:

``` dart
DateTime
```

En SQLite:

``` text
TEXT ISO 8601
```

### Optional fields

Os campos opcionais do dominio poden persistirse como:

``` text
NULL
```

Exemplo:

``` text
PlantEvolutionRecord.height
PlantEvolutionRecord.notes
Garden.latitude
Garden.longitude
```

------------------------------------------------------------------------

# View Layer

A View é responsable de:

-   Mostrar información.
-   Capturar interaccións.
-   Manter estado local de interface.
-   Executar navegación cando coñece o fluxo.
-   Delegar operacións de dominio nos ViewModels.

Non debe conter:

-   SQL.
-   Acceso directo á base de datos.
-   Lóxica persistente.
-   Regras de negocio complexas.

Pantallas actualmente implementadas:

## General

-   `HomeScreen`
-   `DashboardScreen`

## Gardens

-   `GardensScreen`
-   `GardenDetailsScreen`
-   `CreateGardenScreen`
-   `EditGardenScreen`

## Plants

-   `PlantListScreen`
-   `AddPlantScreen`
-   `PlantDetailsScreen`
-   `EditPlantScreen`

## Plant Evolution

-   `PlantEvolutionListScreen`
-   `AddPlantEvolutionRecordScreen`
-   `PlantEvolutionDetailsScreen`
-   `EditPlantEvolutionRecordScreen`

## Garden Layout

-   `LayoutDesignerScreen`

## Provisional

-   `TasksScreen`
-   `CreateTaskScreen`

As Views manteñen localmente:

-   `TextEditingController`
-   `FormState`
-   valores seleccionados
-   datas temporais
-   outros datos propios da interacción

------------------------------------------------------------------------

# Presentation Widgets

Os widgets reutilizables deben limitarse, sempre que sexa posible, á
presentación e á comunicación de eventos.

Exemplos:

## Dashboard

-   `GardenCard`
-   `TasksCard`
-   `QuickActionsCard`

## Gardens

-   `GardenListItem`

## Shared

-   `WeatherCard` (`lib/widgets/`)

As interaccións comunícanse mediante callbacks cando isto evita
acoplamento coa navegación.

Exemplo:

``` dart
final VoidCallback onPressed;
```

ou:

``` dart
final void Function(Garden) onTap;
```

------------------------------------------------------------------------

# ViewModel Layer

Responsable de:

-   Estado compartido.
-   Coordinación entre Views e Repositories.
-   Operacións de carga.
-   Actualización de coleccións.
-   Notificación de cambios mediante `notifyListeners()`.
-   Consulta síncrona sobre datos xa cargados.

------------------------------------------------------------------------

## GardensViewModel

Mantén:

``` dart
final List<Garden> _gardens = [];
```

Operacións:

``` text
loadGardens()
addGarden()
getGardenById()
updateGarden()
removeGarden()
```

Depende de:

``` text
GardenRepository
```

------------------------------------------------------------------------

## PlantSpeciesViewModel

Mantén:

``` dart
final List<PlantSpecies> _species = [];
```

Operacións:

``` text
loadSpecies()
addSpecies()
getSpeciesById()
updateSpecies()
removeSpecies()
```

Depende de:

``` text
PlantSpeciesRepository
```

O catálogo é global dentro do estado actual da aplicación.

------------------------------------------------------------------------

## PlantsViewModel

Mantén:

``` dart
String? _currentGardenId;
final List<GardenPlant> _plants = [];
```

Operacións:

``` text
loadPlants(gardenId)
addPlant()
getPlantById()
updatePlant()
removePlant()
```

Depende de:

``` text
GardenPlantRepository
```

`_currentGardenId` contextualiza o estado.

Isto evita acumular nunha mesma colección plantas de diferentes hortas.

------------------------------------------------------------------------

## PlantEvolutionViewModel

Mantén:

``` dart
String? _currentPlantId;
final List<PlantEvolutionRecord> _records = [];
```

Operacións:

``` text
loadRecords(plantId)
addRecord()
getRecordById()
updateRecord()
removeRecord()
```

Depende de:

``` text
PlantEvolutionRecordRepository
```

`_currentPlantId` contextualiza os rexistros da planta seleccionada.

Isto segue o mesmo patrón usado previamente en `PlantsViewModel`.

------------------------------------------------------------------------

## GardenLayoutViewModel

Mantén os elementos de deseño da horta actual:

``` dart
final List<GardenLayoutItem> _items = [];
```

Operacións principais:

``` text
loadItems(gardenId)
addItem()
updateItem()
removeItem()
updateItemPositionLocally()
```

Depende de:

``` text
GardenLayoutRepository
```

O movemento durante `onPanUpdate` actualízase primeiro en memoria mediante `updateItemPositionLocally()`. A persistencia en SQLite realízase ao finalizar o arrastre con `updateItem()`, evitando escrituras continuas durante cada pequeno movemento do punteiro.

------------------------------------------------------------------------

## WeatherViewModel

Mantén:

``` dart
WeatherData? _weatherData;
bool _isLoading = false;
String? _errorMessage;
```

Operación principal:

``` text
loadCurrentWeather(latitude, longitude)
```

Depende de:

``` text
WeatherRepository
```

Representa explicitamente os estados dunha operación asíncrona:

``` text
loading
data
error
```

O ViewModel non coñece OpenWeather nin realiza peticións HTTP
directamente. Depende do contrato `WeatherRepository`, o que permite
substituír a implementación meteorolóxica sen modificar a capa de
presentación.

------------------------------------------------------------------------


## GeocodingViewModel

Mantén:

``` dart
List<GeocodingResult>? _results;
bool _isLoading = false;
String? _errorMessage;
```

Operación principal:

``` text
searchLocation(location)
```

Depende de:

``` text
GeocodingRepository
```

Representa os estados de carga, resultados e erro da busca de localidades. A lista nula indica que aínda non se realizou unha busca; unha lista baleira indica unha busca correcta sen coincidencias.

---

# State Scope

MARTOLA distingue entre diferentes tipos de estado.

## Local State

Pertence a unha única pantalla.

Exemplos:

``` text
TextEditingController
FormState
_selectedSpeciesId
_date
```

## Shared Global State

Exemplo:

``` text
PlantSpeciesViewModel
```

## Shared Contextual State

Exemplos:

``` text
PlantsViewModel
→ plantas da horta actual

PlantEvolutionViewModel
→ rexistros da planta actual

GardenLayoutViewModel
→ elementos do deseño da horta actual
```

Compartido non implica necesariamente cargar todos os datos da
aplicación.

------------------------------------------------------------------------

# Repository Layer

Responsable de abstraer o acceso e manipulación dos datos.

Os ViewModels dependen de contratos, non de implementacións concretas.

Contratos actuais:

``` text
GardenRepository
PlantSpeciesRepository
GardenPlantRepository
PlantEvolutionRecordRepository
WeatherRepository
GeocodingRepository
```

Implementacións:

``` text
SQLiteGardenRepository
SQLitePlantSpeciesRepository
SQLiteGardenPlantRepository
SQLitePlantEvolutionRecordRepository
OpenWeatherRepository
OpenWeatherGeocodingRepository
SqliteGardenLayoutRepository
```

Implementación alternativa:

``` text
MemoryGardenRepository
```

------------------------------------------------------------------------

# Repository Responsibilities

## GardenRepository

``` text
getGardens()
addGarden()
getGardenById()
updateGarden()
removeGarden()
```

------------------------------------------------------------------------

## PlantSpeciesRepository

``` text
getSpecies()
addSpecies()
getSpeciesById()
updateSpecies()
removeSpecies()
```

------------------------------------------------------------------------

## GardenPlantRepository

``` text
getPlantsByGardenId()
addPlant()
getPlantById()
updatePlant()
removePlant()
```

A lectura principal está contextualizada por:

``` text
gardenId
```

------------------------------------------------------------------------

## PlantEvolutionRecordRepository

``` text
getRecordsByPlantId()
addRecord()
getRecordById()
updateRecord()
removeRecord()
```

A lectura principal está contextualizada por:

``` text
plantId
```

------------------------------------------------------------------------

## GardenLayoutRepository

``` text
getItemsByGardenId()
addItem()
updateItem()
removeItem()
```

A implementación actual é:

``` text
SqliteGardenLayoutRepository
```

A lectura está contextualizada por `gardenId`. A táboa garante ademais que unha mesma planta non poida aparecer máis dunha vez no deseño.

------------------------------------------------------------------------

## WeatherRepository

Operación:

``` text
getCurrentWeather(
  latitude,
  longitude,
)
```

A interface recibe coordenadas e devolve un `WeatherData`.

A implementación actual é:

``` text
OpenWeatherRepository
```

`OpenWeatherRepository` delega a comunicación HTTP en `WeatherService`.
Deste xeito, `WeatherViewModel` depende do contrato meteorolóxico e non
dun provedor externo concreto.

------------------------------------------------------------------------


## GeocodingRepository

Operación:

``` text
getGeocodingResults(location)
```

A interface recibe o texto dunha localización e devolve unha lista de `GeocodingResult`. A implementación actual é `OpenWeatherGeocodingRepository`, que delega a comunicación HTTP en `GeocodingService`.

---

# Service Layer

Os Services encapsulan infraestrutura ou comunicación con sistemas
externos que non debe aparecer nas Views nin nos ViewModels.

Actualmente existen tres responsabilidades principais:

``` text
DatabaseService
→ infraestrutura SQLite

WeatherService
→ comunicación HTTP meteorolóxica con OpenWeather

GeocodingService
→ busca de localidades e coordenadas mediante OpenWeather Geocoding API
```

## WeatherService

Responsable de:

-   Construír a URI da petición.
-   Executar a petición HTTP GET.
-   Procesar a resposta JSON.
-   Crear `WeatherData` mediante `WeatherData.fromJson()`.
-   Interpretar códigos de estado HTTP.
-   Detectar fallos de conexión.
-   Aplicar un timeout á petición.
-   Lanzar `WeatherException` cando a operación non pode completarse.

Fluxo:

``` text
OpenWeatherRepository
  ↓
WeatherService
  ↓
HTTP GET
  ↓
OpenWeather API
```

`WeatherException` permite propagar os erros meteorolóxicos ás capas
superiores sen introducir detalles HTTP na interface.

------------------------------------------------------------------------


## GeocodingService

Responsable de construír e executar a petición á Direct Geocoding API de OpenWeather, converter o array JSON nunha `List<GeocodingResult>`, aplicar timeout e traducir erros técnicos a `GeocodingException`.

Fluxo:

``` text
OpenWeatherGeocodingRepository
  ↓
GeocodingService
  ↓
HTTP GET
  ↓
OpenWeather Geocoding API
```

---

# Database Service Layer

`DatabaseService` representa a infraestrutura común de SQLite.

Responsabilidades:

-   Seleccionar a factoría SQLite segundo a plataforma.
-   Inicializar FFI cando sexa necesario.
-   Determinar a ruta de `martola.db`.
-   Abrir e reutilizar a conexión.
-   Activar claves foráneas.
-   Crear o esquema actual.
-   Xestionar versións.
-   Xestionar migracións.
-   Servir a conexión aos Repositories.

Non debe conter lóxica de presentación nin responsabilidade específica
dun ViewModel.

------------------------------------------------------------------------

# SQLite Multiplatform Strategy

``` text
Android
  ↓
sqflite

Windows / Linux
  ↓
sqflite_common_ffi
```

`DatabaseService` encapsula esta diferenza.

As capas superiores non necesitan coñecer a factoría utilizada.

------------------------------------------------------------------------

# Database Path

Utilízanse:

``` text
getApplicationDocumentsDirectory()
join()
```

para construír unha ruta compatible coa plataforma.

Nome da base:

``` text
martola.db
```

------------------------------------------------------------------------

# Database Versioning

## Current Version

``` text
version: 5
```

## Version 1

``` text
gardens
```

## Version 2

Engadiu:

``` text
plant_species
garden_plants
```

## Version 3

Engadiu:

``` text
plant_evolution_records
```

## Version 4

Engadiu `latitude` e `longitude` opcionais a `gardens`.

## Version 5

Engadiu:

``` text
garden_layout_items
```

coas relacións a `gardens` e `garden_plants`, coordenadas normalizadas e `UNIQUE (garden_plant_id)`.

------------------------------------------------------------------------

# Migration Strategy

`onCreate()` crea directamente o esquema correspondente á versión
actual.

Nunha instalación nova v5:

``` text
gardens
plant_species
garden_plants
plant_evolution_records
garden_layout_items
```

`onUpgrade()` utiliza migracións acumulativas:

``` dart
if (oldVersion < 2) {
  // cambios v2
}

if (oldVersion < 3) {
  // cambios v3
}

if (oldVersion < 4) {
  // engade latitude e longitude a gardens
}

if (oldVersion < 5) {
  // crea garden_layout_items
}
```

Isto permite actualizar desde versións antigas sen perder datos.

A migración:

``` text
v2 → v3
```

foi comprobada mantendo hortas e plantas xa existentes.

A migración `v3 → v4` engade `latitude` e `longitude` opcionais á táboa `gardens`, conservando as hortas xa persistidas.

A migración `v4 → v5` crea `garden_layout_items` para persistir o deseño visual das hortas.

------------------------------------------------------------------------

# Foreign Keys

As claves foráneas actívanse mediante:

``` sql
PRAGMA foreign_keys = ON
```

en `onConfigure`.

## Garden → GardenPlant

``` text
garden_plants.garden_id
        ↓
gardens.id
```

``` text
ON DELETE CASCADE
```

## PlantSpecies → GardenPlant

``` text
garden_plants.species_id
        ↓
plant_species.id
```

``` text
ON DELETE RESTRICT
```

## GardenPlant → PlantEvolutionRecord

``` text
plant_evolution_records.plant_id
        ↓
garden_plants.id
```

``` text
ON DELETE CASCADE
```

Consecuencia:

``` text
Eliminar Garden
→ elimina GardenPlant
→ elimina PlantEvolutionRecord
```

A especie mantense protexida se está sendo utilizada.

## Garden → GardenLayoutItem

``` text
garden_layout_items.garden_id
        ↓
gardens.id
```

``` text
ON DELETE CASCADE
```

## GardenPlant → GardenLayoutItem

``` text
garden_layout_items.garden_plant_id
        ↓
garden_plants.id
```

``` text
ON DELETE CASCADE
```

`UNIQUE (garden_plant_id)` garante que cada planta poida ter como máximo unha única posición no deseño.

------------------------------------------------------------------------

# Dependency Injection

As dependencias créanse en `main.dart`.

Fluxo conceptual para persistencia local:

``` text
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

Fluxo conceptual para meteoroloxía:

``` text
WeatherService
  ↓
OpenWeatherRepository
  ↓
WeatherViewModel
  ↓
MultiProvider
  ↓
GardenDetailsScreen
```

Exemplo simplificado:

``` text
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

------------------------------------------------------------------------

# Current Provider Composition

Conceptualmente:

``` text
MultiProvider
├── GardensViewModel
├── PlantSpeciesViewModel
├── PlantsViewModel
├── PlantEvolutionViewModel
├── WeatherViewModel
├── GeocodingViewModel
└── GardenLayoutViewModel
    ↓
MaterialApp
    ↓
Views
```

Carga inicial:

``` text
GardensViewModel
→ loadGardens()

PlantSpeciesViewModel
→ loadSpecies()
```

Carga contextual:

``` text
PlantsViewModel
→ loadPlants(gardenId)

PlantEvolutionViewModel
→ loadRecords(plantId)

GardenLayoutViewModel
→ loadItems(gardenId)
```

Carga meteorolóxica:

``` text
GardenDetailsScreen
→ obtén latitude/longitude de Garden
→ addPostFrameCallback()
→ WeatherViewModel.loadCurrentWeather(latitude, longitude)
```

A carga meteorolóxica contextual da horta iníciase despois do primeiro frame para evitar
chamar a `notifyListeners()` mentres Flutter está construíndo a árbore
de widgets.

------------------------------------------------------------------------

# Provider Usage

## context.read()

Utilizado para executar accións sen subscribirse aos cambios.

Exemplos:

``` text
addGarden()
addPlant()
addRecord()
removeRecord()
```

------------------------------------------------------------------------

## context.watch()

Utilizado cando a View depende do estado compartido.

Exemplo:

``` dart
final records =
    context.watch<PlantEvolutionViewModel>().records;
```

------------------------------------------------------------------------

## context.select()

Utilizado cando a View necesita observar un valor concreto.

Exemplos:

``` text
Garden concreto
Plant concreta
PlantEvolutionRecord concreto
número de plantas
```

------------------------------------------------------------------------

# Provider vs Persistence

Provider non é persistencia.

Separación:

``` text
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

------------------------------------------------------------------------

# Asynchronous Network State

As operacións de rede introducen estados que a interface debe
representar explicitamente.

`WeatherViewModel` mantén:

``` text
isLoading
weatherData
errorMessage
```

A View distingue:

``` text
loading
→ CircularProgressIndicator

error
→ mensaxe de erro

data
→ WeatherCard

sen datos
→ mensaxe informativa
```

O Service detecta os erros técnicos e o ViewModel transfórmaos en estado
observable para a interface.

------------------------------------------------------------------------

# Navigation Strategy

Actualmente utilízase:

``` text
Navigator.push()
Navigator.pop()
MaterialPageRoute
```

Non se introducirá outra solución mentres esta cubra correctamente as
necesidades do proxecto.

------------------------------------------------------------------------

# Identity-Based Navigation

As pantallas de detalle reciben preferentemente identificadores.

## Garden

``` text
GardensScreen
  ↓ gardenId
GardenDetailsScreen
  ↓
GardensViewModel.getGardenById()
```

## Plant

``` text
PlantListScreen
  ↓ plantId
PlantDetailsScreen
  ↓
PlantsViewModel.getPlantById()
```

## Evolution Record

``` text
PlantEvolutionListScreen
  ↓ recordId
PlantEvolutionDetailsScreen
  ↓
PlantEvolutionViewModel.getRecordById()
```

Isto permite que as pantallas de detalle obteñan a versión actual da
entidade desde o estado compartido.

------------------------------------------------------------------------

# Context Loading

Cando unha pantalla necesita establecer un contexto, utilízase
`initState()`.

Exemplo conceptual:

``` text
GardenDetailsScreen
→ loadPlants(gardenId)

PlantEvolutionListScreen
→ loadRecords(plantId)
```

Isto evita iniciar cargas repetidas directamente desde `build()`.

No caso de `WeatherViewModel`, a carga en `GardenDetailsScreen` execútase
mediante `WidgetsBinding.instance.addPostFrameCallback()`, porque
`loadCurrentWeather()` modifica estado e chama a `notifyListeners()`.
Así evítase solicitar unha reconstrución durante o primeiro `build()`.

------------------------------------------------------------------------

# Current Navigation Flow

``` text
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

``` text
GardenDetailsScreen
├── EditGardenScreen
├── LayoutDesignerScreen
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

------------------------------------------------------------------------

# Folder Structure

``` text
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

------------------------------------------------------------------------

# Current Models

``` text
models/
├── garden.dart
├── plant_species.dart
├── garden_plant.dart
├── plant_evolution_record.dart
├── garden_layout_item.dart
├── weather_data.dart
└── geocoding_result.dart
```

------------------------------------------------------------------------

# Current ViewModels

``` text
viewmodels/
├── gardens_viewmodel.dart
├── plant_species_viewmodel.dart
├── plants_viewmodel.dart
├── plant_evolution_viewmodel.dart
├── weather_viewmodel.dart
├── geocoding_viewmodel.dart
└── garden_layout_viewmodel.dart
```

------------------------------------------------------------------------

# Current Repositories

``` text
repositories/
├── garden_repository.dart
├── memory_garden_repository.dart
├── sqlite_garden_repository.dart
├── plant_species_repository.dart
├── sqlite_plant_species_repository.dart
├── garden_plant_repository.dart
├── sqlite_garden_plant_repository.dart
├── plant_evolution_record_repository.dart
├── sqlite_plant_evolution_record_repository.dart
├── weather_repository.dart
├── open_weather_repository.dart
├── geocoding_repository.dart
├── garden_layout_repository.dart
├── sqlite/
│   └── sqlite_garden_layout_repository.dart
└── open_weather_geocoding_repository.dart
```

------------------------------------------------------------------------

# Current Services

``` text
services/
├── database_service.dart
├── weather_service.dart
├── weather_exception.dart
├── geocoding_service.dart
└── geocoding_exception.dart
```

------------------------------------------------------------------------

# Data Layer

## SQLite

Fonte persistente local actualmente utilizada.

## External APIs

Actualmente implementada:

-   OpenWeather para condicións meteorolóxicas actuais.
-   OpenWeather Geocoding API para converter localidades en coordenadas.

Prevista:

-   MeteoSIX como posible provedor meteorolóxico adicional.

Posibles futuras:

-   APIs botánicas.
-   Servizos cloud.
-   Sincronización remota.

A comunicación externa segue:

``` text
View
  ↓
ViewModel
  ↓
Repository
  ↓
Service
  ↓
API
```

Isto conserva a separación de responsabilidades utilizada na
persistencia local, substituíndo SQLite por un servizo HTTP.

------------------------------------------------------------------------

# API Configuration and Secrets

As credenciais das APIs non se almacenan directamente no código fonte.

Durante o desenvolvemento, a clave de OpenWeather proporciónase
mediante:

``` text
--dart-define
```

ou:

``` text
--dart-define-from-file
```

Estrutura local:

``` text
config/
├── secrets.json
└── secrets.example.json
```

`secrets.json` contén as credenciais reais e está excluído mediante
`.gitignore`.

`secrets.example.json` pode versionarse para documentar as variables
necesarias sen expoñer claves reais.

O código recupera a clave mediante:

``` dart
const apiKey = String.fromEnvironment(
  'OPENWEATHER_API_KEY',
);
```

Exemplo:

``` text
flutter run -d windows --dart-define-from-file=config/secrets.json
```

Este mecanismo evita gardar a clave directamente no repositorio. Unha
clave incorporada nun cliente compilado, porén, non debe considerarse un
segredo completamente protexido; credenciais que deban permanecer
privadas requirirían unha capa backend.

------------------------------------------------------------------------

# Local First Strategy

A aplicación prioriza o almacenamento local.

Beneficios:

-   Funciona sen conexión.
-   Menor complexidade inicial.
-   Desenvolvemento incremental.
-   Maior control sobre o MVP.
-   Menor dependencia de infraestrutura externa.

A sincronización cloud poderá incorporarse posteriormente.

------------------------------------------------------------------------

# Current Dependency Flow

A estrutura xeral é:

``` text
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

``` text
GardensViewModel
  ↓
GardenRepository
  ↑
SQLiteGardenRepository
```

``` text
PlantSpeciesViewModel
  ↓
PlantSpeciesRepository
  ↑
SQLitePlantSpeciesRepository
```

``` text
PlantsViewModel
  ↓
GardenPlantRepository
  ↑
SQLiteGardenPlantRepository
```

``` text
PlantEvolutionViewModel
  ↓
PlantEvolutionRecordRepository
  ↑
SQLitePlantEvolutionRecordRepository
```

``` text
GardenLayoutViewModel
  ↓
GardenLayoutRepository
  ↑
SqliteGardenLayoutRepository
```

Todos os Repositories SQLite converxen en:

``` text
DatabaseService
  ↓
SQLite
```

O módulo meteorolóxico utiliza un fluxo equivalente orientado a unha
fonte externa:

``` text
WeatherViewModel
  ↓
WeatherRepository
  ↑
OpenWeatherRepository
  ↓
WeatherService
  ↓
OpenWeather API
```

A xeocodificación segue o mesmo patrón:

``` text
GeocodingViewModel
  ↓
GeocodingRepository
  ↑
OpenWeatherGeocodingRepository
  ↓
GeocodingService
  ↓
OpenWeather Geocoding API
```

------------------------------------------------------------------------

# Current Architectural Milestone

A arquitectura xa foi reutilizada con éxito en varios módulos.

O patrón inicial:

``` text
Garden
```

foi estendido a:

``` text
PlantSpecies
GardenPlant
PlantEvolutionRecord
```

sen introducir dependencias SQLite nas Views nin nos ViewModels.

Isto valida na práctica a capacidade da arquitectura para crecer
mantendo responsabilidades separadas.

O módulo de evolución completado na sesión 16 utiliza exactamente a
mesma estrutura:

``` text
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

------------------------------------------------------------------------


## Session 18 — Geocoding and garden-specific weather

A sesión 18 completou un segundo fluxo baseado nunha API externa:

``` text
CreateGardenScreen
  ↓
GeocodingViewModel
  ↓
GeocodingRepository
  ↓
OpenWeatherGeocodingRepository
  ↓
GeocodingService
  ↓
OpenWeather Geocoding API
  ↓
GeocodingResult
  ↓
Garden(location, latitude, longitude)
  ↓
SQLite v4
```

As coordenadas persistidas son reutilizadas posteriormente por `GardenDetailsScreen` para solicitar a meteoroloxía da horta mediante `WeatherViewModel`. Isto elimina a dependencia de coordenadas fixas no Dashboard e contextualiza a información meteorolóxica no dominio correcto.

---

## Session 19 — Garden Layout Designer

A sesión 19 incorporou un novo módulo persistente reutilizando a mesma arquitectura:

``` text
LayoutDesignerScreen
  ↓
GardenLayoutViewModel
  ↓
GardenLayoutRepository
  ↓
SqliteGardenLayoutRepository
  ↓
DatabaseService
  ↓
SQLite v5
```

`GardenLayoutItem` relaciona unha planta concreta coa súa horta e persiste a súa posición mediante coordenadas normalizadas `xPosition` e `yPosition`.

A View utiliza `LayoutBuilder` para converter esas coordenadas ás dimensións reais do taboleiro. O movemento actualízase localmente durante `onPanUpdate` e só se persiste ao finalizar con `onPanEnd`.

O deseñador limita os elementos ao interior do taboleiro, evita o solapamento entre plantas e permite retirar unha planta do deseño sen eliminala da horta. As posicións persisten entre navegacións e reinicios da aplicación.

---

# Future Architecture Evolution

Posibles ampliacións:

-   MeteoSIX como segundo provedor meteorolóxico.
-   Selección de coordenadas mediante mapa.
-   Posible horta principal para o Dashboard.
-   Predición meteorolóxica.
-   Histórico climático.
-   Melloras do Layout Designer: maior fluidez, grid/snapping, colocación inicial libre e representación visual por especie.
-   Sincronización cloud.
-   Firebase ou Supabase.
-   Authentication.
-   Push Notifications.
-   AI Services.
-   Exportación de históricos.
-   Xestión de ficheiros e fotografías.

Estas ampliacións só se introducirán cando exista unha necesidade
funcional real.

------------------------------------------------------------------------

# Architectural Principles

-   Manter a arquitectura simple.
-   Separar UI, estado e persistencia.
-   Depender de abstraccións sempre que resulte útil.
-   Centralizar a infraestrutura SQLite.
-   Evitar acceso SQL desde Views ou ViewModels.
-   Evitar ViewModels excesivamente grandes.
-   Crear Repositories cunha responsabilidade clara.
-   Manter estado contextual cando a colección depende dunha entidade
    pai.
-   Utilizar identificadores para manter sincronizadas as pantallas de
    detalle.
-   Non introducir capas adicionais sen beneficio claro.
-   Priorizar funcionalidade e comprensión sobre sofisticación
    arquitectónica.
-   Encapsular as comunicacións HTTP en Services específicos.
-   Manter os ViewModels independentes do provedor externo concreto
    mediante contratos Repository.
-   Representar explicitamente os estados asíncronos de carga, datos e
    erro.
-   Evitar `notifyListeners()` durante o proceso de construción inicial
    dunha View.
-   Aplicar timeout ás peticións externas para evitar esperas
    indefinidas.
-   Non almacenar claves reais de APIs no código fonte nin no
    repositorio.
-   Manter a documentación sincronizada co código real.

------------------------------------------------------------------------

# Notes

A arquitectura actual é suficiente para o MVP e xa soporta varios
módulos persistentes e relacionados entre si, incluído o deseño visual das hortas, ademais dos fluxos meteorolóxico e de xeocodificación integrados con APIs externas.

As futuras ampliacións deberán respectar a separación de
responsabilidades definida neste documento.

O obxectivo segue sendo construír unha aplicación funcional,
comprensible e mantible antes de introducir complexidade adicional.
