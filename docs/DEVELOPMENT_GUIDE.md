# DEVELOPMENT_GUIDE.md

# MARTOLA - Development Guide

## Purpose

Este documento define o plan de aprendizaxe e desenvolvemento da
aplicación MARTOLA.

O seu obxectivo non é substituír o ROADMAP técnico do proxecto, senón
servir como guía práctica para aprender Flutter e Dart mentres se
desenvolve a aplicación.

Cada sesión de traballo terá un obxectivo concreto, conceptos asociados
e un resultado funcional dentro de MARTOLA.

**---**

# Current Learning Status

## Preparation Completed

-   [x] Repositorio GitHub configurado.
-   [x] Proxecto Flutter creado.
-   [x] Estrutura de carpetas creada.
-   [x] Arquitectura documentada.
-   [x] Interface inicial definida.
-   [x] Modelo de datos documentado.

## Current Phase

Módulos relacionais principais do MVP implementados con persistencia
local.

Actualmente MARTOLA dispón de:

-   CRUD persistente completo de hortas.
-   CRUD persistente completo de plantas.
-   Catálogo persistente de especies.
-   Seguemento persistente da evolución das plantas.
-   Estado compartido mediante Provider.
-   Arquitectura MVVM simplificada + Repository Pattern.
-   Inxección de dependencias desde `main.dart`.
-   Navegación por identificadores nas pantallas de detalle.
-   Estado contextual para plantas e rexistros de evolución.
-   Integración meteorolóxica básica mediante API REST.
-   Consulta das condicións meteorolóxicas actuais mediante OpenWeather.
-   Presentación dos datos meteorolóxicos reais no Dashboard.
-   Xeocodificación de localidades mediante OpenWeather Geocoding API.
-   Selección de resultados de xeocodificación ao crear ou editar unha
    horta.
-   Coordenadas opcionais persistidas en cada horta.
-   Meteoroloxía específica segundo a localización de cada horta.
-   `WeatherCard` reutilizable no Dashboard e no detalle dunha horta.
-   Xestión dos estados de carga e erro nas operacións de rede.
-   Layout Designer persistente por horta.
-   Engadido e retirada de plantas do deseño sen modificar as plantas da horta.
-   Posicionamento libre mediante arrastre.
-   Coordenadas normalizadas independentes do tamaño do taboleiro.
-   Límites de movemento para manter os elementos dentro do taboleiro.
-   Prevención de solapamento entre plantas.
-   Persistencia das posicións en SQLite.

A infraestrutura SQLite dispón actualmente de:

-   `DatabaseService`.
-   Base de datos `martola.db`.
-   Esquema na versión 5.
-   Migración v1 → v2.
-   Migración v2 → v3.
-   Migración v3 → v4.
-   Migración v4 → v5.
-   Táboa `gardens`, con `latitude` e `longitude` opcionais.
-   Táboa `plant_species`.
-   Táboa `garden_plants`.
-   Táboa `plant_evolution_records`.
-   Táboa `garden_layout_items`.
-   Claves foráneas activadas mediante `PRAGMA foreign_keys = ON`.
-   `ON DELETE CASCADE` entre `gardens` e `garden_plants`.
-   `ON DELETE RESTRICT` entre `plant_species` e `garden_plants`.
-   `ON DELETE CASCADE` entre `garden_plants` e
    `plant_evolution_records`.

Os ViewModels actualmente integrados son:

-   `GardensViewModel`.
-   `PlantSpeciesViewModel`.
-   `PlantsViewModel`.
-   `PlantEvolutionViewModel`.
-   `WeatherViewModel`.
-   `GeocodingViewModel`.
-   `GardenLayoutViewModel`.

Os Repositories e implementacións actualmente integrados inclúen:

-   `SQLiteGardenRepository`.
-   `SQLitePlantSpeciesRepository`.
-   `SQLiteGardenPlantRepository`.
-   `SQLitePlantEvolutionRecordRepository`.
-   `OpenWeatherRepository`.
-   `OpenWeatherGeocodingRepository`.
-   `GardenLayoutRepository`.
-   `SqliteGardenLayoutRepository`.

## Next Action

Revisar o `ROADMAP.md` actualizado e seleccionar o seguinte bloque
funcional do MVP.

A Session 19 deixa implementada a primeira versión funcional do Layout
Designer. MARTOLA xa pode asociar as plantas dunha horta cunha posición
visual persistente, movelas libremente dentro dun taboleiro e impedir que
dúas plantas ocupen o mesmo espazo.

Os principais bloques aínda pendentes son:

1.  Adaptación responsive.
2.  Testing, revisión e optimización.
3.  Documentación final e preparación da defensa.
4.  Melloras opcionais do Layout Designer, como maior fluidez, grid/snapping
    ou representación visual específica por especie.
5.  Ampliacións meteorolóxicas non imprescindibles para o MVP, como
    MeteoSIX, predición ou histórico persistente.

Antes de comezar unha nova implementación revisarase o roadmap para
fixar o seguinte obxectivo concreto.

**---**

# Working Method

Cada sesión seguirá sempre a mesma estrutura.

## 1. Theory

Introdución aos conceptos necesarios.

Só se estudará a teoría imprescindible para implementar a funcionalidade
da sesión.

**---**

## 2. Implementation

Aplicación inmediata dos conceptos aprendidos dentro de MARTOLA.

Non se realizarán exercicios independentes do proxecto salvo que sexan
imprescindibles para comprender un concepto.

**---**

## 3. Review

Ao finalizar a implementación revisarase:

-   organización do código
-   boas prácticas
-   alternativas posibles
-   erros frecuentes

**---**

## 4. Version Control

Ao finalizar cada sesión realizarase un commit en Git.

Cada commit representará un pequeno avance funcional.

**---**

## 5. Documentation

Actualizaranse os documentos do proxecto sempre que sexa necesario.

Especialmente:

-   PROJECT_CONTEXT.md
-   ARCHITECTURE.md
-   DATABASE_DESIGN.md
-   UI_REFERENCE.md
-   ROADMAP.md

**---**

# Learning Objectives

Ao finalizar o proxecto deberase comprender:

-   Dart
-   Flutter
-   Widgets
-   Material Design
-   Navegación
-   MVVM
-   Provider
-   SQLite
-   Consumo de APIs REST
-   Responsive Design
-   Arquitectura dunha aplicación Flutter
-   Organización dun proxecto profesional

**---**

# Development Phases

## Phase 1

Flutter Fundamentals

Status:

✅ Completed

### Concepts

-   Estrutura dun proxecto Flutter
-   main.dart
-   runApp()
-   Widget
-   StatelessWidget
-   StatefulWidget
-   MaterialApp
-   Scaffold
-   BuildContext
-   Hot Reload

### Practical Objective

Crear a primeira pantalla funcional de MARTOLA.

### Deliverable

HomeScreen funcionando.

**---**

## Phase 2

Layouts

Status:

✅ Completed

### Concepts

-   Column
-   Row
-   Expanded
-   Flexible
-   Container
-   Padding
-   Margin
-   Align
-   Center

### Practical Objective

Construír a estrutura visual da HomeScreen.

**---**

## Phase 3

Navigation

Status:

🟡 In Progress

### Concepts

-   Navigator
-   Routes
-   Navigation Stack
-   Paso de parámetros

### Practical Objective

Crear a navegación entre:

-   HomeScreen
-   GardensScreen
-   GardenDetailScreen
-   PlantDetailScreen
-   LayoutDesignerScreen

**---**

## Phase 4

Reusable Widgets

Status:

🟡 In Progress

### Concepts

-   Composición
-   Props
-   Reutilización
-   Organización de widgets

### Practical Objective

Crear:

-   GardenCard
-   WeatherCard
-   PlantCard
-   ActionCard

**---**

## Phase 5

Application Theme

Status:

🟡 In Progress

### Concepts

-   ThemeData
-   ColorScheme
-   Typography
-   Icons
-   Material 3

### Practical Objective

Aplicar un deseño consistente a toda a aplicación.

**---**

## Phase 6

State Management

Status:

✅ Completed

### Concepts

-   Provider
-   ChangeNotifier
-   notifyListeners()
-   MVVM

### Practical Objective

Conectar vistas e ViewModels.

**---**

## Phase 7

Models

Status:

🟡 In Progress

### Concepts

-   Clases Dart
-   fromMap()
-   toMap()
-   JSON
-   Encapsulamento

### Practical Objective

Crear todos os modelos da aplicación.

**---**

## Phase 8

SQLite

Status:

🟡 In Progress

### Concepts

-   sqflite
-   CRUD
-   Repository Pattern
-   Persistencia local

### Practical Objective

Implementar a base de datos local.

**---**

## Phase 9

Forms

Status:

🟡 In Progress

### Concepts

-   Form
-   TextField
-   Validation
-   Controllers

### Practical Objective

Crear formularios de creación e edición.

**---**

## Phase 10

REST APIs

Status:

✅ Completed

### Concepts

-   HTTP
-   REST
-   JSON
-   `http`
-   `Uri.https`
-   `jsonDecode`
-   `async` / `await`
-   `Future`
-   Códigos de estado HTTP
-   Excepcións de servizo
-   Configuración mediante `String.fromEnvironment`
-   Separación Service / Repository / ViewModel

### Practical Objective

Integrar OpenWeather como primeira fonte meteorolóxica de MARTOLA e
mostrar datos reais no Dashboard.

**---**

## Phase 11

Garden Module

Status:

✅ Completed

### Practical Objective

Finalizar a xestión completa das hortas.

**---**

## Phase 12

Plant Module

Status:

✅ Completed

### Practical Objective

Finalizar a xestión completa das plantas.

**---**

## Phase 13

Plant Evolution

Status:

✅ Completed

### Practical Objective

Implementar o seguemento da evolución das plantas.

**---**

## Phase 14

Layout Designer

Status:

✅ Completed

### Concepts

-   `LayoutBuilder`
-   `Stack`
-   `Positioned`
-   `GestureDetector`
-   `onPanUpdate`
-   `onPanEnd`
-   Coordenadas normalizadas
-   Conversión entre coordenadas relativas e píxeles
-   `clamp()`
-   Detección de solapamento
-   Actualización local durante interaccións continuas
-   Persistencia ao finalizar unha interacción
-   Reutilización de MVVM + Repository Pattern nun novo módulo

### Practical Objective

Deseño visual persistente da horta mediante plantas posicionables.

### Result

Implementouse unha primeira versión funcional de `LayoutDesignerScreen`
na que as plantas poden engadirse ao deseño, moverse individualmente,
permanecer dentro dos límites do taboleiro, evitar solapamentos e conservar
a súa posición despois de navegar ou reiniciar a aplicación.

**---**

## Phase 15

Responsive Design

Status:

⬜ Pending

### Practical Objective

Adaptar a aplicación para:

-   móbil
-   tablet
-   escritorio

**---**

## Phase 16

Testing & Optimization

Status:

⬜ Pending

### Concepts

-   Debugging
-   Performance
-   Refactoring

### Practical Objective

Optimizar a aplicación.

**---**

## Phase 17

Final Documentation

Status:

⬜ Pending

### Practical Objective

Preparar:

-   Memoria
-   Capturas
-   Diagramas
-   Defensa

**---**

# Session Log

Esta sección actualizarase ao finalizar cada sesión.

## Session 1

Status:

✅ Completed

### Concepts Learned

-   Estrutura xeral dunha aplicación Flutter.
-   Función `main()`.
-   Función `runApp()`.
-   Widget raíz da aplicación.
-   Que é un Widget.
-   Diferenza entre `StatelessWidget` e `StatefulWidget`.
-   Uso de `const`.
-   Filosofía de composición mediante widgets.

### Practical Work

-   Análise conceptual do ficheiro `main.dart`.
-   Comprensión da árbore de widgets.
-   Definición dos criterios para distinguir widgets con estado e sen
    estado.

### Code Implemented

Ningún.

A sesión centrouse exclusivamente na comprensión da arquitectura básica
de Flutter.

### Documentation Updated

-   DEVELOPMENT_GUIDE.md

### Commit

Non necesario.

### Notes

A comprensión dos fundamentos foi satisfactoria. Antes de implementar
código considérase importante consolidar o funcionamento interno dunha
aplicación Flutter para facilitar as seguintes fases do desenvolvemento.

**---**

## Session 2

Status:

✅ Completed

### Concepts Learned

-   Estrutura dun Widget.
-   Filosofía de composición en Flutter.
-   Relación entre Framework e Engine.
-   Función do método build().
-   Widget como descrición da interface.
-   BuildContext (introdución).
-   MaterialApp.
-   Scaffold.
-   Composición mediante widgets pequenos.
-   Principio de responsabilidade única aplicado aos widgets.

### Practical Work

-   Análise completa de main.dart.
-   Análise de HomeScreen.
-   Comprensión da árbore de widgets dunha aplicación Flutter.
-   Introdución á arquitectura baseada en composición.

### Code Implemented

Ningún.

A sesión estivo centrada na comprensión profunda do código xerado por
Flutter e na filosofía do framework.

### Documentation Updated

-   DEVELOPMENT_GUIDE.md

### Commit

Non necesario.

### Notes

Comeza a consolidarse o modelo mental de Flutter. Compréndese que os
widgets describen a interface e que Flutter reconstrúe unicamente as
partes necesarias da árbore cando cambia o estado.

**---**

## Session 3

Status:

✅ Completed

### Concepts Learned

-   Column
-   Row
-   Eixe principal (Main Axis)
-   Eixe secundario (Cross Axis)
-   MainAxisAlignment
-   CrossAxisAlignment
-   Filosofía de composición de Flutter
-   Organización dunha pantalla mediante widgets

### Practical Work

-   Comprensión do funcionamento de Column e Row.
-   Dedución do comportamento de mainAxisAlignment e crossAxisAlignment
    sen recorrer á documentación.
-   Introdución ao sistema de layout de Flutter.
-   Análise da responsabilidade dos widgets de organización.

### Code Implemented

Ningún.

A sesión centrouse na comprensión do sistema de composición e
distribución dos widgets antes de comezar a construír a primeira
interface de MARTOLA.

### Documentation Updated

-   DEVELOPMENT_GUIDE.md
-   LEARNING_NOTES.md

### Commit

Non necesario.

### Notes

A comprensión do sistema de layout foi moi satisfactoria. O alumno xa é
capaz de deducir o comportamento de widgets novos a partir da súa
responsabilidade, sen depender da memorización da API.

**---**

## Session 4

Status:

✅ Completed

### Concepts Learned

-   Column
-   Row
-   Main Axis
-   Cross Axis
-   MainAxisAlignment
-   CrossAxisAlignment
-   SizedBox
-   Padding
-   Composición de widgets
-   Lectura dunha árbore de widgets

