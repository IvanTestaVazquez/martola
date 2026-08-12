# DEVELOPMENT_GUIDE.md

# MARTOLA - Development Guide

## Purpose

Este documento define o plan de aprendizaxe e desenvolvemento da aplicación MARTOLA.

O seu obxectivo non é substituír o ROADMAP técnico do proxecto, senón servir como guía práctica para aprender Flutter e Dart mentres se desenvolve a aplicación.

Cada sesión de traballo terá un obxectivo concreto, conceptos asociados e un resultado funcional dentro de MARTOLA.

---

# Current Learning Status

## Preparation Completed

- [x] Repositorio GitHub configurado.
- [x] Proxecto Flutter creado.
- [x] Estrutura de carpetas creada.
- [x] Arquitectura documentada.
- [x] Interface inicial definida.
- [x] Modelo de datos documentado.

## Current Phase

Persistencia e arquitectura de datos.

O módulo de hortas xa dispón de:

- Estado compartido mediante Provider.
- `GardensViewModel`.
- `GardenRepository` como abstracción asíncrona.
- `MemoryGardenRepository` como implementación alternativa en memoria.
- `SQLiteGardenRepository` como implementación persistente actualmente utilizada.
- Inxección de dependencias.
- Operacións asíncronas mediante `Future`, `async` e `await`.
- Estado local no ViewModel sincronizado co Repository.
- Carga inicial mediante `loadGardens()`.
- Fluxos de creación, edición e eliminación adaptados á asincronía.
- Dependencias SQLite multiplataforma instaladas.
- `DatabaseService` funcional.
- Base de datos `martola.db`.
- Táboa `gardens`.
- Conversión entre `Garden` e `Map<String, Object?>`.
- CRUD completo de hortas mediante SQLite.
- Persistencia dos datos entre reinicios.

## Next Action

Completar a Session 13 estudando o versionado e as migracións de SQLite.

O seguinte paso será:

1. Comprender por que unha base de datos necesita un número de versión.
2. Analizar que ocorre cando cambia o esquema dunha base de datos xa existente.
3. Introducir o concepto de migración.
4. Preparar `DatabaseService` para futuras modificacións do esquema.
5. Revisar a arquitectura SQLite resultante.
6. Pechar a Session 13.

---

# Working Method

Cada sesión seguirá sempre a mesma estrutura.

## 1. Theory

Introdución aos conceptos necesarios.

Só se estudará a teoría imprescindible para implementar a funcionalidade da sesión.

---

## 2. Implementation

Aplicación inmediata dos conceptos aprendidos dentro de MARTOLA.

Non se realizarán exercicios independentes do proxecto salvo que sexan imprescindibles para comprender un concepto.

---

## 3. Review

Ao finalizar a implementación revisarase:

- organización do código
- boas prácticas
- alternativas posibles
- erros frecuentes

---

## 4. Version Control

Ao finalizar cada sesión realizarase un commit en Git.

Cada commit representará un pequeno avance funcional.

---

## 5. Documentation

Actualizaranse os documentos do proxecto sempre que sexa necesario.

Especialmente:

- PROJECT_CONTEXT.md
- ARCHITECTURE.md
- DATABASE_DESIGN.md
- UI_REFERENCE.md
- ROADMAP.md

---

# Learning Objectives

Ao finalizar o proxecto deberase comprender:

- Dart
- Flutter
- Widgets
- Material Design
- Navegación
- MVVM
- Provider
- SQLite
- Consumo de APIs REST
- Responsive Design
- Arquitectura dunha aplicación Flutter
- Organización dun proxecto profesional

---

# Development Phases

## Phase 1

Flutter Fundamentals

Status:

✅ Completed

### Concepts

- Estrutura dun proxecto Flutter
- main.dart
- runApp()
- Widget
- StatelessWidget
- StatefulWidget
- MaterialApp
- Scaffold
- BuildContext
- Hot Reload

### Practical Objective

Crear a primeira pantalla funcional de MARTOLA.

### Deliverable

HomeScreen funcionando.

---

## Phase 2

Layouts

Status:

✅ Completed

### Concepts

- Column
- Row
- Expanded
- Flexible
- Container
- Padding
- Margin
- Align
- Center

### Practical Objective

Construír a estrutura visual da HomeScreen.

---

## Phase 3

Navigation

Status:

🟡 In Progress

### Concepts

- Navigator
- Routes
- Navigation Stack
- Paso de parámetros

### Practical Objective

Crear a navegación entre:

- HomeScreen
- GardensScreen
- GardenDetailScreen
- PlantDetailScreen
- LayoutDesignerScreen

---

## Phase 4

Reusable Widgets

Status:

🟡 In Progress

### Concepts

- Composición
- Props
- Reutilización
- Organización de widgets

### Practical Objective

Crear:

- GardenCard
- WeatherCard
- PlantCard
- ActionCard

---

## Phase 5

Application Theme

Status:

🟡 In Progress

### Concepts

- ThemeData
- ColorScheme
- Typography
- Icons
- Material 3

### Practical Objective

Aplicar un deseño consistente a toda a aplicación.

---

## Phase 6

State Management

Status:

✅ Completed

### Concepts

- Provider
- ChangeNotifier
- notifyListeners()
- MVVM

### Practical Objective

Conectar vistas e ViewModels.

---

## Phase 7

Models

Status:

🟡 In Progress

### Concepts

- Clases Dart
- fromMap()
- toMap()
- JSON
- Encapsulamento

### Practical Objective

Crear todos os modelos da aplicación.

---

## Phase 8

SQLite

Status:

🟡 In Progress

### Concepts

- sqflite
- CRUD
- Repository Pattern
- Persistencia local

