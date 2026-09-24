# PROJECT_CONTEXT.md

# Project Information

## Project Name

**MARTOLA**

**Modelo Avanzado de Rexistro e Tratamento de Organización de Leiras e
Agricultura**

## Project Type

-   Proxecto de Desenvolvemento de Aplicacións Multiplataforma.
-   Traballo de Fin de Ciclo (TFC).
-   CFGS en Desenvolvemento de Aplicacións Multiplataforma (DAM) Dual
    Intensiva.
-   CIFP A Carballeira Marcos Valcárcel.

## Project Summary

MARTOLA é unha aplicación multiplataforma desenvolvida con Flutter e
Dart para a xestión de hortas e xardíns.

A versión 1.0.0 constitúe o MVP funcional presentado como proxecto final
do ciclo. A aplicación permite centralizar a xestión de hortas, plantas
e tarefas, realizar o seguimento da evolución das plantas, consultar
información meteorolóxica asociada á localización de cada horta e
organizar visualmente a disposición das plantas.

A versión actual inclúe:

-   Creación, edición e eliminación de hortas e xardíns.
-   Rexistro, edición e eliminación de plantas.
-   Catálogo local de especies vexetais.
-   Seguimento da evolución das plantas mediante rexistros históricos.
-   Consulta de meteoroloxía actual mediante OpenWeather.
-   Xeocodificación de localizacións mediante OpenWeather.
-   Xestión básica de tarefas.
-   Deseñador visual da disposición das plantas dentro dunha horta.
-   Persistencia local mediante SQLite.
-   Interface adaptable a móbil, tablet e escritorio.

O MVP dispón de builds verificadas para:

-   Android.
-   Windows.

O desenvolvemento mantén unha orientación multiplataforma e contempla
Linux como plataforma compatible co enfoque técnico empregado.

Posibles ampliacións futuras:

-   Web.
-   Sincronización cloud entre dispositivos.
-   Autenticación e contas de usuario.
-   Funcionalidades meteorolóxicas avanzadas.
-   Alertas e notificacións.
-   Ampliación do catálogo de especies.

iOS non forma parte do alcance inicial debido ás limitacións e custos
asociados ao desenvolvemento e distribución na plataforma Apple.

------------------------------------------------------------------------

# Current Project Status

## Version

`1.0.0`

## Status

**MVP finalizado --- TFC entregado**

A versión académica do proxecto está finalizada. MARTOLA pode continuar
evolucionando posteriormente mediante novas funcionalidades, melloras
técnicas e refinamentos da experiencia de usuario.

## Last Updated

2026-09-24

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

Esta documentación constitúe o sistema principal de contexto técnico e
histórico do proxecto.

Os documentos permiten:

-   Comprender as decisións técnicas adoptadas.
-   Consultar a arquitectura e o modelo de datos.
-   Recuperar o contexto do desenvolvemento.
-   Documentar a evolución do proxecto.
-   Servir como apoio para o mantemento e futuras ampliacións.
-   Conservar o proceso de aprendizaxe seguido durante o TFC.

O estado actual do produto debe consultarse principalmente neste
documento e no `README.md`. Os documentos de desenvolvemento e
aprendizaxe poden conservar información histórica correspondente a fases
anteriores do proxecto.

------------------------------------------------------------------------

# Technical Stack

## Application

-   Flutter.
-   Dart.

## Architecture

-   MVVM simplificado.
-   Repository Pattern.

## State Management

-   Provider.
-   `ChangeNotifier`.
-   `MultiProvider`.

## Database

-   SQLite.
-   `sqflite`.
-   `sqflite_common_ffi`.
-   `path`.
-   `path_provider`.

A infraestrutura de persistencia está deseñada cun enfoque local-first e
permite traballar en Android, Windows e Linux.

## HTTP / External APIs

-   Paquete `http`.
-   OpenWeather API para meteoroloxía actual.
-   OpenWeather Geocoding API para xeocodificación directa de
    localidades.

A integración con OpenWeather está implementada e operativa.