### Practical Work

-   Comprensión do sistema de layout de Flutter.
-   Análise das responsabilidades de Column, Row, Padding e SizedBox.
-   Comprensión da distribución mediante Main Axis e Cross Axis.
-   Interpretación visual dunha interface a partir da súa árbore de
    widgets.

### Skills Acquired

-   Deducir o funcionamento dunha API a partir da responsabilidade dun
    widget.
-   Identificar o eixe principal e secundario sen necesidade de
    memorización.
-   Ler mentalmente unha interface Flutter antes de executala.
-   Comprender a filosofía de composición mediante widgets pequenos.

### Code Implemented

Ningún.

A sesión estivo dedicada á comprensión do sistema de composición e
layout antes de construír a primeira interface de MARTOLA.

### Documentation Updated

-   DEVELOPMENT_GUIDE.md
-   LEARNING_NOTES.md

### Commit

Non necesario.

### Notes

A partir desta sesión o enfoque cambia progresivamente cara ao
desenvolvemento práctico. Os fundamentos de composición de widgets
considéranse suficientemente consolidados para comezar a implementar a
interface da aplicación.

**---**

## Session 5

Status:

✅ Completed

### Objective

Construír a primeira interface funcional de MARTOLA aplicando os
conceptos aprendidos nas sesións anteriores.

### Concepts Learned

-   AppBar
-   SafeArea
-   ElevatedButton
-   Icon
-   Composición de widgets aplicada a un caso real
-   Lectura e construción dunha árbore de widgets
-   Relación entre responsabilidade e composición

### Practical Work

-   Deseño da arquitectura da primeira HomeScreen.
-   Implementación da primeira pantalla funcional da aplicación.
-   Primeira revisión de código (Code Review).
-   Corrección de erros de sintaxe relacionados con `child`, `children`
    e propiedades nomeadas.

### Skills Acquired

-   Construír unha pantalla Flutter desde cero sen recorrer a un
    exemplo.
-   Traducir un wireframe nunha árbore de widgets.
-   Comprender a diferenza entre erros conceptuais e erros de sintaxe.
-   Aplicar os principios de responsabilidade única e composición
    durante a implementación.

### Code Implemented

-   HomeScreen inicial.
-   AppBar.
-   SafeArea.
-   Center.
-   Padding.
-   Column.
-   Icon.
-   ElevatedButton.

### Documentation Updated

-   DEVELOPMENT_GUIDE.md
-   LEARNING_NOTES.md

### Commit

Create initial HomeScreen layout

### Notes

Primeira pantalla funcional de MARTOLA. Nesta sesión produciuse a
transición desde o estudo dos fundamentos de Flutter á implementación
práctica da aplicación.

**---**

## Session 6

Status:

✅ Completed

### Objective

Introducir a reutilización de compoñentes e a configuración visual
global da aplicación.

### Concepts Learned

-   Refactorización
-   Widgets reutilizables
-   ThemeData
-   ColorScheme
-   Theme.of(context)
-   Separación entre lóxica e presentación

### Practical Work

-   Creación do widget reutilizable `MartolaLogo`.
-   Eliminación de código duplicado na `HomeScreen`.
-   Configuración do primeiro `ThemeData`.
-   Uso de `ColorScheme.fromSeed()`.
-   Aplicación de `Theme.of(context).colorScheme.primary`.

### Skills Acquired

-   Identificar cando un widget merece ser extraído.
-   Comprender a diferenza entre reutilización e duplicación.
-   Entender o papel de `ThemeData` como configuración global.
-   Comprender a relación entre `MaterialApp`, `ThemeData` e os widgets
    da aplicación.

### Code Implemented

-   `MartolaLogo`
-   Primeira configuración global do tema.
-   Refactorización da `HomeScreen`.

### Documentation Updated

-   DEVELOPMENT_GUIDE.md
-   LEARNING_NOTES.md
-   PROJECT_CONTEXT.md

### Commit

Refactor HomeScreen and introduce reusable MartolaLogo widget

### Notes

Primeira sesión centrada na mellora da arquitectura do código. A
interface permanece visualmente igual, pero o código gaña en
reutilización, mantemento e escalabilidade.

**---**

## Session 7

Status:

✅ Completed

### Objective

Introducir o sistema de navegación entre pantallas e comprender o
funcionamento do Navigator.

### Concepts Learned

-   Navigator
-   Routes
-   Stack de navegación
-   push()
-   pop()
-   MaterialPageRoute
-   Organización de pantallas por responsabilidade
-   SingleChildScrollView
-   Diferenzas entre Column, SingleChildScrollView e ListView

### Practical Work

-   Creación de DashboardScreen.
-   Navegación desde HomeScreen.
-   Retorno mediante Navigator.pop().
-   Estruturación das vistas.
-   Deseño conceptual do Dashboard.

### Skills Acquired

-   Comprender a navegación baseada nunha pila.
-   Identificar cando crear unha nova pantalla.
-   Organizar vistas segundo a súa responsabilidade.
-   Escoller o widget adecuado segundo o comportamento esperado da
    interface.

### Code Implemented

-   DashboardScreen.
-   Navegación Home → Dashboard.
-   Botón Entrar funcional.

### Documentation Updated

-   DEVELOPMENT_GUIDE.md
-   LEARNING_NOTES.md
-   PROJECT_CONTEXT.md

### Commit

Add DashboardScreen and navigation flow

### Notes

Primeira navegación funcional da aplicación. A arquitectura pasa dunha
aplicación dunha única pantalla a unha estrutura preparada para crecer
con múltiples vistas.

**---**

## Session 8

Status:

✅ Completed

### Objective

Construír o primeiro Dashboard funcional de MARTOLA mediante compoñentes
independentes e reutilizables.

### Concepts Learned

-   Deseño de widgets a partir da súa responsabilidade.
-   Interface pública dun widget.
-   Paso de datos mediante o construtor.
-   Mock data.
-   Callbacks mediante `VoidCallback`.
-   Separación entre presentación e comportamento.
-   `Card`.
-   `SingleChildScrollView`.
-   `CrossAxisAlignment.stretch`.
-   `TextButton`.
-   `OutlinedButton.icon`.
-   Uso do `Theme` dentro de widgets reutilizables.
-   Xerarquía visual da información.

### Practical Work

-   Creación de `WeatherCard`.
-   Creación de `GardenCard`.
-   Creación de `TasksCard`.
-   Creación de `QuickActionsCard`.
-   Integración dos catro compoñentes en `DashboardScreen`.
-   Uso de datos ficticios para construír a interface antes de dispoñer
    de datos reais.
-   Introdución de callbacks para delegar accións no widget pai.
-   Preparación do Dashboard para contido con scroll.

### Components Implemented

DashboardScreen ├── WeatherCard ├── GardenCard ├── TasksCard └──
QuickActionsCard

### Architecture Decisions

-   Os widgets específicos do Dashboard permanecen en
    `views/dashboard/widgets/`.
-   Un widget só se moverá a `lib/widgets/` cando exista unha necesidade
    real de reutilización fóra da funcionalidade.
-   Os widgets de presentación non deben controlar directamente a
    navegación.
-   As accións externas expóñense mediante callbacks.
-   `Engadir planta` non se inclúe nas accións rápidas do Dashboard, xa
    que require o contexto dunha horta concreta.

### Skills Acquired

-   Deseñar un widget antes de implementar o seu `build()`.
-   Identificar os datos mínimos que necesita un compoñente.
-   Pasar datos dun widget pai a un widget fillo.
-   Pasar comportamento mediante callbacks.
-   Compoñer unha pantalla a partir de widgets especializados.
-   Diferenciar responsabilidades de presentación, navegación e lóxica.

### Next Step

Comezar a conectar as accións do Dashboard coas pantallas
correspondentes e continuar o fluxo funcional de MARTOLA.

**---**

## Session 9

Status:

✅ Completed

### Objective

Conectar os callbacks dos compoñentes do Dashboard coa navegación real
entre os distintos módulos de MARTOLA.

### Concepts Practiced

-   Reutilización de `Navigator`.
-   Uso de `Navigator.of(context).push()`.
-   Uso de `MaterialPageRoute`.
-   Integración entre callbacks e navegación.
-   Separación entre widgets de presentación e control do fluxo.
-   Organización das pantallas por funcionalidade.

### Practical Work

-   Creación de `GardensScreen`.
-   Creación de `CreateGardenScreen`.
-   Creación de `TasksScreen`.
-   Creación de `CreateTaskScreen`.
-   Conexión de `GardenCard` con `GardensScreen`.
-   Conexión de `TasksCard` con `TasksScreen`.
-   Conexión da acción `Crear horta` con `CreateGardenScreen`.
-   Conexión da acción `Engadir tarefa` con `CreateTaskScreen`.
-   Comprobación da navegación de ida e volta mediante a pila de
    `Navigator`.

### Navigation Implemented

``` text
HomeScreen
    ↓
DashboardScreen
    ├── GardenCard
    │      └── GardensScreen
    │
    ├── TasksCard
    │      └── TasksScreen
    │
    └── QuickActionsCard
           ├── CreateGardenScreen
           └── CreateTaskScreen
```

### Architecture Decisions

-   `DashboardScreen` coñece o fluxo de navegación desde o panel
    principal.
-   Os widgets `GardenCard`, `TasksCard` e `QuickActionsCard` non
    realizan navegación directamente.
-   Os widgets de presentación comunican as interaccións mediante
    callbacks.
-   As pantallas relacionadas coas hortas almacénanse en
    `views/gardens/`.
-   As pantallas relacionadas coas tarefas almacénanse en
    `views/tasks/`.
-   As pantallas de creación créanse inicialmente como estruturas
    provisionais antes de implementar os formularios reais.

### Skills Acquired

-   Conectar un callback cunha acción de navegación.
-   Aplicar o mesmo patrón de navegación a diferentes módulos.
-   Manter separados presentación e fluxo da aplicación.
-   Crear pantallas provisionais para desenvolver incrementalmente un
    fluxo.
-   Organizar novas funcionalidades dentro da estrutura do proxecto.

### Next Step

Comezar o desenvolvemento funcional do módulo de hortas, substituíndo as
pantallas provisionais por interfaces capaces de representar e
posteriormente xestionar os datos dunha horta.

**---**

## Estado de desenvolvemento --- Sesión 10

### Módulo de hortas

Iniciouse a implementación funcional do módulo de xestión de hortas.

A aplicación dispón actualmente dun modelo de dominio `Garden`:

``` dart
class Garden {
  final String? id;
  final String name;
  final String location;
  final double area;

  const Garden({
    this.id,
    required this.name,
    required this.location,
    required this.area,
  });
}
```

O identificador é nullable porque unha nova horta pode existir como
obxecto antes de ser persistida e recibir un identificador definitivo.

**---**

### Estrutura actual do módulo

A estrutura principal implementada é:

``` text
lib/
├── models/
│   └── garden.dart
│
└── views/
    ├── dashboard/
    │   └── ...
    │
    └── gardens/
        ├── gardens_screen.dart
        ├── garden_details_screen.dart
        ├── create_garden_screen.dart
        │
        └── widgets/
            └── garden_list_item.dart
```

Responsabilidades actuais:

-   `Garden`: representa os datos dunha horta.
-   `GardensScreen`: mostra a colección de hortas e xestiona a
    navegación desde a lista.
-   `GardenListItem`: representa visualmente unha horta dentro da lista
    e comunica a selección.
-   `GardenDetailsScreen`: mostra a información da horta seleccionada.
-   `CreateGardenScreen`: permite introducir e validar os datos
    necesarios para crear unha nova horta.

**---**

### Listado de hortas

`GardensScreen` utiliza actualmente unha colección local de datos
ficticios:

``` dart
const List<Garden> gardens = [
  // Datos temporais
];
```

A representación da colección realízase mediante:

``` dart
ListView.builder(...)
```

Cada elemento é representado por:

``` dart
GardenListItem
```

Esta implementación é temporal.

A colección local será substituída posteriormente por datos
proporcionados pola capa de estado e persistencia.

**---**

### Fluxo de consulta dunha horta

O fluxo actualmente implementado é:

``` text
DashboardScreen
      ↓
GardensScreen
      ↓
List<Garden>
      ↓
ListView.builder
      ↓
GardenListItem
      ↓
selección do usuario
      ↓
GardenDetailsScreen
```

`GardenDetailsScreen` recibe directamente o modelo seleccionado:

``` dart
GardenDetailsScreen(
  garden: garden,
)
```

Deste modo a pantalla de detalle é independente da horta concreta que se
queira representar.

**---**

### Creación dunha horta

`CreateGardenScreen` está implementada como `StatefulWidget`.

Actualmente dispón de:

-   Campo de nome.
-   Campo de localización.
-   Campo de superficie.
-   `TextEditingController` para cada campo.
-   `Form`.
-   `GlobalKey<FormState>`.
-   Validación dos campos.
-   Conversión da superficie de `String` a `double`.
-   Creación dunha instancia de `Garden`.

Fluxo:

``` text
CreateGardenScreen
      ↓
TextFormField
      ↓
TextEditingController
      ↓
Form / validators
      ↓
conversión de tipos
      ↓
Garden
```

Os `TextEditingController` son creados e destruídos polo estado de
`CreateGardenScreen`.

**---**

### Devolución da nova horta

Unha vez creado o modelo, o formulario pode devolvelo mediante:

``` dart
Navigator.of(context).pop(garden);
```

A ruta que abriu o formulario pode recibir o resultado:

``` dart
final garden = await Navigator.of(context).push<Garden>(
  MaterialPageRoute(
    builder: (context) => const CreateGardenScreen(),
  ),
);
```

O resultado é nullable porque o usuario pode abandonar o formulario sen
crear unha horta.

Esta implementación utilízase actualmente para comprobar o fluxo de
datos entre rutas.

**---**

### Limitación actual

A nova horta creada aínda non se incorpora á colección mostrada en
`GardensScreen`.

Actualmente:

``` text
Formulario
    ↓
Garden creado
    ↓
Garden devolto
    ↓
NON persistido
```

Isto é intencionado.

Non se implementará unha solución temporal baseada en modificar
manualmente a lista local, xa que a xestión dos datos deberá integrarse
coa arquitectura prevista para MARTOLA.

**---**

### Evolución prevista

O fluxo actual:

``` text
View
 ↓
datos locais ficticios
```

deberá evolucionar progresivamente cara á arquitectura prevista:

``` text
View
 ↓
ViewModel / Provider
 ↓
Repository
 ↓
SQLite
```

Isto permitirá que:

-   As hortas non dependan dunha lista local dentro dunha pantalla.
-   Varias pantallas compartan o mesmo estado.
-   Crear unha horta actualice a interface.
-   Os datos permanezan dispoñibles ao pechar e volver abrir a
    aplicación.