### Practical Objective

Implementar a base de datos local.

---

## Phase 9

Forms

Status:

🟡 In Progress

### Concepts

- Form
- TextField
- Validation
- Controllers

### Practical Objective

Crear formularios de creación e edición.

---

## Phase 10

REST APIs

Status:

⬜ Pending

### Concepts

- HTTP
- REST
- JSON
- async/await
- Future

### Practical Objective

Integrar OpenWeatherMap.

---

## Phase 11

Garden Module

Status:

🟡 In Progress

### Practical Objective

Finalizar a xestión completa das hortas.

---

## Phase 12

Plant Module

Status:

⬜ Pending

### Practical Objective

Finalizar a xestión completa das plantas.

---

## Phase 13

Plant Evolution

Status:

⬜ Pending

### Practical Objective

Implementar o seguemento da evolución das plantas.

---

## Phase 14

Layout Designer

Status:

⬜ Pending

### Concepts

- Drag & Drop
- GestureDetector
- Positioned
- Stack

### Practical Objective

Deseño visual da horta.

---

## Phase 15

Responsive Design

Status:

⬜ Pending

### Practical Objective

Adaptar a aplicación para:

- móbil
- tablet
- escritorio

---

## Phase 16

Testing & Optimization

Status:

⬜ Pending

### Concepts

- Debugging
- Performance
- Refactoring

### Practical Objective

Optimizar a aplicación.

---

## Phase 17

Final Documentation

Status:

⬜ Pending

### Practical Objective

Preparar:

- Memoria
- Capturas
- Diagramas
- Defensa

---

# Session Log

Esta sección actualizarase ao finalizar cada sesión.

## Session 1

Status:

✅ Completed

### Concepts Learned

- Estrutura xeral dunha aplicación Flutter.
- Función `main()`.
- Función `runApp()`.
- Widget raíz da aplicación.
- Que é un Widget.
- Diferenza entre `StatelessWidget` e `StatefulWidget`.
- Uso de `const`.
- Filosofía de composición mediante widgets.

### Practical Work

- Análise conceptual do ficheiro `main.dart`.
- Comprensión da árbore de widgets.
- Definición dos criterios para distinguir widgets con estado e sen estado.

### Code Implemented

Ningún.

A sesión centrouse exclusivamente na comprensión da arquitectura básica de Flutter.

### Documentation Updated

- DEVELOPMENT_GUIDE.md

### Commit

Non necesario.

### Notes

A comprensión dos fundamentos foi satisfactoria. Antes de implementar código considérase importante consolidar o funcionamento interno dunha aplicación Flutter para facilitar as seguintes fases do desenvolvemento.

---

## Session 2

Status:

✅ Completed

### Concepts Learned

- Estrutura dun Widget.
- Filosofía de composición en Flutter.
- Relación entre Framework e Engine.
- Función do método build().
- Widget como descrición da interface.
- BuildContext (introdución).
- MaterialApp.
- Scaffold.
- Composición mediante widgets pequenos.
- Principio de responsabilidade única aplicado aos widgets.

### Practical Work

- Análise completa de main.dart.
- Análise de HomeScreen.
- Comprensión da árbore de widgets dunha aplicación Flutter.
- Introdución á arquitectura baseada en composición.

### Code Implemented

Ningún.

A sesión estivo centrada na comprensión profunda do código xerado por Flutter e na filosofía do framework.

### Documentation Updated

- DEVELOPMENT_GUIDE.md

### Commit

Non necesario.

### Notes

Comeza a consolidarse o modelo mental de Flutter. Compréndese que os widgets describen a interface e que Flutter reconstrúe unicamente as partes necesarias da árbore cando cambia o estado.

---

## Session 3

Status:

✅ Completed

### Concepts Learned

- Column
- Row
- Eixe principal (Main Axis)
- Eixe secundario (Cross Axis)
- MainAxisAlignment
- CrossAxisAlignment
- Filosofía de composición de Flutter
- Organización dunha pantalla mediante widgets

### Practical Work

- Comprensión do funcionamento de Column e Row.
- Dedución do comportamento de mainAxisAlignment e crossAxisAlignment sen recorrer á documentación.
- Introdución ao sistema de layout de Flutter.
- Análise da responsabilidade dos widgets de organización.

### Code Implemented

Ningún.

A sesión centrouse na comprensión do sistema de composición e distribución dos widgets antes de comezar a construír a primeira interface de MARTOLA.

### Documentation Updated

- DEVELOPMENT_GUIDE.md
- LEARNING_NOTES.md

### Commit

Non necesario.

### Notes

A comprensión do sistema de layout foi moi satisfactoria. O alumno xa é capaz de deducir o comportamento de widgets novos a partir da súa responsabilidade, sen depender da memorización da API.

---

## Session 4

Status:

✅ Completed

### Concepts Learned

- Column
- Row
- Main Axis
- Cross Axis
- MainAxisAlignment
- CrossAxisAlignment
- SizedBox
- Padding
- Composición de widgets
- Lectura dunha árbore de widgets

### Practical Work

- Comprensión do sistema de layout de Flutter.
- Análise das responsabilidades de Column, Row, Padding e SizedBox.
- Comprensión da distribución mediante Main Axis e Cross Axis.
- Interpretación visual dunha interface a partir da súa árbore de widgets.

### Skills Acquired

- Deducir o funcionamento dunha API a partir da responsabilidade dun widget.
- Identificar o eixe principal e secundario sen necesidade de memorización.
- Ler mentalmente unha interface Flutter antes de executala.
- Comprender a filosofía de composición mediante widgets pequenos.

### Code Implemented

Ningún.

A sesión estivo dedicada á comprensión do sistema de composición e layout antes de construír a primeira interface de MARTOLA.

