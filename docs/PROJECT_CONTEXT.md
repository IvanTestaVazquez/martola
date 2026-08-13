# PROJECT_CONTEXT.md

# Project Information

## Project Name

MARTOLA

**Modelo Avanzado de Rexistro e Tratamento de Organización de Leiras e Agricultura**

## Project Type

Traballo de Fin de Ciclo (TFC)
DAM Dual Intensiva
CIFP A Carballeira Marcos Valcárcel

## Project Summary

MARTOLA é unha aplicación multiplataforma para a xestión de hortas e xardíns desenvolvida con Flutter.

A aplicación permitirá:

- Crear e administrar hortas e xardíns.
- Rexistrar plantas.
- Consultar información meteorolóxica.
- Almacenar históricos climáticos.
- Realizar seguemento da evolución das plantas.
- Deseñar visualmente a distribución dunha horta.
- Servir como ferramenta de apoio á planificación e mantemento de cultivos.

O proxecto está pensado para funcionar inicialmente en:

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

## Database

- SQLite
- `sqflite`
- `sqflite_common_ffi`
- `path`
- `path_provider`

A infraestrutura de persistencia está deseñada para soportar Android, Windows e Linux.

## APIs

- OpenWeatherMap (prevista)

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

## Strategy

Arquitectura MVVM simplificada orientada a:

- Separación de responsabilidades.
- Mantemento sinxelo.
- Escalabilidade futura.
- Curva de aprendizaxe moderada.

## Current Implementation State

A arquitectura MVVM simplificada está implementada no módulo de hortas e dispón actualmente dunha capa de persistencia real mediante SQLite.

O fluxo actual é:

    View
      ↓
    GardensViewModel
      ↓ async
    GardenRepository
      ↑
    SQLiteGardenRepository
      ↓
    DatabaseService
      ↓
    SQLite
      ↓
    martola.db

Existe unha separación efectiva entre:

- Interface de usuario.
- Estado e lóxica de presentación.
- Contrato de acceso aos datos.
- Implementación concreta do Repository.
- Infraestrutura de acceso á base de datos.
- Persistencia SQLite.

`GardensViewModel` actúa como intermediario entre as Views e a capa Repository e é compartido mediante Provider.

O ViewModel mantén unha colección local cos datos xa cargados:

    List<Garden> _gardens

Esta colección representa o estado de presentación e non a fonte persistente dos datos.

A carga inicial realízase mediante:

    loadGardens()

que recupera de maneira asíncrona as hortas desde o Repository e actualiza o estado observable.

As principais operacións do módulo son:

    loadGardens()
    addGarden()
    getGardenById()
    updateGarden()
    removeGarden()

As Views acceden ao ViewModel mediante:

    context.read()
    context.watch()
    context.select()

segundo necesiten executar unha acción, observar o estado completo ou reaccionar a unha parte concreta.

A abstracción de acceso aos datos é:

    GardenRepository

Actualmente a implementación utilizada pola aplicación é:

    SQLiteGardenRepository

`MemoryGardenRepository` mantense como implementación alternativa do mesmo contrato e pode continuar sendo útil durante o desenvolvemento ou para probas.

A implementación concreta inxéctase en `GardensViewModel` desde `main.dart`.

A composición actual é:

    main.dart
       ↓
    DatabaseService
       ↓
    SQLiteGardenRepository
       ↓
    GardensViewModel
       ↓
    ChangeNotifierProvider
       ↓
    Views

Deste modo, `GardensViewModel` depende da abstracción `GardenRepository` e non necesita coñecer a tecnoloxía concreta utilizada para persistir os datos.

Durante as sesións 13 e 14 completouse e evolucionou a primeira infraestrutura SQLite funcional.

Xa se completou:

