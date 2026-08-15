# UI_REFERENCE.md

# MARTOLA - User Interface Reference

## Purpose

Este documento describe a estrutura visual e funcional das pantallas da aplicación MARTOLA.

Non pretende definir o deseño visual final da aplicación. O seu obxectivo é servir como referencia para:

- Desenvolvemento en Flutter
- Deseño en Figma
- Organización da navegación
- Identificación de widgets reutilizables

**---**

# General Layout Rules

## Mobile First

Resolución base:

390 x 844

**---**

## Spacing System

Valores base:

- XS = 4
- SM = 8
- MD = 16
- LG = 24
- XL = 32

**---**

## Horizontal Padding

Padding estándar:

16 px

**---**

## Border Radius

Tarxetas e elementos principais:

12 px

**---**

# Reusable Widgets

Os widgets reutilizables poden ser globais ou específicos dunha funcionalidade.

Os widgets específicos dun módulo permanecerán dentro do directorio dese módulo mentres non exista unha necesidade real de reutilización global.

**---**

## MartolaLogo

### Descrición

Representa o elemento visual de identidade de MARTOLA.

### Uso actual

- HomeScreen

### Estado

✅ Implementado

**---**

## WeatherCard

### Descrición

Mostra un resumo da información meteorolóxica.

### Información actual

- Temperatura
- Estado meteorolóxico
- Localización

### Uso actual

- DashboardScreen

### Estado

✅ Implementado con datos ficticios.

A información será substituída posteriormente por datos procedentes do módulo meteorolóxico.

**---**

## GardenCard

### Descrición

Mostra un resumo da información relacionada coas hortas do usuario.

### Información actual

- Número de hortas dispoñibles.
- Acción para acceder ao módulo de hortas.

### Uso actual

- DashboardScreen

### Estado

✅ Implementado.

O número de hortas mostrado procede do estado compartido de `GardensViewModel`.

`DashboardScreen` obtén este valor mediante Provider e proporciónao ao widget como dato de presentación.

`GardenCard` non accede directamente ao ViewModel e mantense desacoplado da xestión do estado.

**---**

## TasksCard

### Descrición

Mostra un resumo das tarefas pendentes.

### Información actual

- Número de tarefas pendentes.
- Acción para acceder á lista de tarefas.

### Uso actual

- DashboardScreen

### Estado

✅ Implementado con datos ficticios.

**---**

## QuickActionsCard

### Descrición

Agrupa accesos directos ás accións máis frecuentes desde o Dashboard.

### Accións actuais

- Crear nova horta.
- Engadir nova tarefa.

### Uso actual

- DashboardScreen

### Estado

✅ Implementado

As accións dependentes dunha horta concreta, como engadir unha planta, non se mostrarán neste widget global e estarán dispoñibles dentro do contexto da horta correspondente.

**---**

## GardenListItem

### Descrición

Representa unha horta individual dentro do listado de hortas.

### Información

- Nome.
- Localización.
- Superficie.

### Interacción

Permite seleccionar a horta mediante `InkWell`.

A interacción comunícase mediante:

```dart
final void Function(Garden) onTap;
```

### Uso actual

- GardensScreen

### Estado

✅ Implementado

**---**

## PlantCard

### Descrición

Representará unha planta concreta.

### Información prevista

- Nome.
- Estado.
- Data de plantación.

### Uso previsto

- Listado de plantas dunha horta.

### Estado

⬜ Pendente

**---**

## ActionCard

### Descrición

Tarxeta prevista para proporcionar acceso rápido ás funcionalidades dunha horta.

### Uso previsto

- GardenDetailsScreen

### Accións previstas

- Plantas.
- Evolución.
- Meteoroloxía.
- Deseño visual.

### Estado

⬜ Pendente

**---**

## MainBottomNavigation

### Descrición

Posible barra principal de navegación para dispositivos móbiles.

### Estado

⬜ Pendente de validación durante a evolución da navegación.

A navegación actual utiliza `Navigator` estándar entre pantallas.

**---**

# Screens

## HomeScreen

### Propósito

Pantalla inicial de entrada á aplicación.

### Seccións actuais

- Identidade visual de MARTOLA.
- Nome da aplicación.
- Descrición breve.
- Botón de entrada.

### Widgets utilizados

- MartolaLogo
- Text
- ElevatedButton

### Navegación

```text
HomeScreen
    ↓
  Entrar
    ↓
DashboardScreen
```

### Estado

✅ Implementada

**---**

## DashboardScreen

### Propósito

Panel principal da aplicación e punto central de acceso aos diferentes módulos.

### Seccións actuais

- Resumo meteorolóxico.
- Resumo de hortas.
- Resumo de tarefas.
- Accións rápidas.

