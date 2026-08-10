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

Phase 1 - Flutter Fundamentals

## Next Action

Comezar a Session 1 e crear a primeira HomeScreen de MARTOLA.

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

🟡 In Progress (75%)

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

⬜ Pending

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

⬜ Pending

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

⬜ Pending

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

⬜ Pending

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

⬜ Pending

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

⬜ Pending

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

⬜ Pending

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

⬜ Pending

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

⬜ Pending

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