- Adaptación asíncrona de `GardenRepository`.
- Adaptación asíncrona de `MemoryGardenRepository`.
- Introdución de `Future`, `async` e `await` no fluxo de datos.
- Carga inicial mediante `loadGardens()`.
- Adaptación das operacións CRUD ao modelo asíncrono.
- Implementación de `DatabaseService`.
- Apertura de `martola.db`.
- Implementación de `SQLiteGardenRepository`.
- CRUD completo de hortas mediante SQLite.
- Integración de `SQLiteGardenRepository` desde `main.dart`.
- Recuperación das hortas persistidas ao iniciar a aplicación.
- Verificación da persistencia entre reinicios.
- Evolución do esquema SQLite á versión 2.
- Implementación da primeira migración v1 → v2.
- Conservación dos datos existentes durante a migración.
- Creación de `plant_species`.
- Creación de `garden_plants`.
- Introdución e activación de claves foráneas.
- Verificación de `ON DELETE CASCADE`.
- Verificación de `ON DELETE RESTRICT`.
- Creación do modelo `GardenPlant`.
- Creación do modelo `PlantSpecies`.
- Creación de `GardenPlantRepository`.
- Creación de `PlantSpeciesRepository`.

A infraestrutura SQLite queda preparada para continuar o módulo de plantas.

O seguinte paso é implementar `SQLitePlantSpeciesRepository` e posteriormente `SQLiteGardenPlantRepository`.

---

# Database Design

## Main Entities

### users

Usuarios da aplicación.

### gardens

Hortas ou xardíns creados polos usuarios.

### plant_species

Información xeral das especies vexetais.

### garden_plants

Plantas concretas rexistradas dentro dunha horta.

### plant_evolution_records

Histórico de evolución dunha planta.

### weather_records

Histórico meteorolóxico asociado ás hortas.

### garden_layout_items

Posición visual das plantas dentro do deseño da horta.

---

## Database Relationships

```text
users 1:N gardens

gardens 1:N garden_plants

plant_species 1:N garden_plants

garden_plants 1:N plant_evolution_records

gardens 1:N weather_records

gardens 1:N garden_layout_items

garden_plants 1:1 garden_layout_items
```

---

# Navigation Flow

```text
Inicio / Splash
        ↓
Benvida / Login
        ↓
Panel Principal
        ↓
Lista de Hortas
        ↓
Detalle dunha Horta
        ├── Plantas
        │     └── Detalle Planta
        │            └── Evolución
        ├── Meteoroloxía
        │     └── Histórico Climático
        ├── Deseño Visual
        └── Configuración
```

---

# Responsive Design

## Mobile

Navegación secuencial vertical.

## Tablet

Uso de múltiples columnas.

Paneis simultáneos.

## Desktop

Sidebar lateral.

Maior aproveitamento do espazo horizontal.

Especialmente importante para:

- GardenDetailScreen
- LayoutDesignerScreen

---

# Figma Structure

Debido ás limitacións da versión gratuíta de Figma (3 páxinas), o proxecto estrutúrase do seguinte modo:

## Page 1

### 00_System_&_Wireframes

Contido:

- Design System
- Assets
- Wireframes

## Page 2

### 01_Mobile_UI

Mockups finais para móbil.

## Page 3

### 02_Desktop_&_Prototype

Mockups escritorio.

Prototipo navegable.

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

---

# Existing Documentation

## UI_REFERENCE.md

Referencia funcional das pantallas e widgets.

## ARCHITECTURE.md

Definición da arquitectura software.

## DATABASE_DESIGN.md

Modelo de datos e estrutura SQLite.

## ROADMAP.md

Planificación técnica do desenvolvemento.

## DEVELOPMENT_GUIDE.md

Plan de aprendizaxe e desenvolvemento progresivo de Flutter e Dart aplicado a MARTOLA.

---

# Current Version

## Version

0.1.0-alpha

## Status

🟢 En desenvolvemento activo

## Last Updated

2026-08-13

## Current Phase

A infraestrutura de persistencia SQLite está operativa e evolucionou á versión 2.

O módulo de hortas dispón dun CRUD persistente completo mediante:

    View
      ↓
    GardensViewModel
      ↓
    GardenRepository
      ↑
    SQLiteGardenRepository
      ↓
    DatabaseService
      ↓
    SQLite

A persistencia foi comprobada entre reinicios da aplicación.

A base de datos utiliza actualmente:

    version: 2

