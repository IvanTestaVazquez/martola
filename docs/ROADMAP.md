# MARTOLA - Development Roadmap

## Purpose

Este documento define a planificación técnica do desenvolvemento de
MARTOLA.

O seu obxectivo é:

-   Dividir o proxecto en fases.
-   Establecer prioridades.
-   Facilitar o seguemento do progreso.
-   Evitar bloqueos durante o desenvolvemento.

**---**

# Current Status

## Completed

-   Idea do proxecto.
-   Nome definitivo.
-   Análise de requisitos.
-   Planificación inicial.
-   Modelo de datos inicial.
-   Arquitectura.
-   Fluxo de navegación.
-   Estrutura Figma.
-   Documentación técnica inicial.
-   Creación do repositorio GitHub.
-   Creación do proxecto Flutter.
-   Estrutura inicial de carpetas.
-   HomeScreen funcional.
-   DashboardScreen inicial.
-   Configuración inicial do Theme global.
-   Primeiros widgets reutilizables.
-   Navegación básica mediante `Navigator`.
-   Modelo de dominio `Garden`.
-   Listado inicial de hortas con datos ficticios.
-   Pantalla de detalle dunha horta.
-   Formulario validado para creación dunha horta.
-   Integración de Provider.
-   Primeiro ViewModel funcional (`GardensViewModel`).
-   Estado compartido das hortas.
-   Identificadores temporais para as hortas en memoria.
-   Consulta de hortas mediante identificador.
-   Edición de hortas.
-   Eliminación de hortas con confirmación.
-   CRUD completo de hortas en memoria.
-   Sincronización automática das Views mediante Provider.
-   Introdución do Repository Pattern.
-   Creación da abstracción `GardenRepository`.
-   Creación de `MemoryGardenRepository`.
-   Traslado do almacenamento temporal de hortas desde
    `GardensViewModel` ao Repository.
-   Integración de `GardensViewModel` con `GardenRepository`.
-   Inxección de dependencias mediante o construtor.
-   Desacoplamento do ViewModel da implementación concreta de
    persistencia.
-   CRUD de hortas delegado na capa Repository.
-   Conversión de `GardenRepository` a un contrato asíncrono.
-   Adaptación de `MemoryGardenRepository` ao contrato asíncrono.
-   Introdución de `Future`, `async` e `await` na arquitectura de datos.
-   Estado local de hortas en `GardensViewModel` sincronizado co
    Repository.
-   Carga inicial de hortas mediante `loadGardens()`.
-   Inicialización da carga de datos desde Provider.
-   Adaptación dos fluxos CRUD ás operacións asíncronas.
-   Uso de `context.mounted` despois de operacións asíncronas.
-   Instalación das dependencias necesarias para SQLite multiplataforma.
-   Creación e apertura de `martola.db`.
-   Creación do esquema SQLite inicial.
-   Creación da táboa `gardens`.
-   Conversión `Garden ↔ Map<String, Object?>`.
-   Creación de `SQLiteGardenRepository`.
-   Implementación do CRUD completo de hortas en SQLite.
-   Integración de `SQLiteGardenRepository` coa arquitectura existente.
-   Substitución de `MemoryGardenRepository` por
    `SQLiteGardenRepository` na composición da aplicación.
-   Persistencia de hortas verificada entre reinicios.
-   Creación do modelo `GardenPlant`.
-   Creación do modelo `PlantSpecies`.
-   Conversión `GardenPlant ↔ Map<String, Object?>`.
-   Conversión `PlantSpecies ↔ Map<String, Object?>`.
-   Evolución do esquema SQLite á versión 2.
-   Creación da táboa `plant_species`.
-   Creación da táboa `garden_plants`.
-   Introdución de claves foráneas.
-   Activación da integridade referencial mediante
    `PRAGMA foreign_keys = ON`.
-   Implementación da primeira migración SQLite v1 → v2.
-   Verificación da conservación dos datos existentes durante a
    migración.
