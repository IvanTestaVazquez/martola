# PROJECT_CONTEXT.md

# Project Information

## Project Name

**MARTOLA**

**Modelo Avanzado de Rexistro e Tratamento de Organización de Leiras e Agricultura**

## Project Type

- Traballo de Fin de Ciclo (TFC)
- DAM Dual Intensiva
- CIFP A Carballeira Marcos Valcárcel

## Project Summary

MARTOLA é unha aplicación multiplataforma desenvolvida con Flutter para a xestión de hortas e xardíns.

A aplicación permitirá:

- Crear, editar e eliminar hortas e xardíns.
- Rexistrar, editar e eliminar plantas.
- Manter un catálogo de especies vexetais.
- Realizar seguemento da evolución das plantas mediante rexistros históricos.
- Consultar información meteorolóxica.
- Almacenar históricos climáticos.
- Deseñar visualmente a distribución dunha horta.
- Servir como ferramenta de apoio á planificación e mantemento de cultivos.

O proxecto está pensado inicialmente para:

- Android
- Windows
- Linux
- Tablets

Posible soporte futuro:

- Web
- Sincronización cloud

iOS descártase inicialmente debido ás limitacións e custos asociados ao desenvolvemento para a plataforma Apple.

---

# Project Documentation

## Documentation Structure

```text
docs/
├── PROJECT_CONTEXT.md
├── UI_REFERENCE.md
├── ARCHITECTURE.md
├── DATABASE_DESIGN.md
├── ROADMAP.md
├── DEVELOPMENT_GUIDE.md
└── LEARNING_NOTES.md
```

## Purpose

Esta documentación constitúe o sistema principal de seguemento e contexto do proxecto.

Todos os cambios relevantes deberán reflectirse nestes documentos para facilitar:

- Desenvolvemento.
- Mantemento.
- Elaboración da memoria final.
- Recuperación de contexto.
- Seguemento da evolución do proxecto.

---

# Technical Stack

## Frontend

- Flutter
- Dart

## Architecture

- MVVM simplificado
- Repository Pattern

## State Management

- Provider
- `ChangeNotifier`
- `MultiProvider`

## Database

- SQLite
- `sqflite`
- `sqflite_common_ffi`
- `path`
- `path_provider`

A infraestrutura de persistencia está deseñada para soportar Android, Windows e Linux.

## HTTP / External APIs

- Paquete `http`
- OpenWeather API para condicións meteorolóxicas actuais e xeocodificación directa de localidades.
- MeteoSIX prevista para información e predición meteorolóxica adicional.

A integración actual con OpenWeather está implementada e operativa.

As credenciais das APIs non se almacenan directamente no código fonte. Durante o desenvolvemento proporciónanse mediante `--dart-define` ou `--dart-define-from-file`.

## Design Tools

- Figma
- draw.io

## Version Control

- Git
- GitHub

---

# Architecture

## Folder Structure

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

## Architecture Flow

Para datos persistentes locais:

```text
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

Para servizos externos:

```text
View
  ↓
ViewModel
  ↓
Repository
  ↓
Service
  ↓
External API
```

## Strategy

Arquitectura MVVM simplificada orientada a:

- Separación de responsabilidades.
- Mantemento sinxelo.
- Escalabilidade futura.
- Curva de aprendizaxe moderada.
- Independencia entre interface, estado, persistencia e fontes externas de datos.

## Current Implementation State

A arquitectura está aplicada actualmente aos módulos de hortas, plantas, especies, evolución das plantas, xeocodificación, meteoroloxía, deseño visual da distribución da horta e tarefas.

A composición principal realízase en `main.dart`, onde se crean e inxectan as implementacións concretas dos Repositories, Services e ViewModels mediante `MultiProvider`.

Para a persistencia local:

```text
main.dart
   ↓
DatabaseService
   ↓
Repositories SQLite
   ↓
ViewModels
   ↓
ChangeNotifierProvider / MultiProvider
   ↓
Views
```

Para a xeocodificación e meteoroloxía:

```text
main.dart
   ├── GeocodingService → OpenWeatherGeocodingRepository → GeocodingViewModel
   └── WeatherService → OpenWeatherRepository → WeatherViewModel
                    ↓
       ChangeNotifierProvider / MultiProvider
                    ↓
                  Views
```

O fluxo de localización e meteoroloxía por horta é:

```text
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
Garden(location, latitude, longitude)
   ↓
SQLite

GardenDetailsScreen
   ↓
WeatherViewModel
   ↓
WeatherRepository
   ↓
OpenWeatherRepository
   ↓
WeatherService
   ↓