O esquema físico implementado contén:

    gardens
    plant_species
    garden_plants

Implementouse e comprobouse a primeira migración real:

    v1 → v2

A migración conserva os datos existentes e incorpora as primeiras relacións mediante claves foráneas.

Están implementados os modelos:

    Garden
    GardenPlant
    PlantSpecies

Están definidos os contratos:

    GardenRepository
    GardenPlantRepository
    PlantSpeciesRepository

Actualmente `GardenRepository` dispón dunha implementación SQLite completa.

As implementacións SQLite de plantas e especies son o seguinte paso do desenvolvemento.

---

# Current Progress

## Analysis & Planning

✅ Descrición inicial do proxecto

✅ Análise de requisitos

✅ Planificación inicial

✅ Estrutura da memoria final

---

## Design

✅ Fluxo de navegación

✅ Estrutura Figma definida

✅ Wireframes definidos

⏳ Design System

⬜ Mockups finais

---

## Architecture

✅ Arquitectura MVVM simplificada

✅ Repository Pattern definido

✅ Estrutura de carpetas

✅ Primeiro ViewModel funcional (`GardensViewModel`)

✅ Estado compartido mediante Provider

✅ Separación entre Views e estado do módulo de hortas

✅ Implementación da capa Repository no módulo de hortas

✅ Creación da abstracción `GardenRepository`

✅ Creación de `MemoryGardenRepository`

✅ Inxección de dependencias entre `GardensViewModel` e `GardenRepository`

✅ Configuración de `main.dart` como punto de composición

✅ Conversión de `GardenRepository` a contrato asíncrono

✅ Adaptación de `MemoryGardenRepository` ao contrato asíncrono

✅ Estado de presentación cargado en `GardensViewModel`

✅ Carga inicial mediante `loadGardens()`

✅ Implementación inicial de `DatabaseService`

✅ Implementación de `SQLiteGardenRepository`

✅ Integración da capa de persistencia SQLite

✅ Substitución de `MemoryGardenRepository` por `SQLiteGardenRepository` na composición da aplicación

✅ Persistencia SQLite desacoplada do ViewModel mediante `GardenRepository`

✅ Estratexia de versionado da base de datos comprendida e documentada

✅ Estratexia para futuras migracións definida

✅ Primeira migración SQLite v1 → v2

✅ Conservación dos datos existentes durante a migración

✅ Introdución de claves foráneas

✅ Creación de `GardenPlantRepository`

✅ Creación de `PlantSpeciesRepository`

⬜ Implementación de `SQLitePlantSpeciesRepository`

⬜ Implementación de `SQLiteGardenPlantRepository`

---

## Database

✅ Modelo ER

✅ Documentación SQLite

✅ Dependencias SQLite multiplataforma configuradas

✅ Implementación inicial de `DatabaseService`

✅ Apertura de `martola.db`

✅ Creación do esquema inicial

✅ Creación da táboa `gardens`

✅ Conversión `Garden ↔ Map<String, Object?>`

✅ Implementación de `SQLiteGardenRepository`

✅ CRUD SQLite do módulo de hortas

✅ Integración SQLite co módulo de hortas

✅ Persistencia verificada entre reinicios

✅ Versionado do esquema comprendido e documentado

✅ Funcionamento de `onCreate` e `onUpgrade` comprendido

✅ Estratexia de migracións acumulativas definida

✅ Evolución do esquema SQLite á versión 2

✅ Primeira migración real v1 → v2

✅ Conservación dos datos existentes durante a migración

✅ Creación da táboa `plant_species`

✅ Creación da táboa `garden_plants`

✅ Activación de claves foráneas mediante `PRAGMA foreign_keys = ON`

✅ Implementación de `ON DELETE CASCADE`

✅ Implementación de `ON DELETE RESTRICT`

✅ Verificación transaccional da integridade referencial

---

## Documentation

✅ PROJECT_CONTEXT.md

✅ UI_REFERENCE.md

✅ ARCHITECTURE.md

✅ DATABASE_DESIGN.md

✅ ROADMAP.md

✅ DEVELOPMENT_GUIDE.md