-   Verificación de `ON DELETE CASCADE`.
-   Verificación de `ON DELETE RESTRICT`.
-   Creación de `GardenPlantRepository`.
-   Creación de `PlantSpeciesRepository`.
-   Implementación de `SQLitePlantSpeciesRepository`.
-   Implementación do CRUD SQLite de especies.
-   Implementación de `SQLiteGardenPlantRepository`.
-   Implementación do CRUD SQLite de plantas.
-   Consulta de plantas mediante `gardenId`.
-   Creación de `PlantSpeciesViewModel`.
-   Creación de `PlantsViewModel`.
-   Integración dos novos ViewModels mediante `MultiProvider`.
-   Carga do catálogo de especies mediante `loadSpecies()`.
-   Carga das plantas dunha horta mediante `loadPlants(gardenId)`.
-   Mantemento da horta activa mediante `_currentGardenId`.
-   Catálogo inicial local de especies.
-   Creación de `PlantListScreen`.
-   Creación de `AddPlantScreen`.
-   Creación de `PlantDetailsScreen`.
-   Creación de `EditPlantScreen`.
-   Selección de especie mediante `DropdownButtonFormField`.
-   Selección da data de plantación mediante `showDatePicker`.
-   Creación, consulta, edición e eliminación de plantas desde a
    interface.
-   Resolución do nome da especie no detalle dunha planta.
-   CRUD completo do módulo de plantas integrado con SQLite.
-   Módulo de evolución de plantas completo con CRUD e SQLite.
-   Evolución do esquema SQLite á versión 3.
-   Xeocodificación de localidades mediante OpenWeather.
-   Coordenadas opcionais (`latitude` e `longitude`) asociadas ás
    hortas.
-   Evolución do esquema SQLite á versión 4.
-   Migración v3 → v4.
-   Consulta meteorolóxica contextual por horta desde
    `GardenDetailsScreen`.
-   Reutilización de `WeatherCard` fóra do Dashboard.
-   Corrección dos fluxos de creación e edición para manter coherentes
    localidade e coordenadas.
-   Creación do modelo `GardenLayoutItem`.
-   Creación de `GardenLayoutRepository`.
-   Creación de `SqliteGardenLayoutRepository`.
-   Creación de `GardenLayoutViewModel`.
-   Evolución do esquema SQLite á versión 5.
-   Migración v4 → v5.
-   Creación da táboa `garden_layout_items`.
-   Creación de `LayoutDesignerScreen`.
-   Engadido e retirada de plantas do deseño.
-   Posicionamento libre mediante arrastre.
-   Coordenadas normalizadas independentes do tamaño do taboleiro.
-   Limitación do movemento ao interior do taboleiro.
-   Prevención de solapamento entre plantas.
-   Persistencia da disposición en SQLite.
-   Corrección da colocación inicial de novos elementos no Layout
    Designer para evitar solapamentos.
-   Implementación funcional do módulo de tarefas.
-   Creación do modelo `Task`.
-   Creación de `TaskRepository` e implementación SQLite.
-   Creación de `TasksViewModel` e integración mediante Provider.
-   Creación e consulta de tarefas desde a interface.
-   Persistencia das tarefas en SQLite.
-   Evolución do esquema SQLite á versión 6.
-   Migración v5 → v6.
-   Primeira revisión responsive das pantallas principais.
-   Probas manuais con diferentes anchos de pantalla.
-   Identificación dos límites prácticos das `Row` en compoñentes do
    Dashboard.

## In Progress

-   Aprendizaxe de Flutter e Dart.
-   Revisión e consolidación da interface.
-   Design System.
-   Testing e revisión final.

## Pending

-   Refinamento responsive adicional se aparece algunha necesidade real
    en tablet ou escritorio.
-   Refinamento da interface e consolidación do Design System.
-   Testing, revisión e optimización.
-   Documentación final e preparación da defensa.
-   Ampliacións meteorolóxicas opcionais: histórico persistente,
    predición e posible integración de MeteoSIX.
-   Melloras opcionais do Layout Designer: grid/snapping, maior fluidez,
    tamaños variables ou representación específica por especie.

**---**

# Phase 1 - Project Setup

## Objective

Preparar o proxecto Flutter e a súa estrutura.

## Tasks

-   [x] Crear proxecto Flutter.
-   [x] Configurar Git.
-   [x] Crear repositorio GitHub.
-   [x] Definir estrutura de carpetas.
-   [x] Crear tema básico da aplicación.
-   [x] Crear navegación básica mediante `Navigator`.
-   [x] Configurar Provider.

## Deliverable

Aplicación Flutter funcional cunha estrutura inicial organizada, tema
global e navegación básica.

**Estado:** completada.

**---**

# Phase 2 - Navigation and Screens

## Objective

Construír a navegación principal e as pantallas base da aplicación.

## Tasks