-   A interface permaneza desacoplada da implementación concreta da
    persistencia.

**---**

### Estado actual do módulo

Implementado:

-   Modelo `Garden`.
-   Listado dinámico de hortas.
-   Widget reutilizable `GardenListItem`.
-   Selección dunha horta.
-   Pantalla de detalle.
-   Paso de modelos entre pantallas.
-   Formulario de creación.
-   Validación de datos.
-   Conversión de tipos.
-   Creación dun novo `Garden`.
-   Devolución do resultado entre rutas.

Pendente:

-   Estado compartido das hortas.
-   Integración con `Provider`.
-   ViewModel do módulo.
-   Repository.
-   Persistencia mediante SQLite.
-   Inserción real de hortas.
-   Recuperación das hortas almacenadas.
-   Edición de hortas.
-   Eliminación de hortas.
-   Asociación de plantas ás hortas.

**---**

## Sesión 11 - Estado compartido e Provider

### Obxectivos

-   Comprender a diferenza entre estado local e compartido.
-   Introducir Provider.
-   Crear o primeiro ViewModel funcional.
-   Centralizar o estado das hortas.
-   Sincronizar diferentes pantallas.
-   Implementar CRUD en memoria.
-   Introducir identidade estable das entidades.

### Contidos

-   `ChangeNotifier`
-   `notifyListeners()`
-   `ChangeNotifierProvider`
-   `context.read`
-   `context.watch`
-   `context.select`
-   Encapsulación de coleccións
-   `List.unmodifiable`
-   Modelos inmutables
-   `initState`
-   `late final`
-   `widget`
-   Identificadores temporais
-   `getGardenById`
-   CRUD en memoria

### Implementación realizada

Creouse:

``` text
viewmodels/
└── gardens_viewmodel.dart
```

O estado das hortas trasladouse desde `GardensScreen` a
`GardensViewModel`.

Provider configurouse no nivel superior da aplicación para compartir
unha única instancia do ViewModel.

`GardensScreen` deixou de utilizar mock data e pasou a observar a
colección do ViewModel.

`CreateGardenScreen` utiliza o ViewModel para crear hortas.

`DashboardScreen` obtén dinamicamente o número de hortas mediante
`context.select`.

Implementouse `EditGardenScreen` para modificar hortas existentes.

`GardenDetailsScreen` pasou a traballar mediante `gardenId` e obtén a
versión actual da entidade desde o ViewModel.

Implementáronse as operacións:

``` dart
addGarden()
getGardenById()
updateGarden()
removeGarden()
```

### Resultado

Primeiro CRUD completo en memoria de MARTOLA:

``` text
CREATE → CreateGardenScreen
READ   → GardensScreen / GardenDetailsScreen
UPDATE → EditGardenScreen
DELETE → GardenDetailsScreen
```

O estado mantense sincronizado mediante:

``` text
ChangeNotifier
      ↓
notifyListeners()
      ↓
Provider
      ↓
Views
```

### Limitación actual

Os datos non son persistentes.

Ao reiniciar a aplicación:

``` text
_gardens = []
```

A seguinte evolución arquitectónica deberá separar a xestión de estado
do acceso aos datos mediante Repository e posteriormente integrar
SQLite.

**---**

**---**

## Sesión 12 - Repository Pattern e separación do acceso aos datos

### Status

✅ Completed

### Obxectivos

-   Comprender a responsabilidade da capa Repository.
-   Separar a xestión do estado do acceso aos datos.
-   Extraer o almacenamento temporal de `GardensViewModel`.
-   Introducir inxección de dependencias.
-   Reducir o acoplamento entre ViewModel e fonte de datos.
-   Preparar a arquitectura para SQLite.

### Conceptos aprendidos

-   Repository Pattern.
-   Separación de responsabilidades.
-   Abstracción.
-   Clases abstractas.
-   `implements`.
-   Contratos entre capas.
-   Inxección de dependencias.
-   Inversión de dependencias.
-   Dependencia respecto dunha abstracción.
-   Implementacións substituíbles.
-   Punto de composición.
-   Identidade das entidades.
-   Delegación de responsabilidades.

### Evolución arquitectónica

Ao finalizar a sesión 11, o fluxo era:

``` text
Views
  ↓
GardensViewModel
  ↓
List<Garden>
```

`GardensViewModel` era responsable tanto do estado de presentación como
do almacenamento temporal e das operacións sobre os datos.

Durante a sesión 12 introduciuse a capa Repository:

``` text
Views
  ↓
GardensViewModel
  ↓
GardenRepository
  ↑
MemoryGardenRepository
  ↓
List<Garden>
```

Deste modo, o ViewModel deixa de coñecer como se almacenan os datos.

### GardenRepository

Creouse `GardenRepository` como contrato abstracto:

``` dart
abstract class GardenRepository {
  List<Garden> get gardens;

  Garden addGarden(Garden garden);

  Garden? getGardenById(String id);

  Garden? updateGarden(
    String gardenId,
    Garden updatedGarden,
  );

  bool removeGarden(String id);
}
```

Esta clase define que operacións debe proporcionar un Repository de
hortas, pero non determina como deben implementarse.

### MemoryGardenRepository

Creouse:

``` text
repositories/
├── garden_repository.dart
└── memory_garden_repository.dart
```

`MemoryGardenRepository` implementa `GardenRepository` e constitúe a
fonte de datos temporal do módulo.

É responsable actualmente de:

-   Manter a colección `_gardens`.
-   Xerar identificadores temporais.
-   Engadir hortas.
-   Buscar hortas mediante o seu ID.
-   Actualizar hortas.
-   Eliminar hortas.
-   Conservar o identificador dunha horta durante unha actualización.

A colección e o contador deixaron de pertencer a `GardensViewModel`.

### GardensViewModel

`GardensViewModel` recibe agora o Repository mediante o construtor:

``` dart
final GardenRepository repository;

GardensViewModel({
  required this.repository,
});
```

O ViewModel delega nel as operacións relacionadas cos datos:

``` text
GardensViewModel
       ↓
GardenRepository
```

A súa responsabilidade céntrase en:

-   Recibir accións procedentes das Views.
-   Coordinarse coa capa Repository.
-   Expoñer os datos necesarios para a interface.
-   Notificar cambios mediante `notifyListeners()` cando corresponda.

### Inxección de dependencias

`GardensViewModel` non crea internamente un `MemoryGardenRepository`.

A implementación concreta selecciónase desde `main.dart`:

``` text
main.dart
   ↓
MemoryGardenRepository
   ↓
GardensViewModel
   ↓
Provider
   ↓
Views
```

Isto converte `main.dart` no punto de composición actual destas
dependencias.

### Dependencia dunha abstracción

O ViewModel depende de:

``` dart
GardenRepository
```

e non directamente de:

``` dart
MemoryGardenRepository
```

Isto permite utilizar diferentes implementacións mantendo o mesmo
ViewModel:

``` text
                 ┌── MemoryGardenRepository
                 │
GardensViewModel → GardenRepository
                 │
                 └── SQLiteGardenRepository
```

Esta decisión permite:

-   Substituír a implementación en memoria por SQLite.
-   Evitar cambios nas Views ao cambiar a fonte de datos.
-   Reducir o acoplamento.
-   Crear implementacións alternativas.
-   Facilitar futuras probas mediante Repositories específicos para
    testing.

### Actualización mediante identidade

As operacións que modifican unha entidade existente evolucionaron para
utilizar o seu identificador.

Por exemplo:

``` dart
updateGarden(String gardenId, Garden updatedGarden)
```

O Repository:

1.  Localiza a entidade mediante `gardenId`.
2.  Obtén a súa posición.
3.  Constrúe a nova versión.
4.  Conserva o identificador existente.
5.  Substitúe a entidade anterior.

Deste modo a identidade dunha horta non depende da instancia concreta do
obxecto recibida pola interface.

### Resultado

Ao finalizar a sesión existe un CRUD completo en memoria mantendo
separadas as responsabilidades:

``` text
View
 ↓
GardensViewModel
 ↓
GardenRepository
 ↑
MemoryGardenRepository
 ↓
Estado en memoria
```

Comprobouse funcionalmente que:

-   Crear funciona.
-   Consultar funciona.
-   Editar funciona.
-   Eliminar funciona.
-   As Views continúan actualizándose mediante Provider.
-   O Dashboard continúa mostrando o número correcto de hortas.
-   O cambio de arquitectura non require modificar as Views.

### Limitación actual

`MemoryGardenRepository` continúa almacenando os datos exclusivamente en
memoria.

Ao finalizar a aplicación pérdese a colección.

A seguinte implementación prevista será:

``` text
GardenRepository
        ↑
SQLiteGardenRepository
        ↓
DatabaseService
        ↓
SQLite
```

### Seguinte paso

A integración de SQLite introducirá unha nova necesidade: as operacións
de acceso aos datos deixarán de ser exclusivamente síncronas.

Na seguinte sesión estudaranse no contexto real de MARTOLA:

-   `Future`
-   `async`
-   `await`

e analizarase como debe evolucionar o contrato `GardenRepository` para
soportar unha implementación baseada en SQLite.

### Skills Acquired

-   Diferenciar estado de presentación e acceso aos datos.
-   Identificar correctamente a responsabilidade dun Repository.
-   Extraer responsabilidades dun ViewModel.
-   Definir un contrato mediante unha clase abstracta.
-   Implementar un contrato mediante `implements`.
-   Aplicar inxección de dependencias.
-   Depender dunha abstracción en lugar dunha implementación concreta.
-   Deseñar unha arquitectura preparada para substituír a fonte de
    datos.
-   Utilizar identificadores para localizar entidades independentemente
    da instancia do modelo.

### Documentation Updated

-   `DEVELOPMENT_GUIDE.md`
-   `PROJECT_CONTEXT.md`
-   `ARCHITECTURE.md`
-   `ROADMAP.md`
-   `LEARNING_NOTES.md`

### Commit

Pendente ao finalizar a actualización da documentación.

### Notes

A sesión 12 supón a transición desde un ViewModel que tamén almacenaba
os datos cara a unha arquitectura cunha capa de acceso aos datos
claramente separada.

A implementación continúa sendo deliberadamente sinxela e en memoria,
pero a aplicación queda preparada para introducir persistencia real sen
acoplar as Views nin `GardensViewModel` a SQLite.

**---**

## Sesión 13 - Asincronía e persistencia con SQLite

### Status

✅ Completed

### Obxectivos

-   Comprender o funcionamento de `Future`.
-   Introducir `async` e `await`.
-   Adaptar a arquitectura Repository a operacións asíncronas.
-   Preparar `GardensViewModel` para unha fonte de datos persistente.
-   Adaptar as Views ás operacións asíncronas.
-   Introducir a carga inicial de datos.
-   Implementar a infraestrutura SQLite.
-   Implementar `DatabaseService`.
-   Comprender a conversión entre modelos Dart e filas SQLite.
-   Crear `SQLiteGardenRepository`.
-   Implementar o CRUD persistente do módulo de hortas.
-   Integrar SQLite mediante inxección de dependencias.
-   Comprender o versionado e as migracións dunha base de datos.

### Conceptos aprendidos

-   `Future<T>`.
-   `async`.
-   `await`.
-   Operacións asíncronas.
-   Espera dunha operación antes de continuar o fluxo.
-   `context.mounted`.
-   Estado local do ViewModel.
-   Sincronización entre Repository e ViewModel.
-   Carga inicial de datos.
-   Operador de cascada `..`.
-   Separación entre Repository e Database Service.
-   Factorías de base de datos.
-   Detección da plataforma mediante `Platform`.
-   SQLite multiplataforma.
-   Construción de rutas multiplataforma.
-   Getter asíncrono.
-   Operador `??=`.
-   `Map<String, Object?>`.
-   Conversión modelo → fila mediante `toMap()`.
-   Conversión fila → modelo mediante `fromMap()`.
-   `db.query()`.
-   `db.insert()`.
-   `db.update()`.
-   `db.delete()`.
-   `where`.
-   `whereArgs`.
-   `INTEGER PRIMARY KEY AUTOINCREMENT`.
-   Número de filas afectadas por unha operación SQL.
-   Separación entre Repository e infraestrutura de base de datos.
-   Persistencia local real.
-   Versionado do esquema SQLite.
-   Diferenza entre versión da aplicación e versión da base de datos.
-   `version` en `OpenDatabaseOptions`.
-   `onCreate`.
-   `onUpgrade`.
-   `oldVersion`.
-   `newVersion`.
-   Migracións de base de datos.
-   Migracións acumulativas.
-   Evolución do esquema conservando os datos existentes.

### Evolución do GardenRepository

O contrato `GardenRepository` evolucionou para permitir fontes de datos
asíncronas.

As operacións pasan a devolver `Future`:

    abstract class GardenRepository {      
Future\<List`<Garden>`{=html}\> getGardens();

      Future`<Garden>`{=html} addGarden(Garden garden);

      Future\<Garden?\> getGardenById(String id);

      Future\<Garden?\> updateGarden(         String gardenId,        
Garden updatedGarden,       );

      Future`<bool>`{=html} removeGarden(String id);     }

Esta modificación permite que o mesmo contrato poida ser implementado
tanto por un Repository en memoria como por unha futura implementación
SQLite.

### MemoryGardenRepository asíncrono

`MemoryGardenRepository` foi adaptado ao novo contrato.

A implementación continúa utilizando unha colección en memoria, pero os
seus métodos devolven agora `Future`.

Isto permite probar a arquitectura asíncrona antes de introducir SQLite
real.

### Evolución de GardensViewModel

`GardensViewModel` mantén agora unha colección propia que representa o
estado actualmente dispoñible para a interface:

    final List`<Garden>`{=html} \_gardens = \[\];

    List`<Garden>`{=html} get gardens =\>        
List.unmodifiable(\_gardens);

O Repository continúa sendo a fonte de datos, mentres que o ViewModel
mantén o estado preparado para ser consumido polas Views.

O fluxo pasa a ser:

    Fonte de datos           ↓     GardenRepository           ↓ async  
  GardensViewModel           ↓     \_gardens           ↓ sync     Views

Deste modo, o acceso á fonte de datos pode ser asíncrono sen obrigar ás
Views a traballar directamente con `Future`.

### Carga inicial

Engadiuse:

    Future`<void>`{=html} loadGardens() async {       final gardens =
await repository.getGardens();

      \_gardens.clear();       \_gardens.addAll(gardens);

      notifyListeners();     }

A carga inicial execútase ao crear o ViewModel desde Provider:

    GardensViewModel(       repository: MemoryGardenRepository(),    
)..loadGardens()