### Documentation Updated

- DEVELOPMENT_GUIDE.md
- LEARNING_NOTES.md

### Commit

Non necesario.

### Notes

A partir desta sesión o enfoque cambia progresivamente cara ao desenvolvemento práctico. Os fundamentos de composición de widgets considéranse suficientemente consolidados para comezar a implementar a interface da aplicación.

---

## Session 5

Status:

✅ Completed

### Objective

Construír a primeira interface funcional de MARTOLA aplicando os conceptos aprendidos nas sesións anteriores.

### Concepts Learned

- AppBar
- SafeArea
- ElevatedButton
- Icon
- Composición de widgets aplicada a un caso real
- Lectura e construción dunha árbore de widgets
- Relación entre responsabilidade e composición

### Practical Work

- Deseño da arquitectura da primeira HomeScreen.
- Implementación da primeira pantalla funcional da aplicación.
- Primeira revisión de código (Code Review).
- Corrección de erros de sintaxe relacionados con `child`, `children` e propiedades nomeadas.

### Skills Acquired

- Construír unha pantalla Flutter desde cero sen recorrer a un exemplo.
- Traducir un wireframe nunha árbore de widgets.
- Comprender a diferenza entre erros conceptuais e erros de sintaxe.
- Aplicar os principios de responsabilidade única e composición durante a implementación.

### Code Implemented

- HomeScreen inicial.
- AppBar.
- SafeArea.
- Center.
- Padding.
- Column.
- Icon.
- ElevatedButton.

### Documentation Updated

- DEVELOPMENT_GUIDE.md
- LEARNING_NOTES.md

### Commit

Create initial HomeScreen layout

### Notes

Primeira pantalla funcional de MARTOLA. Nesta sesión produciuse a transición desde o estudo dos fundamentos de Flutter á implementación práctica da aplicación.

---

## Session 6

Status:

✅ Completed

### Objective

Introducir a reutilización de compoñentes e a configuración visual global da aplicación.

### Concepts Learned

- Refactorización
- Widgets reutilizables
- ThemeData
- ColorScheme
- Theme.of(context)
- Separación entre lóxica e presentación

### Practical Work

- Creación do widget reutilizable `MartolaLogo`.
- Eliminación de código duplicado na `HomeScreen`.
- Configuración do primeiro `ThemeData`.
- Uso de `ColorScheme.fromSeed()`.
- Aplicación de `Theme.of(context).colorScheme.primary`.

### Skills Acquired

- Identificar cando un widget merece ser extraído.
- Comprender a diferenza entre reutilización e duplicación.
- Entender o papel de `ThemeData` como configuración global.
- Comprender a relación entre `MaterialApp`, `ThemeData` e os widgets da aplicación.

### Code Implemented

- `MartolaLogo`
- Primeira configuración global do tema.
- Refactorización da `HomeScreen`.

### Documentation Updated

- DEVELOPMENT_GUIDE.md
- LEARNING_NOTES.md
- PROJECT_CONTEXT.md

### Commit

Refactor HomeScreen and introduce reusable MartolaLogo widget

### Notes

Primeira sesión centrada na mellora da arquitectura do código. A interface permanece visualmente igual, pero o código gaña en reutilización, mantemento e escalabilidade.

---

## Session 7

Status:

✅ Completed

### Objective

Introducir o sistema de navegación entre pantallas e comprender o funcionamento do Navigator.

### Concepts Learned

- Navigator
- Routes
- Stack de navegación
- push()
- pop()
- MaterialPageRoute
- Organización de pantallas por responsabilidade
- SingleChildScrollView
- Diferenzas entre Column, SingleChildScrollView e ListView

### Practical Work

- Creación de DashboardScreen.
- Navegación desde HomeScreen.
- Retorno mediante Navigator.pop().
- Estruturación das vistas.
- Deseño conceptual do Dashboard.

### Skills Acquired

- Comprender a navegación baseada nunha pila.
- Identificar cando crear unha nova pantalla.
- Organizar vistas segundo a súa responsabilidade.
- Escoller o widget adecuado segundo o comportamento esperado da interface.

### Code Implemented

- DashboardScreen.
- Navegación Home → Dashboard.
- Botón Entrar funcional.

### Documentation Updated

- DEVELOPMENT_GUIDE.md
- LEARNING_NOTES.md
- PROJECT_CONTEXT.md

### Commit

Add DashboardScreen and navigation flow

### Notes

Primeira navegación funcional da aplicación. A arquitectura pasa dunha aplicación dunha única pantalla a unha estrutura preparada para crecer con múltiples vistas.

---

## Session 8

Status:

✅ Completed

### Objective

Construír o primeiro Dashboard funcional de MARTOLA mediante compoñentes independentes e reutilizables.

### Concepts Learned

- Deseño de widgets a partir da súa responsabilidade.
- Interface pública dun widget.
- Paso de datos mediante o construtor.
- Mock data.
- Callbacks mediante `VoidCallback`.
- Separación entre presentación e comportamento.
- `Card`.
- `SingleChildScrollView`.
- `CrossAxisAlignment.stretch`.
- `TextButton`.
- `OutlinedButton.icon`.
- Uso do `Theme` dentro de widgets reutilizables.
- Xerarquía visual da información.

### Practical Work

- Creación de `WeatherCard`.
- Creación de `GardenCard`.
- Creación de `TasksCard`.
- Creación de `QuickActionsCard`.
- Integración dos catro compoñentes en `DashboardScreen`.
- Uso de datos ficticios para construír a interface antes de dispoñer de datos reais.
- Introdución de callbacks para delegar accións no widget pai.
- Preparación do Dashboard para contido con scroll.

