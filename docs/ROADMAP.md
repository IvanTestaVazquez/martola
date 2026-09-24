# MARTOLA - Development Roadmap

## Purpose

Este documento recolle a evolución técnica de MARTOLA desde a
planificación inicial ata a versión 1.0.0 presentada como TFC.

O seu obxectivo actual é:

-   Documentar as fases principais do desenvolvemento.
-   Reflectir o alcance acadado polo MVP.
-   Conservar as decisións e fitos máis relevantes.
-   Separar o traballo completado das posibles evolucións posteriores.

> Para consultar o estado funcional e técnico actual do proxecto, véxase
> tamén `PROJECT_CONTEXT.md` e o `README.md` principal.

------------------------------------------------------------------------

# Current Status

## Version

`1.0.0`

## Status

**MVP finalizado --- TFC entregado**

A versión académica de MARTOLA está finalizada. O proxecto pode
continuar evolucionando posteriormente como proxecto persoal.

## Completed for Version 1.0.0

-   Definición do proxecto, requisitos e alcance.
-   Deseño inicial da arquitectura e do modelo de datos.
-   Creación do proxecto Flutter e do repositorio Git.
-   Arquitectura MVVM simplificada + Repository Pattern.
-   Xestión de estado mediante Provider.
-   Persistencia local mediante SQLite.
-   Migracións acumulativas do esquema ata a versión 6.
-   CRUD de hortas.
-   CRUD de plantas e catálogo local de especies.
-   CRUD de rexistros de evolución das plantas.
-   Xeocodificación de localidades mediante OpenWeather.
-   Meteoroloxía actual contextualizada por horta.
-   Layout Designer persistente.
-   Xestión básica e persistente de tarefas.
-   Adaptación responsive para móbil, tablet e escritorio.
-   Validación manual do funcionamento nos tamaños obxectivo.
-   Builds verificadas para Android e Windows.
-   Documentación técnica do proxecto.
-   Preparación e entrega do TFC.
-   Publicación da versión `1.0.0`.

## Post-1.0 / Future Improvements

Estas tarefas non forman parte dos requisitos do MVP entregado:

-   Incorporar unha suite de probas automatizadas.
-   Continuar refinando accesibilidade e usabilidade.
-   Mellorar o Layout Designer con grid/snapping ou representacións
    adicionais.
-   Engadir histórico e predición meteorolóxica.
-   Valorar provedores meteorolóxicos adicionais.
-   Engadir fotografías aos rexistros de evolución.
-   Incorporar alertas, notificacións e recorrencia ás tarefas.
-   Engadir autenticación e contas de usuario.
-   Incorporar sincronización cloud e copias de seguridade.
-   Desenvolver unha versión web.
-   Explorar funcionalidades avanzadas como estatísticas, sensores ou
    recomendacións.

------------------------------------------------------------------------

# Phase 1 - Project Setup

## Objective

Preparar o proxecto Flutter e a súa estrutura base.

## Completed

-   [x] Crear o proxecto Flutter.
-   [x] Configurar Git e GitHub.
-   [x] Definir a estrutura inicial de carpetas.
-   [x] Crear o Theme global.
-   [x] Implementar navegación mediante `Navigator`.
-   [x] Configurar Provider.
-   [x] Crear os primeiros widgets reutilizables.

## Result

Aplicación Flutter funcional cunha base organizada para continuar o
desenvolvemento.

**Estado:** completada.

------------------------------------------------------------------------

# Phase 2 - Navigation and Base Screens

## Objective

Construír o fluxo principal de navegación e as pantallas base.

## Completed

-   [x] `HomeScreen`.
-   [x] `DashboardScreen`.
-   [x] Listado e detalle de hortas.
-   [x] Creación e edición de hortas.
-   [x] Pantallas de plantas.
-   [x] Pantallas de evolución.
-   [x] Pantallas de tarefas.
-   [x] `LayoutDesignerScreen`.
-   [x] Fluxos de navegación necesarios para o MVP.

## Result

Navegación funcional entre os módulos principais.

**Estado:** completada.

------------------------------------------------------------------------

# Phase 3 - State Management

## Objective

Separar o estado da interface e permitir que varias pantallas compartan
datos de forma reactiva.

## Completed

