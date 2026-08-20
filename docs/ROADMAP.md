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

## In Progress

-   Aprendizaxe de Flutter e Dart.
-   Primeira iteración da interface.
-   Design System.
-   Navegación entre pantallas.

## Pending

-   Completar as ampliacións do módulo meteorolóxico: localización por
    horta e histórico.
-   Valorar a integración de MeteoSIX como segundo provedor.
-   Layout Designer.

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
-   [x] TasksScreen inicial.
-   [x] CreateTaskScreen inicial.
-   [x] PlantListScreen.
-   [x] PlantDetailsScreen.
-   [ ] LayoutDesignerScreen.
-   [ ] SettingsScreen.
-   [ ] Completar os fluxos de navegación pendentes.

## Deliverable

Navegación completa entre as pantallas principais.

Nesta fase poden empregarse datos ficticios, sen necesidade de
persistencia real.

**Estado:** en progreso.

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

## Deliverable

Base de datos local funcional e accesible mediante unha capa de
persistencia organizada.

## Current Progress

A infraestrutura SQLite está operativa e o esquema evolucionou á versión
2.

O fluxo de persistencia do módulo de hortas continúa sendo:

    GardensViewModel           ↓     GardenRepository           ↑    
SQLiteGardenRepository           ↓     DatabaseService           ↓    
SQLite           ↓     martola.db

A versión 2 do esquema inclúe actualmente:

    gardens     plant_species     garden_plants

A migración:

    v1 → v2

foi implementada mediante `onUpgrade` e comprobouse que conserva os
datos existentes.

As relacións entre as novas táboas utilizan claves foráneas e a
integridade referencial está activada mediante:

    PRAGMA foreign_keys = ON

Comprobouse o comportamento de:

    ON DELETE CASCADE     ON DELETE RESTRICT

mediante probas transaccionais.

A infraestrutura queda preparada para futuras migracións acumulativas.

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
-   [ ] Crear `SQLitePlantSpeciesRepository`.
-   [ ] Crear `SQLiteGardenPlantRepository`.
-   [ ] Implementar CRUD SQLite de especies.
-   [ ] Implementar CRUD SQLite de plantas.

### State Management

-   [ ] Crear ViewModel para plantas.
-   [ ] Cargar as plantas dunha horta.
-   [ ] Integrar o ViewModel con Provider.
-   [ ] Sincronizar as Views co estado das plantas.

### Interface

-   [ ] Crear `PlantListScreen`.
-   [ ] Crear `PlantDetailsScreen`.
-   [ ] Crear formulario de nova planta.
-   [ ] Crear fluxo de edición.
-   [ ] Crear fluxo de eliminación.
-   [ ] Permitir seleccionar unha especie.
-   [ ] Mostrar as plantas asociadas a unha horta.

## Deliverable

Módulo de plantas funcional, persistido mediante SQLite e integrado co
módulo de hortas.

**Estado:** en progreso. Modelo de dominio, esquema SQLite e contratos
Repository preparados. Pendentes as implementacións SQLite, o ViewModel
e a interface.

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

### Pending Weather Extensions

-   [ ] Obter a localización meteorolóxica a partir dunha horta.
-   [ ] Permitir seleccionar a localización mediante localidade e/ou
    mapa.
-   [ ] Valorar MeteoSIX como segundo provedor meteorolóxico.
-   [ ] Gardar históricos meteorolóxicos.
-   [ ] Consultar rexistros meteorolóxicos persistidos.
-   [ ] Valorar predición meteorolóxica.

## Deliverable

Primeira integración meteorolóxica real funcional, coa arquitectura
preparada para ampliar o provedor e asociar posteriormente a
meteoroloxía ás hortas.

**Estado:** integración meteorolóxica básica completada. Pendentes a
asociación dinámica coa horta, históricos e posibles ampliacións.

------------------------------------------------------------------------

# Phase 10 - Layout Designer

## Objective

Implementar a representación visual da horta.

## Tasks

-   [ ] Crear área de deseño.
-   [ ] Mostrar plantas.
-   [ ] Posicionar elementos.
-   [ ] Gardar disposición.
-   [ ] Recuperar unha disposición gardada.

## Deliverable

Primeira versión funcional do deseñador visual.

**---**

# Phase 11 - UI Improvement

## Objective

Mellorar a experiencia visual e consolidar o Design System.

## Tasks

-   [x] Configuración inicial do Theme global.
-   [x] Creación dos primeiros widgets reutilizables.
-   [ ] Completar o Design System.
-   [ ] Refinar compoñentes.
-   [ ] Unificar estilos de formularios, Cards e botóns.
-   [ ] Adaptar a tablet.
-   [ ] Adaptar a escritorio.
-   [ ] Revisar accesibilidade e usabilidade.

## Deliverable

Interface consistente, usable e responsive.

**---**

# Phase 12 - Testing

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

# Phase 13 - Documentation

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

## Session 17 - Basic Weather Integration

**Estado:** completada.

Completado:

-   Instalación e integración do paquete `http`.
-   Primeira petición HTTP GET de proba.
-   Comprensión práctica da resposta JSON e de `Map<String, dynamic>`.
-   Conexión coa API de OpenWeather.
-   Verificación dunha resposta meteorolóxica real.
-   Creación de `WeatherData`.
-   Conversión JSON → `WeatherData`.
-   Creación de `WeatherService`.
-   Tratamento básico dos códigos HTTP.
-   Creación de `WeatherException`.
-   Creación de `WeatherRepository`.
-   Creación de `OpenWeatherRepository`.
-   Creación de `WeatherViewModel`.
-   Integración do módulo mediante Provider.
-   Substitución dos datos ficticios de `WeatherCard` por datos reais.
-   Representación dos estados de carga, erro, datos e ausencia de
    datos.
-   Resolución do erro provocado por `notifyListeners()` durante o
    primeiro `build()`.
-   Uso de `WidgetsBinding.instance.addPostFrameCallback()`.
-   Configuración da API key mediante `String.fromEnvironment`.
-   Uso de `--dart-define-from-file`.
-   Creación dunha configuración local excluída de Git.
-   Preparación do contrato para permitir no futuro outro provedor como
    MeteoSIX.

O fluxo meteorolóxico actual é:

``` text
DashboardScreen
      ↓
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

A localización utilizada actualmente para validar o módulo baséase en
coordenadas coñecidas.

A asociación dinámica da meteoroloxía coa localización dunha horta queda
como ampliación posterior, xunto coa posible selección mediante
localidade ou mapa.

Os datos meteorolóxicos actuais non se persisten en SQLite. A base de
datos continúa na versión 3.

O seguinte bloque funcional debe seleccionarse segundo a prioridade do
MVP e o tempo dispoñible. O principal bloque novo aínda sen implementar
é o Layout Designer; as melloras meteorolóxicas poden desenvolverse
incrementalmente sen bloquear o resto do proxecto.

------------------------------------------------------------------------

# MVP Definition

A primeira versión mínima viable de MARTOLA debe incluír:

-   [x] Navegación funcional.
-   [x] Xestión de estado.
-   [x] SQLite.
-   [x] Xestión de hortas persistente.
-   [x] Xestión de plantas.
-   [ ] Rexistros de evolución.

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