-   [x] HomeScreen.
-   [x] DashboardScreen.
-   [x] GardensScreen.
-   [x] GardenDetailsScreen.
-   [x] CreateGardenScreen.
-   [x] TasksScreen funcional.
-   [x] CreateTaskScreen funcional.
-   [x] PlantListScreen.
-   [x] PlantDetailsScreen.
-   [x] LayoutDesignerScreen.
-   [x] Completar os fluxos de navegación necesarios para o MVP.

## Deliverable

Navegación completa entre as pantallas principais.

Nesta fase poden empregarse datos ficticios, sen necesidade de
persistencia real.

**Estado:** completada para o MVP.

**---**

# Phase 3 - State Management

## Objective

Introducir unha xestión de estado organizada e desacoplar os datos das
pantallas.

## Tasks

-   [x] Configurar Provider.
-   [x] Crear o primeiro ViewModel (`GardensViewModel`).
-   [x] Mover o estado das hortas fóra das Views.
-   [x] Permitir que varias pantallas compartan o mesmo estado.
-   [x] Actualizar automaticamente a interface cando cambian os datos.
-   [x] Utilizar `ChangeNotifier` e `notifyListeners()`.
-   [x] Diferenciar o uso de `context.read`, `context.watch` e
    `context.select`.
-   [x] Encapsular a colección de hortas.
-   [x] Establecer `GardensViewModel` como punto de acceso ao estado das
    hortas desde as Views.
-   [x] Crear `PlantSpeciesViewModel`.
-   [x] Crear `PlantsViewModel`.
-   [x] Integrar os tres ViewModels mediante `MultiProvider`.
-   [x] Manter o catálogo de especies no estado compartido.
-   [x] Manter no `PlantsViewModel` as plantas da horta actualmente
    cargada.
-   [x] Sincronizar as Views de plantas mediante `notifyListeners()`.
-   [x] Crear `GardenLayoutViewModel`.
-   [x] Integrar `GardenLayoutViewModel` mediante `MultiProvider`.
-   [x] Manter o estado contextual do deseño por `gardenId`.
-   [x] Actualizar localmente a posición durante o arrastre mediante
    `notifyListeners()`.
-   [x] Crear `TasksViewModel`.
-   [x] Integrar `TasksViewModel` mediante Provider.
-   [x] Manter sincronizada a colección de tarefas mediante
    `notifyListeners()`.

## Deliverable

Xestión de estado funcional mediante Provider seguindo o enfoque MVVM
simplificado previsto para MARTOLA.

**Estado:** completada para a infraestrutura inicial. Poderán engadirse
novos ViewModels segundo se desenvolvan os restantes módulos.

**---**

# Phase 4 - Repository Foundation

## Objective

Introducir a capa Repository e separar a xestión do estado do acceso aos
datos.

## Tasks

-   [x] Comprender a responsabilidade do Repository.
-   [x] Crear `GardenRepository`.
-   [x] Definir as operacións necesarias para o módulo de hortas.
-   [x] Crear `MemoryGardenRepository`.
-   [x] Conectar `GardensViewModel` con `GardenRepository`.
-   [x] Mover o almacenamento temporal desde `GardensViewModel` ao
    Repository.
-   [x] Aplicar inxección de dependencias.
-   [x] Evitar que o ViewModel dependa directamente dunha implementación
    concreta.
-   [x] Preparar a arquitectura para substituír o almacenamento temporal
    en memoria pola persistencia local.
-   [x] Converter `GardenRepository` nun contrato asíncrono.
-   [x] Adaptar `MemoryGardenRepository` ao contrato asíncrono.
-   [x] Introducir `Future`, `async` e `await` na comunicación co
    Repository.
-   [x] Manter no ViewModel o estado xa cargado para as Views.
-   [x] Implementar `loadGardens()`.
-   [x] Iniciar automaticamente a carga de datos ao crear
    `GardensViewModel`.

## Deliverable

Separación funcional entre a xestión do estado e o acceso aos datos.

Fluxo actual:

    View       ↓     GardensViewModel       ↓ async     GardenRepository
      ↑     MemoryGardenRepository       ↓     Memoria

O ViewModel mantén o estado xa cargado para que as Views poidan
consultalo de maneira síncrona.

A arquitectura permite substituír `MemoryGardenRepository` por unha
implementación baseada en SQLite sen modificar as Views.

**Estado:** completada.

**---**

# Phase 5 - Database Foundation

## Objective

Integrar SQLite e establecer a capa básica de persistencia.

## Tasks