Isto prepara a aplicación para recuperar automaticamente as hortas
almacenadas cando se introduza SQLite.

### Sincronización do CRUD

As operacións de creación, actualización e eliminación:

1.  Esperan mediante `await` pola resposta do Repository.
2.  Actualizan o estado local de `GardensViewModel`.
3.  Executan `notifyListeners()`.

Isto evita realizar unha segunda carga completa da colección despois de
cada operación.

### Adaptación das Views

`CreateGardenScreen`, `EditGardenScreen` e `GardenDetailsScreen` foron
adaptadas para esperar polas operacións asíncronas.

Patrón empregado:

    await context         .read`<GardensViewModel>`{=html}()        
.addGarden(garden);

    if (!context.mounted) {       return;     }

    Navigator.of(context).pop();

Introduciuse `context.mounted` para comprobar que o contexto continúa
sendo válido despois dunha operación asíncrona antes de utilizalo
novamente.

O mesmo principio foi aplicado aos fluxos de edición e eliminación.

### Consulta síncrona desde as Views

Aínda que o Repository ofrece:

    Future\<Garden?\> getGardenById(String id)

o ViewModel pode consultar sincronamente a súa colección xa cargada:

    Garden? getGardenById(String id) {       for (final garden in
\_gardens) {         if (garden.id == id) {           return garden;    
    }       }

      return null;     }

Isto permite manter chamadas como:

    context.select\<GardensViewModel, Garden?\>(...)

sen expoñer a asincronía da persistencia directamente á interface.

### Preparación de SQLite

Instaláronse as dependencias necesarias para preparar unha solución
SQLite multiplataforma:

    sqflite     sqflite_common_ffi     path     path_provider

A estratexia inicial é:

    Android        ↓     sqflite

    Windows / Linux        ↓     sqflite_common_ffi

### DatabaseService

Implementouse:

    lib/         └── services/             └── database_service.dart

A súa responsabilidade é:

-   Determinar a ruta do ficheiro da base de datos.
-   Abrir a base de datos.
-   Xestionar e reutilizar a conexión.
-   Crear o esquema inicial.
-   Proporcionar acceso á instancia de `Database`.
-   Servir como punto central para futuras versións e migracións.

A conexión obtense mediante un getter asíncrono:

    Future`<Database>`{=html} get database async {       \_database ??=
await \_openDatabase();

      return \_database!;     }

O operador `??=` permite abrir a base de datos unicamente cando
`_database` aínda non contén unha instancia.

Os Repositories son responsables das operacións relacionadas coas súas
entidades, mentres que `DatabaseService` se encarga da infraestrutura
común da base de datos.

A arquitectura actualmente implementada é:

    Views       ↓     GardensViewModel       ↓     GardenRepository    
  ↑     SQLiteGardenRepository       ↓     DatabaseService       ↓    
SQLite

### Soporte multiplataforma

`DatabaseService` seleccionará a factoría de base de datos segundo a
plataforma.

Para Windows e Linux utilizarase:

    sqfliteFfiInit();     databaseFactoryFfi;

mentres que nas plataformas soportadas por `sqflite` poderá utilizarse:

    databaseFactory;

A detección realízase mediante `Platform`.

### Ruta da base de datos

Estudouse o papel de:

    getApplicationDocumentsDirectory()

para obter un directorio apropiado da aplicación e de:

    join()

para construír unha ruta multiplataforma.

O ficheiro previsto será:

    martola.db

### Conversión entre Garden e SQLite

SQLite traballa con filas representadas en Dart mediante mapas.

Para permitir a conversión entre o modelo de dominio e a representación
da base de datos, `Garden` incorpora:

    Garden.fromMap(...)

e:

    toMap()

`fromMap()` constrúe unha instancia de `Garden` a partir dunha fila
recuperada da base de datos.

`toMap()` transforma os atributos dunha instancia de `Garden` nun:

    Map\<String, Object?\>

que pode ser utilizado nas operacións SQLite.

O fluxo é:

    SQLite       ↓     Map\<String, Object?\>       ↓    
Garden.fromMap()       ↓     Garden

e na dirección contraria:

    Garden       ↓     toMap()       ↓     Map\<String, Object?\>      
↓     SQLite

-   Getter asíncrono.
-   Operador `??=`.
-   `Map<String, Object?>`.
-   Conversión modelo → fila mediante `toMap()`.
-   Conversión fila → modelo mediante `fromMap()`.
-   `db.query()`.
-   `db.insert()`.
-   `db.update()`.
-   `db.delete()`.
-   `where`.
-   `whereArgs`.
-   `INTEGER PRIMARY KEY AUTOINCREMENT`.
-   Número de filas afectadas por unha operación SQL.
-   Separación entre Repository e infraestrutura de base de datos.
-   Persistencia local real.

### SQLiteGardenRepository

Creouse:

    repositories/     └── sqlite_garden_repository.dart

`SQLiteGardenRepository` implementa o contrato `GardenRepository`
utilizando SQLite como fonte persistente de datos.

Recibe `DatabaseService` mediante inxección de dependencias:

    SQLiteGardenRepository(       databaseService: databaseService,    
)

As operacións implementadas son:

    getGardens()     addGarden()     updateGarden()     removeGarden()

`getGardens()`:

1.  Obtén a conexión mediante `DatabaseService`.
2.  Consulta a táboa `gardens`.
3.  Recibe unha colección de mapas.
4.  Converte cada mapa nun `Garden` mediante `Garden.fromMap()`.
5.  Devolve unha `List<Garden>`.

`addGarden()`:

1.  Converte o modelo mediante `toMap()`.
2.  Insire a fila na táboa `gardens`.
3.  Obtén o identificador xerado por SQLite.
4.  Constrúe e devolve un novo `Garden` co identificador definitivo.

`updateGarden()`:

1.  Localiza a fila mediante o identificador.
2.  Converte os novos datos mediante `toMap()`.
3.  Executa `db.update()`.
4.  Comproba o número de filas afectadas.
5.  Devolve a versión actualizada da entidade cando a operación ten
    éxito.

`removeGarden()`:

1.  Localiza a fila mediante o identificador.
2.  Executa `db.delete()`.
3.  Comproba o número de filas afectadas.
4.  Devolve se a eliminación tivo éxito.

### Comprobación funcional

Tras integrar SQLite comprobouse que:

-   A aplicación arranca correctamente.
-   `martola.db` créase correctamente.
-   A táboa `gardens` existe.
-   Crear hortas funciona.
-   Consultar hortas funciona.
-   Editar hortas funciona.
-   Eliminar hortas funciona.
-   O estado continúa sincronizado mediante Provider.
-   `loadGardens()` recupera os datos desde SQLite.
-   O Dashboard continúa mostrando o número correcto de hortas.
-   Os identificadores son xerados por SQLite.
-   As hortas permanecen almacenadas despois de pechar e volver abrir a
    aplicación.

A persistencia real do primeiro módulo de MARTOLA queda así verificada.

### Versionado e migracións

A base de datos de MARTOLA utiliza actualmente:

    version: 1

Esta versión identifica o esquema actual da base de datos e é
independente da versión da aplicación.

`onCreate` execútase cando a base de datos aínda non existe e é
responsable de crear o esquema inicial.

Modificar posteriormente o código de `onCreate` non modifica
automaticamente unha base de datos que xa existe.

Cando no futuro sexa necesario modificar o esquema, incrementarase a
versión da base de datos e utilizarase `onUpgrade` para realizar a
migración correspondente.

Conceptualmente:

    Base de datos v1           ↓     aplicación solicita v2           ↓
       onUpgrade           ↓        migración           ↓     Base de
datos v2

`onUpgrade` recibe:

    oldVersion     newVersion

Isto permite determinar que cambios necesita a base de datos existente.

As migracións poderán organizarse de maneira acumulativa:

    if (oldVersion \< 2) {       // cambios introducidos na versión 2  
  }

    if (oldVersion \< 3) {       // cambios introducidos na versión 3  
  }

Deste modo unha base de datos antiga pode actualizarse directamente a
unha versión posterior aplicando todos os cambios que lle falten.

Por exemplo:

    oldVersion = 2     newVersion = 4

executaría os cambios correspondentes a:

    oldVersion \< 3     oldVersion \< 4

pero non os correspondentes a:

    oldVersion \< 2

Actualmente non se implementou `onUpgrade` porque MARTOLA continúa
utilizando o esquema v1.

Non se creará unha versión 2 artificialmente. A primeira migración
implementarase cando exista un cambio real no esquema que deba aplicarse
conservando os datos existentes.

### Estado final

A Session 13 queda completada.

Durante esta sesión MARTOLA realizou a transición desde unha fonte de
datos temporal en memoria cara á primeira persistencia SQLite real.

O fluxo final é:

    View       ↓     GardensViewModel       ↓     GardenRepository      
↑     SQLiteGardenRepository       ↓     DatabaseService       ↓    
SQLite       ↓     martola.db

O módulo de hortas dispón dun CRUD persistente completo:

    CREATE → addGarden()     READ   → getGardens()     READ   →
getGardenById()     UPDATE → updateGarden()     DELETE → removeGarden()

Comprobouse manualmente que:

-   A aplicación arranca correctamente.
-   `martola.db` se crea e abre correctamente.
-   A táboa `gardens` funciona.
-   As hortas poden crearse.
-   As hortas poden recuperarse.
-   As hortas poden editarse.
-   As hortas poden eliminarse.
-   Os identificadores son xerados por SQLite.
-   Os datos permanecen despois de pechar e volver abrir MARTOLA.

A arquitectura Repository permitiu substituír:

    MemoryGardenRepository

por:

    SQLiteGardenRepository

sen modificar as Views nin acoplar `GardensViewModel` a SQLite.

Tamén se comprenderon os mecanismos necesarios para a futura evolución
do esquema:

-   Versionado.
-   `onCreate`.
-   `onUpgrade`.
-   Migracións.
-   Migracións acumulativas.

A base de datos permanece correctamente na versión 1 ata que exista un
cambio real de esquema.

### Seguinte paso

A seguinte sesión partirá dunha infraestrutura SQLite xa funcional e
persistente.

O seguinte obxectivo de desenvolvemento determinarase revisando o
roadmap de MARTOLA.

Calquera futura modificación do esquema SQLite deberá considerar:

1.  A versión actual da base de datos.
2.  O novo esquema necesario.
3.  A actualización de `onCreate` para instalacións novas.
4.  A migración necesaria en `onUpgrade` para instalacións existentes.
5.  A conservación dos datos xa almacenados.

### Documentation Updated

-   `LEARNING_NOTES.md`
-   `ARCHITECTURE.md`
-   `DATABASE_DESIGN.md`
-   `ROADMAP.md`
-   `PROJECT_CONTEXT.md`
-   `DEVELOPMENT_GUIDE.md`

A documentación queda sincronizada co estado final da Session 13.

### Commit

Complete SQLite persistence foundation

### Notes

A Session 13 supón a transición definitiva desde unha fonte de datos
temporal en memoria cara á primeira persistencia real de MARTOLA.

A arquitectura preparada nas sesións anteriores permitiu substituír
`MemoryGardenRepository` por `SQLiteGardenRepository` sen modificar as
Views e mantendo `GardensViewModel` desacoplado da tecnoloxía de
persistencia.

A implementación confirma na práctica a utilidade do Repository Pattern,
a inxección de dependencias e a separación entre estado de presentación
e acceso aos datos.

Antes de pechar a sesión queda pendente introducir o versionado e as
migracións necesarias para permitir que o esquema SQLite evolucione de
forma segura.

**---**

**---**

## Sesión 14 - Modelo relacional e preparación do módulo de plantas

### Status

✅ Completed

### Obxectivos

-   Evolucionar o esquema SQLite para incorporar o módulo de plantas.
-   Aplicar por primeira vez unha migración real.
-   Comprender e implementar relacións mediante claves foráneas.
-   Diferenciar unha especie dunha planta concreta.
-   Crear os modelos de dominio necesarios.
-   Preparar os contratos Repository do módulo de plantas.
-   Verificar o comportamento da integridade referencial.

### Conceptos aprendidos

-   Relación 1:N.
-   Clave primaria.
-   Clave foránea.
-   Integridade referencial.
-   `PRAGMA foreign_keys = ON`.
-   `ON DELETE CASCADE`.
-   `ON DELETE RESTRICT`.
-   Migración real de esquema.
-   Evolución SQLite v1 → v2.
-   Orde de creación das táboas relacionadas.
-   Separación entre modelo de dominio e representación SQLite.
-   Conversión de identificadores entre `String` e `INTEGER`.
-   Representación de `DateTime` mediante ISO 8601.
-   Separación de responsabilidades entre Repositories.

### Evolución do modelo de datos

Introducíronse dúas novas entidades:

    PlantSpecies     GardenPlant

`PlantSpecies` representa información compartida dunha especie vexetal.

`GardenPlant` representa unha planta concreta pertencente a unha horta.

A relación conceptual é:

    Garden       1       │       N     GardenPlant       N       │      
1     PlantSpecies

Isto permite que varias plantas concretas compartan unha mesma especie
sen duplicar a información da especie.

### Modelo GardenPlant

Creouse o modelo:

``` dart
class GardenPlant {
  final String? id;
  final String gardenId;
  final String speciesId;
  final String customName;
  final DateTime plantingDate;

  const GardenPlant({
    this.id,
    required this.gardenId,
    required this.speciesId,
    required this.customName,
    required this.plantingDate,
  });
}
```

O modelo utiliza `String` para os identificadores do dominio, mantendo
coherencia co modelo `Garden`.

Na fronteira con SQLite, os identificadores utilizados como claves
foráneas convértense a `INTEGER`:

``` dart
'garden_id': int.parse(gardenId),
'species_id': int.parse(speciesId),
```

Na dirección contraria, os identificadores recuperados desde SQLite
convértense novamente a `String`.

`plantingDate` represéntase no dominio mediante `DateTime` e almacénase
en SQLite como `TEXT` utilizando:

``` dart
plantingDate.toIso8601String()
```

### Modelo PlantSpecies

Creouse o modelo:

``` dart
class PlantSpecies {
  final String? id;
  final String commonName;
  final String scientificName;

  const PlantSpecies({
    this.id,
    required this.commonName,
    required this.scientificName,
  });
}
```

Tamén se implementaron:

``` dart
PlantSpecies.fromMap(...)
```

e:

``` dart
toMap()
```

para realizar a conversión entre o modelo de dominio e as filas SQLite.

### Evolución da base de datos

A base de datos evolucionou:

    version 1         ↓     version 2

Esta é a primeira migración real do proxecto.

O esquema actual incorpora:

    gardens     plant_species     garden_plants