As credenciais das APIs non se almacenan directamente no código fonte.
Durante o desenvolvemento proporciónanse mediante `--dart-define` ou
`--dart-define-from-file`.

## Design and Documentation Tools

-   Figma.
-   draw.io.

## Version Control

-   Git.
-   GitHub.

------------------------------------------------------------------------

# Architecture

## Current Folder Structure

A estrutura real principal de `lib/` organízase por responsabilidades:

``` text
lib/
├── models/
├── repositories/
│   ├── memory/
│   ├── open_weather/
│   └── sqlite/
├── services/
├── viewmodels/
├── views/
├── widgets/
└── main.dart
```

## Architecture Flow

Para datos persistentes locais:

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

Para servizos externos:

``` text
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

A arquitectura MVVM simplificada está orientada a:

-   Separar responsabilidades.
-   Manter independentes a interface, o estado e as fontes de datos.
-   Facilitar o mantemento.
-   Permitir substituír implementacións concretas mediante contratos de
    Repository.
-   Manter unha complexidade adecuada ao alcance do proxecto.
-   Facilitar futuras ampliacións.

## Current Implementation

A arquitectura aplícase aos módulos de:

-   Hortas.
-   Plantas.
-   Especies.
-   Evolución das plantas.
-   Meteoroloxía.
-   Xeocodificación.
-   Deseño visual da horta.
-   Tarefas.

A composición principal realízase en `main.dart`, onde se crean e
inxectan as implementacións concretas de Repositories, Services e
ViewModels mediante Provider.

Para a persistencia local:

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

Para xeocodificación e meteoroloxía:

``` text
main.dart
   ├── GeocodingService
   │      ↓
   │   OpenWeatherGeocodingRepository
   │      ↓
   │   GeocodingViewModel
   │
   └── WeatherService
          ↓
       OpenWeatherRepository
          ↓
       WeatherViewModel