-   [x] Analizar a estratexia SQLite multiplataforma.
-   [x] Preparar o contrato asíncrono necesario para a persistencia.
-   [x] Engadir `sqflite`.
-   [x] Engadir `sqflite_common_ffi`.
-   [x] Engadir `path`.
-   [x] Engadir `path_provider`.
-   [x] Comprobar que a aplicación continúa arrancando coas novas
    dependencias.
-   [x] Crear `DatabaseService`.
-   [x] Preparar a selección da factoría SQLite segundo a plataforma.
-   [x] Implementar a apertura de `martola.db`.
-   [x] Manter e reutilizar a conexión coa base de datos.
-   [x] Crear o esquema inicial.
-   [x] Crear a táboa `gardens`.
-   [x] Implementar operacións básicas de lectura e escritura.
-   [x] Crear `SQLiteGardenRepository`.
-   [x] Integrar a persistencia SQLite coa capa Repository.
-   [x] Substituír `MemoryGardenRepository` por `SQLiteGardenRepository`
    na composición da aplicación.
-   [x] Verificar a persistencia entre reinicios da aplicación.
-   [x] Comprender o versionado do esquema SQLite.
-   [x] Comprender a función de `onCreate` e `onUpgrade`.
-   [x] Comprender o funcionamento das migracións acumulativas.
-   [x] Definir a estratexia para futuras migracións.
-   [x] Manter a base de datos na versión 1 mentres non exista un cambio
    real de esquema.
-   [x] Evolucionar o esquema á versión 2.
-   [x] Implementar a primeira migración SQLite v1 → v2.
-   [x] Conservar os datos existentes durante a migración.
-   [x] Crear a táboa `plant_species`.
-   [x] Crear a táboa `garden_plants`.
-   [x] Introducir claves foráneas.
-   [x] Activar a integridade referencial mediante
    `PRAGMA foreign_keys = ON`.
-   [x] Verificar `ON DELETE CASCADE`.
-   [x] Verificar `ON DELETE RESTRICT`.
-   [x] Crear `SQLitePlantSpeciesRepository`.
-   [x] Crear `SQLiteGardenPlantRepository`.
-   [x] Implementar CRUD SQLite de especies.
-   [x] Implementar CRUD SQLite de plantas.
-   [x] Consultar plantas mediante `gardenId`.
-   [x] Engadir un catálogo inicial local de especies cando a táboa está
    baleira.
-   [x] Evolucionar o esquema á versión 3 para os rexistros de
    evolución.
-   [x] Implementar a migración v2 → v3.
-   [x] Evolucionar o esquema á versión 4 para as coordenadas das
    hortas.
-   [x] Implementar a migración v3 → v4.
-   [x] Evolucionar o esquema á versión 5 para o Layout Designer.
-   [x] Crear a táboa `garden_layout_items`.
-   [x] Implementar a migración v4 → v5.
-   [x] Verificar a persistencia das posicións do Layout Designer.
-   [x] Evolucionar o esquema á versión 6 para o módulo de tarefas.
-   [x] Crear a táboa `tasks`.
-   [x] Implementar a migración v5 → v6.
-   [x] Verificar a persistencia das tarefas.

## Deliverable

Base de datos local funcional e accesible mediante unha capa de
persistencia organizada.

## Current Progress

A infraestrutura SQLite está operativa e o esquema evolucionou á versión
6.

O esquema actual inclúe:

``` text
gardens
plant_species
garden_plants
plant_evolution_records
garden_layout_items
tasks
```

As migracións acumulativas implementadas son:

``` text
v1 → v2
v2 → v3
v3 → v4
v4 → v5
v5 → v6
```

As relacións entre táboas utilizan claves foráneas e a integridade
referencial está activada mediante:

``` text
PRAGMA foreign_keys = ON
```

O Layout Designer engade ademais `UNIQUE (garden_plant_id)` para impedir
que unha mesma planta teña máis dunha posición simultánea no deseño.

Comprobouse que as migracións conservan os datos existentes e que a
persistencia continúa funcionando entre reinicios.

**Estado:** completada.

**---**

# Phase 6 - Gardens Module

## Objective

Implementar a xestión completa de hortas.

## Implemented

-   [x] Crear modelo `Garden`.
-   [x] Mostrar unha lista inicial de hortas con datos ficticios.
-   [x] Crear `GardenListItem`.
-   [x] Seleccionar unha horta.
-   [x] Mostrar o detalle dunha horta.
-   [x] Crear formulario de nova horta.
-   [x] Validar os datos do formulario.
-   [x] Construír un obxecto `Garden` desde o formulario.
-   [x] Devolver un `Garden` entre rutas como primeira aproximación ao
    fluxo de creación.