### Widgets utilizados

- WeatherCard
- GardenCard
- TasksCard
- QuickActionsCard

### Navegación actual

```text
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

### Estado

✅ Primeira versión funcional implementada.

A información mostrada combina actualmente datos reais do estado da aplicación con datos ficticios:

- O número de hortas procede de `GardensViewModel`.
- A información meteorolóxica continúa sendo ficticia.
- A información de tarefas continúa sendo ficticia.

Os datos ficticios substituiranse progresivamente polos módulos funcionais correspondentes.

**---**

## GardensScreen

### Propósito

Mostrar as hortas almacenadas no estado da aplicación e permitir seleccionar unha delas.

### Seccións actuais

- AppBar.
- Lista dinámica de hortas.

### Widgets utilizados

- ListView.builder
- GardenListItem

### Datos actuais

A colección de hortas procede de `GardensViewModel`.

A pantalla observa o estado mediante Provider:

```dart
context.watch<GardensViewModel>()
```

Deste xeito, a lista reconstrúese automaticamente cando se crean, editan ou eliminan hortas.

### Interacción

Ao seleccionar un `GardenListItem`, a pantalla recibe o modelo seleccionado mediante callback.

Para navegar ao detalle utilízase a identidade da horta:

```text
GardensScreen
      ↓
GardenListItem
      ↓
onTap(garden)
      ↓
garden.id
      ↓
GardenDetailsScreen
```

`GardenDetailsScreen` non depende da instancia recibida polo listado, senón que utiliza o identificador para consultar a versión actual da entidade no estado compartido.

### Estado

✅ Funcional con estado compartido mediante Provider.

✅ Persistencia mediante SQLite integrada.

**---**

## GardenDetailsScreen

### Propósito

Mostrar a información actual dunha horta concreta e actuar progresivamente como centro de control desa horta.

### Información actual

- Nome.
- Localización.
- Superficie.

### Entrada

A pantalla recibe:

```dart
String gardenId
```

mediante o constructor.

Non conserva unha copia independente da entidade como fonte de datos.

A versión actual da horta obtense desde `GardensViewModel` mediante:

```dart
getGardenById(gardenId)
```

e Provider.

O fluxo é:

```text
GardenDetailsScreen
        ↓
    gardenId
        ↓
GardensViewModel
        ↓
 getGardenById()
        ↓
   Garden actual
```

Deste xeito, se a horta é modificada, a pantalla pode reconstruírse mostrando a nova instancia almacenada no ViewModel.

### Accións actuais

- Editar horta.
- Eliminar horta.

### Eliminación

A eliminación utiliza o identificador da horta.

Antes de eliminar móstrase un diálogo de confirmación mediante `AlertDialog`.

Se o usuario confirma:

```text
GardenDetailsScreen
        ↓
removeGarden(gardenId)
        ↓
GardensViewModel
        ↓
eliminación do estado
```

### Funcionalidades previstas

- Plantas.
- Evolución.
- Meteoroloxía.
- Deseño da horta.
- Outras accións relacionadas coa horta.

### Estado

✅ Visualización funcional conectada ao estado compartido.

✅ Edición integrada.

✅ Eliminación integrada.

⏳ Funcionalidades específicas de plantas, meteoroloxía, evolución e deseño pendentes.

**---**

## CreateGardenScreen

### Propósito

Permitir introducir e validar os datos necesarios para crear unha nova horta.

### Tipo

StatefulWidget

### Campos actuais

- Nome.
- Localización.
- Superficie.

### Xestión do formulario

Utiliza:

- Form.
- GlobalKey<FormState>.
- TextFormField.
- TextEditingController.
- Validators.

### Validación

Compróbase que:

- O nome sexa válido.
- A localización sexa válida.
- A superficie poida converterse correctamente a `double`.
- A superficie cumpra as condicións definidas polo formulario.

### Resultado

Cando os datos son válidos:

1. Convértense os valores necesarios.
2. Créase unha instancia de `Garden`.
3. A pantalla solicita a creación mediante:

```dart
context
    .read<GardensViewModel>()
    .addGarden(garden);
```

4. `GardensViewModel` delega a creación no `GardenRepository`.
5. SQLite xera o identificador persistente.
6. A entidade devolta polo Repository incorpórase ao estado compartido.
7. `notifyListeners()` informa ás Views subscritas.
8. A pantalla péchase mediante `Navigator.pop()`.

O fluxo actual é:

```text
CreateGardenScreen
        ↓
    Garden
        ↓
GardensViewModel
        ↓
   addGarden()
        ↓
estado compartido
        ↓