OpenWeather API
```

Os ViewModels implementados son:

- `GardensViewModel`
- `PlantSpeciesViewModel`
- `PlantsViewModel`
- `PlantEvolutionViewModel`
- `WeatherViewModel`
- `GeocodingViewModel`
- `GardenLayoutViewModel`

As Views acceden ao estado mediante:

- `context.read()` para executar accións sen subscribirse aos cambios.
- `context.watch()` para observar un estado.
- `context.select()` para observar só unha parte concreta.

Os ViewModels manteñen estado de presentación xa cargado, mentres que os Repositories constitúen unha abstracción fronte á fonte concreta dos datos.

Esta abstracción aplícase tanto á persistencia SQLite como ás APIs externas.

## Implemented Repositories

Contratos:

- `GardenRepository`
- `PlantSpeciesRepository`
- `GardenPlantRepository`
- `PlantEvolutionRecordRepository`
- `WeatherRepository`
- `GeocodingRepository`
- `GardenLayoutRepository`

Implementacións:

- `SQLiteGardenRepository`
- `SQLitePlantSpeciesRepository`
- `SQLiteGardenPlantRepository`
- `SQLitePlantEvolutionRecordRepository`
- `OpenWeatherRepository`
- `OpenWeatherGeocodingRepository`
- `SqliteGardenLayoutRepository`

`MemoryGardenRepository` mantense como implementación alternativa útil para probas ou desenvolvemento.

`WeatherRepository` permite que `WeatherViewModel` non dependa directamente de OpenWeather. Isto facilita substituír ou combinar no futuro diferentes provedores meteorolóxicos sen modificar o ViewModel.

---

# Database Design

## Current SQLite Version

```text
version: 6
```

Migracións implementadas e comprobadas:

```text
v1 → v2
v2 → v3
v3 → v4
v4 → v5
v5 → v6
```

As migracións son acumulativas e conservan os datos existentes.

## Current Physical Schema

```text
gardens
plant_species
garden_plants
plant_evolution_records
garden_layout_items
tasks
```

## Main Entities

### gardens

Hortas ou xardíns creados na aplicación.

### plant_species

Información común das especies vexetais.

### garden_plants

Plantas concretas rexistradas dentro dunha horta.

### plant_evolution_records

Histórico de evolución dunha planta concreta.

Campos actualmente implementados:

- `id`
- `plant_id`
- `date`
- `height`
- `notes`

`height` e `notes` son opcionais.

### garden_layout_items

Elementos que representan a posición dunha planta dentro do deseño visual dunha horta.

Campos implementados:

- `id`
- `garden_id`
- `garden_plant_id`
- `x_position`
- `y_position`

As posicións almacénanse como valores normalizados independentes do tamaño real da pantalla. `garden_plant_id` é único, polo que unha planta só pode ocupar unha posición no deseño dunha horta.

### Future Entities

Previstas no deseño global, pero aínda non implementadas fisicamente:

- `users`
- `weather_records`

## Current Relationships

```text
gardens 1:N garden_plants
plant_species 1:N garden_plants
garden_plants 1:N plant_evolution_records
gardens 1:N garden_layout_items
garden_plants 1:0..1 garden_layout_items

As tarefas constitúen rexistros independentes de apoio á planificación no MVP actual.
tasks
```

Integridade referencial:

- `garden_plants.garden_id → gardens.id` con `ON DELETE CASCADE`.
- `garden_plants.species_id → plant_species.id` con `ON DELETE RESTRICT`.
- `plant_evolution_records.plant_id → garden_plants.id` con `ON DELETE CASCADE`.
- `garden_layout_items.garden_id → gardens.id` con `ON DELETE CASCADE`.
- `garden_layout_items.garden_plant_id → garden_plants.id` con `ON DELETE CASCADE`.
- `garden_layout_items.garden_plant_id` ten restrición `UNIQUE`.

As claves foráneas actívanse mediante:

```sql
PRAGMA foreign_keys = ON
```

## Persistence Decisions

- Os identificadores do dominio mantéñense como `String`, aínda que SQLite utiliza `INTEGER`.
- A conversión realízase na fronteira coa persistencia.
- Os `DateTime` almacénanse como `TEXT` en formato ISO 8601.
- Os valores decimais, como superficie ou altura, almacénanse como `REAL`.
- Os campos opcionais poden persistirse como `NULL`.

## Garden Location and Coordinates

`Garden` xa permite asociar cada horta a coordenadas xeográficas mediante:

- `latitude` opcional.
- `longitude` opcional.

Os campos persístense na táboa `gardens` como valores `REAL` anulables. A ampliación incorporouse mediante a migración SQLite v3 → v4, conservando os datos existentes.

A localización pode buscarse por texto mediante a API de xeocodificación directa de OpenWeather. O usuario selecciona unha das coincidencias devoltas e MARTOLA garda o nome da localización seleccionada xunto coas súas coordenadas.

A selección mediante mapa mantense como mellora futura. As coordenadas son a referencia xeográfica utilizada para consultar a meteoroloxía específica de cada horta.

---

# Implemented Functional Modules

## Gardens

CRUD completo desde a interface:

- Crear horta.
- Listar hortas.
- Consultar detalle.
- Editar horta.
- Eliminar horta.
- Persistencia SQLite.
- Recuperación dos datos entre reinicios.

Fluxo:

```text
Views
  ↓
