# PROJECT_CONTEXT.md

# Project Information

## Project Name

**MARTOLA**

**Modelo Avanzado de Rexistro e Tratamento de Organización de Leiras e
Agricultura**

## Project Type

-   Traballo de Fin de Ciclo (TFC)
-   DAM Dual Intensiva
-   CIFP A Carballeira Marcos Valcárcel

## Project Summary

MARTOLA é unha aplicación multiplataforma desenvolvida con Flutter para
a xestión de hortas e xardíns.

A aplicación permitirá:

-   Crear, editar e eliminar hortas e xardíns.
-   Rexistrar, editar e eliminar plantas.
-   Manter un catálogo de especies vexetais.
-   Realizar seguemento da evolución das plantas mediante rexistros
    históricos.
-   Consultar información meteorolóxica.
-   Almacenar históricos climáticos.
-   Deseñar visualmente a distribución dunha horta.
-   Servir como ferramenta de apoio á planificación e mantemento de
    cultivos.

O proxecto está pensado inicialmente para:

-   Android
-   Windows
-   Linux
-   Tablets

Posible soporte futuro:

-   Web
-   Sincronización cloud

iOS descártase inicialmente debido ás limitacións e custos asociados ao
desenvolvemento para a plataforma Apple.

------------------------------------------------------------------------

# Project Documentation

## Documentation Structure

``` text
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

Esta documentación constitúe o sistema principal de seguemento e
contexto do proxecto.

Todos os cambios relevantes deberán reflectirse nestes documentos para
facilitar:

-   Desenvolvemento.
-   Mantemento.
-   Elaboración da memoria final.
-   Recuperación de contexto.
-   Seguemento da evolución do proxecto.

------------------------------------------------------------------------

# Technical Stack

## Frontend

-   Flutter
-   Dart

## Architecture

-   MVVM simplificado
-   Repository Pattern

## State Management

-   Provider
-   `ChangeNotifier`
-   `MultiProvider`

## Database

-   SQLite
-   `sqflite`
-   `sqflite_common_ffi`
-   `path`
-   `path_provider`

A infraestrutura de persistencia está deseñada para soportar Android,
Windows e Linux.

## APIs

-   OpenWeatherMap (prevista)

## Design Tools

-   Figma
-   draw.io

## Version Control

-   Git
-   GitHub

------------------------------------------------------------------------

# Architecture

## Folder Structure

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

## Architecture Flow

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

## Strategy

Arquitectura MVVM simplificada orientada a:

-   Separación de responsabilidades.
-   Mantemento sinxelo.
-   Escalabilidade futura.
-   Curva de aprendizaxe moderada.
-   Independencia entre interface, estado e persistencia.

## Current Implementation State

A arquitectura está aplicada actualmente aos módulos de hortas, plantas,
especies e evolución das plantas.

A composición principal realízase en `main.dart`, onde se crean e
inxectan as implementacións concretas dos Repositories e os ViewModels
mediante `MultiProvider`.

``` text
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

Os ViewModels implementados son:

-   `GardensViewModel`
-   `PlantSpeciesViewModel`
-   `PlantsViewModel`
-   `PlantEvolutionViewModel`

As Views acceden ao estado mediante:

-   `context.read()` para executar accións sen subscribirse aos cambios.
-   `context.watch()` para observar un estado.
-   `context.select()` para observar só unha parte concreta.

Os ViewModels manteñen estado de presentación xa cargado, mentres que os
Repositories constitúen a abstracción de acceso aos datos persistentes.

## Implemented Repositories

Contratos:

-   `GardenRepository`
-   `PlantSpeciesRepository`
-   `GardenPlantRepository`
-   `PlantEvolutionRecordRepository`

Implementacións SQLite:

-   `SQLiteGardenRepository`
-   `SQLitePlantSpeciesRepository`
-   `SQLiteGardenPlantRepository`
-   `SQLitePlantEvolutionRecordRepository`

`MemoryGardenRepository` mantense como implementación alternativa útil
para probas ou desenvolvemento.

------------------------------------------------------------------------

# Database Design

## Current SQLite Version

``` text
version: 3
```

Migracións implementadas e comprobadas:

``` text
v1 → v2
v2 → v3
```

As migracións son acumulativas e conservan os datos existentes.

## Current Physical Schema

``` text
gardens
plant_species
garden_plants
plant_evolution_records
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

-   `id`
-   `plant_id`
-   `date`
-   `height`
-   `notes`

`height` e `notes` son opcionais.

### Future Entities

Previstas no deseño global, pero aínda non implementadas fisicamente:

-   `users`
-   `weather_records`
-   `garden_layout_items`

## Current Relationships

``` text
gardens 1:N garden_plants