### Components Implemented

DashboardScreen
├── WeatherCard
├── GardenCard
├── TasksCard
└── QuickActionsCard

### Architecture Decisions

- Os widgets específicos do Dashboard permanecen en `views/dashboard/widgets/`.
- Un widget só se moverá a `lib/widgets/` cando exista unha necesidade real de reutilización fóra da funcionalidade.
- Os widgets de presentación non deben controlar directamente a navegación.
- As accións externas expóñense mediante callbacks.
- `Engadir planta` non se inclúe nas accións rápidas do Dashboard, xa que require o contexto dunha horta concreta.

### Skills Acquired

- Deseñar un widget antes de implementar o seu `build()`.
- Identificar os datos mínimos que necesita un compoñente.
- Pasar datos dun widget pai a un widget fillo.
- Pasar comportamento mediante callbacks.
- Compoñer unha pantalla a partir de widgets especializados.
- Diferenciar responsabilidades de presentación, navegación e lóxica.

### Next Step

Comezar a conectar as accións do Dashboard coas pantallas correspondentes e continuar o fluxo funcional de MARTOLA.

---

## Session 9

Status:

✅ Completed

### Objective

Conectar os callbacks dos compoñentes do Dashboard coa navegación real entre os distintos módulos de MARTOLA.

### Concepts Practiced

- Reutilización de `Navigator`.
- Uso de `Navigator.of(context).push()`.
- Uso de `MaterialPageRoute`.
- Integración entre callbacks e navegación.
- Separación entre widgets de presentación e control do fluxo.
- Organización das pantallas por funcionalidade.

### Practical Work

- Creación de `GardensScreen`.
- Creación de `CreateGardenScreen`.
- Creación de `TasksScreen`.
- Creación de `CreateTaskScreen`.
- Conexión de `GardenCard` con `GardensScreen`.
- Conexión de `TasksCard` con `TasksScreen`.
- Conexión da acción `Crear horta` con `CreateGardenScreen`.
- Conexión da acción `Engadir tarefa` con `CreateTaskScreen`.
- Comprobación da navegación de ida e volta mediante a pila de `Navigator`.

### Navigation Implemented

```text
HomeScreen
    ↓
DashboardScreen
    ├── GardenCard
    │      └── GardensScreen
    │
    ├── TasksCard
    │      └── TasksScreen
    │
    └── QuickActionsCard
           ├── CreateGardenScreen
           └── CreateTaskScreen
```

### Architecture Decisions

- `DashboardScreen` coñece o fluxo de navegación desde o panel principal.
- Os widgets `GardenCard`, `TasksCard` e `QuickActionsCard` non realizan navegación directamente.
- Os widgets de presentación comunican as interaccións mediante callbacks.
- As pantallas relacionadas coas hortas almacénanse en `views/gardens/`.
- As pantallas relacionadas coas tarefas almacénanse en `views/tasks/`.
- As pantallas de creación créanse inicialmente como estruturas provisionais antes de implementar os formularios reais.

### Skills Acquired

- Conectar un callback cunha acción de navegación.
- Aplicar o mesmo patrón de navegación a diferentes módulos.
- Manter separados presentación e fluxo da aplicación.
- Crear pantallas provisionais para desenvolver incrementalmente un fluxo.
- Organizar novas funcionalidades dentro da estrutura do proxecto.

### Next Step

Comezar o desenvolvemento funcional do módulo de hortas, substituíndo as pantallas provisionais por interfaces capaces de representar e posteriormente xestionar os datos dunha horta.

---

## Estado de desenvolvemento — Sesión 10

### Módulo de hortas

Iniciouse a implementación funcional do módulo de xestión de hortas.

A aplicación dispón actualmente dun modelo de dominio `Garden`:

```dart
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

O identificador é nullable porque unha nova horta pode existir como obxecto antes de ser persistida e recibir un identificador definitivo.

---

### Estrutura actual do módulo

A estrutura principal implementada é:

```text
lib/
├── models/
│   └── garden.dart
│
└── views/
    ├── dashboard/
    │   └── ...
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

- `Garden`: representa os datos dunha horta.
- `GardensScreen`: mostra a colección de hortas e xestiona a navegación desde a lista.
- `GardenListItem`: representa visualmente unha horta dentro da lista e comunica a selección.
- `GardenDetailsScreen`: mostra a información da horta seleccionada.
- `CreateGardenScreen`: permite introducir e validar os datos necesarios para crear unha nova horta.

---

### Listado de hortas

`GardensScreen` utiliza actualmente unha colección local de datos ficticios:

```dart
const List<Garden> gardens = [
  // Datos temporais
];
```

A representación da colección realízase mediante:

```dart
ListView.builder(...)
```

Cada elemento é representado por:

```dart
GardenListItem
```

Esta implementación é temporal.

A colección local será substituída posteriormente por datos proporcionados pola capa de estado e persistencia.

---

### Fluxo de consulta dunha horta

O fluxo actualmente implementado é:

```text
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

```dart
GardenDetailsScreen(
  garden: garden,
)
```

Deste modo a pantalla de detalle é independente da horta concreta que se queira representar.

---

### Creación dunha horta

`CreateGardenScreen` está implementada como `StatefulWidget`.

Actualmente dispón de:

- Campo de nome.
- Campo de localización.
- Campo de superficie.
- `TextEditingController` para cada campo.
- `Form`.
- `GlobalKey<FormState>`.
- Validación dos campos.
- Conversión da superficie de `String` a `double`.
- Creación dunha instancia de `Garden`.

Fluxo:

```text
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

Os `TextEditingController` son creados e destruídos polo estado de `CreateGardenScreen`.

---

### Devolución da nova horta