GardensViewModel
  ↓
GardenRepository
  ↓
SQLiteGardenRepository
  ↓
DatabaseService
  ↓
SQLite
```

## Plant Species

Implementado:

- Modelo `PlantSpecies`.
- `PlantSpeciesRepository`.
- `SQLitePlantSpeciesRepository`.
- `PlantSpeciesViewModel`.
- Catálogo inicial local de especies.
- Inserción do catálogo só cando `plant_species` está baleira.
- Uso do catálogo desde os formularios mediante selector de especies.

O catálogo local é unha solución provisional para o MVP e poderá substituírse ou ampliarse no futuro.

## Plants

CRUD completo desde a interface:

- Listar plantas dunha horta.
- Crear planta.
- Consultar detalle.
- Resolver o nome da especie asociada.
- Editar planta.
- Eliminar planta.
- Persistencia SQLite.
- Actualización reactiva das Views.

`PlantsViewModel` conserva `_currentGardenId` e mantén unicamente as plantas correspondentes á horta actualmente cargada.

Fluxo principal:

```text
GardenDetailsScreen
  ↓
PlantListScreen
  ↓
PlantDetailsScreen
```

Pantallas implementadas:

- `PlantListScreen`
- `AddPlantScreen`
- `PlantDetailsScreen`
- `EditPlantScreen`

## Plant Evolution

O módulo de evolución está implementado cun CRUD completo desde a interface.

Modelo:

- `PlantEvolutionRecord`

Campos:

- `id`
- `plantId`
- `date`
- `height` opcional
- `notes` opcionais

Infraestrutura:

- `PlantEvolutionRecordRepository`
- `SQLitePlantEvolutionRecordRepository`
- `PlantEvolutionViewModel`

Pantallas:

- `PlantEvolutionListScreen`
- `AddPlantEvolutionRecordScreen`
- `PlantEvolutionDetailsScreen`
- `EditPlantEvolutionRecordScreen`

Funcionalidades:

- Cargar os rexistros dunha planta.
- Crear un rexistro.
- Consultar o detalle.
- Editar un rexistro.
- Eliminar un rexistro.
- Validar altura opcional.
- Gardar altura e notas como `NULL` cando non se proporcionan.
- Seleccionar a data mediante `showDatePicker`.
- Actualizar automaticamente as Views mediante `notifyListeners()`.

`PlantEvolutionViewModel` conserva `_currentPlantId`, polo que os formularios de creación non necesitan xestionar directamente a relación coa planta activa.

Fluxo:

```text
PlantDetailsScreen
  ↓
PlantEvolutionListScreen
  ↓
PlantEvolutionDetailsScreen
```

Fluxo de datos:

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

O CRUD foi comprobado tanto directamente contra o Repository/SQLite como desde a interface.


## Garden Layout

O módulo de deseño visual da horta dispón xa dun primeiro MVP funcional.

Modelo:

- `GardenLayoutItem`

Infraestrutura:

- `GardenLayoutRepository`
- `SqliteGardenLayoutRepository`
- `GardenLayoutViewModel`
- Táboa SQLite `garden_layout_items` incorporada na versión 5.

Funcionalidades implementadas:

- Cargar os elementos do deseño dunha horta.
- Engadir ao deseño plantas que pertencen á horta.
- Evitar que unha mesma planta se engada dúas veces mediante `UNIQUE (garden_plant_id)`.
- Representar cada planta nun `Stack` mediante `Positioned`.
- Gardar `xPosition` e `yPosition` como coordenadas normalizadas.
- Arrastrar individualmente os elementos.
- Manter cada elemento completamente dentro dos límites do taboleiro.
- Evitar solapamentos durante o arrastre.
- Actualizar a posición en memoria durante `onPanUpdate` para non escribir continuamente en SQLite.
- Persistir a posición final mediante `onPanEnd`.
- Identificar visualmente os elementos mediante o nome personalizado da planta.
- Retirar unha planta do deseño mediante pulsación longa e confirmación, sen eliminar a planta da horta.
- Recuperar as posicións persistidas ao volver entrar na pantalla ou reiniciar a aplicación.

A colocación inicial automática procura unha posición libre antes de engadir unha nova planta ao taboleiro, evitando que un elemento novo apareza superposto a outro xa existente. A mellora da fluidez do arrastre e posibles mecanismos de grid/snapping quedan como refinamentos posteriores.

Fluxo:

```text
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
SQLite
```

---

## Tasks

O MVP incorpora un módulo básico de tarefas para apoiar a planificación do traballo. Mantense deliberadamente sinxelo para non ampliar innecesariamente o alcance do TFC.

Funcionalidades actuais:

- Listar tarefas.
- Crear novas tarefas.
- Manter os datos mediante persistencia local en SQLite.
- Actualizar a interface de forma reactiva mediante Provider.
- Mostrar no Dashboard un resumo das tarefas pendentes.

Pantallas principais:

- `TasksScreen`
- `CreateTaskScreen`

O módulo segue a mesma separación de responsabilidades do resto da aplicación: View → ViewModel → Repository → SQLite. Funcionalidades máis avanzadas como alertas, notificacións ou recorrencia quedan fóra do MVP actual.

---

## Weather

O módulo meteorolóxico básico está implementado e conectado con datos reais de OpenWeather.

Modelo:

- `WeatherData`

A información meteorolóxica actualmente procesada inclúe:

- Temperatura.
- Humidade.
- Descrición meteorolóxica.
- Velocidade do vento.
- Localidade.

Infraestrutura:

- `WeatherService`
- `WeatherException`
- `WeatherRepository`
- `OpenWeatherRepository`
- `WeatherViewModel`

Fluxo:

```text
GardenDetailsScreen
  ↓