-   [x] Integrar Provider.
-   [x] Utilizar `ChangeNotifier`.
-   [x] Crear `GardensViewModel`.
-   [x] Crear `PlantSpeciesViewModel`.
-   [x] Crear `PlantsViewModel`.
-   [x] Crear `PlantEvolutionViewModel`.
-   [x] Crear `GardenLayoutViewModel`.
-   [x] Crear `TasksViewModel`.
-   [x] Crear `WeatherViewModel`.
-   [x] Crear `GeocodingViewModel`.
-   [x] Integrar os ViewModels mediante `MultiProvider`.
-   [x] Utilizar `context.read()`, `context.watch()` e
    `context.select()` segundo as necesidades das Views.
-   [x] Adaptar os fluxos de datos a operacións asíncronas mediante
    `Future`, `async` e `await`.

## Result

Xestión de estado funcional seguindo o enfoque MVVM simplificado
previsto para MARTOLA.

**Estado:** completada.

------------------------------------------------------------------------

# Phase 4 - Repository Foundation

## Objective

Separar a xestión do estado do acceso ás fontes de datos.

## Completed

-   [x] Definir contratos Repository.
-   [x] Crear `MemoryGardenRepository` como primeira implementación.
-   [x] Aplicar inxección de dependencias mediante construtores.
-   [x] Evitar dependencias directas dos ViewModels sobre
    implementacións concretas.
-   [x] Converter os contratos de acceso a datos a operacións
    asíncronas.
-   [x] Substituír progresivamente a persistencia temporal polas
    implementacións SQLite.
-   [x] Aplicar a mesma abstracción aos servizos meteorolóxicos e de
    xeocodificación.

## Result

As Views e ViewModels quedan desacoplados da implementación concreta das
fontes de datos.

**Estado:** completada.

------------------------------------------------------------------------

# Phase 5 - Database and Persistence

## Objective

Integrar SQLite e establecer unha capa de persistencia local
multiplataforma.

## Completed

-   [x] Engadir `sqflite`.
-   [x] Engadir `sqflite_common_ffi`.
-   [x] Engadir `path`.
-   [x] Engadir `path_provider`.
-   [x] Crear `DatabaseService`.
-   [x] Implementar a apertura e reutilización de `martola.db`.
-   [x] Activar `PRAGMA foreign_keys = ON`.
-   [x] Crear o esquema inicial.
-   [x] Evolucionar o esquema ata a versión 6.
-   [x] Implementar migracións acumulativas.
-   [x] Verificar a conservación dos datos entre migracións.
-   [x] Verificar a persistencia entre reinicios.
-   [x] Aplicar `ON DELETE CASCADE`, `ON DELETE RESTRICT` e restricións
    `UNIQUE` segundo o modelo.

## Current Schema

``` text
gardens
plant_species
garden_plants
plant_evolution_records
garden_layout_items
tasks
```

## Implemented Migrations

``` text
v1 → v2
v2 → v3
v3 → v4
v4 → v5
v5 → v6
```

## Result

Persistencia local funcional mediante SQLite e integrada coa capa
Repository.

**Estado:** completada.

------------------------------------------------------------------------

# Phase 6 - Gardens Module

## Objective

Implementar a xestión completa de hortas e xardíns.

## Completed

-   [x] Modelo `Garden`.
-   [x] Conversión `Garden ↔ Map<String, Object?>`.
-   [x] `GardenRepository`.
-   [x] `SQLiteGardenRepository`.
-   [x] `GardensViewModel`.
-   [x] Listado de hortas.
-   [x] Detalle dunha horta.
-   [x] Creación.
-   [x] Edición.
-   [x] Eliminación con confirmación.
-   [x] Persistencia SQLite.
-   [x] Localización e coordenadas opcionais.
-   [x] Integración posterior con xeocodificación e meteoroloxía.

## Result

CRUD completo e persistente de hortas.

**Estado:** completada para o MVP.

------------------------------------------------------------------------

# Phase 7 - Plants and Species Module

## Objective

Implementar a xestión de plantas e especies asociadas ás hortas.

## Completed