Unha vez creado o modelo, o formulario pode devolvelo mediante:

```dart
Navigator.of(context).pop(garden);
```

A ruta que abriu o formulario pode recibir o resultado:

```dart
final garden = await Navigator.of(context).push<Garden>(
  MaterialPageRoute(
    builder: (context) => const CreateGardenScreen(),
  ),
);
```

O resultado é nullable porque o usuario pode abandonar o formulario sen crear unha horta.

Esta implementación utilízase actualmente para comprobar o fluxo de datos entre rutas.

---

### Limitación actual

A nova horta creada aínda non se incorpora á colección mostrada en `GardensScreen`.

Actualmente:

```text
Formulario
    ↓
Garden creado
    ↓
Garden devolto
    ↓
NON persistido
```

Isto é intencionado.

Non se implementará unha solución temporal baseada en modificar manualmente a lista local, xa que a xestión dos datos deberá integrarse coa arquitectura prevista para MARTOLA.

---

### Evolución prevista

O fluxo actual:

```text
View
 ↓
datos locais ficticios
```

deberá evolucionar progresivamente cara á arquitectura prevista:

```text
View
 ↓
ViewModel / Provider
 ↓
Repository
 ↓
SQLite
```

Isto permitirá que:

- As hortas non dependan dunha lista local dentro dunha pantalla.
- Varias pantallas compartan o mesmo estado.
- Crear unha horta actualice a interface.
- Os datos permanezan dispoñibles ao pechar e volver abrir a aplicación.
- A interface permaneza desacoplada da implementación concreta da persistencia.

---

### Estado actual do módulo

Implementado:

- Modelo `Garden`.
- Listado dinámico de hortas.
- Widget reutilizable `GardenListItem`.
- Selección dunha horta.
- Pantalla de detalle.
- Paso de modelos entre pantallas.
- Formulario de creación.
- Validación de datos.
- Conversión de tipos.
- Creación dun novo `Garden`.
- Devolución do resultado entre rutas.

Pendente:

- Estado compartido das hortas.
- Integración con `Provider`.
- ViewModel do módulo.
- Repository.
- Persistencia mediante SQLite.
- Inserción real de hortas.
- Recuperación das hortas almacenadas.
- Edición de hortas.
- Eliminación de hortas.
- Asociación de plantas ás hortas.

---

## Sesión 11 - Estado compartido e Provider

### Obxectivos

- Comprender a diferenza entre estado local e compartido.
- Introducir Provider.
- Crear o primeiro ViewModel funcional.
- Centralizar o estado das hortas.
- Sincronizar diferentes pantallas.
- Implementar CRUD en memoria.
- Introducir identidade estable das entidades.

### Contidos

- `ChangeNotifier`
- `notifyListeners()`
- `ChangeNotifierProvider`
- `context.read`
- `context.watch`
- `context.select`
- Encapsulación de coleccións
- `List.unmodifiable`
- Modelos inmutables
- `initState`
- `late final`
- `widget`
- Identificadores temporais
- `getGardenById`
- CRUD en memoria

### Implementación realizada

Creouse:

```text
viewmodels/
└── gardens_viewmodel.dart
```

O estado das hortas trasladouse desde `GardensScreen` a `GardensViewModel`.

Provider configurouse no nivel superior da aplicación para compartir unha única instancia do ViewModel.

`GardensScreen` deixou de utilizar mock data e pasou a observar a colección do ViewModel.

`CreateGardenScreen` utiliza o ViewModel para crear hortas.

`DashboardScreen` obtén dinamicamente o número de hortas mediante `context.select`.

Implementouse `EditGardenScreen` para modificar hortas existentes.

`GardenDetailsScreen` pasou a traballar mediante `gardenId` e obtén a versión actual da entidade desde o ViewModel.

Implementáronse as operacións:

```dart
addGarden()
getGardenById()
updateGarden()
removeGarden()
```

### Resultado

Primeiro CRUD completo en memoria de MARTOLA:

```text
CREATE → CreateGardenScreen
READ   → GardensScreen / GardenDetailsScreen
UPDATE → EditGardenScreen
DELETE → GardenDetailsScreen
```

O estado mantense sincronizado mediante:

```text
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

```text
_gardens = []
```

A seguinte evolución arquitectónica deberá separar a xestión de estado do acceso aos datos mediante Repository e posteriormente integrar SQLite.

---

---

## Sesión 12 - Repository Pattern e separación do acceso aos datos

### Status

✅ Completed

### Obxectivos

- Comprender a responsabilidade da capa Repository.
- Separar a xestión do estado do acceso aos datos.
- Extraer o almacenamento temporal de `GardensViewModel`.
- Introducir inxección de dependencias.
- Reducir o acoplamento entre ViewModel e fonte de datos.
- Preparar a arquitectura para SQLite.

### Conceptos aprendidos

- Repository Pattern.
- Separación de responsabilidades.
- Abstracción.
- Clases abstractas.
- `implements`.
- Contratos entre capas.
- Inxección de dependencias.
- Inversión de dependencias.
- Dependencia respecto dunha abstracción.
- Implementacións substituíbles.
- Punto de composición.
- Identidade das entidades.
- Delegación de responsabilidades.

### Evolución arquitectónica

Ao finalizar a sesión 11, o fluxo era:

```text
Views
  ↓
GardensViewModel
  ↓
List<Garden>
```

`GardensViewModel` era responsable tanto do estado de presentación como do almacenamento temporal e das operacións sobre os datos.

Durante a sesión 12 introduciuse a capa Repository:

```text
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