WeatherViewModel
  ↓
WeatherRepository
  ↓
OpenWeatherRepository
  ↓
WeatherService
  ↓
OpenWeather API
```

`WeatherService` é responsable de:

- Construír a URI de OpenWeather.
- Realizar a petición HTTP GET.
- Procesar a resposta JSON.
- Converter os datos mediante `WeatherData.fromJson()`.
- Interpretar erros HTTP.
- Detectar problemas de conexión.
- Controlar o timeout das peticións.
- Lanzar `WeatherException` cando a operación non pode completarse.

`WeatherViewModel` representa os estados principais da operación:

```text
loading
data
error
```

Mantén:

- `WeatherData? _weatherData`
- `bool _isLoading`
- `String? _errorMessage`

`GardenDetailsScreen` reacciona a estes estados mostrando:

- Mensaxe específica cando a horta non ten coordenadas asociadas.
- `CircularProgressIndicator` durante a carga.
- Mensaxe de erro cando a petición falla.
- `WeatherCard` cando existen datos.

A carga realízase despois do frame mediante `WidgetsBinding.instance.addPostFrameCallback()` cando a horta dispón de latitude e longitude, evitando notificacións durante o proceso de construción da interface.

`WeatherCard` trasladouse a `lib/widgets/` ao converterse nun compoñente reutilizable e non exclusivo do Dashboard.

A consulta meteorolóxica utiliza xa as coordenadas reais persistidas de cada horta; eliminouse a dependencia funcional das coordenadas fixas de Ourense.

---


## Geocoding

O módulo de xeocodificación directa está implementado e conectado coa API de OpenWeather.

Modelo:

- `GeocodingResult`

Datos procesados:

- Nome da localización.
- Latitude.
- Longitude.
- Estado/rexión cando está dispoñible.
- País cando está dispoñible.

Infraestrutura:

- `GeocodingService`
- `GeocodingException`
- `GeocodingRepository`
- `OpenWeatherGeocodingRepository`
- `GeocodingViewModel`

`CreateGardenScreen` permite introducir unha localización, realizar a busca, representar os estados de carga/erro/sen resultados e seleccionar unha coincidencia. A selección actualiza a localización do formulario e permite persistir `latitude` e `longitude` no `Garden`.

Fluxo:

```text
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
```

# API Configuration and Secrets

As claves de APIs non se escriben directamente no código fonte.

Durante o desenvolvemento poden proporcionarse mediante:

```text
--dart-define
```

ou mediante:

```text
--dart-define-from-file
```

Estrutura actual:

```text
config/
├── secrets.json
└── secrets.example.json
```

`secrets.json` contén as claves reais do entorno local e está excluído do control de versións mediante `.gitignore`.

`secrets.example.json` non contén credenciais reais e pode versionarse para documentar as variables necesarias.

Configuración actual:

```json
{
  "OPENWEATHER_API_KEY": ""
}
```

O código accede á clave mediante:

```dart
const apiKey = String.fromEnvironment(
  'OPENWEATHER_API_KEY',
);
```

Exemplo de execución durante o desenvolvemento:

```text
flutter run -d windows --dart-define-from-file=config/secrets.json
```

Este mecanismo evita subir accidentalmente as claves ao repositorio.

Non obstante, unha clave incorporada nunha aplicación cliente compilada non debe considerarse un segredo completamente protexido. Se no futuro MARTOLA necesitase credenciais que non puidesen ser expostas ao cliente, sería necesario utilizar un backend que almacenase esas credenciais.

---

# Navigation Flow

Fluxo funcional actualmente relevante:

```text
Inicio
  ↓
Dashboard
  ├── Tarefas → Lista / Crear tarefa
  ↓