-   [x] Modelo `GardenPlant`.
-   [x] Modelo `PlantSpecies`.
-   [x] Táboas `garden_plants` e `plant_species`.
-   [x] Relacións mediante claves foráneas.
-   [x] `GardenPlantRepository`.
-   [x] `PlantSpeciesRepository`.
-   [x] Implementacións SQLite.
-   [x] `PlantsViewModel`.
-   [x] `PlantSpeciesViewModel`.
-   [x] Catálogo inicial local de especies.
-   [x] Listado de plantas dunha horta.
-   [x] Creación de plantas.
-   [x] Detalle de planta.
-   [x] Edición.
-   [x] Eliminación.
-   [x] Selección de especie.
-   [x] Selección da data de plantación.

## Result

CRUD completo de plantas e catálogo local de especies integrado con
SQLite.

**Estado:** completada para o MVP.

------------------------------------------------------------------------

# Phase 8 - Plant Evolution Module

## Objective

Permitir o seguemento histórico da evolución das plantas.

## Completed

-   [x] Modelo `PlantEvolutionRecord`.
-   [x] Táboa `plant_evolution_records`.
-   [x] Migración v2 → v3.
-   [x] Relación coa planta mediante `plantId`.
-   [x] `ON DELETE CASCADE`.
-   [x] Repository e implementación SQLite.
-   [x] `PlantEvolutionViewModel`.
-   [x] Listado de rexistros.
-   [x] Creación.
-   [x] Detalle.
-   [x] Edición.
-   [x] Eliminación.
-   [x] Rexistro de data, altura opcional e notas opcionais.

## Future Improvement

-   [ ] Incorporar fotografías aos rexistros de evolución.

## Result

Seguemento persistente da evolución dunha planta ao longo do tempo.

**Estado:** completada para o MVP.

------------------------------------------------------------------------

# Phase 9 - Weather and Geocoding

## Objective

Integrar información meteorolóxica real asociada á localización das
hortas.

## Completed

### Weather

-   [x] Engadir o paquete `http`.
-   [x] Crear `WeatherData`.
-   [x] Crear `WeatherService`.
-   [x] Crear `WeatherException`.
-   [x] Crear `WeatherRepository`.
-   [x] Crear `OpenWeatherRepository`.
-   [x] Crear `WeatherViewModel`.
-   [x] Conectar OpenWeather.
-   [x] Realizar peticións mediante latitude e lonxitude.
-   [x] Decodificar e mapear a resposta externa.
-   [x] Xestionar estados de carga, datos e erro.
-   [x] Mostrar meteoroloxía contextual en `GardenDetailsScreen`.
-   [x] Reutilizar `WeatherCard`.

### Geocoding

-   [x] Engadir latitude e longitude opcionais a `Garden`.
-   [x] Evolucionar SQLite á versión 4.
-   [x] Implementar a migración v3 → v4.
-   [x] Crear `GeocodingRepository`.
-   [x] Crear `OpenWeatherGeocodingRepository`.
-   [x] Crear `GeocodingViewModel`.
-   [x] Buscar localidades mediante OpenWeather Geocoding API.
-   [x] Permitir seleccionar unha localización válida.
-   [x] Persistir nome e coordenadas coa horta.
-   [x] Manter coherentes localización e coordenadas durante creación e
    edición.

### API Key Management

-   [x] Obter `OPENWEATHER_API_KEY` mediante `String.fromEnvironment`.
-   [x] Permitir `--dart-define-from-file`.
-   [x] Excluír `config/secrets.json` do repositorio.
-   [x] Manter `config/secrets.example.json` como referencia.

## Future Improvements

-   [ ] Histórico meteorolóxico persistente.
-   [ ] Predición meteorolóxica.
-   [ ] Valorar provedores adicionais como MeteoSIX.
-   [ ] Selección de localización mediante mapa.

## Result

Meteoroloxía actual e xeocodificación integradas no fluxo real das
hortas.

**Estado:** completada para o MVP.

------------------------------------------------------------------------

# Phase 10 - Layout Designer

## Objective

Implementar unha representación visual e persistente da disposición das
plantas dunha horta.

## Completed