---

## Development

✅ Creación proxecto Flutter

✅ Configuración inicial Git/GitHub

✅ Estrutura de carpetas da arquitectura

✅ Creación da primeira HomeScreen funcional

✅ Primeira interface funcional implementada

✅ Primeiro widget reutilizable (`MartolaLogo`)

✅ Configuración inicial do Theme global

✅ Creación de `DashboardScreen`

✅ Creación dos widgets principais do Dashboard:
    - `WeatherCard`
    - `GardenCard`
    - `TasksCard`
    - `QuickActionsCard`

✅ Navegación do Dashboard aos módulos de hortas e tarefas

✅ Pantallas provisionais `TasksScreen` e `CreateTaskScreen`

✅ Callbacks desacoplados da navegación nos widgets do Dashboard

✅ Creación do modelo de dominio `Garden`

✅ Implementación inicial de `GardensScreen`

✅ Listado dinámico de hortas mediante `ListView.builder`

✅ Creación do widget reutilizable `GardenListItem`

✅ Selección dunha horta mediante `InkWell`

✅ Navegación desde a lista ao detalle dunha horta

✅ Creación de `GardenDetailsScreen`

✅ Paso dun obxecto `Garden` entre pantallas

✅ Conversión de `CreateGardenScreen` a `StatefulWidget`

✅ Implementación do formulario de creación de hortas

✅ Xestión dos campos mediante `TextEditingController`

✅ Validación do formulario mediante `Form` e `GlobalKey<FormState>`

✅ Validación de nome, localización e superficie

✅ Conversión da superficie de `String` a `double`

✅ Creación dun obxecto `Garden` a partir dos datos do formulario

✅ Devolución dun `Garden` entre rutas mediante `Navigator.pop(garden)`

✅ Recepción de resultados mediante `await Navigator.push<Garden>()`

✅ Integración do paquete Provider

✅ Creación de `GardensViewModel`

✅ Centralización da colección de hortas no ViewModel

✅ Encapsulación da colección mediante `List.unmodifiable`

✅ Implementación de `ChangeNotifier` e `notifyListeners()`

✅ Configuración de `ChangeNotifierProvider` por enriba de `MaterialApp`

✅ Lectura reactiva do estado en `GardensScreen` mediante `context.watch`

✅ Modificación do estado desde `CreateGardenScreen` mediante `context.read`

✅ Actualización dinámica do número de hortas no Dashboard mediante `context.select`

✅ Eliminación dos mock data locais de `GardensScreen`

✅ Implementación de identificadores temporais para as hortas en memoria

✅ Implementación de `getGardenById()`

✅ Creación de `EditGardenScreen`

✅ Inicialización dos formularios de edición mediante `initState()`

✅ Actualización de hortas mediante modelos inmutables

✅ Implementación de `updateGarden()`

✅ Implementación de eliminación de hortas mediante `removeGarden()`

✅ Confirmación de eliminación mediante `AlertDialog`

✅ Conversión de `GardenDetailsScreen` para traballar mediante `gardenId`

✅ Consulta da versión actual dunha horta desde `GardensViewModel`

✅ CRUD completo de hortas en memoria

✅ Creación da capa Repository para o módulo de hortas

✅ Traslado da colección de hortas desde `GardensViewModel` a `MemoryGardenRepository`

✅ Traslado da xeración temporal de identificadores ao Repository

✅ Delegación das operacións CRUD desde `GardensViewModel` ao Repository

✅ Actualización das operacións de edición e eliminación para traballar mediante `gardenId`

✅ Conservación da identidade dunha horta durante as actualizacións

✅ Creación da abstracción `GardenRepository`

✅ Creación da implementación `MemoryGardenRepository`

✅ Aplicación de inxección de dependencias en `GardensViewModel`

✅ Dependencia de `GardensViewModel` respecto da abstracción `GardenRepository`

✅ Selección de `MemoryGardenRepository` desde `main.dart`

✅ CRUD completo verificado tras a separación ViewModel/Repository
✅ Conversión das operacións de `GardenRepository` a `Future`