Para instalacións novas, `onCreate` crea directamente o esquema completo
correspondente á versión actual.

Para bases de datos existentes, `onUpgrade` realiza a migración
necesaria conservando os datos xa almacenados.

### Táboa plant_species

Creouse:

``` sql
CREATE TABLE plant_species (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  common_name TEXT NOT NULL,
  scientific_name TEXT NOT NULL
)
```

### Táboa garden_plants

Creouse unha táboa relacionada con `gardens` e `plant_species`.

As relacións utilizan claves foráneas.

A relación coa horta utiliza:

``` sql
ON DELETE CASCADE
```

Isto significa que ao eliminar unha horta tamén se eliminan
automaticamente as plantas concretas que pertencen a ela.

A relación coa especie utiliza:

``` sql
ON DELETE RESTRICT
```

Isto impide eliminar unha especie mentres exista algunha planta que a
estea utilizando.

### Activación das claves foráneas

Engadiuse a configuración:

``` dart
onConfigure: (db) async {
  await db.execute('PRAGMA foreign_keys = ON');
},
```

Esta configuración é necesaria para que SQLite aplique as restricións
definidas mediante claves foráneas.

### Comprobación de ON DELETE CASCADE

Realizouse unha proba controlada creando datos temporais.

Resultado:

``` text
Plantas antes de eliminar a horta: 1
Plantas despois de eliminar a horta: 0
Proba finalizada. Datos temporais revertidos.
```

Confirmouse que eliminar unha horta elimina automaticamente as plantas
asociadas.

O código temporal da proba foi eliminado posteriormente.

### Comprobación de ON DELETE RESTRICT

Realizouse tamén unha proba controlada intentando eliminar unha especie
utilizada por unha planta.

Resultado:

``` text
Correcto: SQLite impediu eliminar a especie en uso
A especie segue existindo: true
Proba finalizada. Datos temporais revertidos.
```

Confirmouse que SQLite impide eliminar unha especie referenciada por
unha planta.

O código temporal da proba foi eliminado posteriormente.

### Repositories do módulo de plantas

Creouse:

``` dart
abstract class GardenPlantRepository
```

coas operacións:

``` text
getPlantsByGardenId()
addPlant()
getPlantById()
updatePlant()
removePlant()
```

A consulta principal utiliza:

``` dart
getPlantsByGardenId(gardenId)
```

porque as plantas concretas teñen sentido principalmente dentro do
contexto dunha horta.

Tamén se creou:

``` dart
abstract class PlantSpeciesRepository
```

coas operacións necesarias para consultar e xestionar o catálogo de
especies.

Decidiuse manter `GardenPlantRepository` e `PlantSpeciesRepository`
separados porque representan responsabilidades distintas.

### Arquitectura preparada

O módulo de plantas queda preparado actualmente ata a capa de contratos:

    Views       ↓     ViewModel       ↓     Repository       ↑    
SQLite Repository       ↓     DatabaseService       ↓     SQLite

No módulo de hortas este fluxo xa está implementado completamente.

No módulo de plantas están preparados:

    GardenPlant     PlantSpecies     GardenPlantRepository    
PlantSpeciesRepository

e están pendentes as implementacións SQLite.

### Skills Acquired

-   Deseñar relacións entre entidades do dominio.
-   Diferenciar unha especie dunha instancia concreta dunha planta.
-   Implementar claves foráneas en SQLite.
-   Comprender a necesidade de activar explicitamente a integridade
    referencial.
-   Escoller o comportamento adecuado ao eliminar entidades
    relacionadas.
-   Aplicar `CASCADE` e `RESTRICT`.
-   Realizar unha migración real conservando datos existentes.
-   Manter separados os tipos do dominio e os tipos utilizados pola
    persistencia.
-   Deseñar contratos Repository antes das súas implementacións.
-   Separar Repositories segundo a responsabilidade da entidade.

### Documentation Updated

-   `DATABASE_DESIGN.md`
-   `ARCHITECTURE.md`
-   `LEARNING_NOTES.md`
-   `ROADMAP.md`
-   `PROJECT_CONTEXT.md`
-   `DEVELOPMENT_GUIDE.md`

### Next Step

A Session 15 comezará implementando:

    SQLitePlantSpeciesRepository

A idea será reutilizar o coñecemento adquirido con:

    SQLiteGardenRepository

pero sen copiar mecanicamente a implementación.

Construiremos progresivamente as operacións do novo Repository
comprendendo que parte é común ao patrón e que parte depende
especificamente de `PlantSpecies`.

Unha vez completado e probado:

    SQLitePlantSpeciesRepository

continuaremos con:

    SQLiteGardenPlantRepository

### Commit

Pendente ao finalizar a actualización da documentación.

### Notes

A Session 14 supón a primeira evolución real do esquema SQLite de
MARTOLA.

Por primeira vez a base de datos deixa de conter unha única entidade
independente e pasa a representar relacións reais entre entidades do
dominio.

A infraestrutura queda preparada para iniciar a persistencia funcional
do módulo de plantas durante a seguinte sesión.

------------------------------------------------------------------------

## Sesión 15 - Persistencia, estado e CRUD completo do módulo de plantas

### Status

✅ Completed

### Obxectivos

-   Implementar `SQLitePlantSpeciesRepository`.
-   Implementar `SQLiteGardenPlantRepository`.
-   Integrar os novos Repositories mediante inxección de dependencias.
-   Crear os ViewModels de especies e plantas.
-   Comprender como manter no ViewModel un subconxunto contextual dos
    datos.
-   Integrar os tres ViewModels mediante `MultiProvider`.
-   Crear o fluxo de consulta e xestión das plantas dunha horta.
-   Implementar formularios de creación e edición de plantas.
-   Relacionar unha planta concreta coa súa especie.
-   Completar o CRUD funcional e persistente do módulo de plantas.

### Conceptos aprendidos e practicados

-   Reutilización dun patrón Repository xa coñecido sen copiar
    mecanicamente.
-   `indexWhere()`.
-   `removeWhere()`.
-   Consulta síncrona sobre o estado xa cargado.
-   Separación entre fonte persistente e estado do ViewModel.
-   Estado contextual mediante `_currentGardenId`.
-   `MultiProvider`.
-   Varios `ChangeNotifierProvider`.
-   `context.read()`.
-   `context.watch()`.
-   `context.select()`.
-   `initState()` para iniciar a carga asociada a unha pantalla.
-   Paso de identificadores entre pantallas.
-   Resolución de relacións entre modelos mediante IDs.
-   `DropdownButtonFormField`.
-   `showDatePicker`.
-   `TextEditingController` inicializado a partir dun modelo existente.
-   `late final`.
-   Validación de formularios.
-   Actualización reactiva mediante `notifyListeners()`.
-   Confirmación previa á eliminación.
-   Seed de datos iniciais en SQLite.

### SQLitePlantSpeciesRepository

Implementouse:

``` text
PlantSpeciesRepository
          ↑
SQLitePlantSpeciesRepository
          ↓
DatabaseService
          ↓
SQLite
```

O Repository implementa as operacións necesarias sobre `plant_species`:

``` text
getSpecies()
addSpecies()
getSpeciesById()
updateSpecies()
removeSpecies()
```

As operacións seguen o mesmo contrato arquitectónico empregado
previamente no módulo de hortas.

A implementación converte as filas SQLite en `PlantSpecies` mediante
`fromMap()` e os modelos en mapas mediante `toMap()`.

### SQLiteGardenPlantRepository

Implementouse:

``` text
GardenPlantRepository
          ↑
SQLiteGardenPlantRepository
          ↓
DatabaseService
          ↓
SQLite
```

As operacións implementadas son:

``` text
getPlantsByGardenId()
addPlant()
getPlantById()
updatePlant()
removePlant()
```

A consulta principal utiliza `gardenId`:

``` dart
getPlantsByGardenId(gardenId)
```

porque o estado de plantas da interface está contextualizado pola horta
seleccionada.

### PlantSpeciesViewModel

Creouse:

``` text
viewmodels/
└── plant_species_viewmodel.dart
```

Mantén:

``` dart
final List<PlantSpecies> _species = [];
```

e expón a colección mediante:

``` dart
List.unmodifiable(_species)
```

As operacións principais son:

``` text
loadSpecies()
addSpecies()
getSpeciesById()
updateSpecies()
removeSpecies()
```

`getSpeciesById()` consulta directamente a colección xa cargada,
evitando realizar unha consulta asíncrona ao Repository cada vez que
unha View necesita resolver unha especie.

Para actualizacións utilízase `indexWhere()` para localizar a posición
da entidade polo seu identificador.

Para eliminacións utilízase `removeWhere()`.

### PlantsViewModel

Creouse:

``` text
viewmodels/
└── plants_viewmodel.dart
```

Mantén:

``` dart
String? _currentGardenId;
final List<GardenPlant> _plants = [];
```

A decisión de conservar `_currentGardenId` permite que o ViewModel saiba
a que horta pertence o estado actualmente cargado.

`loadPlants(gardenId)`:

1.  Garda o identificador da horta activa.
2.  Solicita ao Repository unicamente as plantas desa horta.
3.  Baleira `_plants`.
4.  Engade a colección recuperada.
5.  Executa `notifyListeners()`.

Conceptualmente:

``` text
Garden seleccionada
        ↓
loadPlants(gardenId)
        ↓
_currentGardenId
        ↓
GardenPlantRepository
        ↓
plantas desa horta
        ↓
_plants
```

Isto evita acumular nunha mesma colección as plantas de diferentes
hortas.

As operacións implementadas son:

``` text
loadPlants()
addPlant()
getPlantById()
updatePlant()
removePlant()
```

### MultiProvider

`main.dart` evolucionou para proporcionar os tres ViewModels:

``` text
MultiProvider
    ├── GardensViewModel
    ├── PlantSpeciesViewModel
    └── PlantsViewModel
```

As dependencias créanse previamente no punto de composición:

``` text
DatabaseService
    ├── SQLiteGardenRepository
    ├── SQLitePlantSpeciesRepository
    └── SQLiteGardenPlantRepository
```

`GardensViewModel` realiza a carga inicial das hortas.

`PlantSpeciesViewModel` realiza a carga inicial do catálogo de especies.

`PlantsViewModel` carga as plantas cando existe o contexto dunha horta
concreta.

Comprobouse durante a execución que os tres Providers estaban
dispoñibles correctamente.

### Integración co detalle da horta

`GardenDetailsScreen` evolucionou a `StatefulWidget`.

En `initState()` execútase:

``` dart
context.read<PlantsViewModel>().loadPlants(widget.gardenId);
```

Deste modo, ao entrar no detalle dunha horta, `PlantsViewModel` carga as
plantas correspondentes.

A pantalla pode observar a colección para mostrar o número de plantas e
navegar posteriormente ao listado.

### PlantListScreen

Creouse unha pantalla separada para mostrar as plantas da horta.

A pantalla observa:

``` dart
context.watch<PlantsViewModel>()
```

e utiliza a colección:

``` dart
plants
```

Cando non existen plantas mostra un estado baleiro.

Cando existen, represéntanse mediante unha lista.

Mantívose o patrón visual empregado no listado de hortas para conservar
coherencia entre módulos.

### AddPlantScreen

Creouse un formulario para rexistrar unha planta concreta.

O formulario permite introducir:

-   Nome personalizado.
-   Especie.
-   Data de plantación.

A especie selecciónase desde o catálogo cargado por
`PlantSpeciesViewModel` mediante:

``` dart
DropdownButtonFormField<String>
```

A data selecciónase mediante:

``` dart
showDatePicker()
```

Ao gardar, a pantalla chama:

``` dart
PlantsViewModel.addPlant(...)
```

Non necesita recibir directamente `gardenId`, xa que `PlantsViewModel`
conserva a horta activa en `_currentGardenId`.

### Seed inicial de especies

Para poder utilizar o selector de especies sen crear manualmente cada
rexistro, engadiuse un pequeno catálogo inicial.

Actualmente inclúe:

``` text
Tomate   — Solanum lycopersicum
Leituga  — Lactuca sativa
Pemento  — Capsicum annuum
Cenoria  — Daucus carota
Amorodo  — Fragaria × ananassa
Alfábega — Ocimum basilicum
```

Antes da inserción compróbase:

``` sql
SELECT COUNT(*) AS count FROM plant_species
```

Se a táboa xa contén datos, o seed non se executa.

Deste modo os rexistros iniciais non se duplican en cada arranque.

### PlantDetailsScreen

Creouse a pantalla de detalle dunha planta.

Recibe:

``` dart
plantId
```

e consulta a versión actual da entidade mediante:

``` dart
PlantsViewModel.getPlantById(plantId)
```

A especie non se mostra mediante o identificador.

A pantalla resolve:

``` text
GardenPlant.speciesId
        ↓
PlantSpeciesViewModel
        ↓
getSpeciesById()
        ↓
PlantSpecies.commonName
```

Deste modo mantense a relación entre entidades mediante IDs, pero a
interface presenta información comprensible para o usuario.

### EditPlantScreen

Creouse a pantalla de edición reutilizando o patrón aprendido nos
formularios anteriores.

O estado inicial obtense desde a planta recibida:

``` dart
_customNameController =
    TextEditingController(text: widget.plant.customName);

_selectedSpeciesId = widget.plant.speciesId;

_plantingDate = widget.plant.plantingDate;
```

Ao gardar execútase:

``` dart
PlantsViewModel.updatePlant(...)
```

O Repository actualiza SQLite e o ViewModel substitúe a versión
correspondente dentro de `_plants`.

`notifyListeners()` provoca a actualización das pantallas que observan
ese estado.

### Eliminación de plantas

Implementouse a eliminación mediante:

``` dart
PlantsViewModel.removePlant(id)
```

O fluxo é:

``` text
View
  ↓
PlantsViewModel
  ↓
GardenPlantRepository
  ↓
SQLite
  ↓
resultado
  ↓
_plants.removeWhere(...)
  ↓
notifyListeners()
```

A interface solicita confirmación antes de executar a eliminación.

### Fluxo funcional completado

Ao finalizar a sesión, o fluxo principal de plantas é:

``` text
GardenDetailsScreen
        ↓
PlantListScreen
    ├── AddPlantScreen
    │       ↓
    │   crear planta
    │
    └── PlantDetailsScreen
            ├── EditPlantScreen
            │       ↓
            │   editar planta
            │
            └── eliminar planta
```

O módulo queda conectado coa arquitectura:

``` text
Views
  ↓
PlantsViewModel / PlantSpeciesViewModel
  ↓
GardenPlantRepository / PlantSpeciesRepository
  ↑
SQLiteGardenPlantRepository / SQLitePlantSpeciesRepository
  ↓
DatabaseService
  ↓
SQLite
```