-   [x] Modelo `GardenLayoutItem`.
-   [x] Táboa `garden_layout_items`.
-   [x] Migración v4 → v5.
-   [x] `GardenLayoutRepository`.
-   [x] `SqliteGardenLayoutRepository`.
-   [x] `GardenLayoutViewModel`.
-   [x] `LayoutDesignerScreen`.
-   [x] Representación mediante `LayoutBuilder` e `Stack`.
-   [x] Engadir e retirar plantas do deseño.
-   [x] Coordenadas normalizadas.
-   [x] Movemento mediante arrastre.
-   [x] Restrición aos límites do taboleiro.
-   [x] Prevención de solapamentos.
-   [x] Persistencia das posicións.
-   [x] Recuperación da disposición gardada.
-   [x] Busca dunha posición inicial libre para novos elementos.

## Future Improvements

-   [ ] Grid ou snapping.
-   [ ] Maior refinamento da interacción de arrastre.
-   [ ] Tamaños variables.
-   [ ] Representación visual específica por especie.

## Result

Deseñador visual funcional e persistente.

**Estado:** completada para o MVP.

------------------------------------------------------------------------

# Phase 11 - Tasks Module

## Objective

Implementar unha xestión básica e persistente de tarefas.

## Completed

-   [x] Modelo `Task`.
-   [x] `TaskRepository`.
-   [x] Implementación SQLite.
-   [x] `TasksViewModel`.
-   [x] `TasksScreen`.
-   [x] `CreateTaskScreen`.
-   [x] Creación e consulta de tarefas.
-   [x] Persistencia local.
-   [x] Evolución de SQLite á versión 6.
-   [x] Migración v5 → v6.
-   [x] Resumo de tarefas pendentes no Dashboard.

## Future Improvements

-   [ ] Edición e funcionalidades avanzadas se se amplía o módulo.
-   [ ] Alertas e notificacións.
-   [ ] Recorrencia.

## Result

Módulo básico de tarefas integrado coa arquitectura do resto da
aplicación.

**Estado:** completada para o alcance do MVP.

------------------------------------------------------------------------

# Phase 12 - UI and Responsive Design

## Objective

Construír unha interface consistente e adaptable aos tamaños obxectivo.

## Completed

-   [x] Theme global.
-   [x] Widgets reutilizables.
-   [x] Adaptación das pantallas principais.
-   [x] Formularios con ancho controlado.
-   [x] Uso de `Row` ou `Column` segundo o espazo dispoñible.
-   [x] Listas adaptables a `GridView`.
-   [x] Dashboard responsive.
-   [x] Pantallas de detalle adaptables.
-   [x] Layout Designer baseado en coordenadas normalizadas.
-   [x] Probas manuais con diferentes anchos.
-   [x] Validación práctica en móbil, tablet e escritorio.
-   [x] Revisión de overflows nos tamaños obxectivo.

## Future Improvements

-   [ ] Continuar refinando accesibilidade.
-   [ ] Continuar refinando consistencia visual cando se engadan novas
    funcionalidades.
-   [ ] Revisar casos extremos de ancho se se amplían as plataformas
    obxectivo.

## Result

Interface usable e adaptable para o alcance definido do MVP.

**Estado:** completada para a versión 1.0.0.

------------------------------------------------------------------------

# Phase 13 - Validation and Release

## Objective

Validar o MVP e preparar unha versión entregable.

## Completed

-   [x] Probas manuais dos fluxos principais.
-   [x] Validación das operacións CRUD.
-   [x] Validación da navegación.
-   [x] Validación da persistencia SQLite.
-   [x] Verificación das migracións do esquema.
-   [x] Validación da integración con OpenWeather.
-   [x] Revisión e corrección de erros detectados durante o
    desenvolvemento.
-   [x] Validación práctica en Android.
-   [x] Validación práctica en Windows.
-   [x] Xeración de builds de entrega.
-   [x] Publicación da versión `1.0.0`.

## Not Included in Version 1.0.0

-   [ ] Suite de tests automatizados.

## Result

MVP funcional preparado para entrega académica e distribución de
demostración.

**Estado:** completada.

------------------------------------------------------------------------

# Phase 14 - Documentation and TFC Delivery

## Objective

Completar a documentación necesaria para pechar o TFC.

## Completed

-   [x] Documentación técnica.
-   [x] Documentación da arquitectura.
-   [x] Deseño da base de datos.
-   [x] Diagramas.
-   [x] Documentación da interface.
-   [x] Roadmap de desenvolvemento.
-   [x] Rexistro do proceso de aprendizaxe.
-   [x] README do repositorio.
-   [x] Preparación da memoria e material académico de entrega.
-   [x] Preparación e entrega do TFC.