✅ Adaptación de `MemoryGardenRepository` ao modelo asíncrono

✅ Creación do estado local `_gardens` en `GardensViewModel`

✅ Implementación de `loadGardens()`

✅ Carga inicial dos datos ao crear `GardensViewModel`

✅ Sincronización do estado local tras creación, edición e eliminación

✅ Adaptación de `CreateGardenScreen` ao uso de `await`

✅ Adaptación de `EditGardenScreen` ao uso de `await`

✅ Adaptación da eliminación desde `GardenDetailsScreen` ao uso de `await`

✅ Uso de `context.mounted` despois de operacións asíncronas

✅ Instalación de `sqflite`

✅ Instalación de `sqflite_common_ffi`

✅ Instalación de `path`

✅ Instalación de `path_provider`

✅ Implementación inicial de `DatabaseService`

✅ Apertura de `martola.db`

✅ Creación da táboa `gardens`

✅ Implementación de `Garden.fromMap()`

✅ Implementación de `Garden.toMap()`

✅ Creación de `SQLiteGardenRepository`

✅ Implementación de lectura de hortas mediante SQLite

✅ Implementación de inserción de hortas mediante SQLite

✅ Implementación de actualización de hortas mediante SQLite

✅ Implementación de eliminación de hortas mediante SQLite

✅ Integración de `SQLiteGardenRepository` desde `main.dart`

✅ Substitución da persistencia en memoria pola persistencia SQLite

✅ Carga das hortas persistidas mediante `loadGardens()`

✅ Persistencia dos datos verificada entre reinicios

✅ Introdución ao versionado SQLite

✅ Introdución a `onCreate` e `onUpgrade`

✅ Introdución ás migracións acumulativas

✅ Revisión e limpeza final de `DatabaseService`

✅ Evolución da base de datos á versión 2

✅ Primeira migración SQLite v1 → v2

✅ Creación do modelo `GardenPlant`

✅ Creación do modelo `PlantSpecies`

✅ Implementación de `GardenPlant.toMap()` e `GardenPlant.fromMap()`

✅ Implementación de `PlantSpecies.toMap()` e `PlantSpecies.fromMap()`

✅ Creación das táboas `plant_species` e `garden_plants`

✅ Introdución de claves foráneas

✅ Activación de `PRAGMA foreign_keys = ON`

✅ Verificación de `ON DELETE CASCADE`

✅ Verificación de `ON DELETE RESTRICT`

✅ Creación de `GardenPlantRepository`

✅ Creación de `PlantSpeciesRepository`

⬜ Implementación de `SQLitePlantSpeciesRepository`

⬜ Implementación de `SQLiteGardenPlantRepository`

⬜ Módulo funcional de plantas

---

# Important Technical Decisions