```

As Views acceden ao estado principalmente mediante:

-   `context.read()` para executar accións sen subscribirse aos cambios.
-   `context.watch()` para observar cambios de estado.
-   `context.select()` para observar só unha parte concreta do estado.

Os ViewModels manteñen o estado de presentación e os Repositories
abstraen a fonte concreta dos datos.

Esta abstracción aplícase tanto á persistencia SQLite como ás APIs
externas.

## Implemented Repositories

### Contracts

-   `GardenRepository`.
-   `PlantSpeciesRepository`.
-   `GardenPlantRepository`.
-   `PlantEvolutionRecordRepository`.
-   `WeatherRepository`.
-   `GeocodingRepository`.
-   `GardenLayoutRepository`.

### Implementations

-   `SQLiteGardenRepository`.
-   `SQLitePlantSpeciesRepository`.
-   `SQLiteGardenPlantRepository`.
-   `SQLitePlantEvolutionRecordRepository`.
-   `OpenWeatherRepository`.
-   `OpenWeatherGeocodingRepository`.
-   `SqliteGardenLayoutRepository`.

`MemoryGardenRepository` mantense como implementación alternativa útil
para desenvolvemento ou probas.

A abstracción de `WeatherRepository` evita que `WeatherViewModel`
dependa directamente de OpenWeather e permite substituír ou combinar
provedores no futuro.

------------------------------------------------------------------------

# Database Design

## Persistence

A persistencia local está implementada mediante SQLite.

O esquema evolucionou durante o desenvolvemento ata a:

``` text
version: 6
```

As migracións implementadas son acumulativas:

``` text
v1 → v2
v2 → v3
v3 → v4
v4 → v5
v5 → v6
```

O obxectivo das migracións é conservar os datos existentes ao
evolucionar o esquema.

## Current Physical Schema

``` text
gardens
plant_species
garden_plants
plant_evolution_records
garden_layout_items
tasks
```

## Main Relationships

``` text
gardens 1:N garden_plants
plant_species 1:N garden_plants
garden_plants 1:N plant_evolution_records
gardens 1:N garden_layout_items
garden_plants 1:0..1 garden_layout_items
```

As tarefas constitúen rexistros independentes de apoio á planificación
no MVP actual.

## Referential Integrity

-   `garden_plants.garden_id → gardens.id` con `ON DELETE CASCADE`.
-   `garden_plants.species_id → plant_species.id` con
    `ON DELETE RESTRICT`.
-   `plant_evolution_records.plant_id → garden_plants.id` con
    `ON DELETE CASCADE`.
-   `garden_layout_items.garden_id → gardens.id` con
    `ON DELETE CASCADE`.
-   `garden_layout_items.garden_plant_id → garden_plants.id` con
    `ON DELETE CASCADE`.
-   `garden_layout_items.garden_plant_id` dispón de restrición `UNIQUE`.

As claves foráneas actívanse mediante:

``` sql
PRAGMA foreign_keys = ON
```

## Persistence Decisions

-   Os identificadores do dominio mantéñense como `String`, aínda que
    SQLite utiliza `INTEGER`.
-   A conversión realízase na fronteira coa persistencia.
-   Os `DateTime` almacénanse como `TEXT` en formato ISO 8601.
-   Os valores decimais almacénanse como `REAL`.
-   Os campos opcionais poden persistirse como `NULL`.

O deseño completo das entidades, táboas, relacións e decisións de
persistencia está documentado en:

`docs/DATABASE_DESIGN.md`

------------------------------------------------------------------------

# Implemented Functional Modules

## Gardens

CRUD completo desde a interface:

-   Crear horta.
-   Listar hortas.
-   Consultar detalle.
-   Editar horta.
-   Eliminar horta.
-   Persistir os datos en SQLite.
-   Recuperar os datos entre reinicios.

Cada horta pode almacenar unha localización e coordenadas xeográficas
opcionais utilizadas posteriormente para consultar a meteoroloxía.

## Plant Species

Implementado:

-   Modelo `PlantSpecies`.
-   Repository e implementación SQLite.
-   `PlantSpeciesViewModel`.
-   Catálogo inicial local de especies.
-   Inserción do catálogo cando a táboa está baleira.
-   Selección de especies desde os formularios.

O catálogo local resolve as necesidades do MVP e pode ampliarse ou
substituírse no futuro.

## Plants

CRUD completo desde a interface:

-   Listar plantas dunha horta.
-   Crear planta.
-   Consultar detalle.
-   Resolver a especie asociada.
-   Editar planta.
-   Eliminar planta.
-   Persistir os datos en SQLite.
-   Actualizar as Views de forma reactiva.

## Plant Evolution

CRUD completo de rexistros de evolución dunha planta.

Cada rexistro permite almacenar:

-   Data.
-   Altura opcional.
-   Notas opcionais.

Inclúe creación, consulta, edición e eliminación, selección de data e
actualización reactiva mediante Provider.

## Garden Layout

O deseñador visual permite:

-   Engadir ao deseño plantas pertencentes á horta.
-   Evitar que unha planta apareza dúas veces.
-   Representar as plantas sobre un taboleiro.
-   Arrastrar os elementos.
-   Evitar solapamentos.
-   Manter os elementos dentro dos límites do taboleiro.
-   Gardar posicións mediante coordenadas normalizadas.
-   Persistir a posición final en SQLite.
-   Recuperar as posicións ao volver abrir a pantalla.
-   Retirar unha planta do deseño sen eliminala da horta.
-   Procurar automaticamente unha posición inicial libre.

As coordenadas normalizadas permiten adaptar o deseño ao tamaño
dispoñible da pantalla.

## Tasks

O MVP incorpora un módulo básico de tarefas para apoiar a planificación.

Funcionalidades:

-   Listar tarefas.
-   Crear tarefas.
-   Persistencia local mediante SQLite.
-   Actualización reactiva mediante Provider.
-   Resumo de tarefas pendentes no Dashboard.

Alertas, notificacións e recorrencia quedan como posibles ampliacións
futuras.

## Weather

O módulo meteorolóxico está conectado con datos reais de OpenWeather.

A información procesada inclúe:

-   Temperatura.
-   Humidade.
-   Descrición meteorolóxica.
-   Velocidade do vento.
-   Localidade.

Infraestrutura principal:

-   `WeatherData`.
-   `WeatherService`.
-   `WeatherException`.
-   `WeatherRepository`.
-   `OpenWeatherRepository`.
-   `WeatherViewModel`.

`WeatherViewModel` representa os estados principais:

``` text
loading
data
error
```

A consulta utiliza as coordenadas reais persistidas de cada horta.

## Geocoding

O módulo de xeocodificación directa está conectado coa API de
OpenWeather.

A información procesada inclúe:

-   Nome da localización.
-   Latitude.
-   Longitude.
-   Estado ou rexión cando está dispoñible.
-   País cando está dispoñible.

`CreateGardenScreen` permite buscar unha localización, mostrar os
resultados e seleccionar unha coincidencia. A localización e as
coordenadas seleccionadas persístense posteriormente no modelo `Garden`.

------------------------------------------------------------------------

# API Configuration and Secrets

As claves de APIs non se almacenan directamente no código fonte.

Poden proporcionarse mediante:

``` text
--dart-define
```

ou:

``` text
--dart-define-from-file
```

A configuración local utiliza:

``` text
config/
├── secrets.json
└── secrets.example.json
```

`secrets.json` contén a configuración local e está excluído do control
de versións mediante `.gitignore`.

`secrets.example.json` pode versionarse porque non contén credenciais
reais e documenta as variables necesarias.

Configuración esperada:

``` json
{
  "OPENWEATHER_API_KEY": ""
}
```

O código accede á clave mediante:

``` dart
const apiKey = String.fromEnvironment(
  'OPENWEATHER_API_KEY',
);
```

Exemplo de execución:

``` text
flutter run -d windows --dart-define-from-file=config/secrets.json
```

Este mecanismo evita almacenar a clave directamente no código ou subila
accidentalmente xunto cos ficheiros locais de configuración.

Unha clave incorporada nunha aplicación cliente compilada non debe
considerarse un segredo completamente protexido. Se MARTOLA necesitase
no futuro credenciais que non puidesen ser expostas ao cliente, sería
necesario empregar un backend para custodialas.

------------------------------------------------------------------------

# Navigation Flow

Fluxo funcional principal:

``` text
Inicio
  ↓