## Result

Documentación suficiente para comprender o proxecto, as decisións
técnicas e a súa evolución.

**Estado:** completada.

------------------------------------------------------------------------

# Development Milestones

## Milestone 1 - Foundation

-   Definición do proxecto.
-   Flutter e Dart.
-   Navegación.
-   Primeiras pantallas.
-   Provider.
-   Primeiro ViewModel.

## Milestone 2 - Architecture and Persistence

-   Repository Pattern.
-   Operacións asíncronas.
-   SQLite.
-   `DatabaseService`.
-   Primeiro Repository persistente.
-   Migracións do esquema.

## Milestone 3 - Core Domain

-   Hortas.
-   Especies.
-   Plantas.
-   Evolución das plantas.
-   Integridade referencial.

## Milestone 4 - External Services

-   OpenWeather.
-   Meteoroloxía real.
-   Xeocodificación.
-   Coordenadas persistidas.

## Milestone 5 - Advanced MVP Features

-   Layout Designer.
-   Tarefas.
-   SQLite v6.
-   Responsive design.

## Milestone 6 - Stabilization and Delivery

-   Probas manuais.
-   Corrección de erros.
-   Validación Android e Windows.
-   Documentación final.
-   Builds.
-   Release `1.0.0`.
-   Entrega do TFC.

------------------------------------------------------------------------

# MVP Definition

A versión 1.0.0 de MARTOLA inclúe:

-   [x] Navegación funcional.
-   [x] Xestión de estado mediante Provider.
-   [x] Arquitectura MVVM simplificada + Repository Pattern.
-   [x] Persistencia SQLite.
-   [x] Xestión persistente de hortas.
-   [x] Xestión de plantas e especies.
-   [x] Rexistros de evolución.
-   [x] Xeocodificación.
-   [x] Meteoroloxía actual asociada á localización dunha horta.
-   [x] Layout Designer persistente.
-   [x] Xestión básica de tarefas.
-   [x] Interface adaptable.
-   [x] Builds verificadas para Android e Windows.
-   [x] Documentación técnica.

**Estado do MVP:** completado.

------------------------------------------------------------------------

# Future Evolution

As seguintes funcionalidades quedan fóra da versión 1.0.0 e considéranse
posibles ampliacións:

## Quality

-   Tests automatizados.
-   Maior cobertura de validación.
-   Melloras de accesibilidade.
-   Refinamentos adicionais da interface.

## Data and Cloud

-   Autenticación.
-   Sincronización cloud.
-   Copias de seguridade e restauración.
-   Compartición de hortas.

## Weather

-   Histórico meteorolóxico.
-   Predición.
-   Provedores adicionais.
-   Selección de localización mediante mapa.

## Plants and Layout

-   Fotografías na evolución.
-   Ampliación do catálogo de especies.
-   Grid/snapping.
-   Representación visual por especie.
-   Tamaños variables.

## Tasks

-   Alertas.
-   Notificacións.
-   Recorrencia.
-   Funcionalidades de planificación máis avanzadas.

## Other Possibilities

-   Versión web.
-   Estatísticas avanzadas.
-   Integración con sensores.
-   Recomendacións asistidas.

------------------------------------------------------------------------

# Success Criteria

Os criterios definidos para o MVP considéranse cumpridos:

-   [x] Funciona en Android.
-   [x] Funciona en escritorio.
-   [x] Permite xestionar hortas.
-   [x] Permite xestionar plantas.
-   [x] Permite rexistrar a evolución das plantas.
-   [x] Integra meteoroloxía real.
-   [x] Almacena información localmente.
-   [x] Mantén unha arquitectura organizada.
-   [x] Presenta unha interface usable e adaptable.
-   [x] Inclúe funcionalidades adicionais de deseño da horta e tarefas.
-   [x] Dispón de documentación técnica.
-   [x] Alcanzou a versión `1.0.0`.

------------------------------------------------------------------------

# Final State

``` text
Version: 1.0.0
Status: MVP finalizado — TFC entregado
Academic completion: September 2026
Last Updated: 2026-09-24
```

A partir da versión 1.0.0, o roadmap deixa de representar tarefas
necesarias para completar o TFC. Calquera novo desenvolvemento
considerarase evolución posterior de MARTOLA.