-   [x] Integrar o módulo con `GardensViewModel`.
-   [x] Incorporar novas hortas ao estado compartido.
-   [x] Substituír os datos ficticios do listado polo estado real en
    memoria.
-   [x] Actualizar automaticamente o listado mediante Provider.
-   [x] Asignar identificadores temporais ás hortas.
-   [x] Recuperar unha horta mediante `getGardenById()`.
-   [x] Consultar o detalle mediante a identidade da horta.
-   [x] Crear `EditGardenScreen`.
-   [x] Editar unha horta.
-   [x] Conservar a identidade durante unha actualización.
-   [x] Eliminar unha horta.
-   [x] Solicitar confirmación antes da eliminación.
-   [x] Completar o CRUD de hortas en memoria.
-   [x] Crear `GardenRepository`.
-   [x] Crear `MemoryGardenRepository`.
-   [x] Integrar `GardensViewModel` con `GardenRepository`.
-   [x] Delegar o CRUD na capa Repository.
-   [x] Utilizar a identidade da horta nas operacións de actualización e
    eliminación.
-   [x] Desacoplar o ViewModel da implementación concreta do Repository.
-   [x] Adaptar o CRUD de hortas a operacións asíncronas.
-   [x] Implementar a carga inicial mediante `loadGardens()`.
-   [x] Manter o estado cargado dentro de `GardensViewModel`.
-   [x] Adaptar creación, edición e eliminación ao uso de `await`.
-   [x] Crear `Garden.fromMap()`.
-   [x] Crear `Garden.toMap()`.
-   [x] Gardar unha horta en SQLite.
-   [x] Recuperar hortas desde SQLite.
-   [x] Recuperar unha horta concreta mediante o seu identificador.
-   [x] Actualizar hortas en SQLite.
-   [x] Eliminar hortas de SQLite.
-   [x] Utilizar identificadores xerados pola capa de persistencia.
-   [x] Verificar o CRUD completo contra SQLite.
-   [x] Verificar a persistencia entre reinicios.

## Pending

-   [ ] Revisar e refinar a interface do módulo.

## Deliverable

Módulo de hortas completo con operacións de creación, consulta, edición
e eliminación persistidas localmente.

**Estado:** funcional a nivel de CRUD e persistencia. Pendentes
refinamentos da interface e futuras ampliacións do modelo.

**---**

# Phase 7 - Plants Module

## Objective

Implementar a xestión de plantas e especies asociadas ás hortas.

## Tasks

### Domain Model

-   [x] Crear modelo `GardenPlant`.
-   [x] Crear modelo `PlantSpecies`.
-   [x] Relacionar `GardenPlant` cunha horta mediante `gardenId`.
-   [x] Relacionar `GardenPlant` cunha especie mediante `speciesId`.
-   [x] Implementar conversión `GardenPlant ↔ Map<String, Object?>`.
-   [x] Implementar conversión `PlantSpecies ↔ Map<String, Object?>`.
-   [x] Definir a conversión de `DateTime` mediante ISO 8601.

### Database

-   [x] Crear táboa `plant_species`.
-   [x] Crear táboa `garden_plants`.
-   [x] Definir claves foráneas.
-   [x] Configurar `ON DELETE CASCADE` para a relación coa horta.
-   [x] Configurar `ON DELETE RESTRICT` para a relación coa especie.
-   [x] Integrar as novas táboas no esquema SQLite v2.
-   [x] Implementar a migración v1 → v2.
-   [x] Verificar a integridade referencial.

### Repository

-   [x] Crear contrato `GardenPlantRepository`.
-   [x] Crear contrato `PlantSpeciesRepository`.
-   [x] Crear `SQLitePlantSpeciesRepository`.
-   [x] Crear `SQLiteGardenPlantRepository`.
-   [x] Implementar CRUD SQLite de especies.
-   [x] Implementar CRUD SQLite de plantas.

### State Management

-   [x] Crear ViewModel para plantas.
-   [x] Cargar as plantas dunha horta.
-   [x] Integrar o ViewModel con Provider.
-   [x] Sincronizar as Views co estado das plantas.

### Interface