```dart
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

Esta clase define que operacións debe proporcionar un Repository de hortas, pero non determina como deben implementarse.

### MemoryGardenRepository

Creouse:

```text
repositories/
├── garden_repository.dart
└── memory_garden_repository.dart
```

`MemoryGardenRepository` implementa `GardenRepository` e constitúe a fonte de datos temporal do módulo.

É responsable actualmente de:

- Manter a colección `_gardens`.
- Xerar identificadores temporais.
- Engadir hortas.
- Buscar hortas mediante o seu ID.
- Actualizar hortas.
- Eliminar hortas.
- Conservar o identificador dunha horta durante unha actualización.

A colección e o contador deixaron de pertencer a `GardensViewModel`.

### GardensViewModel

`GardensViewModel` recibe agora o Repository mediante o construtor:

```dart
final GardenRepository repository;

GardensViewModel({
  required this.repository,
});
```

O ViewModel delega nel as operacións relacionadas cos datos:

```text
GardensViewModel
       ↓
GardenRepository
```

A súa responsabilidade céntrase en:

- Recibir accións procedentes das Views.
- Coordinarse coa capa Repository.
- Expoñer os datos necesarios para a interface.
- Notificar cambios mediante `notifyListeners()` cando corresponda.

### Inxección de dependencias

`GardensViewModel` non crea internamente un `MemoryGardenRepository`.

A implementación concreta selecciónase desde `main.dart`:

```text
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

Isto converte `main.dart` no punto de composición actual destas dependencias.

### Dependencia dunha abstracción

O ViewModel depende de:

```dart
GardenRepository
```

e non directamente de:

```dart
MemoryGardenRepository
```

Isto permite utilizar diferentes implementacións mantendo o mesmo ViewModel:

```text
                 ┌── MemoryGardenRepository
                 │
GardensViewModel → GardenRepository
                 │
                 └── SQLiteGardenRepository
```

Esta decisión permite:

- Substituír a implementación en memoria por SQLite.
- Evitar cambios nas Views ao cambiar a fonte de datos.
- Reducir o acoplamento.
- Crear implementacións alternativas.
- Facilitar futuras probas mediante Repositories específicos para testing.

### Actualización mediante identidade

As operacións que modifican unha entidade existente evolucionaron para utilizar o seu identificador.

Por exemplo:

```dart
updateGarden(String gardenId, Garden updatedGarden)
```

O Repository:

1. Localiza a entidade mediante `gardenId`.
2. Obtén a súa posición.
3. Constrúe a nova versión.
4. Conserva o identificador existente.
5. Substitúe a entidade anterior.

Deste modo a identidade dunha horta non depende da instancia concreta do obxecto recibida pola interface.

### Resultado

Ao finalizar a sesión existe un CRUD completo en memoria mantendo separadas as responsabilidades:

```text
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

- Crear funciona.
- Consultar funciona.
- Editar funciona.
- Eliminar funciona.
- As Views continúan actualizándose mediante Provider.
- O Dashboard continúa mostrando o número correcto de hortas.
- O cambio de arquitectura non require modificar as Views.

### Limitación actual

`MemoryGardenRepository` continúa almacenando os datos exclusivamente en memoria.

Ao finalizar a aplicación pérdese a colección.

A seguinte implementación prevista será:

```text
GardenRepository
        ↑
SQLiteGardenRepository
        ↓
DatabaseService
        ↓