plant_species 1:N garden_plants

garden_plants 1:N plant_evolution_records
```

Integridade referencial:

-   `garden_plants.garden_id → gardens.id` con `ON DELETE CASCADE`.
-   `garden_plants.species_id → plant_species.id` con
    `ON DELETE RESTRICT`.
-   `plant_evolution_records.plant_id → garden_plants.id` con
    `ON DELETE CASCADE`.

As claves foráneas actívanse mediante:

``` sql
PRAGMA foreign_keys = ON
```

## Persistence Decisions

-   Os identificadores do dominio mantéñense como `String`, aínda que
    SQLite utiliza `INTEGER`.
-   A conversión realízase na fronteira coa persistencia.
-   Os `DateTime` almacénanse como `TEXT` en formato ISO 8601.
-   Os valores decimais, como superficie ou altura, almacénanse como
    `REAL`.
-   Os campos opcionais poden persistirse como `NULL`.

------------------------------------------------------------------------

# Implemented Functional Modules

## Gardens

CRUD completo desde a interface:

-   Crear horta.
-   Listar hortas.
-   Consultar detalle.
-   Editar horta.
-   Eliminar horta.
-   Persistencia SQLite.
-   Recuperación dos datos entre reinicios.

Fluxo:

``` text
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

-   Modelo `PlantSpecies`.
-   `PlantSpeciesRepository`.
-   `SQLitePlantSpeciesRepository`.
-   `PlantSpeciesViewModel`.
-   Catálogo inicial local de especies.
-   Inserción do catálogo só cando `plant_species` está baleira.
-   Uso do catálogo desde os formularios mediante selector de especies.

O catálogo local é unha solución provisional para o MVP e poderá
substituírse ou ampliarse no futuro.

## Plants

CRUD completo desde a interface:

-   Listar plantas dunha horta.
-   Crear planta.
-   Consultar detalle.
-   Resolver o nome da especie asociada.
-   Editar planta.
-   Eliminar planta.
-   Persistencia SQLite.
-   Actualización reactiva das Views.

`PlantsViewModel` conserva `_currentGardenId` e mantén unicamente as
plantas correspondentes á horta actualmente cargada.

Fluxo principal:

``` text
GardenDetailsScreen
  ↓
PlantListScreen
  ↓
PlantDetailsScreen
```

Pantallas implementadas:

-   `PlantListScreen`
-   `AddPlantScreen`
-   `PlantDetailsScreen`
-   `EditPlantScreen`

## Plant Evolution

O módulo de evolución está implementado cun CRUD completo desde a
interface.

Modelo:

-   `PlantEvolutionRecord`

Campos:

-   `id`
-   `plantId`
-   `date`
-   `height` opcional
-   `notes` opcionais

Infraestrutura:

-   `PlantEvolutionRecordRepository`
-   `SQLitePlantEvolutionRecordRepository`
-   `PlantEvolutionViewModel`

Pantallas:

-   `PlantEvolutionListScreen`
-   `AddPlantEvolutionRecordScreen`
-   `PlantEvolutionDetailsScreen`
-   `EditPlantEvolutionRecordScreen`

Funcionalidades:

-   Cargar os rexistros dunha planta.
-   Crear un rexistro.
-   Consultar o detalle.
-   Editar un rexistro.
-   Eliminar un rexistro.
-   Validar altura opcional.
-   Gardar altura e notas como `NULL` cando non se proporcionan.
-   Seleccionar a data mediante `showDatePicker`.
-   Actualizar automaticamente as Views mediante `notifyListeners()`.

`PlantEvolutionViewModel` conserva `_currentPlantId`, polo que os
formularios de creación non necesitan xestionar directamente a relación
coa planta activa.

Fluxo:

``` text
PlantDetailsScreen
  ↓
PlantEvolutionListScreen
  ↓
PlantEvolutionDetailsScreen
```

Fluxo de datos:

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

O CRUD foi comprobado tanto directamente contra o Repository/SQLite como
desde a interface.

------------------------------------------------------------------------

# Navigation Flow

Fluxo funcional actualmente relevante:

``` text
Inicio
  ↓
Dashboard
  ↓
Lista de Hortas
  ↓
Detalle dunha Horta
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

``` text
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
```

Funcionalidades futuras previstas no fluxo:

-   Meteoroloxía.
-   Histórico climático.
-   Deseño visual da horta.
-   Configuración.
-   Tarefas e alertas.

------------------------------------------------------------------------

# Responsive Design

## Mobile

Navegación principalmente secuencial e vertical.

## Tablet

Prevese uso de múltiples columnas e paneis simultáneos.

## Desktop

Prevese maior aproveitamento do espazo horizontal e posible navegación
mediante sidebar.

O deseño responsive será especialmente relevante para:

-   `GardenDetailsScreen`
-   Listas e detalles.
-   Futuro `LayoutDesignerScreen`

------------------------------------------------------------------------

# Figma Structure

Debido ás limitacións da versión gratuíta de Figma, o proxecto
estrutúrase en tres páxinas:

## Page 1 --- `00_System_&_Wireframes`

-   Design System
-   Assets
-   Wireframes

## Page 2 --- `01_Mobile_UI`

-   Mockups finais para móbil

## Page 3 --- `02_Desktop_&_Prototype`

-   Mockups de escritorio
-   Prototipo navegable

------------------------------------------------------------------------

# Design System

## Current Status

Pendente de definición final.

Durante a fase de deseño definiranse:

-   Paleta de cores.
-   Tipografías.
-   Sistema de espazado.
-   Compoñentes reutilizables.
-   Comportamento responsive.
-   Iconografía.

A prioridade actual continúa sendo completar e estabilizar a
funcionalidade antes do refinamento visual definitivo.

------------------------------------------------------------------------

# Current Version

## Version

`0.1.0-alpha`

## Status

🟢 En desenvolvemento activo

## Last Updated

2026-08-17

## Current Phase

A infraestrutura local principal do MVP está operativa mediante SQLite
v3.

Están implementados de extremo a extremo:

-   CRUD de hortas.
-   Catálogo local de especies.
-   CRUD de plantas.
-   CRUD de rexistros de evolución.

A persistencia foi comprobada entre reinicios e as relacións entre
hortas, plantas, especies e evolución están implementadas mediante
claves foráneas.

------------------------------------------------------------------------

# Current Progress

## Analysis & Planning

-   ✅ Descrición inicial do proxecto
-   ✅ Análise de requisitos
-   ✅ Planificación inicial
-   ✅ Estrutura da memoria final

## Design

-   ✅ Fluxo de navegación
-   ✅ Estrutura Figma definida
-   ✅ Wireframes definidos
-   ⏳ Design System
-   ⬜ Mockups finais

## Architecture

-   ✅ MVVM simplificado
-   ✅ Repository Pattern
-   ✅ Estrutura de carpetas
-   ✅ Provider / MultiProvider
-   ✅ Inxección de dependencias desde `main.dart`
-   ✅ Contratos Repository asíncronos
-   ✅ ViewModels desacoplados da persistencia
-   ✅ `GardensViewModel`
-   ✅ `PlantSpeciesViewModel`
-   ✅ `PlantsViewModel`
-   ✅ `PlantEvolutionViewModel`
-   ✅ Repositories SQLite para hortas, especies, plantas e evolución

## Database

-   ✅ SQLite multiplataforma
-   ✅ `DatabaseService`
-   ✅ `martola.db`
-   ✅ Versionado do esquema
-   ✅ Migración v1 → v2
-   ✅ Migración v2 → v3
-   ✅ Conservación dos datos existentes
-   ✅ `gardens`
-   ✅ `plant_species`
-   ✅ `garden_plants`
-   ✅ `plant_evolution_records`
-   ✅ Claves foráneas
-   ✅ `ON DELETE CASCADE`
-   ✅ `ON DELETE RESTRICT`
-   ✅ Datas ISO 8601
-   ✅ Valores opcionais `NULL`
-   ✅ Catálogo inicial de especies

## Development

-   ✅ Home e Dashboard iniciais
-   ✅ CRUD completo de hortas
-   ✅ Persistencia real das hortas
-   ✅ Módulo de especies
-   ✅ CRUD completo de plantas
-   ✅ Navegación Horta → Plantas → Detalle
-   ✅ CRUD completo de evolución
-   ✅ Navegación Planta → Evolución → Detalle
-   ✅ Formularios con validación
-   ✅ `TextEditingController`
-   ✅ `showDatePicker`
-   ✅ Conversión segura de datos de formulario
-   ✅ Uso de `context.mounted` tras operacións asíncronas
-   ✅ Actualización reactiva mediante Provider

## Documentation

-   ✅ `PROJECT_CONTEXT.md`
-   ✅ `UI_REFERENCE.md`
-   ✅ `ARCHITECTURE.md`
-   ✅ `DATABASE_DESIGN.md`
-   ✅ `ROADMAP.md`
-   ✅ `DEVELOPMENT_GUIDE.md`
-   ✅ `LEARNING_NOTES.md`

------------------------------------------------------------------------

# Important Technical Decisions

-   Arquitectura Local First.
-   SQLite antes que Firebase ou sincronización cloud.
-   MVVM simplificado para manter unha complexidade asumible.
-   Repository Pattern para desacoplar o dominio da persistencia.
-   Provider para distribuír e observar o estado compartido.
-   `main.dart` como punto de composición e inxección de dependencias.
-   As Views non acceden directamente á base de datos.
-   Os ViewModels dependen dos contratos Repository, non das
    implementacións SQLite.
-   Os modelos de dominio mantéñense independentes da interface.
-   Os modelos poden implementar `toMap()` e `fromMap()` para a
    fronteira coa persistencia.
-   Os identificadores poden ser `String` no dominio e `INTEGER` en
    SQLite.
-   Os `DateTime` almacénanse como `TEXT` ISO 8601.
-   Os campos opcionais persístense como `NULL` cando non existe un
    valor.
-   As migracións SQLite son acumulativas mediante comprobacións de
    `oldVersion`.
-   As claves foráneas actívanse explicitamente con
    `PRAGMA foreign_keys = ON`.
-   A eliminación dunha horta elimina as súas plantas mediante
    `ON DELETE CASCADE`.
-   A eliminación dunha planta elimina os seus rexistros de evolución
    mediante `ON DELETE CASCADE`.
-   Unha especie utilizada por unha planta está protexida mediante
    `ON DELETE RESTRICT`.
-   `PlantSpeciesRepository`, `GardenPlantRepository` e
    `PlantEvolutionRecordRepository` mantéñense separados por
    responsabilidade.
-   `PlantsViewModel` conserva o contexto da horta activa mediante
    `_currentGardenId`.
-   `PlantEvolutionViewModel` conserva o contexto da planta activa
    mediante `_currentPlantId`.
-   Os formularios manteñen o estado temporal na propia View mediante
    `StatefulWidget` e `setState()`.
-   Os `TextEditingController` créanse e libéranse no ciclo de vida do
    `State`.
-   Os formularios utilizan `Form`, `GlobalKey<FormState>` e
    validadores.
-   Os campos opcionais baleiros convértense a `null` cando esa é a
    semántica do dominio.
-   `context.read()` úsase para accións, `context.watch()` para observar
    estado e `context.select()` para observar partes concretas.
-   As entidades persistidas actualízanse preferentemente mediante o seu
    identificador.
-   As pantallas de detalle consultan a versión actual da entidade desde
    o ViewModel cando necesitan permanecer sincronizadas.
-   Os widgets de presentación comunican accións mediante callbacks
    cando convén desacoplalos da navegación.
-   As novas funcionalidades desenvólvense incrementalmente: dominio →
    persistencia → ViewModel → interface → proba.
-   Flutter e a funcionalidade teñen prioridade fronte ao refinamento
    visual nesta fase.
-   O deseño seguirá sendo responsive desde o inicio.
-   A documentación técnica mantense sincronizada co estado real do
    proxecto.

------------------------------------------------------------------------

# Current Milestone

## Achieved

A infraestrutura relacional principal do MVP está implementada ata
SQLite v3.

Actualmente funciona:

``` text
Garden
  1
  │
  N
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