-   [x] Crear `PlantListScreen`.
-   [x] Crear `PlantDetailsScreen`.
-   [x] Crear formulario de nova planta.
-   [x] Crear fluxo de edición.
-   [x] Crear fluxo de eliminación.
-   [x] Permitir seleccionar unha especie.
-   [x] Mostrar as plantas asociadas a unha horta.

## Deliverable

Módulo de plantas funcional, persistido mediante SQLite e integrado co
módulo de hortas.

**Estado:** completada a primeira versión funcional. CRUD, persistencia,
ViewModel e interface están integrados.

**---**

# Phase 8 - Plant Evolution Module

## Objective

Implementar o seguemento das plantas.

## Tasks

-   [x] Crear o modelo `PlantEvolutionRecord`.
-   [x] Crear a táboa `plant_evolution_records`.
-   [x] Evolucionar o esquema SQLite á versión 3.
-   [x] Implementar a migración v2 → v3.
-   [x] Relacionar os rexistros coa planta mediante `plantId`.
-   [x] Configurar `ON DELETE CASCADE`.
-   [x] Crear `PlantEvolutionRecordRepository`.
-   [x] Crear `SQLitePlantEvolutionRecordRepository`.
-   [x] Implementar CRUD persistente dos rexistros.
-   [x] Crear `PlantEvolutionViewModel`.
-   [x] Crear `PlantEvolutionListScreen`.
-   [x] Crear `AddPlantEvolutionRecordScreen`.
-   [x] Crear `PlantEvolutionDetailsScreen`.
-   [x] Crear `EditPlantEvolutionRecordScreen`.
-   [x] Crear, consultar, editar e eliminar rexistros desde a interface.
-   [x] Mostrar o historial de evolución dunha planta.
-   [x] Rexistrar medicións básicas.
-   [ ] Valorar a incorporación de fotografías como ampliación
    posterior.

## Deliverable

Seguemento da evolución dunha planta ao longo do tempo.

**Estado:** funcional a nivel de CRUD, persistencia e interface básica.
As fotografías quedan como posible ampliación posterior.

------------------------------------------------------------------------

# Phase 9 - Weather Module

## Objective

Integrar información meteorolóxica.

## Tasks

### Basic Weather Integration

-   [x] Engadir o paquete `http`.
-   [x] Crear o modelo `WeatherData`.
-   [x] Crear `WeatherService`.
-   [x] Crear `WeatherException`.
-   [x] Crear o contrato `WeatherRepository`.
-   [x] Crear `OpenWeatherRepository`.
-   [x] Crear `WeatherViewModel`.
-   [x] Integrar `WeatherViewModel` mediante `MultiProvider`.
-   [x] Conectar OpenWeather.
-   [x] Realizar peticións HTTP GET mediante latitude e lonxitude.
-   [x] Decodificar a resposta JSON.
-   [x] Transformar a resposta externa a `WeatherData`.
-   [x] Substituír os datos meteorolóxicos ficticios do Dashboard.
-   [x] Mostrar condicións meteorolóxicas actuais.
-   [x] Xestionar estados de carga, erro e datos.
-   [x] Evitar notificacións durante o primeiro `build()` mediante
    `addPostFrameCallback`.
-   [x] Configurar a API key mediante `String.fromEnvironment`.
-   [x] Utilizar `--dart-define-from-file` durante o desenvolvemento.
-   [x] Excluír a clave real do repositorio.

### Garden Location Integration

-   [x] Engadir `latitude` e `longitude` opcionais ao modelo `Garden`.
-   [x] Evolucionar SQLite á versión 4.
-   [x] Implementar a migración v3 → v4.
-   [x] Crear o módulo de xeocodificación.
-   [x] Buscar localidades mediante OpenWeather Geocoding API.
-   [x] Permitir seleccionar unha localidade válida nos formularios.
-   [x] Gardar as coordenadas seleccionadas coa horta.
-   [x] Consultar a meteoroloxía dunha horta mediante as súas
    coordenadas.
-   [x] Mostrar a información meteorolóxica en `GardenDetailsScreen`.
-   [x] Reutilizar `WeatherCard` como widget compartido.
-   [x] Invalidar coordenadas cando o nome gardado xa non corresponde
    coa localización seleccionada.
-   [x] Limpar os resultados de xeocodificación entre formularios.

### Pending Weather Extensions

-   [ ] Valorar MeteoSIX como segundo provedor meteorolóxico.
-   [ ] Gardar históricos meteorolóxicos.
-   [ ] Consultar rexistros meteorolóxicos persistidos.
-   [ ] Valorar predición meteorolóxica.