SQLite
```

### Seguinte paso

A integración de SQLite introducirá unha nova necesidade: as operacións de acceso aos datos deixarán de ser exclusivamente síncronas.

Na seguinte sesión estudaranse no contexto real de MARTOLA:

- `Future`
- `async`
- `await`

e analizarase como debe evolucionar o contrato `GardenRepository` para soportar unha implementación baseada en SQLite.

### Skills Acquired

- Diferenciar estado de presentación e acceso aos datos.
- Identificar correctamente a responsabilidade dun Repository.
- Extraer responsabilidades dun ViewModel.
- Definir un contrato mediante unha clase abstracta.
- Implementar un contrato mediante `implements`.
- Aplicar inxección de dependencias.
- Depender dunha abstracción en lugar dunha implementación concreta.
- Deseñar unha arquitectura preparada para substituír a fonte de datos.
- Utilizar identificadores para localizar entidades independentemente da instancia do modelo.

### Documentation Updated

- `DEVELOPMENT_GUIDE.md`
- `PROJECT_CONTEXT.md`
- `ARCHITECTURE.md`
- `ROADMAP.md`
- `LEARNING_NOTES.md`

### Commit

Pendente ao finalizar a actualización da documentación.

### Notes

A sesión 12 supón a transición desde un ViewModel que tamén almacenaba os datos cara a unha arquitectura cunha capa de acceso aos datos claramente separada.

A implementación continúa sendo deliberadamente sinxela e en memoria, pero a aplicación queda preparada para introducir persistencia real sen acoplar as Views nin `GardensViewModel` a SQLite.

---

## Sesión 13 - Asincronía e persistencia con SQLite

### Status

🟡 In Progress

### Obxectivos

- Comprender o funcionamento de `Future`.
- Introducir `async` e `await`.
- Adaptar a arquitectura Repository a operacións asíncronas.
- Preparar `GardensViewModel` para unha fonte de datos persistente.
- Adaptar as Views ás operacións asíncronas.
- Introducir a carga inicial de datos.
- Implementar a infraestrutura SQLite.
- Implementar `DatabaseService`.
- Comprender a conversión entre modelos Dart e filas SQLite.
- Crear `SQLiteGardenRepository`.
- Implementar o CRUD persistente do módulo de hortas.
- Integrar SQLite mediante inxección de dependencias.
- Comprender o versionado e as migracións dunha base de datos.

### Conceptos aprendidos

- `Future<T>`.
- `async`.
- `await`.
- Operacións asíncronas.
- Espera dunha operación antes de continuar o fluxo.
- `context.mounted`.
- Estado local do ViewModel.
- Sincronización entre Repository e ViewModel.
- Carga inicial de datos.
- Operador de cascada `..`.
- Separación entre Repository e Database Service.
- Factorías de base de datos.
- Detección da plataforma mediante `Platform`.
- SQLite multiplataforma.
- Construción de rutas multiplataforma.
- Getter asíncrono.
- Operador `??=`.
- `Map<String, Object?>`.
- Conversión modelo → fila mediante `toMap()`.
- Conversión fila → modelo mediante `fromMap()`.
- `db.query()`.
- `db.insert()`.
- `db.update()`.
- `db.delete()`.
- `where`.
- `whereArgs`.
- `INTEGER PRIMARY KEY AUTOINCREMENT`.
- Número de filas afectadas por unha operación SQL.
- Separación entre Repository e infraestrutura de base de datos.
- Persistencia local real.

### Evolución do GardenRepository

O contrato `GardenRepository` evolucionou para permitir fontes de datos asíncronas.

As operacións pasan a devolver `Future`:

    abstract class GardenRepository {
      Future<List<Garden>> getGardens();

      Future<Garden> addGarden(Garden garden);

      Future<Garden?> getGardenById(String id);

      Future<Garden?> updateGarden(
        String gardenId,
        Garden updatedGarden,
      );

      Future<bool> removeGarden(String id);
    }

Esta modificación permite que o mesmo contrato poida ser implementado tanto por un Repository en memoria como por unha futura implementación SQLite.

### MemoryGardenRepository asíncrono

`MemoryGardenRepository` foi adaptado ao novo contrato.

A implementación continúa utilizando unha colección en memoria, pero os seus métodos devolven agora `Future`.

Isto permite probar a arquitectura asíncrona antes de introducir SQLite real.

### Evolución de GardensViewModel

`GardensViewModel` mantén agora unha colección propia que representa o estado actualmente dispoñible para a interface:

    final List<Garden> _gardens = [];

    List<Garden> get gardens =>
        List.unmodifiable(_gardens);

O Repository continúa sendo a fonte de datos, mentres que o ViewModel mantén o estado preparado para ser consumido polas Views.

O fluxo pasa a ser:

    Fonte de datos
          ↓
    GardenRepository
          ↓ async
    GardensViewModel
          ↓
    _gardens
          ↓ sync
    Views

Deste modo, o acceso á fonte de datos pode ser asíncrono sen obrigar ás Views a traballar directamente con `Future`.

### Carga inicial

Engadiuse:

    Future<void> loadGardens() async {
      final gardens = await repository.getGardens();

      _gardens.clear();
      _gardens.addAll(gardens);

      notifyListeners();
    }

A carga inicial execútase ao crear o ViewModel desde Provider:

    GardensViewModel(
      repository: MemoryGardenRepository(),
    )..loadGardens()

Isto prepara a aplicación para recuperar automaticamente as hortas almacenadas cando se introduza SQLite.

### Sincronización do CRUD

As operacións de creación, actualización e eliminación:

1. Esperan mediante `await` pola resposta do Repository.
2. Actualizan o estado local de `GardensViewModel`.
3. Executan `notifyListeners()`.

Isto evita realizar unha segunda carga completa da colección despois de cada operación.

### Adaptación das Views

`CreateGardenScreen`, `EditGardenScreen` e `GardenDetailsScreen` foron adaptadas para esperar polas operacións asíncronas.

Patrón empregado:

    await context
        .read<GardensViewModel>()
        .addGarden(garden);

    if (!context.mounted) {
      return;
    }

    Navigator.of(context).pop();

Introduciuse `context.mounted` para comprobar que o contexto continúa sendo válido despois dunha operación asíncrona antes de utilizalo novamente.

O mesmo principio foi aplicado aos fluxos de edición e eliminación.

### Consulta síncrona desde as Views

Aínda que o Repository ofrece:

    Future<Garden?> getGardenById(String id)

o ViewModel pode consultar sincronamente a súa colección xa cargada:

    Garden? getGardenById(String id) {
      for (final garden in _gardens) {
        if (garden.id == id) {
          return garden;
        }
      }

      return null;
    }

Isto permite manter chamadas como:

    context.select<GardensViewModel, Garden?>(...)

sen expoñer a asincronía da persistencia directamente á interface.

### Preparación de SQLite

Instaláronse as dependencias necesarias para preparar unha solución SQLite multiplataforma:

    sqflite
    sqflite_common_ffi
    path
    path_provider

A estratexia inicial é:

    Android
       ↓
    sqflite

    Windows / Linux
       ↓
    sqflite_common_ffi

### DatabaseService

Implementouse:

    lib/
        └── services/
            └── database_service.dart

A súa responsabilidade é:

- Determinar a ruta do ficheiro da base de datos.
- Abrir a base de datos.
- Xestionar e reutilizar a conexión.
- Crear o esquema inicial.
- Proporcionar acceso á instancia de `Database`.
- Servir como punto central para futuras versións e migracións.

A conexión obtense mediante un getter asíncrono:

    Future<Database> get database async {
      _database ??= await _openDatabase();

      return _database!;
    }

O operador `??=` permite abrir a base de datos unicamente cando `_database` aínda non contén unha instancia.

Os Repositories son responsables das operacións relacionadas coas súas entidades, mentres que `DatabaseService` se encarga da infraestrutura común da base de datos.

A arquitectura actualmente implementada é:

    Views
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

### Soporte multiplataforma

`DatabaseService` seleccionará a factoría de base de datos segundo a plataforma.

Para Windows e Linux utilizarase:

    sqfliteFfiInit();
    databaseFactoryFfi;

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

Para permitir a conversión entre o modelo de dominio e a representación da base de datos, `Garden` incorpora:

    Garden.fromMap(...)

e:

    toMap()

`fromMap()` constrúe unha instancia de `Garden` a partir dunha fila recuperada da base de datos.

`toMap()` transforma os atributos dunha instancia de `Garden` nun:

    Map<String, Object?>

que pode ser utilizado nas operacións SQLite.

O fluxo é:

    SQLite
      ↓
    Map<String, Object?>
      ↓
    Garden.fromMap()
      ↓
    Garden

e na dirección contraria:

    Garden
      ↓
    toMap()
      ↓
    Map<String, Object?>
      ↓
    SQLite

- Getter asíncrono.
- Operador `??=`.
- `Map<String, Object?>`.
- Conversión modelo → fila mediante `toMap()`.
- Conversión fila → modelo mediante `fromMap()`.
- `db.query()`.
- `db.insert()`.
- `db.update()`.
- `db.delete()`.
- `where`.
- `whereArgs`.
- `INTEGER PRIMARY KEY AUTOINCREMENT`.
- Número de filas afectadas por unha operación SQL.
- Separación entre Repository e infraestrutura de base de datos.
- Persistencia local real.

### SQLiteGardenRepository

Creouse:

    repositories/
    └── sqlite_garden_repository.dart

`SQLiteGardenRepository` implementa o contrato `GardenRepository` utilizando SQLite como fonte persistente de datos.

Recibe `DatabaseService` mediante inxección de dependencias:

    SQLiteGardenRepository(
      databaseService: databaseService,
    )

As operacións implementadas son:

    getGardens()
    addGarden()
    updateGarden()
    removeGarden()

`getGardens()`:

1. Obtén a conexión mediante `DatabaseService`.
2. Consulta a táboa `gardens`.
3. Recibe unha colección de mapas.
4. Converte cada mapa nun `Garden` mediante `Garden.fromMap()`.
5. Devolve unha `List<Garden>`.

`addGarden()`:

1. Converte o modelo mediante `toMap()`.
2. Insire a fila na táboa `gardens`.
3. Obtén o identificador xerado por SQLite.
4. Constrúe e devolve un novo `Garden` co identificador definitivo.

`updateGarden()`:

1. Localiza a fila mediante o identificador.
2. Converte os novos datos mediante `toMap()`.
3. Executa `db.update()`.
4. Comproba o número de filas afectadas.
5. Devolve a versión actualizada da entidade cando a operación ten éxito.

`removeGarden()`:

1. Localiza a fila mediante o identificador.
2. Executa `db.delete()`.
3. Comproba o número de filas afectadas.
4. Devolve se a eliminación tivo éxito.

### Comprobación funcional

Tras integrar SQLite comprobouse que:

- A aplicación arranca correctamente.
- `martola.db` créase correctamente.
- A táboa `gardens` existe.
- Crear hortas funciona.
- Consultar hortas funciona.
- Editar hortas funciona.
- Eliminar hortas funciona.
- O estado continúa sincronizado mediante Provider.
- `loadGardens()` recupera os datos desde SQLite.
- O Dashboard continúa mostrando o número correcto de hortas.
- Os identificadores son xerados por SQLite.
- As hortas permanecen almacenadas despois de pechar e volver abrir a aplicación.

A persistencia real do primeiro módulo de MARTOLA queda así verificada.

### Estado actual

A primeira integración SQLite está completada e funcionando.

O módulo de hortas dispón agora dun CRUD persistente completo:

    CREATE
      ↓
    SQLiteGardenRepository.addGarden()

    READ
      ↓
    SQLiteGardenRepository.getGardens()

    UPDATE
      ↓
    SQLiteGardenRepository.updateGarden()

    DELETE
      ↓
    SQLiteGardenRepository.removeGarden()

A aplicación recupera automaticamente as hortas almacenadas ao iniciar mediante:

    GardensViewModel
          ↓
    loadGardens()
          ↓
    GardenRepository
          ↓
    SQLiteGardenRepository
          ↓
    martola.db

A persistencia foi comprobada pechando e volvendo iniciar a aplicación.

### Seguinte paso

Antes de considerar pechada a Session 13 estudarase como debe evolucionar unha base de datos SQLite cando cambia o seu esquema.

Os seguintes conceptos serán:

1. Versión dunha base de datos.
2. Cambios de esquema.
3. Migracións.
4. Conservación dos datos existentes.
5. Evolución de `DatabaseService`.

Unha vez comprendidos e preparada a infraestrutura necesaria, realizarase unha revisión final da arquitectura de persistencia e pecharase a Session 13.

### Documentation Updated

- `DEVELOPMENT_GUIDE.md`
- `PROJECT_CONTEXT.md`
- `ARCHITECTURE.md`
- `DATABASE_DESIGN.md`
- `ROADMAP.md`
- `LEARNING_NOTES.md`

### Commit

Pendente ao finalizar a Session 13.

### Notes

A Session 13 supón a transición definitiva desde unha fonte de datos temporal en memoria cara á primeira persistencia real de MARTOLA.

A arquitectura preparada nas sesións anteriores permitiu substituír `MemoryGardenRepository` por `SQLiteGardenRepository` sen modificar as Views e mantendo `GardensViewModel` desacoplado da tecnoloxía de persistencia.

A implementación confirma na práctica a utilidade do Repository Pattern, a inxección de dependencias e a separación entre estado de presentación e acceso aos datos.

Antes de pechar a sesión queda pendente introducir o versionado e as migracións necesarias para permitir que o esquema SQLite evolucione de forma segura.