Lista de Hortas
  ├── Crear horta → Buscar/seleccionar localización → Coordenadas
  ↓
Detalle dunha Horta
  ├── Meteoroloxía actual da horta
  ↓
Lista de Plantas
  ↓
Detalle dunha Planta
  ↓
Evolución
  ↓
Lista de Rexistros
  ↓
Detalle do Rexistro
```

Operacións asociadas:

```text
Horta
├── Crear
├── Editar
└── Eliminar

Planta
├── Crear
├── Editar
└── Eliminar

Evolución
├── Crear rexistro
├── Editar rexistro
└── Eliminar rexistro

Meteoroloxía
└── Consultar condicións actuais

Deseño da horta
├── Engadir planta ao deseño nun oco libre
├── Mover e persistir posición
└── Retirar planta do deseño

Tarefas
├── Listar tarefas
└── Crear tarefa
```

Funcionalidades futuras previstas no fluxo:

- Selección de localización mediante mapa.
- Predición meteorolóxica.
- Histórico climático.
- Autenticación de usuario, como ampliación opcional se o tempo dispoñible o permite.
- Configuración avanzada da aplicación, fóra do alcance actual do MVP.
- Alertas e notificacións asociadas ás tarefas, como ampliación futura.

---

# Responsive Design

## Mobile

A interface está adaptada para navegación principalmente secuencial e vertical. Como referencia práctica de probas establécese un ancho mínimo aproximado de 360 px lóxicos.

## Tablet

As pantallas aproveitan o espazo dispoñible mediante cambios de composición e, nas listas principais, mediante distribucións en varias columnas cando o ancho o permite.

## Desktop

O contido limita o ancho cando convén para evitar formularios excesivamente estirados e aproveita o espazo horizontal mediante layouts máis amplos e grids.

## Current responsive implementation

A revisión responsive principal do MVP está realizada. Implementáronse e comprobaron, entre outros:

- `HomeScreen` con contido centrado e ancho máximo controlado.
- Formularios de hortas, plantas e evolución con ancho limitado e composición adaptable.
- Cambio entre `Row` e `Column` nos controis que o requiren cando diminúe o ancho.
- Listas adaptables a `GridView` en pantallas amplas.
- Pantallas de detalle con distribución adaptable.
- Dashboard e tarxetas principais comprobados en diferentes anchos.
- `LayoutDesignerScreen` con coordenadas normalizadas e taboleiro adaptable ao espazo dispoñible.

As probas manuais toman como referencias aproximadas 360–400 px para móbil, arredor de 700 px para tablet/transición e 1200 px para escritorio, comprobando tamén o comportamento continuo ao redimensionar a ventá.

---

# Figma Structure

Debido ás limitacións da versión gratuíta de Figma, o proxecto estrutúrase en tres páxinas:

## Page 1 — `00_System_&_Wireframes`

- Design System
- Assets
- Wireframes

## Page 2 — `01_Mobile_UI`

- Mockups finais para móbil

## Page 3 — `02_Desktop_&_Prototype`

- Mockups de escritorio
- Prototipo navegable

---

# Design System

## Current Status

Pendente de definición final.

Durante a fase de deseño definiranse:

- Paleta de cores.
- Tipografías.
- Sistema de espazado.
- Compoñentes reutilizables.
- Comportamento responsive.
- Iconografía.

A prioridade actual continúa sendo completar e estabilizar a funcionalidade antes do refinamento visual definitivo.

---

# Current Version

## Version

`0.1.0-alpha`

## Status

🟢 En desenvolvemento activo

## Last Updated

2026-08-22

## Current Phase

A infraestrutura local principal do MVP está operativa mediante SQLite v6.

Están implementados de extremo a extremo:

- CRUD de hortas.
- Catálogo local de especies.
- CRUD de plantas.
- CRUD de rexistros de evolución.
- Xeocodificación de localidades mediante OpenWeather.
- Consulta meteorolóxica actual específica por horta mediante OpenWeather.
- Primeiro MVP funcional do deseño visual da distribución da horta.
- Módulo básico de tarefas con persistencia local.
- Adaptación responsive principal das pantallas do MVP.

A persistencia foi comprobada entre reinicios e as relacións entre hortas, plantas, especies e evolución están implementadas mediante claves foráneas.

A aplicación tamén dispón xa dunha primeira integración cun servizo externo mediante HTTP, Repository Pattern e xestión reactiva dos estados de rede.

---

# Current Progress

## Analysis & Planning

- ✅ Descrición inicial do proxecto
- ✅ Análise de requisitos
- ✅ Planificación inicial
- ✅ Estrutura da memoria final

## Design

- ✅ Fluxo de navegación
- ✅ Estrutura Figma definida
- ✅ Wireframes definidos
- ⏳ Design System
- ⬜ Mockups finais

## Architecture

- ✅ MVVM simplificado
- ✅ Repository Pattern
- ✅ Estrutura de carpetas
- ✅ Provider / MultiProvider
- ✅ Inxección de dependencias desde `main.dart`
- ✅ Contratos Repository asíncronos
- ✅ ViewModels desacoplados das fontes concretas de datos
- ✅ `GardensViewModel`
- ✅ `PlantSpeciesViewModel`
- ✅ `PlantsViewModel`
- ✅ `PlantEvolutionViewModel`
- ✅ `WeatherViewModel`
- ✅ `GeocodingViewModel`
- ✅ Repositories SQLite para hortas, especies, plantas e evolución
- ✅ Repository para acceso á API meteorolóxica
- ✅ Repository para xeocodificación directa
- ✅ Repository para deseño visual da horta
- ✅ Services dedicados á comunicación HTTP con OpenWeather

## Database

- ✅ SQLite multiplataforma
- ✅ `DatabaseService`
- ✅ `martola.db`
- ✅ Versionado do esquema
- ✅ Migración v1 → v2
- ✅ Migración v2 → v3
- ✅ Migración v3 → v4
- ✅ Migración v4 → v5
- ✅ Migración v5 → v6
- ✅ Conservación dos datos existentes
- ✅ `gardens`
- ✅ `plant_species`
- ✅ `garden_plants`
- ✅ `plant_evolution_records`
- ✅ `garden_layout_items`
- ✅ `tasks`
- ✅ Claves foráneas
- ✅ `ON DELETE CASCADE`
- ✅ `ON DELETE RESTRICT`
- ✅ Datas ISO 8601
- ✅ Valores opcionais `NULL`
- ✅ Catálogo inicial de especies
- ✅ Coordenadas opcionais `latitude` / `longitude` en `gardens`

## Development

- ✅ Home e Dashboard iniciais
- ✅ CRUD completo de hortas
- ✅ Persistencia real das hortas
- ✅ Módulo de especies
- ✅ CRUD completo de plantas
- ✅ Navegación Horta → Plantas → Detalle
- ✅ CRUD completo de evolución
- ✅ Navegación Planta → Evolución → Detalle
- ✅ Formularios con validación
- ✅ `TextEditingController`
- ✅ `showDatePicker`
- ✅ Conversión segura de datos de formulario
- ✅ Uso de `context.mounted` tras operacións asíncronas
- ✅ Actualización reactiva mediante Provider
- ✅ Petición HTTP GET real
- ✅ Deserialización JSON
- ✅ Modelo `WeatherData`
- ✅ Integración OpenWeather
- ✅ `WeatherService`
- ✅ `WeatherRepository`
- ✅ `OpenWeatherRepository`
- ✅ `WeatherViewModel`
- ✅ Estados `loading / data / error`
- ✅ Tratamento de erros HTTP
- ✅ Tratamento de fallo de conexión
- ✅ Timeout das peticións meteorolóxicas
- ✅ Modelo `GeocodingResult`
- ✅ `GeocodingService` / `GeocodingRepository` / `GeocodingViewModel`
- ✅ Busca e selección de localización en `CreateGardenScreen`
- ✅ Persistencia de latitude e longitude por horta
- ✅ Meteoroloxía real específica por horta en `GardenDetailsScreen`
- ✅ `WeatherCard` reutilizable en `lib/widgets/`
- ✅ Configuración da API key fóra do código fonte
- ✅ Modelo `GardenLayoutItem`
- ✅ `GardenLayoutRepository` / `SqliteGardenLayoutRepository` / `GardenLayoutViewModel`
- ✅ `LayoutDesignerScreen`
- ✅ Coordenadas normalizadas para o deseño responsive
- ✅ Drag individual con límites e prevención de solapamentos
- ✅ Persistencia da posición final ao rematar o arrastre
- ✅ Engadir e retirar plantas do deseño
- ✅ Colocación inicial nun oco libre para evitar superposicións ao engadir elementos
- ✅ Módulo básico de tarefas con persistencia SQLite
- ✅ Listaxe e creación de tarefas desde a interface
- ✅ Integración das tarefas no Dashboard
- ✅ Revisión responsive principal do MVP
- ✅ Layouts adaptables mediante `LayoutBuilder`, límites de ancho, `Row`/`Column` e listas/grids segundo o espazo dispoñible

## Documentation

- ✅ `PROJECT_CONTEXT.md`
- ✅ `UI_REFERENCE.md`
- ✅ `ARCHITECTURE.md`
- ✅ `DATABASE_DESIGN.md`
- ✅ `ROADMAP.md`
- ✅ `DEVELOPMENT_GUIDE.md`
- ✅ `LEARNING_NOTES.md`

---

# Important Technical Decisions

- Arquitectura Local First.
- SQLite antes que Firebase ou sincronización cloud.
- MVVM simplificado para manter unha complexidade asumible.
- Repository Pattern para desacoplar o dominio das fontes concretas de datos.
- Provider para distribuír e observar o estado compartido.
- `main.dart` como punto de composición e inxección de dependencias.
- As Views non acceden directamente á base de datos nin ás APIs externas.
- Os ViewModels dependen dos contratos Repository, non das implementacións concretas.
- Os modelos de dominio mantéñense independentes da interface.
- Os modelos poden implementar `toMap()` e `fromMap()` para a fronteira coa persistencia.
- Os identificadores poden ser `String` no dominio e `INTEGER` en SQLite.
- Os `DateTime` almacénanse como `TEXT` ISO 8601.
- Os campos opcionais persístense como `NULL` cando non existe un valor.
- As migracións SQLite son acumulativas mediante comprobacións de `oldVersion`.
- As claves foráneas actívanse explicitamente con `PRAGMA foreign_keys = ON`.
- A eliminación dunha horta elimina as súas plantas mediante `ON DELETE CASCADE`.
- A eliminación dunha planta elimina os seus rexistros de evolución e o seu elemento de layout mediante `ON DELETE CASCADE`.
- Unha especie utilizada por unha planta está protexida mediante `ON DELETE RESTRICT`.
- `PlantSpeciesRepository`, `GardenPlantRepository`, `PlantEvolutionRecordRepository`, `GardenLayoutRepository`, `WeatherRepository` e `GeocodingRepository` mantéñense separados por responsabilidade.
- `PlantsViewModel` conserva o contexto da horta activa mediante `_currentGardenId`.
- `PlantEvolutionViewModel` conserva o contexto da planta activa mediante `_currentPlantId`.
- Os formularios manteñen o estado temporal na propia View mediante `StatefulWidget` e `setState()`.
- Os `TextEditingController` créanse e libéranse no ciclo de vida do `State`.
- Os formularios utilizan `Form`, `GlobalKey<FormState>` e validadores.
- Os campos opcionais baleiros convértense a `null` cando esa é a semántica do dominio.
- `context.read()` úsase para accións, `context.watch()` para observar estado e `context.select()` para observar partes concretas.
- As entidades persistidas actualízanse preferentemente mediante o seu identificador.
- As pantallas de detalle consultan a versión actual da entidade desde o ViewModel cando necesitan permanecer sincronizadas.
- Os widgets de presentación comunican accións mediante callbacks cando convén desacoplalos da navegación.
- As novas funcionalidades desenvólvense incrementalmente: dominio → infraestrutura → ViewModel → interface → proba.
- Os servizos externos encapsúlanse en clases `Service` específicas.
- Os Repositories abstraen o ViewModel do provedor externo concreto.
- `WeatherViewModel` non coñece OpenWeather directamente; depende de `WeatherRepository`.
- `OpenWeatherRepository` implementa actualmente o contrato meteorolóxico utilizando `WeatherService`.
- `OpenWeatherGeocodingRepository` implementa o contrato de xeocodificación utilizando `GeocodingService`.
- A localización xeográfica dunha horta represéntase mediante texto máis coordenadas opcionais; as coordenadas son a referencia utilizada para a meteoroloxía.
- A xeocodificación devolve varias coincidencias e a selección final corresponde ao usuario.
- As respostas JSON externas convértense a modelos propios antes de chegar á interface.
- O estado dunha operación de rede represéntase explicitamente mediante carga, datos e erro.
- `notifyListeners()` permite que a interface reaccione aos cambios dese estado.
- As operacións que notifican cambios non deben iniciarse durante o primeiro `build`; cando é necesario utilízase `addPostFrameCallback()`.
- Os erros técnicos das APIs detéctanse no Service.
- `WeatherException` permite propagar erros meteorolóxicos cara ás capas superiores.
- As peticións externas dispoñen dun timeout para evitar esperas indefinidas.
- As claves de APIs non se escriben directamente no código nin se versionan.
- `secrets.json` está excluído mediante `.gitignore`.
- `secrets.example.json` documenta as variables necesarias sen conter credenciais.
- `String.fromEnvironment()` permite recuperar os valores proporcionados durante a execución ou compilación.
- As claves incorporadas nun cliente compilado non se consideran segredos completamente protexidos; un backend sería necesario para credenciais que deban permanecer realmente privadas.
- As posicións do Layout Designer almacénanse normalizadas para manter a distribución independente das dimensións reais da pantalla.
- Durante o drag do layout, a posición actualízase primeiro en memoria e persístese en SQLite ao finalizar o xesto.
- Os elementos do layout non poden saír do taboleiro nin solaparse durante o arrastre.
- Flutter e a funcionalidade teñen prioridade fronte ao refinamento visual nesta fase.
- O deseño responsive aplícase de forma progresiva e a revisión principal do MVP xa foi realizada.
- A documentación técnica mantense sincronizada co estado real do proxecto.

---

# Current Milestone

## Achieved

A infraestrutura relacional principal do MVP está implementada ata SQLite v6.

Actualmente funciona:

```text
Garden
 1
 │
 N