notifyListeners()
```

### Estado

✅ Formulario funcional.

✅ Integrado coa xestión de estado mediante Provider.

✅ Persistencia mediante Repository e SQLite integrada.

**---**

## EditGardenScreen

### Propósito

Permitir modificar os datos dunha horta existente.

### Tipo

StatefulWidget

### Entrada

Recibe unha instancia de `Garden` coa información que debe mostrarse inicialmente no formulario.

### Campos

- Nome.
- Localización.
- Superficie.

### Inicialización

Os `TextEditingController` inicialízanse en `initState()` utilizando os valores da horta recibida.

```text
Garden
  ↓
initState()
  ↓
TextEditingController
  ↓
formulario cuberto
```

Os controladores decláranse mediante `late final` e libéranse posteriormente en `dispose()`.

### Validación

Utiliza as mesmas regras básicas de validación que `CreateGardenScreen`.

### Actualización

Cando os datos son válidos:

1. Créase unha nova instancia de `Garden`.
2. Consérvase o identificador da entidade orixinal.
3. Solicítase a actualización a `GardensViewModel`.
4. O ViewModel substitúe a instancia anterior.
5. `notifyListeners()` informa ás Views.
6. Péchase a pantalla de edición.

```text
EditGardenScreen
       ↓
updatedGarden
       ↓
GardensViewModel
       ↓
updateGarden()
       ↓
notifyListeners()
```

A actualización non modifica directamente a instancia existente porque o modelo `Garden` é inmutable.

### Estado

✅ Formulario funcional.

✅ Integrado con `GardensViewModel`.

✅ Persistencia dos cambios mediante Repository e SQLite integrada.

**---**

## TasksScreen

### Propósito

Mostrar as tarefas pendentes do usuario.

### Estado

🟡 Pantalla provisional creada.

A implementación funcional realizarase nunha fase posterior.

**---**

## CreateTaskScreen

### Propósito

Permitir crear unha nova tarefa.

### Estado

🟡 Pantalla provisional creada.

O formulario funcional implementarase nunha fase posterior.

**---**

## PlantDetailScreen

### Propósito

Seguemento dunha planta.

### Seccións

- Header
- Fotografía
- Información básica
- Notas
- Rexistros de evolución

### Widgets utilizados

- InfoRow
- EvolutionRecordCard

### Estado

⬜ Pendente

**---**

## LayoutDesignerScreen

### Propósito

Representación visual da horta.

### Seccións

- Header
- Barra de ferramentas
- Área de deseño
- Lista de plantas

### Widgets utilizados

- ToolButton
- LayoutCanvas
- PlantLayoutItem

### Estado

⬜ Pendente

**---**

# Current UI Flow

O fluxo actualmente implementado é:

```text
HomeScreen
    ↓
DashboardScreen
    │
    ├── GardensScreen
    │       ↓
    │  GardenListItem
    │       ↓
    │  GardenDetailsScreen
    │       ├── EditGardenScreen
    │       └── Eliminar horta
    │
    ├── TasksScreen
    │
    ├── CreateGardenScreen
    │       ↓
    │  GardensViewModel
    │       ↓
    │  estado compartido
    │
    └── CreateTaskScreen
```

O módulo de hortas utiliza actualmente Provider para compartir o estado entre as diferentes pantallas.

```text
DashboardScreen ────────┐
                        │
GardensScreen ──────────┼──→ GardensViewModel
                        │
GardenDetailsScreen ────┤
                        │
CreateGardenScreen ─────┤
                        │
EditGardenScreen ───────┘
```

A navegación continúa utilizando `Navigator` estándar e `MaterialPageRoute`.

Provider encárgase da sincronización do estado; Navigator encárgase do movemento entre pantallas.

A persistencia dos datos continúa pendente.

**---**

# Desktop Adaptation

## Main Navigation

A navegación inferior substituirase por:

- NavigationRail
- Sidebar

**---**

## Layout

En escritorio utilizaranse:

- múltiples columnas
- paneis simultáneos
- maior área de traballo

Especialmente en:

- GardenDetailsScreen
- LayoutDesignerScreen

**---**

# Future Screens

Pantallas previstas para futuras versións:

- LoginScreen
- RegisterScreen
- SettingsScreen
- NotificationsScreen
- StatisticsScreen

**---**

# Notes

A implementación actual continúa priorizando funcionalidade fronte a deseño visual.

Os módulos de hortas e plantas dispoñen xa dunha primeira interface funcional, polo que os refinamentos visuais poderán realizarse posteriormente sen alterar o fluxo básico de navegación.

O deseño definitivo definirase posteriormente mediante o Design System e os mockups de Figma.

Este documento considérase a referencia principal para a implementación das pantallas en Flutter.