- Arquitectura Local First.
- SQLite antes que Firebase.
- MVVM simplificado para reducir complexidade.
- Responsive Design desde o inicio.
- Flutter Desktop incluído como obxectivo.
- Sistema preparado para futura sincronización cloud.
- Flutter terá prioridade fronte ao deseño visual.
- Os wireframes actuarán como referencia funcional para o desenvolvemento.
- A documentación técnica converterase na principal fonte de contexto do proxecto.
- Os widgets específicos dunha funcionalidade manteranse dentro da propia funcionalidade ata que exista unha necesidade real de reutilización.
- Os widgets de presentación recibirán accións externas mediante callbacks para evitar acoplamento coa navegación.
- O Dashboard estrutúrase mediante compoñentes independentes: WeatherCard, GardenCard, TasksCard e QuickActionsCard.
- Durante a fase inicial da interface utilizaranse mock data antes da integración con SQLite e APIs.
- As accións dependentes dunha horta concreta, como engadir unha planta, situaranse dentro do contexto desa horta.
- Os widgets de presentación comunicarán as interaccións mediante callbacks; a navegación será responsabilidade das pantallas que coñecen o fluxo da aplicación.
- O desenvolvemento das novas funcionalidades seguirá unha estratexia incremental: primeiro establecerase o fluxo mediante pantallas provisionais e posteriormente implementarase o seu contido funcional.
- Os datos de dominio representaranse mediante modelos independentes da interface, comezando polo modelo `Garden`.
- As pantallas que necesiten manter sincronizada unha entidade co estado compartido traballarán preferentemente coa súa identidade e obterán a versión actual desde o ViewModel.
- Os elementos das listas recibirán o modelo completo cando os seus datos pertenzan conceptualmente á mesma entidade.
- A interacción dun widget non implica por si mesma a necesidade dun `StatefulWidget`; utilizarase estado local só cando exista estado ou recursos que deban ser xestionados polo widget.
- Os recursos asociados ao ciclo de vida dun `State`, como os `TextEditingController`, serán creados e liberados polo propio `State`.
- Os formularios utilizarán `Form`, `GlobalKey<FormState>` e validadores para comprobar os datos antes de construír os modelos de dominio.
- Os datos procedentes de campos de texto serán convertidos explicitamente ao tipo requirido polo modelo antes da creación do obxecto.
- O identificador de `Garden` pode ser `null` antes de que a entidade sexa incorporada á fonte de datos. Na implementación SQLite, o identificador é xerado pola base de datos mediante `INTEGER PRIMARY KEY AUTOINCREMENT`.
- A xestión de estado e a persistencia considéranse responsabilidades diferentes. Provider mantén e distribúe o estado compartido da aplicación, mentres que SQLite proporciona a persistencia local.
- `SQLiteGardenRepository` é a implementación actualmente utilizada para a persistencia do módulo de hortas.
- `MemoryGardenRepository` mantense como implementación alternativa de `GardenRepository`, útil para probas ou desenvolvemento sen persistencia real.
- `DatabaseService` centraliza a apertura, configuración e reutilización da conexión SQLite.
- Os modelos de dominio poden definir mecanismos de conversión cara e desde a representación utilizada pola capa de persistencia, como `toMap()` e `fromMap()`.
- `SQLiteGardenRepository` encapsula as operacións SQL necesarias para transformar as operacións do dominio en operacións sobre SQLite.
- O esquema SQLite evolucionará mediante versións e migracións para permitir cambios futuros conservando os datos existentes.
- `Navigator` poderá utilizarse para devolver resultados entre rutas cando o fluxo o requira.
- Non se implementarán solucións temporais para manter sincronizados datos locais entre pantallas cando esa responsabilidade corresponda posteriormente á xestión de estado.
- Provider utilízase como mecanismo de distribución e observación do estado compartido.
- `GardensViewModel` xestiona o estado de presentación do módulo de hortas e delega o acceso e manipulación dos datos en `GardenRepository`.
- As Views non modificarán directamente as coleccións do ViewModel; as modificacións realizaranse mediante operacións específicas como `addGarden()`, `updateGarden()` e `removeGarden()`.
- Utilizarase `context.read` para executar accións sen subscribirse aos cambios, `context.watch` cando a View dependa do estado completo e `context.select` cando só necesite observar unha parte concreta.
- Os modelos de dominio manteranse inmutables. As actualizacións realizaranse creando unha nova instancia e substituíndo a anterior no estado.
- `GardensViewModel` dependerá da abstracción `GardenRepository` e non dunha implementación concreta.
- As implementacións concretas do acceso aos datos estarán separadas do contrato definido por `GardenRepository`.
- `main.dart` actúa como punto de composición para seleccionar e inxectar as implementacións concretas das dependencias.
- As operacións sobre entidades persistidas utilizarán preferentemente o identificador da entidade en lugar de depender dunha instancia concreta do modelo.
- O Repository será responsable de garantir a conservación da identidade dunha entidade durante unha actualización.
- `GardenRepository` utiliza un contrato asíncrono mediante `Future` para permitir implementacións baseadas tanto en memoria como en fontes persistentes.
- `GardensViewModel` mantén o estado xa cargado necesario para as Views, mentres que o Repository continúa sendo a abstracción de acceso á fonte de datos.
- As Views non accederán directamente á base de datos nin deberán coñecer a tecnoloxía de persistencia utilizada.
- Os Repositories específicos utilizarán `DatabaseService` para acceder á infraestrutura de persistencia.
- A infraestrutura SQLite deberá soportar Android, Windows e Linux mediante a factoría apropiada para cada plataforma.
- As rutas de ficheiros construiranse mediante `path` e os directorios da aplicación obteranse mediante `path_provider`.
- Os identificadores poden manterse como `String` nos modelos de dominio aínda que SQLite utilice `INTEGER`; a conversión realizarase na fronteira coa persistencia.
- As datas do dominio representadas mediante `DateTime` almacenaranse inicialmente en SQLite como `TEXT` utilizando ISO 8601.
- `GardenPlant` e `PlantSpecies` serán entidades independentes para evitar duplicar información común dunha especie en cada planta concreta.
- As plantas dunha horta accederanse principalmente mediante `getPlantsByGardenId(gardenId)` en lugar dunha consulta global.
- `GardenPlantRepository` e `PlantSpeciesRepository` manteranse separados para preservar unha responsabilidade única por Repository.
- As claves foráneas de SQLite activaranse mediante `PRAGMA foreign_keys = ON`.
- A eliminación dunha horta utilizará `ON DELETE CASCADE` sobre as plantas asociadas.
- A eliminación dunha especie utilizada por unha planta estará protexida mediante `ON DELETE RESTRICT`.
- As migracións SQLite seguirán unha estratexia acumulativa baseada en comprobacións de `oldVersion`.