Dashboard
  ├── Tarefas
  │     ├── Lista
  │     └── Crear tarefa
  │
  └── Hortas
        ↓
     Lista de Hortas
        ├── Crear horta
        │     └── Buscar e seleccionar localización
        │
        ↓
     Detalle da Horta
        ├── Meteoroloxía
        ├── Plantas
        │     ↓
        │  Detalle da Planta
        │     ↓
        │  Evolución
        │     ↓
        │  Rexistros
        │
        └── Deseño da Horta
```

Operacións CRUD están dispoñibles nos módulos principais de hortas,
plantas e evolución.

------------------------------------------------------------------------

# Responsive Design

MARTOLA emprega unha interface adaptable para móbil, tablet e escritorio
mantendo un fluxo funcional común.

## Mobile

-   Navegación principalmente secuencial e vertical.
-   Referencia práctica de probas arredor de 360--400 px lóxicos.
-   Formularios e controis adaptados a anchos reducidos.

## Tablet

-   Aproveitamento do espazo dispoñible mediante cambios de composición.
-   Uso de varias columnas cando o ancho o permite.

## Desktop

-   Limitación do ancho de contido cando é necesario.
-   Aproveitamento do espazo horizontal mediante layouts máis amplos e
    grids.
-   Soporte para redimensionado continuo da ventá.

## Implemented Responsive Behaviour

Entre outros:

-   `HomeScreen` con contido centrado e ancho máximo controlado.
-   Formularios con ancho limitado e composición adaptable.
-   Cambio entre `Row` e `Column` segundo o espazo dispoñible.
-   Listas adaptables a `GridView`.
-   Pantallas de detalle adaptables.
-   Dashboard adaptado a diferentes anchos.
-   `LayoutDesignerScreen` baseado en coordenadas normalizadas.

------------------------------------------------------------------------

# Interface and Design

O deseño inicial e os wireframes utilizáronse como referencia durante o
desenvolvemento mediante Figma.

A interface final prioriza:

-   Claridade.
-   Consistencia.
-   Reutilización de compoñentes.
-   Adaptación a diferentes tamaños de pantalla.
-   Navegación coherente entre plataformas.

A implementación final evolucionou durante o desenvolvemento a partir
dos wireframes iniciais, polo que o código e o estado actual da
aplicación constitúen a referencia definitiva do produto.

A documentación específica de interface e fluxo pode consultarse en:

`docs/UI_REFERENCE.md`

------------------------------------------------------------------------

# Scope of Version 1.0.0

MARTOLA 1.0.0 segue unha estratexia **local-first**.

Os datos propios do usuario almacénanse localmente mediante SQLite. Os
servizos externos utilízanse para obter información complementaria, como
meteoroloxía e xeocodificación.

## Included in the MVP

-   Xestión de hortas.
-   Xestión de plantas.
-   Catálogo local de especies.
-   Seguimento da evolución das plantas.
-   Meteoroloxía actual por horta.
-   Xeocodificación.
-   Deseñador visual da horta.
-   Xestión básica de tarefas.
-   Persistencia SQLite.
-   Interface responsive/adaptable.
-   Builds verificadas para Android e Windows.

## Outside the Scope of Version 1.0.0

Non se implementaron nesta versión:

-   Autenticación de usuarios.
-   Sincronización cloud entre dispositivos.
-   Backend propio.
-   Histórico climático persistido.
-   Predición meteorolóxica avanzada.
-   Selección de localización mediante mapa.
-   Alertas e notificacións.
-   Versión web de produción.
-   Suite de probas automatizadas.

A exclusión destas funcionalidades responde ao control do alcance do TFC
e non impide a súa incorporación en versións posteriores.

------------------------------------------------------------------------

# Future Evolution

Posibles liñas de evolución:

-   Incorporar probas automatizadas.
-   Engadir sincronización cloud.
-   Incorporar autenticación e contas de usuario.
-   Implementar copias de seguridade e restauración.
-   Engadir histórico e predición meteorolóxica.
-   Incorporar selección de localización mediante mapa.
-   Engadir alertas, notificacións e recorrencia ás tarefas.
-   Ampliar o catálogo de especies.
-   Mellorar e ampliar o deseñador visual.
-   Incorporar unha versión web.
-   Continuar refinando a experiencia de usuario e a accesibilidade.

Estas ampliacións non forman parte dos requisitos do MVP 1.0.0.

------------------------------------------------------------------------

# Academic Context

MARTOLA foi desenvolvido como Proxecto de Desenvolvemento de Aplicacións
Multiplataforma no CIFP A Carballeira Marcos Valcárcel durante o curso
2025/2026.

O proxecto forma parte do CFGS en Desenvolvemento de Aplicacións
Multiplataforma, finalizado en setembro de 2026.

O obxectivo académico foi aplicar de forma integrada coñecementos de
programación, bases de datos, deseño de interfaces, arquitectura de
software, consumo de servizos externos e desenvolvemento
multiplataforma.

------------------------------------------------------------------------

# Related Documentation

-   `README.md` --- Presentación xeral, funcionalidades, instalación e
    uso.
-   `docs/ARCHITECTURE.md` --- Arquitectura e decisións técnicas.
-   `docs/DATABASE_DESIGN.md` --- Modelo de datos e esquema físico.
-   `docs/UI_REFERENCE.md` --- Interface e fluxo de navegación.
-   `docs/ROADMAP.md` --- Evolución e planificación do proxecto.
-   `docs/DEVELOPMENT_GUIDE.md` --- Guía e rexistro do proceso de
    desenvolvemento.
-   `docs/LEARNING_NOTES.md` --- Notas e conceptos de aprendizaxe.

------------------------------------------------------------------------

# Final State

``` text
Version: 1.0.0
Status: MVP finalizado — TFC entregado
Academic completion: September 2026
Last Updated: 2026-09-24
```

MARTOLA 1.0.0 representa o resultado funcional do TFC. A partir desta
versión, calquera desenvolvemento adicional considerarase evolución
posterior do produto.