### Comprobación funcional

Comprobouse manualmente que:

-   Os tres ViewModels están dispoñibles mediante Provider.
-   As especies aparecen correctamente no selector.
-   O seed non necesita introducirse manualmente.
-   As plantas poden crearse.
-   As plantas quedan gardadas en SQLite.
-   O listado mostra as plantas da horta actual.
-   O detalle mostra correctamente a planta seleccionada.
-   O nome da especie se resolve desde `speciesId`.
-   A edición funciona.
-   A eliminación funciona.
-   As Views se actualizan automaticamente.
-   O estado dunha horta non acumula plantas doutras hortas.
-   O CRUD completo de plantas funciona correctamente.

### Skills Acquired

-   Implementar un novo Repository reutilizando un patrón arquitectónico
    coñecido.
-   Manter sincronizados Repository e estado observable.
-   Utilizar `indexWhere()` e `removeWhere()` segundo a operación
    necesaria.
-   Contextualizar o estado dun ViewModel mediante un identificador.
-   Coordinar varios ViewModels nunha mesma funcionalidade.
-   Configurar varios Providers mediante `MultiProvider`.
-   Cargar datos no ciclo de vida dunha pantalla.
-   Construír formularios de creación e edición relacionados con outras
    entidades.
-   Resolver relacións entre modelos mediante identificadores.
-   Diferenciar datos persistentes, estado compartido e estado local da
    interface.
-   Completar un CRUD persistente mantendo separadas as capas da
    aplicación.

### Documentation Updated

-   `PROJECT_CONTEXT.md`
-   `ROADMAP.md`
-   `ARCHITECTURE.md`
-   `DATABASE_DESIGN.md`
-   `DEVELOPMENT_GUIDE.md`

### Next Step

Revisar o roadmap actualizado e decidir o seguinte bloque funcional do
MVP.

A seguinte sesión partirá dun módulo de hortas e dun módulo de plantas
xa persistentes e funcionais.

Non se engadirá unha nova capa ou funcionalidade ata decidir que parte
do roadmap achega máis valor ao MVP.

### Commit

Pendente ao finalizar a actualización da documentación.

### Notes

A Session 15 completa a primeira funcionalidade relacional de MARTOLA de
extremo a extremo.

A aplicación xa non só persiste entidades independentes. Agora unha
horta pode cargar e xestionar as súas propias plantas, cada planta
referencia unha especie e a interface resolve esas relacións sen
acoplarse directamente a SQLite.

## O patrón aprendido inicialmente co módulo de hortas foi reutilizado para especies e plantas, confirmando que a arquitectura pode crecer mantendo as responsabilidades separadas.

## Sesión 16 - Seguemento da evolución das plantas

### Status

✅ Completed

### Obxectivos

-   Implementar o módulo de seguemento da evolución dunha planta.
-   Crear o modelo `PlantEvolutionRecord`.
-   Evolucionar o esquema SQLite da versión 2 á versión 3.
-   Crear a táboa `plant_evolution_records`.
-   Relacionar os rexistros de evolución cunha planta concreta.
-   Implementar o contrato `PlantEvolutionRecordRepository`.
-   Implementar `SQLitePlantEvolutionRecordRepository`.
-   Crear `PlantEvolutionViewModel`.
-   Integrar o cuarto ViewModel mediante `MultiProvider`.
-   Aplicar estado contextual mediante `_currentPlantId`.
-   Implementar o CRUD completo dos rexistros de evolución.
-   Integrar o novo fluxo coa navegación existente.
-   Verificar a migración conservando os datos das versións anteriores.

### Conceptos aprendidos e practicados

-   Evolución incremental dunha arquitectura xa existente.
-   Reutilización do Repository Pattern nun novo nivel relacional.
-   Relación 1:N entre planta e rexistros de evolución.
-   Nova migración SQLite v2 → v3.
-   Migracións acumulativas.
-   `ON DELETE CASCADE` nunha relación dependente.
-   Persistencia de valores opcionais mediante `NULL`.
-   Conversión de `DateTime` a texto ISO 8601.
-   Estado contextual mediante `_currentPlantId`.
-   Consulta síncrona sobre estado previamente cargado.
-   Navegación por identificadores.
-   Integración dun novo `ChangeNotifierProvider`.
-   Reutilización de patróns de creación, detalle, edición e
    eliminación.

### Modelo PlantEvolutionRecord

Creouse:

``` text
models/
└── plant_evolution_record.dart
```

`PlantEvolutionRecord` representa unha observación da evolución dunha
planta concreta ao longo do tempo.

O modelo inclúe a identidade do rexistro, a referencia á planta, a data
da observación e os datos rexistrados durante o seguemento.

Os campos que non son obrigatorios poden representarse como valores
nullable no dominio e como `NULL` en SQLite.

O modelo incorpora:

``` text
toMap()
fromMap()
```

para converter entre a representación de dominio e a fila persistida.

### Evolución do esquema SQLite

A base de datos evolucionou desde:

``` text
version: 2
```

a:

``` text
version: 3
```

Engadiuse a táboa:

``` text
plant_evolution_records
```

A relación principal é:

``` text
garden_plants
      1
      ↓
      N
plant_evolution_records
```

A clave foránea referencia a planta mediante:

``` text
plant_id
```

e utiliza:

``` text
ON DELETE CASCADE
```

Deste modo, ao eliminar unha planta elimínanse tamén os seus rexistros
de evolución.

### Migración v2 → v3

Actualizouse `onCreate()` para que unha instalación nova cree
directamente todo o esquema actual.

Tamén se incorporou a migración acumulativa correspondente:

``` text
if (oldVersion < 3)
    ↓
crear plant_evolution_records
```

A estratexia continúa permitindo que unha base antiga aplique todas as
migracións que lle falten.

Comprobouse que a migración:

``` text
v2 → v3
```

conserva as hortas, especies e plantas existentes.

### PlantEvolutionRecordRepository

Creouse o contrato:

``` text
PlantEvolutionRecordRepository
```

coas operacións necesarias para o módulo:

``` text
getRecordsByPlantId()
addRecord()
getRecordById()
updateRecord()
removeRecord()
```

A consulta principal está contextualizada pola planta:

``` text
getRecordsByPlantId(plantId)
```

porque cada listado de evolución representa o histórico dunha única
planta.

### SQLitePlantEvolutionRecordRepository

Creouse:

``` text
SQLitePlantEvolutionRecordRepository
```

que implementa:

``` text
PlantEvolutionRecordRepository
```

e utiliza:

``` text
DatabaseService
```

como infraestrutura común de acceso a SQLite.

O fluxo é:

``` text
PlantEvolutionRecordRepository
              ↑
SQLitePlantEvolutionRecordRepository
              ↓
DatabaseService
              ↓
SQLite
```

As operacións realizan a conversión entre modelos e filas mediante
`toMap()` e `fromMap()`.

### PlantEvolutionViewModel

Creouse:

``` text
viewmodels/
└── plant_evolution_viewmodel.dart
```

Mantén:

``` dart
String? _currentPlantId;
final List<PlantEvolutionRecord> _records = [];
```

`_currentPlantId` identifica a planta cuxo histórico está actualmente
cargado.

O patrón é equivalente ao empregado anteriormente en `PlantsViewModel`
con `_currentGardenId`.

As operacións principais son:

``` text
loadRecords(plantId)
addRecord()
getRecordById()
updateRecord()
removeRecord()
```

`loadRecords(plantId)`:

1.  Garda o identificador da planta activa.
2.  Solicita ao Repository os rexistros desa planta.
3.  Baleira a colección anterior.
4.  Engade os rexistros recuperados.
5.  Executa `notifyListeners()`.

Conceptualmente:

``` text
Plant seleccionada
        ↓
loadRecords(plantId)
        ↓
_currentPlantId
        ↓
PlantEvolutionRecordRepository
        ↓
rexistros desa planta
        ↓
_records
```

Isto evita mesturar nunha mesma colección os históricos de diferentes
plantas.

### Integración mediante MultiProvider

`main.dart` evolucionou para proporcionar catro ViewModels:

``` text
MultiProvider
├── GardensViewModel
├── PlantSpeciesViewModel
├── PlantsViewModel
└── PlantEvolutionViewModel
```

As dependencias SQLite compóñense previamente:

``` text
DatabaseService
├── SQLiteGardenRepository
├── SQLitePlantSpeciesRepository
├── SQLiteGardenPlantRepository
└── SQLitePlantEvolutionRecordRepository
```

`PlantEvolutionViewModel` recibe o seu Repository mediante inxección de
dependencias.

### Fluxo de navegación

O módulo de evolución intégrase desde o detalle dunha planta.

Fluxo principal:

``` text
PlantDetailsScreen
        ↓
PlantEvolutionListScreen
        ├── AddPlantEvolutionRecordScreen
        │       ↓
        │   crear rexistro
        │
        └── PlantEvolutionDetailsScreen
                ├── EditPlantEvolutionRecordScreen
                │       ↓
                │   editar rexistro
                │
                └── eliminar rexistro
```

As pantallas de detalle traballan mediante identificadores, seguindo o
patrón xa empregado con hortas e plantas.

### PlantEvolutionListScreen

A pantalla establece o contexto da planta e carga os seus rexistros.

A carga realízase fóra de `build()` para evitar iniciar repetidamente a
mesma operación durante as reconstrucións da interface.

A colección observable procede de:

``` text
PlantEvolutionViewModel.records
```

Cando non existen rexistros móstrase un estado baleiro.

Cando existen, represéntanse como histórico da planta seleccionada.

### Creación dun rexistro

`AddPlantEvolutionRecordScreen` permite introducir os datos dunha nova
observación.

O formulario mantén localmente os valores temporais da interface e
delega a operación persistente en:

``` text
PlantEvolutionViewModel.addRecord(...)
```

O ViewModel utiliza `_currentPlantId` para asociar o rexistro coa planta
activa.

### Consulta dun rexistro

`PlantEvolutionDetailsScreen` recibe:

``` text
recordId
```

e obtén a versión actual mediante:

``` text
PlantEvolutionViewModel.getRecordById(recordId)
```

Deste modo a pantalla non conserva unha copia independente que poida
quedar desactualizada despois dunha edición.

### Edición dun rexistro

`EditPlantEvolutionRecordScreen` inicializa o formulario cos valores
existentes.

Ao gardar:

``` text
View
  ↓
PlantEvolutionViewModel.updateRecord(...)
  ↓
PlantEvolutionRecordRepository
  ↓
SQLite
  ↓
_records
  ↓
notifyListeners()
```

A interface actualízase a partir do estado compartido.

### Eliminación dun rexistro

A eliminación require confirmación previa.

O fluxo é:

``` text
PlantEvolutionDetailsScreen
        ↓
PlantEvolutionViewModel.removeRecord(id)
        ↓
PlantEvolutionRecordRepository
        ↓
SQLite
        ↓
_records.removeWhere(...)
        ↓
notifyListeners()
```

### Fluxo relacional alcanzado

Ao finalizar a sesión MARTOLA xa soporta:

``` text
Garden
  ↓
GardenPlant
  ↓
PlantEvolutionRecord
```

e cada planta mantén ademais a relación:

``` text
PlantSpecies
  ↓
GardenPlant
```

A aplicación dispón así dun fluxo relacional persistente de varios
niveis.

### Arquitectura final do módulo

``` text
Views
  ↓
PlantEvolutionViewModel
  ↓
PlantEvolutionRecordRepository
  ↑
SQLitePlantEvolutionRecordRepository
  ↓
DatabaseService
  ↓
SQLite
```

O novo módulo reutiliza a mesma arquitectura que os módulos anteriores
sen introducir acceso SQL nas Views nin no ViewModel.

### Comprobación funcional

Comprobouse que:

-   A base de datos actualiza correctamente de v2 a v3.
-   Os datos existentes permanecen despois da migración.
-   A táboa `plant_evolution_records` créase correctamente.
-   Os rexistros poden crearse.
-   Os rexistros quedan persistidos en SQLite.
-   O histórico se carga para a planta correspondente.
-   Os rexistros poden consultarse.
-   Os rexistros poden editarse.
-   Os rexistros poden eliminarse.
-   As Views se actualizan mediante Provider.
-   O estado non acumula rexistros doutras plantas.
-   A eliminación dunha planta elimina os seus rexistros asociados
    mediante `ON DELETE CASCADE`.
-   O CRUD completo do módulo de evolución funciona mantendo separadas
    as capas.

### Skills Acquired

-   Estender unha arquitectura existente cun novo módulo relacional.
-   Deseñar un Repository contextualizado por unha entidade pai.
-   Aplicar novamente o patrón de estado contextual nun ViewModel.
-   Implementar unha segunda migración real de SQLite.
-   Manter migracións acumulativas.
-   Utilizar `CASCADE` para datos dependentes.
-   Integrar un novo ViewModel nun `MultiProvider`.
-   Construír un CRUD completo reutilizando patróns xa comprendidos.
-   Manter sincronizados persistencia, estado compartido e interface.
-   Navegar mediante identificadores para evitar copias desactualizadas
    das entidades.

### Documentation Updated

-   `PROJECT_CONTEXT.md`
-   `ARCHITECTURE.md`
-   `DATABASE_DESIGN.md`
-   `DEVELOPMENT_GUIDE.md`

`ROADMAP.md` queda como seguinte documento a revisar para decidir o
próximo bloque funcional.

### Next Step

Revisar `ROADMAP.md` e seleccionar o seguinte bloque do MVP.

A decisión deberá ter en conta:

-   valor funcional para MARTOLA;
-   dependencias técnicas;
-   tempo dispoñible;
-   contido necesario para o TFC;
-   necesidade de reservar tempo para probas e documentación final.

### Commit

Pendente ao finalizar a actualización da documentación.

### Notes

A Session 16 completa o módulo de seguemento da evolución das plantas e
engade un novo nivel á estrutura relacional de MARTOLA.

O patrón arquitectónico utilizado inicialmente para hortas e
posteriormente para plantas volve reutilizarse sen introducir novas
capas innecesarias.

A aplicación dispón agora dunha base local v3 capaz de representar
hortas, especies, plantas concretas e o histórico de evolución de cada
planta, mantendo a separación entre Views, ViewModels, Repositories e
infraestrutura SQLite.

------------------------------------------------------------------------

## Sesión 17 - Integración meteorolóxica básica mediante API REST

### Status

✅ Completed

### Obxectivos