---

# Next Milestone

### Current Objective

Continuar o módulo de plantas sobre a infraestrutura SQLite v2 xa implementada.

### Starting Point

O módulo de hortas dispón dun CRUD persistente completo.

A base de datos está actualmente en:

    version: 2

O esquema implementado contén:

    gardens
    plant_species
    garden_plants

A primeira migración:

    v1 → v2

está implementada e comprobada.

As relacións actuais son:

    Garden
      1
      │
      N
    GardenPlant
      N
      │
      1
    PlantSpecies

A integridade referencial está activada e comprobouse o funcionamento de:

    ON DELETE CASCADE
    ON DELETE RESTRICT

No dominio están implementados:

    Garden
    GardenPlant
    PlantSpecies

Na capa Repository están definidos:

    GardenRepository
    GardenPlantRepository
    PlantSpeciesRepository

Actualmente existe:

    SQLiteGardenRepository

e están pendentes:

    SQLitePlantSpeciesRepository
    SQLiteGardenPlantRepository

### Next Development Step

A seguinte tarefa será implementar:

    SQLitePlantSpeciesRepository

Comezarase polo catálogo de especies porque `GardenPlant` depende dunha especie existente mediante `speciesId`.

Unha vez implementado e comprobado o acceso persistente ás especies, continuarase con:

    SQLiteGardenPlantRepository

Posteriormente integrarase o módulo de plantas coa capa ViewModel e coa interface.

## Deliverable

Primeira infraestrutura relacional de MARTOLA completada e módulo de plantas preparado a nivel de dominio, base de datos e contratos Repository para iniciar as súas implementacións SQLite.

---

# Future Improvements

- Sincronización cloud.
- Autenticación avanzada.
- Notificacións.
- Sensores ambientais.
- IA para recomendacións.
- Compartición de hortas.
- Backup cloud.
- Estatísticas avanzadas.

---

# Notes

Este documento considérase a fonte principal de contexto do proxecto MARTOLA.

Calquera cambio relevante na arquitectura, navegación, base de datos ou planificación deberá reflectirse neste ficheiro e na documentación asociada.

O obxectivo principal actual é construír unha primeira versión funcional antes de introducir funcionalidades avanzadas ou melloras estéticas.

## Current Development Strategy

O desenvolvemento de MARTOLA realízase seguindo unha aprendizaxe progresiva de Flutter.

Cada funcionalidade impleméntase unha vez comprendidos os principios técnicos que a sustentan.

A prioridade actual non é a cantidade de código, senón construír unha arquitectura sólida, reutilizable e facilmente mantible.

A documentación mantense sincronizada co estado real do proxecto e constitúe a principal referencia durante o desenvolvemento.