## Deliverable

Integración meteorolóxica real asociada ás hortas mediante coordenadas,
con xeocodificación de localidades e arquitectura preparada para futuras
ampliacións.

**Estado:** integración meteorolóxica contextual por horta completada.
Históricos, predición e posibles provedores adicionais quedan como
ampliacións.

------------------------------------------------------------------------

# Phase 10 - Layout Designer

## Objective

Implementar a representación visual e persistente da horta.

## Tasks

### Domain and Persistence

-   [x] Crear `GardenLayoutItem`.
-   [x] Crear a táboa `garden_layout_items`.
-   [x] Evolucionar SQLite á versión 5.
-   [x] Implementar a migración v4 → v5.
-   [x] Crear `GardenLayoutRepository`.
-   [x] Crear `SqliteGardenLayoutRepository`.
-   [x] Crear `GardenLayoutViewModel`.
-   [x] Integrar o ViewModel mediante Provider.

### Interface and Interaction

-   [x] Crear `LayoutDesignerScreen`.
-   [x] Crear a área de deseño mediante `LayoutBuilder` e `Stack`.
-   [x] Mostrar as plantas colocadas no deseño.
-   [x] Mostrar no selector só as plantas aínda dispoñibles.
-   [x] Engadir plantas ao deseño.
-   [x] Retirar plantas do deseño sen eliminar a `GardenPlant`.
-   [x] Posicionar elementos mediante coordenadas normalizadas.
-   [x] Permitir movemento individual mediante arrastre.
-   [x] Manter os elementos dentro dos límites do taboleiro.
-   [x] Evitar o solapamento entre plantas.
-   [x] Actualizar a posición localmente durante o arrastre.
-   [x] Persistir a posición ao finalizar o arrastre.
-   [x] Recuperar a disposición gardada.
-   [x] Evitar que unha planta nova se coloque inicialmente sobre outra
    xa existente.
-   [x] Verificar a persistencia entre navegacións e reinicios.

### Optional Improvements

-   [ ] Valorar grid ou snapping.
-   [ ] Mellorar a fluidez do arrastre se resulta necesario.
-   [ ] Valorar tamaños variables.
-   [ ] Valorar representación visual específica por especie.

## Deliverable

Primeira versión funcional e persistente do deseñador visual.

**Estado:** completada para o MVP.

**---**

# Phase 11 - Tasks Module

## Objective

Implementar unha xestión básica e persistente de tarefas mantendo a
mesma arquitectura do resto da aplicación.

## Tasks

-   [x] Crear o modelo `Task`.
-   [x] Crear o contrato `TaskRepository`.
-   [x] Crear a implementación SQLite do Repository.
-   [x] Crear `TasksViewModel`.
-   [x] Integrar o ViewModel mediante Provider.
-   [x] Crear `TasksScreen`.
-   [x] Crear `CreateTaskScreen`.
-   [x] Mostrar as tarefas pendentes.
-   [x] Crear novas tarefas desde a interface.
-   [x] Persistir as tarefas en SQLite.
-   [x] Evolucionar SQLite á versión 6.
-   [x] Implementar a migración v5 → v6.

## Deliverable

Módulo básico de tarefas funcional e persistente, integrado coa
arquitectura MVVM simplificada + Repository Pattern.

**Estado:** completada para o alcance previsto.

**---**

# Phase 12 - UI Improvement

## Objective

Mellorar a experiencia visual e consolidar o Design System.

## Tasks

-   [x] Configuración inicial do Theme global.
-   [x] Creación dos primeiros widgets reutilizables.
-   [ ] Completar o Design System.
-   [ ] Refinar compoñentes.
-   [ ] Unificar estilos de formularios, Cards e botóns.
-   [x] Realizar unha primeira adaptación e validación para tablet.
-   [x] Realizar unha primeira adaptación e validación para escritorio.
-   [ ] Revisar accesibilidade e usabilidade.
-   [x] Probar manualmente diferentes anchos de pantalla.
-   [x] Revisar `Row`, `Column`, scroll e distribución dos compoñentes
    principais.
-   [x] Identificar os overflows do Dashboard en anchos excepcionalmente
    estreitos e valorar o seu impacto real.

## Deliverable

Interface consistente, usable e responsive.

**---**

# Phase 13 - Testing

## Objective

Validar o funcionamento.

## Tasks