-   Introducir o consumo dunha API REST real desde Flutter.
-   Comprender a estrutura dunha resposta JSON.
-   Utilizar o paquete `http`.
-   Crear un modelo de dominio para os datos meteorolóxicos.
-   Separar a comunicación HTTP da capa Repository.
-   Integrar a meteoroloxía coa arquitectura MVVM xa existente.
-   Xestionar carga, éxito e erro desde o ViewModel.
-   Mostrar datos meteorolóxicos reais no Dashboard.
-   Evitar incluír a API key directamente no código fonte.
-   Preparar a arquitectura para poder incorporar no futuro outro
    provedor meteorolóxico.

### Conceptos aprendidos e practicados

-   API REST.
-   Petición HTTP `GET`.
-   `http.get()`.
-   `Uri.https()`.
-   Parámetros de consulta.
-   Códigos de estado HTTP.
-   Resposta `200`.
-   Erro `401`.
-   Erros `5xx`.
-   JSON.
-   `jsonDecode()`.
-   `Map<String, dynamic>`.
-   Conversión JSON → modelo de dominio.
-   `Future`.
-   `async` / `await`.
-   Excepcións específicas da capa Service.
-   Contratos Repository.
-   Inxección de dependencias.
-   `ChangeNotifier`.
-   Estado de carga.
-   Estado de erro.
-   `context.read()`.
-   `context.watch()`.
-   `WidgetsBinding.instance.addPostFrameCallback()`.
-   Configuración mediante `String.fromEnvironment`.
-   Uso de `--dart-define-from-file`.
-   Exclusión de segredos mediante `.gitignore`.

### Dependencia HTTP

Incorporouse ao proxecto:

``` text
http
```

mediante Flutter Pub.

Esta dependencia permite realizar peticións HTTP desde a aplicación sen
acoplar o resto da arquitectura aos detalles de baixo nivel da
comunicación de rede.

### Primeira proba HTTP

Antes de integrar a funcionalidade na arquitectura de MARTOLA realizouse
unha petición de proba para comprender o fluxo:

``` text
Flutter
  ↓
HTTP GET
  ↓
servidor remoto
  ↓
resposta JSON
  ↓
jsonDecode()
  ↓
Map<String, dynamic>
```

A proba permitiu comprobar na práctica que unha resposta JSON pode
converterse nunha estrutura Dart e acceder aos seus valores.

### Proba con OpenWeather

Como primeira fonte meteorolóxica utilizouse OpenWeather.

Realizouse unha consulta de condicións meteorolóxicas actuais mediante
latitude e lonxitude:

``` text
latitude
longitude
  ↓
OpenWeather
  ↓
JSON
```

A resposta real permitiu obter, entre outros datos:

-   temperatura;
-   humidade;
-   descrición meteorolóxica;
-   velocidade do vento;
-   localidade.

Tamén se utilizou:

``` text
units=metric
lang=gl
```

para solicitar unidades métricas e, cando o provedor dispón da tradución
correspondente, descricións en galego.

### Modelo WeatherData

Creouse:

``` text
models/
└── weather_data.dart
```

`WeatherData` representa dentro do dominio os datos meteorolóxicos que
MARTOLA necesita utilizar.

O modelo evita que as Views traballen directamente coa estrutura JSON
devolta pola API.

O fluxo é:

``` text
JSON
  ↓
Map<String, dynamic>
  ↓
WeatherData.fromJson(...)
  ↓
WeatherData
```

Deste modo, se cambia a estrutura da resposta externa, a adaptación pode
concentrarse na fronteira de entrada dos datos.

### WeatherService

Creouse:

``` text
services/
├── weather_service.dart
└── weather_exception.dart
```

`WeatherService` é responsable da comunicación directa con OpenWeather.

Constrúe a URI mediante:

``` text
Uri.https(...)
```

e realiza a petición mediante:

``` text
http.get(...)
```

A súa responsabilidade é:

``` text
coordenadas
  ↓
construír petición
  ↓
realizar HTTP GET
  ↓
interpretar statusCode
  ↓
decodificar JSON
  ↓
WeatherData
```

O Service non xestiona widgets nin estado da interface.

### Xestión de respostas HTTP

A resposta correcta:

``` text
200
```

provoca a conversión do JSON a `WeatherData`.

Tamén se introduciu unha excepción específica:

``` text
WeatherException
```

para representar erros da comunicación meteorolóxica.

Actualmente distínguense casos básicos como:

``` text
401
→ API key non válida

5xx
→ erro no servidor meteorolóxico

outros códigos
→ erro HTTP
```

Isto evita utilizar `null` como único mecanismo para representar tanto
ausencia de datos como fallos da petición.

### WeatherRepository

Creouse o contrato:

``` text
WeatherRepository
```

cunha operación para obter as condicións meteorolóxicas actuais a partir
de coordenadas.

A ViewModel depende deste contrato e non directamente de OpenWeather.

### OpenWeatherRepository

Creouse:

``` text
OpenWeatherRepository
```

que implementa:

``` text
WeatherRepository
```

e delega a comunicación real en:

``` text
WeatherService
```

A arquitectura queda:

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

Esta separación permite que no futuro poida existir outra implementación
do mesmo contrato para outro provedor.

Por exemplo:

``` text
WeatherRepository
       ↑
       ├── OpenWeatherRepository
       └── futura implementación MeteoSIX
```

Cada provedor poderá dispoñer do seu propio Service cando cambien
endpoints, parámetros ou formato de resposta.

### WeatherViewModel

Creouse:

``` text
viewmodels/
└── weather_viewmodel.dart
```

O ViewModel mantén o estado meteorolóxico necesario para a interface:

``` text
WeatherData?
bool isLoading
String? errorMessage
```

A operación principal:

``` text
loadCurrentWeather(...)
```

coordínase co Repository e actualiza o estado observable mediante:

``` text
notifyListeners()
```

O fluxo é:

``` text
View
  ↓
WeatherViewModel
  ↓
WeatherRepository
  ↓
Service / API
  ↓
WeatherData
  ↓
WeatherViewModel
  ↓
notifyListeners()
  ↓
View
```

### Inxección de dependencias

A composición das dependencias meteorolóxicas realízase desde
`main.dart`.

Conceptualmente:

``` text
API key
  ↓
WeatherService
  ↓
OpenWeatherRepository
  ↓
WeatherViewModel
  ↓
Provider
  ↓
Views
```

Mantense así o mesmo criterio arquitectónico utilizado nos módulos
persistentes: as dependencias concretas créanse no punto de composición
e as capas superiores dependen das abstraccións apropiadas.

### Configuración da API key

A clave de OpenWeather non se mantén escrita directamente no código
fonte.

Utilízase:

``` dart
String.fromEnvironment(...)
```

e durante o desenvolvemento pode proporcionarse mediante:

``` text
--dart-define-from-file
```

Creouse unha configuración local para os segredos e un ficheiro de
exemplo versionable.

O ficheiro real coa clave queda excluído mediante `.gitignore`.

Conceptualmente:

``` text
config/secrets.json
  ↓
--dart-define-from-file
  ↓
String.fromEnvironment(...)
  ↓
main.dart
  ↓
WeatherService
```

Esta solución evita publicar accidentalmente a clave no repositorio.

Non debe interpretarse como un sistema de segredo absoluto dentro dun
executable distribuído: unha aplicación cliente necesita dalgún modo
acceder á credencial para realizar a petición. Nunha arquitectura futura
con backend propio, as claves sensibles poderían permanecer no servidor.

### Integración co Dashboard

`DashboardScreen` evolucionou de mostrar datos meteorolóxicos ficticios
a utilizar `WeatherViewModel`.

A pantalla pasou a necesitar estado de ciclo de vida para iniciar a
primeira carga meteorolóxica.

A petición inicial non se realiza directamente durante `build()`.

Utilízase:

``` text
WidgetsBinding.instance.addPostFrameCallback(...)
```

desde `initState()` para iniciar a carga despois do primeiro frame.

Isto resolveu o erro:

``` text
setState() or markNeedsBuild() called during build
```

que aparecía cando `WeatherViewModel` executaba `notifyListeners()`
mentres Flutter aínda estaba construíndo a árbore.

### Estados da interface meteorolóxica

A interface distingue agora varios estados:

``` text
isLoading
  ↓
CircularProgressIndicator

errorMessage != null
  ↓
mensaxe de erro

weatherData != null
  ↓
WeatherCard

sen datos
  ↓
mensaxe informativa
```

Deste modo a View non deduce o estado da petición unicamente comprobando
se `WeatherData` é `null`.

### WeatherCard

`WeatherCard`, que inicialmente utilizaba mock data no Dashboard, queda
conectada a datos reais procedentes da API.

Recibe desde a pantalla os datos preparados polo ViewModel, mantendo a
súa responsabilidade de presentación.

O fluxo final é:

``` text
OpenWeather
  ↓
WeatherService
  ↓
OpenWeatherRepository
  ↓
WeatherViewModel
  ↓
DashboardScreen
  ↓
WeatherCard
```

### Persistencia meteorolóxica

A integración realizada nesta sesión consulta as condicións
meteorolóxicas actuais, pero non almacena esas respostas en SQLite.

Por tanto:

-   `WeatherData` é un modelo utilizado en memoria.
-   Non se crea aínda a táboa `weather_records`.
-   A base de datos permanece na versión 3.
-   Non existe migración `v3 → v4`.
-   O histórico meteorolóxico queda para unha ampliación posterior.

A consulta dunha API externa e a persistencia local son
responsabilidades diferentes e non é necesario modificar o esquema
SQLite ata que MARTOLA necesite conservar eses datos.

### MeteoSIX

Estudouse como posible fonte meteorolóxica para MARTOLA a API MeteoSIX
da Xunta de Galicia.

A intención é valorar a súa incorporación cando se dispoña da credencial
correspondente.

A arquitectura actual permite facelo sen obrigar a modificar
`WeatherViewModel`, sempre que a nova implementación respecte o contrato
definido por `WeatherRepository`.

A integración de MeteoSIX non forma parte desta sesión.

### Localización actual

Para comprobar o módulo utilizáronse temporalmente coordenadas coñecidas
de Ourense.

Isto permite validar toda a cadea de comunicación antes de implementar a
selección dinámica da localización.

A evolución prevista poderá permitir obter a localización meteorolóxica:

-   a partir da localización ou coordenadas dunha horta;
-   mediante selección nun mapa;
-   mediante procura dunha localidade.

Esta funcionalidade queda fóra do incremento básico completado nesta
sesión.

### Arquitectura final do módulo

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

O módulo mantén separadas:

-   presentación;
-   estado;
-   abstracción de acceso aos datos;
-   implementación do provedor;
-   comunicación HTTP.

### Comprobación funcional

Comprobouse que:

-   A dependencia `http` funciona correctamente.
-   As peticións HTTP poden realizarse desde MARTOLA.
-   A resposta JSON de OpenWeather se decodifica correctamente.
-   A API key activa permite realizar peticións válidas.
-   A resposta `200` produce un `WeatherData`.
-   Os datos reais chegan ao `WeatherViewModel`.
-   O Dashboard reacciona aos cambios mediante Provider.
-   `WeatherCard` mostra datos meteorolóxicos reais.
-   A descrición pode recibirse en galego mediante `lang=gl`.
-   Os estados de carga e erro se representan na interface.
-   A carga inicial xa non provoca notificacións durante `build()`.
-   A API key local non queda incluída no repositorio.
-   O ficheiro de exemplo da configuración pode versionarse sen incluír
    a clave real.

### Skills Acquired

-   Consumir unha API REST desde Flutter.
-   Realizar peticións HTTP `GET`.
-   Construír unha URI con parámetros.
-   Interpretar códigos de estado HTTP.
-   Decodificar JSON.
-   Traballar con `Map<String, dynamic>`.
-   Transformar unha resposta externa nun modelo de dominio.
-   Separar Service e Repository.
-   Integrar unha fonte remota nunha arquitectura MVVM.
-   Representar carga, éxito e erro nun ViewModel.
-   Comprender por que non debe notificarse un cambio de estado durante
    a fase de construción.
-   Utilizar un callback posterior ao primeiro frame cando a
    inicialización da pantalla provoca cambios observables.
-   Configurar valores de compilación mediante `String.fromEnvironment`.
-   Evitar versionar credenciais locais.
-   Deseñar un contrato que permita substituír no futuro o provedor
    meteorolóxico.

### Documentation Updated

-   `PROJECT_CONTEXT.md`
-   `ARCHITECTURE.md`
-   `DATABASE_DESIGN.md`
-   `DEVELOPMENT_GUIDE.md`

`ROADMAP.md` deberá quedar sincronizado co peche desta sesión se aínda
non se actualizou.

### Next Step

Revisar o roadmap tras completar a integración meteorolóxica básica e
seleccionar o seguinte bloque funcional do MVP.

Entre os seguintes candidatos están:

-   Layout Designer.
-   Adaptación responsive.
-   Testing e revisión.
-   Melloras posteriores do módulo meteorolóxico, como asociación coa
    localización dunha horta, MeteoSIX ou histórico persistente.

### Commit

Pendente ao finalizar a actualización da documentación.

### Notes

A Session 17 introduce a primeira fonte de datos remota real de MARTOLA.

Ata este momento a aplicación traballaba principalmente con persistencia
local SQLite. A meteoroloxía incorpora unha segunda clase de fonte de
datos: un servizo REST externo.

A arquitectura Repository permite manter a View e o ViewModel
desacoplados do provedor concreto. OpenWeather funciona como primeira
implementación, mentres que MeteoSIX poderá incorporarse posteriormente
sen obrigar a redeseñar a capa de presentación.

A sesión deixa completado o módulo meteorolóxico básico: consulta
remota, transformación a modelo de dominio, integración mediante
Repository e ViewModel, xestión de estados e presentación de datos reais
no Dashboard.

------------------------------------------------------------------------

## Sesión 18 - Xeocodificación e meteoroloxía específica por horta

### Status

✅ Completed

### Obxectivos

-   Asociar coordenadas xeográficas ás hortas.
-   Evolucionar SQLite de v3 a v4 conservando os datos existentes.
-   Introducir un servizo específico de xeocodificación.
-   Reutilizar o patrón Service → Repository → ViewModel.
-   Permitir buscar e seleccionar localidades nos formularios de horta.
-   Consultar a meteoroloxía segundo as coordenadas persistidas da
    horta.
-   Reutilizar `WeatherCard` fóra do Dashboard.

### Conceptos aprendidos e practicados

-   Campos opcionais `double?`.
-   Migración SQLite v3 → v4.
-   Conversión segura mediante `num` e `toDouble()`.
-   Conversión dunha lista JSON mediante `map(...).toList()`.
-   Xeocodificación directa.
-   `TimeoutException` e `http.ClientException`.
-   Excepcións específicas de Service.
-   Uso de `finally` para restaurar estado asíncrono.
-   Dependencia de contratos Repository.
-   `context.read<T>()` con Provider.
-   Selección explícita dun resultado antes de persistilo.
-   Reutilización real dun widget compartido.