Os módulos de hortas, plantas e evolución dispoñen de CRUD persistente
completo desde a interface.

O módulo de evolución, completado na sesión 16, pecha o bloque principal
de seguemento manual das plantas previsto para o MVP.

## Next Development Step

O seguinte paso deberá decidirse segundo `ROADMAP.md`, priorizando as
funcionalidades aínda pendentes do MVP e evitando introducir
funcionalidades futuras antes de estabilizar a base actual.

Os principais bloques aínda previstos inclúen:

-   Integración meteorolóxica.
-   Histórico climático.
-   Deseño visual da distribución da horta.
-   Revisión do responsive design.
-   Probas.
-   Refinamento da interface.
-   Preparación progresiva da memoria final.

------------------------------------------------------------------------

# Future Improvements

-   Sincronización cloud.
-   Autenticación avanzada.
-   Notificacións.
-   Sensores ambientais.
-   IA para recomendacións.
-   Compartición de hortas.
-   Backup cloud.
-   Estatísticas avanzadas.
-   Exportación de información histórica das plantas.
-   Ampliación ou integración externa do catálogo de especies.

------------------------------------------------------------------------

# Notes

Este documento considérase a fonte principal de contexto do proxecto
MARTOLA.

Calquera cambio relevante na arquitectura, navegación, base de datos ou
planificación deberá reflectirse neste ficheiro e na documentación
asociada.

O desenvolvemento realízase seguindo unha aprendizaxe progresiva de
Flutter e Dart. Cada funcionalidade impleméntase unha vez comprendidos
os principios técnicos que a sustentan.

A prioridade é construír unha primeira versión funcional, coherente e
mantible antes de introducir funcionalidades avanzadas ou melloras
estéticas.

A documentación debe manterse sincronizada co estado real do código e
servir como base para a elaboración da memoria final.