-   [ ] Testes manuais.
-   [ ] Testes das validacións.
-   [ ] Testes de navegación.
-   [ ] Testes de persistencia.
-   [ ] Corrección de erros.
-   [ ] Optimización.
-   [ ] Validación en Android.
-   [ ] Validación en escritorio.

## Deliverable

Versión candidata á entrega.

**---**

# Phase 14 - Documentation

## Objective

Completar a documentación final.

## Tasks

-   [ ] Actualizar documentación técnica.
-   [ ] Memoria.
-   [ ] Diagramas.
-   [ ] Capturas.
-   [ ] Conclusións.
-   [ ] Liñas futuras.

## Deliverable

Documentación final do TFC.

**---**

# Current Development Milestone

## Session 20 - Tarefas, responsive e revisión do MVP

**Estado:** completada.

Tras completar o Layout Designer na sesión 19, realizouse unha sesión de
peche e consolidación centrada en funcionalidades pequenas pendentes e
na validación da interface.

### Tasks

Implementouse unha versión básica do módulo de tarefas reutilizando a
arquitectura xa empregada no resto de MARTOLA:

-   Modelo `Task`.
-   `TaskRepository`.
-   Implementación SQLite.
-   `TasksViewModel`.
-   Integración mediante Provider.
-   `TasksScreen`.
-   `CreateTaskScreen`.
-   Creación e consulta de tarefas.
-   Persistencia local.
-   Evolución de SQLite á versión 6.
-   Migración v5 → v6.

O alcance mantívose deliberadamente simple para non introducir
complexidade innecesaria nesta fase do TFC.

### Layout Designer

Corrixiuse un caso límite detectado durante as probas: ao retirar unha
planta do deseño e engadila posteriormente, a posición inicial podía
coincidir coa doutra planta e bloquear o movemento de ambas.

A colocación inicial pasou a buscar unha posición dispoñible antes de
inserir o novo elemento. Comprobouse posteriormente o movemento e a
persistencia.

### Responsive

Realizáronse probas manuais da interface con diferentes tamaños de ventá
e anchos de dispositivo.

Revisáronse especialmente:

-   Dashboard.
-   Cards e `Row` internas.
-   Listados.
-   Formularios.
-   Layout Designer.
-   Comportamento en móbil, tablet e escritorio.

Detectouse que determinadas `Row` do Dashboard poden producir overflow
en anchos extremadamente reducidos, aproximadamente por baixo dos
tamaños habituais dun móbil actual. Decidiuse non introducir máis
complexidade para resolver un caso que queda fóra do rango práctico
previsto para o MVP.

A interface queda, polo tanto, validada para os tamaños obxectivo do
proxecto, mantendo posibles refinamentos adicionais como melloras
futuras.

### Revisión de alcance

As pantallas baleiras `SettingsScreen` e `WeatherScreen` deixan de
formar parte do fluxo previsto. A configuración avanzada non é necesaria
para o MVP e a meteoroloxía xa se integra de forma contextual dentro de
`GardenDetailsScreen`.

A autenticación de usuario mantense como funcionalidade futura e só se
abordará se existe tempo antes da entrega.

O seguinte bloque principal pasa a ser:

``` text
testing e revisión
        ↓
corrección de erros
        ↓
documentación final
        ↓
preparación da defensa
```

------------------------------------------------------------------------

# MVP Definition

A primeira versión mínima viable de MARTOLA debe incluír:

-   [x] Navegación funcional.
-   [x] Xestión de estado.
-   [x] SQLite.
-   [x] Xestión de hortas persistente.
-   [x] Xestión de plantas.
-   [x] Rexistros de evolución.
-   [x] Meteoroloxía actual asociada á localización dunha horta.
-   [x] Layout Designer persistente.
-   [x] Xestión básica de tarefas persistente.

O resto considerarase ampliación ou funcionalidade adicional segundo o
tempo dispoñible.

**---**

# Future Features

Funcionalidades opcionais:

-   Login.
-   Sincronización cloud.
-   Compartición de hortas.
-   Notificacións.
-   Estatísticas avanzadas.
-   IA para recomendacións.
-   Integración con sensores.

**---**

# Success Criteria

O proxecto considerarase exitoso se:

-   Funciona en Android.
-   Funciona en escritorio.
-   Permite xestionar hortas.
-   Permite xestionar plantas.
-   Almacena información localmente.
-   Mantén unha arquitectura organizada.
-   Presenta unha interface usable.