### Evolución de Garden e SQLite

`Garden` incorpora agora:

``` dart
final double? latitude;
final double? longitude;
```

As coordenadas son opcionais. `toMap()` e `Garden.fromMap()` foron
adaptados para persistilas e recuperalas.

Na lectura utilízase:

``` dart
latitude: (map['latitude'] as num?)?.toDouble(),
longitude: (map['longitude'] as num?)?.toDouble(),
```

A base de datos pasa a `version: 4`. A migración `v3 → v4` engade
`latitude` e `longitude` á táboa `gardens` sen eliminar os datos
existentes.

### Decisión sobre a localización

Descartouse usar a xeolocalización do dispositivo como mecanismo
principal. MARTOLA necesita coñecer o tempo onde está a horta, non onde
está o usuario.

O fluxo escollido é:

``` text
localidade introducida
  ↓
xeocodificación
  ↓
lista de resultados
  ↓
selección do usuario
  ↓
latitude + longitude
  ↓
Garden
```

### GeocodingResult

Creouse un modelo específico para os resultados da xeocodificación cos
datos necesarios para identificar e seleccionar unha localización:

``` text
name
state
country
latitude
longitude
```

`state` permite distinguir resultados homónimos de diferentes rexións.

### GeocodingService

Creouse un servizo independente para OpenWeather Geocoding API usando:

``` text
/geo/1.0/direct
```

cos parámetros `q`, `limit` e `appid`. Actualmente `q` corresponde ao
texto introducido polo usuario e `limit` é 5.

A resposta é unha lista JSON que se transforma en
`List<GeocodingResult>` mediante `map()` e `toList()`.

### Xestión de erros

Creouse `GeocodingException`.

Distínguense erros de API key, servidor, outros códigos HTTP, timeout e
fallos de conexión. `GeocodingViewModel` utiliza `finally` para garantir
que `isLoading` volva a `false` ao finalizar a operación.

### Repository e ViewModel

Creáronse:

``` text
GeocodingRepository
OpenWeatherGeocodingRepository
GeocodingViewModel
```

O fluxo é:

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

`GeocodingViewModel` mantén resultados, estado de carga e mensaxe de
erro, e expón `searchLocation(location)`.

### Inxección de dependencias

`main.dart` incorpora:

``` text
GeocodingService
  ↓
OpenWeatherGeocodingRepository
  ↓
GeocodingViewModel
  ↓
MultiProvider
```

Os campos de `MartolaApp` empregan os contratos Repository en lugar das
implementacións concretas cando existe unha abstracción.

### Integración nos formularios

O usuario pode buscar unha localidade e seleccionar un resultado. Ao
facelo, a localización textual e as coordenadas seleccionadas pasan ao
`Garden` que se crea ou actualiza.

A selección explícita evita asumir que o primeiro resultado devolto pola
API é necesariamente o correcto.

Probouse, entre outros casos, con `Ourense` e `Sada`, comprobando que a
API pode devolver varios resultados e que resulta útil mostrar `state` e
`country`.

### Meteoroloxía por horta

`GardenDetailsScreen` utiliza agora as coordenadas persistidas da horta
para consultar as condicións meteorolóxicas correspondentes.

``` text
Garden
  ↓
latitude / longitude
  ↓
WeatherViewModel
  ↓
WeatherRepository
  ↓
OpenWeather
  ↓
WeatherData
  ↓
GardenDetailsScreen
```

A meteoroloxía deixa así de depender de coordenadas fixas de proba.

### WeatherCard reutilizable

Ao necesitar `WeatherCard` tanto no Dashboard como en
`GardenDetailsScreen`, moveuse desde `views/dashboard/widgets/` a
`lib/widgets/`.

Isto aplica o criterio definido no proxecto: extraer un widget cando
aparece unha necesidade real de reutilización.

### Comprobación funcional

Comprobouse que a aplicación arranca coa nova composición, SQLite v4
conserva os datos, as coordenadas quedan persistidas, a xeocodificación
devolve resultados reais, a selección funciona e `GardenDetailsScreen`
pode mostrar meteoroloxía correspondente á horta.

### Skills Acquired

-   Evolucionar un modelo persistido conservando compatibilidade.
-   Crear unha migración SQLite con campos opcionais.
-   Deseñar un segundo fluxo HTTP coa arquitectura existente.
-   Transformar arrays JSON en listas de modelos Dart.
-   Diferenciar erros HTTP, timeout e conexión.
-   Utilizar `finally` en estado asíncrono.
-   Depender de contratos Repository no punto de composición.
-   Integrar un ViewModel nun formulario mediante Provider.
-   Asociar datos dunha API externa cunha entidade persistente.
-   Reutilizar un widget cando aparece unha segunda necesidade real.

### Documentation Updated

-   `PROJECT_CONTEXT.md`
-   `DATABASE_DESIGN.md`
-   `ARCHITECTURE.md`
-   `DEVELOPMENT_GUIDE.md`

`ROADMAP.md` deberá quedar sincronizado co estado final da sesión.

### Next Step

Revisar `ROADMAP.md` e decidir o seguinte bloque priorizando o tempo
restante e o valor para o MVP. Os candidatos principais son Layout
Designer, responsive e testing. MeteoSIX e outras ampliacións
meteorolóxicas quedan como melloras opcionais.

### Commit

Pendente ao finalizar a actualización da documentación.

### Notes

A Session 18 converte a meteoroloxía nunha funcionalidade ligada ás
hortas reais de MARTOLA. A xeocodificación resolve a ponte entre a
localización introducida polo usuario e as coordenadas que necesita a
API meteorolóxica, sen depender da posición física do dispositivo.

A arquitectura da Session 17 puido ampliarse cun segundo fluxo HTTP
mantendo as mesmas responsabilidades e sen introducir capas adicionais.

**---**

## Session 19 - Layout Designer persistente

### Status

✅ Completed

### Objective

Implementar a primeira versión funcional do deseñador visual dunha horta,
reutilizando a arquitectura xa empregada nos módulos persistentes de
MARTOLA.

### Concepts Learned

-   Modelado dunha entidade de posición mediante `GardenLayoutItem`.
-   Coordenadas normalizadas entre `0.0` e `1.0`.
-   Uso de `LayoutBuilder` para coñecer as dimensións reais dispoñibles.
-   Conversión de coordenadas normalizadas a píxeles.
-   `Stack` e `Positioned` para colocar elementos libremente.
-   `GestureDetector`.
-   `onPanUpdate` para movemento continuo.
-   `DragUpdateDetails.delta`.
-   `onPanEnd` para detectar o final do arrastre.
-   `clamp()` para limitar valores.
-   Separación entre actualización visual local e persistencia.
-   Detección simple de colisións mediante distancia horizontal e vertical.
-   Restrición `UNIQUE` en SQLite.
-   Reutilización de estado contextual por `gardenId`.

### Architecture Implemented

O novo módulo segue o mesmo fluxo arquitectónico que os módulos anteriores:

``` text
LayoutDesignerScreen
        ↓
GardenLayoutViewModel
        ↓
GardenLayoutRepository
        ↑
SqliteGardenLayoutRepository
        ↓
DatabaseService
        ↓
SQLite
```

Isto permite incorporar unha funcionalidade nova sen introducir acceso
directo a SQLite desde a View nin desde o ViewModel.

### Model

Creouse:

``` text
GardenLayoutItem
```

Cada elemento relaciona:

``` text
gardenId
gardenPlantId
xPosition
yPosition
```

As coordenadas almacénanse normalizadas, polo que non dependen directamente
da resolución nin do tamaño concreto do taboleiro.

Conceptualmente:

``` text
0.0 ---------------- 1.0
```

A posición real na interface calcúlase a partir das dimensións obtidas con
`LayoutBuilder`.

### Persistence

A base de datos evolucionou á versión:

``` text
v5
```

Engadiuse a táboa:

``` text
garden_layout_items
```

Esta táboa permite persistir a posición de cada planta dentro do deseño.

As relacións coas hortas e plantas utilizan claves foráneas con eliminación
en cascada.

Ademais, a restrición:

``` text
UNIQUE (garden_plant_id)
```

impide que unha mesma planta teña máis dunha posición simultánea no deseño.

Implementouse e comprobouse a migración:

``` text
v4 → v5
```

mantendo os datos existentes.

### Repository

Creouse o contrato:

``` text
GardenLayoutRepository
```

e a implementación SQLite:

``` text
SqliteGardenLayoutRepository
```

As operacións permiten:

-   Recuperar os elementos dunha horta.
-   Engadir unha planta ao deseño.
-   Actualizar a súa posición.
-   Retirala do deseño.

Retirar unha planta do deseño elimina unicamente o seu `GardenLayoutItem`;
a `GardenPlant` continúa existindo na horta.

### ViewModel

Creouse:

``` text
GardenLayoutViewModel
```

O ViewModel mantén a colección correspondente á horta actual e proporciona,
entre outras, as operacións:

``` text
loadItems(gardenId)
addItem()
updateItem()
removeItem()
updateItemPositionLocally()
```

`updateItemPositionLocally()` permite modificar inmediatamente a posición
observable durante o arrastre sen escribir en SQLite en cada pequeno
movemento.

### Provider Integration

`GardenLayoutViewModel` integrouse no `MultiProvider` da aplicación mediante
inxección de dependencias desde `main.dart`.

Deste modo a View depende do ViewModel e este do contrato Repository,
mantendo a separación arquitectónica existente.

### LayoutDesignerScreen

Creouse:

``` text
LayoutDesignerScreen
```

A pantalla recibe:

``` text
gardenId
```

e carga no `initState()`:

``` text
GardenLayoutViewModel.loadItems(gardenId)
PlantsViewModel.loadPlants(gardenId)
```

Deste modo o deseño e a lista de plantas quedan contextualizados pola horta
seleccionada.

### Adding Plants to the Layout

A pantalla mostra nun `DropdownButton` unicamente as plantas que aínda non
forman parte do deseño.

A lista dispoñible obtense comparando as plantas da horta cos
`GardenLayoutItem` existentes.

Ao engadir unha planta créase un novo elemento cunha posición inicial
normalizada.

A selección do Dropdown límpase despois de completar correctamente a
operación.

### Free Positioning

O taboleiro utiliza:

``` text
LayoutBuilder
  ↓
Container
  ↓
Stack
  ↓
Positioned
  ↓
GestureDetector
```

Cada planta represéntase actualmente mediante unha caixa cadrada de tamaño
fixo que contén unha icona e o seu nome personalizado.

### Dragging

Durante:

``` text
onPanUpdate
```

`details.delta` proporciona o desprazamento producido desde a actualización
anterior do punteiro.

Ese desprazamento en píxeles convértese a coordenadas normalizadas:

``` text
delta.dx / boardWidth
delta.dy / boardHeight
```

e engádese á posición actual do elemento.

### Board Limits

Como `Positioned` utiliza a esquina superior esquerda pero as coordenadas
do modelo representan o centro da caixa, calcúlase unha marxe equivalente
á metade do tamaño do elemento.

Os valores mínimos e máximos evitan que unha planta poida arrastrarse fóra
do taboleiro.

A limitación realízase mediante:

``` text
clamp(minX, maxX)
clamp(minY, maxY)
```

### Collision Prevention

Antes de aceptar unha nova posición compróbase se a caixa ocuparía o espazo
doutra planta.

Para cada elemento distinto do que se está movendo calcúlase a distancia
horizontal e vertical entre os seus centros.

Existe solapamento cando ambas distancias son menores que o tamaño do
elemento.

Se existe solapamento, a nova posición non se aplica.

Deste modo cada zona ocupada queda reservada para unha única planta.

### Local Update vs Persistence

Durante o arrastre:

``` text
onPanUpdate
        ↓
updateItemPositionLocally()
        ↓
notifyListeners()
        ↓
rebuild
```

Non se escribe continuamente na base de datos.

Ao finalizar:

``` text
onPanEnd
        ↓
posición actual do ViewModel
        ↓
updateItem()
        ↓
SQLite
```

Esta separación reduce o número de escrituras durante unha interacción
continua.

### Functional Verification

Comprobouse que:

-   As plantas dunha horta poden engadirse individualmente ao deseño.
-   Unha planta xa colocada deixa de aparecer entre as plantas dispoñibles.
-   As plantas poden moverse individualmente.
-   O movemento queda limitado ao interior do taboleiro.
-   Dúas plantas non poden superpoñerse.
-   As posicións persisten ao saír e volver entrar na pantalla.
-   As posicións persisten despois de reiniciar a aplicación.
-   Retirar unha planta do deseño non elimina a planta da horta.
-   A arquitectura continúa separando View, ViewModel, Repository e SQLite.

### Current Limitations

A primeira versión prioriza deliberadamente a simplicidade.

O movemento das caixas pode percibirse algo menos fluído que unha
implementación baseada nunha capa visual temporal de arrastre, xa que a
posición observable se actualiza continuamente mediante Provider.

Considérase aceptable para o MVP actual.

Tamén quedan como posibles melloras:

-   Grid ou snapping.
-   Colocación inicial máis intelixente.
-   Representación visual diferente segundo a especie.
-   Tamaños variables.
-   Melloras na fluidez do arrastre.
-   Deseño responsive específico do taboleiro.

Estas melloras non son necesarias para considerar funcional a primeira
versión do Layout Designer.

### Skills Acquired

-   Crear unha funcionalidade persistente completa reutilizando unha
    arquitectura existente.
-   Traballar con coordenadas independentes da resolución.
-   Traducir movementos do punteiro a cambios de estado.
-   Diferenciar estado temporal de interacción e persistencia.
-   Evitar escrituras innecesarias durante unha interacción continua.
-   Aplicar límites xeométricos a elementos posicionados.
-   Implementar unha detección básica de colisións.
-   Contextualizar coleccións mediante o identificador dunha entidade pai.
-   Evolucionar un esquema SQLite mediante unha nova migración.

### Documentation Updated

-   `DEVELOPMENT_GUIDE.md`
-   `ARCHITECTURE.md`
-   `DATABASE_DESIGN.md`
-   `PROJECT_CONTEXT.md`
-   `ROADMAP.md`
-   `LEARNING_NOTES.md`

### Commit

Pendente ao finalizar a actualización da documentación.

### Notes

A Session 19 completa un dos bloques funcionais principais previstos para o
MVP. O Layout Designer deixa de ser unha funcionalidade futura e pasa a
formar parte da aplicación real.

A implementación mantense deliberadamente sinxela: primeiro garántese un
fluxo funcional, persistente e coherente coa arquitectura existente; as
melloras visuais e de interacción poderán realizarse posteriormente se o
tempo do proxecto o permite.