GardenPlant

GardenPlant
 N
 │
 1
PlantSpecies

GardenPlant
 1
 │
 N
PlantEvolutionRecord
```

Os módulos de hortas, plantas e evolución dispoñen de CRUD persistente completo desde a interface.

O módulo de evolución, completado na sesión 16, pechou o bloque principal de seguemento manual das plantas previsto para o MVP.

Na sesión 17 completouse o primeiro módulo baseado nunha API externa.

Na sesión 18 completouse a asociación entre localización, coordenadas e meteoroloxía por horta. A integración permite actualmente:

```text
CreateGardenScreen
   ↓
GeocodingViewModel
   ↓
OpenWeather Geocoding API
   ↓
Garden(location, latitude, longitude)
   ↓
SQLite v4
   ↓
GardenDetailsScreen
   ↓
WeatherViewModel
   ↓
OpenWeather Weather API
```

A aplicación busca localidades reais, permite seleccionar unha coincidencia, persiste as coordenadas e utiliza esas coordenadas para obter as condicións meteorolóxicas da horta concreta.

Na sesión 19 implementouse o primeiro MVP funcional do deseño visual da horta. Incorporouse SQLite v5 coa táboa `garden_layout_items`, o modelo `GardenLayoutItem`, o Repository correspondente, `GardenLayoutViewModel` e `LayoutDesignerScreen`. As plantas poden engadirse ao taboleiro, moverse individualmente mediante drag, manterse dentro dos límites, evitar solapamentos, persistir a súa posición normalizada e retirarse do deseño sen eliminarse da horta.

Na sesión posterior completouse a revisión responsive principal das pantallas do MVP, reforzouse o Layout Designer para procurar un oco libre ao engadir unha planta e incorporouse un módulo básico de tarefas con persistencia local. As pantallas baleiras de configuración e meteoroloxía independente elimináronse ao non seren necesarias no alcance actual; a meteoroloxía permanece contextualizada no detalle de cada horta. A autenticación queda como posible ampliación posterior, unha vez pechados os obxectivos actuais e só se o tempo dispoñible o permite.

Tamén quedaron implementados o tratamento básico de erros HTTP, conexión e timeout, así como a xestión local das credenciais mediante `dart-define`.

## Next Development Step

O seguinte paso deberá decidirse segundo `ROADMAP.md`, mantendo o desenvolvemento incremental e evitando ampliar innecesariamente o alcance do MVP.

Tras completar o primeiro MVP do Layout Designer, o módulo básico de tarefas e a revisión responsive principal, o seguinte paso debe priorizar estabilización, probas e documentación segundo `ROADMAP.md`. Dentro do bloque meteorolóxico quedan como posibles ampliacións:

- Incorporar selección de localización mediante mapa.
- Decidir se o Dashboard debe recuperar no futuro algún resumo meteorolóxico cando existan varias hortas.
- Valorar unha horta principal só se resulta necesaria para esa experiencia.
- Integrar MeteoSIX, cuxas credenciais xa están dispoñibles, cando o roadmap determine que é o seguinte paso máis eficiente.
- Incorporar predición meteorolóxica.
- Desenvolver o histórico climático.

Outros bloques principais aínda previstos:

- Revisión e refinamento do deseño visual da distribución da horta.
- Mellorar a fluidez do arrastre se resulta necesario tras as probas finais.
- Valorar grid/snapping como mellora posterior.
- Probas finais do responsive design e corrección de incidencias puntuais.
- Probas.
- Refinamento da interface.
- Preparación progresiva da memoria final.

---

# Future Improvements

- Sincronización cloud.
- Autenticación de usuario, como bloque opcional posterior ao peche dos obxectivos actuais.
- Notificacións.
- Sensores ambientais.
- IA para recomendacións.
- Compartición de hortas.
- Backup cloud.
- Estatísticas avanzadas.
- Exportación de información histórica das plantas.
- Ampliación ou integración externa do catálogo de especies.
- Selección de localización mediante mapa.
- Melloras visuais da meteoroloxía, como iconas dinámicas segundo as condicións.
- Integración de múltiples provedores meteorolóxicos.

---

# Notes

Este documento considérase a fonte principal de contexto do proxecto MARTOLA.

Calquera cambio relevante na arquitectura, navegación, base de datos ou planificación deberá reflectirse neste ficheiro e na documentación asociada.

O desenvolvemento realízase seguindo unha aprendizaxe progresiva de Flutter e Dart. Cada funcionalidade impleméntase unha vez comprendidos os principios técnicos que a sustentan.

A prioridade é construír unha primeira versión funcional, coherente e mantible antes de introducir funcionalidades avanzadas ou melloras estéticas.

A documentación debe manterse sincronizada co estado real do código e servir como base para a elaboración da memoria final.