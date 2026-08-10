# UI_REFERENCE.md

# MARTOLA - User Interface Reference

## Purpose

Este documento describe a estrutura visual e funcional das pantallas da aplicación MARTOLA.

Non pretende definir o deseño visual final da aplicación. O seu obxectivo é servir como referencia para:

- Desenvolvemento en Flutter
- Deseño en Figma
- Organización da navegación
- Identificación de widgets reutilizables

---

# General Layout Rules

## Mobile First

Resolución base:

390 x 844

---

## Spacing System

Valores base:

- XS = 4
- SM = 8
- MD = 16
- LG = 24
- XL = 32

---

## Horizontal Padding

Padding estándar:

16 px

---

## Border Radius

Tarxetas e elementos principais:

12 px

---

# Reusable Widgets

Os widgets reutilizables poden ser globais ou específicos dunha funcionalidade.

Os widgets específicos dun módulo permanecerán dentro do directorio dese módulo mentres non exista unha necesidade real de reutilización global.

---

## MartolaLogo

### Descrición

Representa o elemento visual de identidade de MARTOLA.

### Uso actual

- HomeScreen

### Estado

✅ Implementado

---

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

---

## GardenCard

### Descrición

Mostra un resumo da información relacionada coas hortas do usuario.

### Información actual

- Número de hortas dispoñibles.
- Acción para acceder ao módulo de hortas.

### Uso actual

- DashboardScreen

### Estado

✅ Implementado

---

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

---

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

---

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

---

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

---

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

---

## MainBottomNavigation

### Descrición

Posible barra principal de navegación para dispositivos móbiles.

### Estado

⬜ Pendente de validación durante a evolución da navegación.

A navegación actual utiliza `Navigator` estándar entre pantallas.

---

## GardenCard

### Descrición

Representa unha horta ou xardín.

### Información

- Nome
- Número de plantas
- Imaxe opcional

### Uso

- HomeScreen
- GardensScreen

---

## PlantCard

### Descrición

Representa unha planta concreta.

### Información

- Nome
- Estado
- Data de plantación

### Uso

- GardenPlantsScreen

---

## ActionCard

### Descrición

Tarxeta de acceso rápido a funcionalidades.

### Uso

- GardenDetailScreen

### Accións previstas

- Plantas
- Evolución
- Meteoroloxía
- Deseño Visual

---

## MainBottomNavigation

### Descrición

Barra principal de navegación.

### Seccións previstas

- Inicio
- Hortas
- Perfil

---

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

---

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
│      └── GardensScreen
│
├── TasksCard
│      └── TasksScreen
│
└── QuickActionsCard
       ├── CreateGardenScreen
       └── CreateTaskScreen
```

### Estado

✅ Primeira versión funcional implementada.

Os datos mostrados actualmente son ficticios e serán substituídos progresivamente por estado real da aplicación.

---

## GardensScreen

### Propósito

Mostrar as hortas dispoñibles e permitir seleccionar unha delas.

### Seccións actuais

- AppBar.
- Lista dinámica de hortas.

### Widgets utilizados

- ListView.builder
- GardenListItem

### Datos actuais

Utilízase temporalmente unha colección local de obxectos `Garden`.

### Interacción

Ao seleccionar un `GardenListItem`, a pantalla recibe o modelo seleccionado mediante callback e realiza a navegación.

```text
GardensScreen
      ↓
GardenListItem
      ↓
 onTap(garden)
      ↓
GardenDetailsScreen
```

### Estado

✅ Primeira versión funcional implementada.

⏳ Pendente de substituír os datos ficticios por estado compartido.

---

## GardenDetailsScreen

### Propósito

Mostrar a información dunha horta concreta e actuar progresivamente como centro de control desa horta.

### Información actual

- Nome.
- Localización.
- Superficie.

### Entrada

Recibe unha instancia de:

```dart
Garden
```

mediante o constructor.

### Funcionalidades previstas

- Plantas.
- Evolución.
- Meteoroloxía.
- Deseño da horta.
- Accións relacionadas coa horta.

### Estado

✅ Visualización básica implementada.

⏳ Funcionalidades específicas da horta pendentes.

---

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
3. A instancia devólvese á ruta anterior mediante `Navigator.pop()`.

### Estado

✅ Formulario funcional.

⏳ Pendente de conectar coa xestión de estado e persistencia.

---

## TasksScreen

### Propósito

Mostrar as tarefas pendentes do usuario.

### Estado

🟡 Pantalla provisional creada.

A implementación funcional realizarase nunha fase posterior.

---

## CreateTaskScreen

### Propósito

Permitir crear unha nova tarefa.

### Estado

🟡 Pantalla provisional creada.

O formulario funcional implementarase nunha fase posterior.

---

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

---

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

---

# Current UI Flow

O fluxo actualmente implementado é:

```text
HomeScreen
    ↓
DashboardScreen
    │
    ├── GardensScreen
    │       ↓
    │  GardenListItem
    │       ↓
    │  GardenDetailsScreen
    │
    ├── TasksScreen
    │
    ├── CreateGardenScreen
    │       ↓
    │    Garden
    │       ↓
    │  retorno á ruta anterior
    │
    └── CreateTaskScreen
```

Este fluxo representa a primeira versión navegable da aplicación.

A navegación utiliza actualmente `Navigator` estándar e `MaterialPageRoute`.

Os módulos irán adquirindo funcionalidade progresivamente sen modificar innecesariamente este fluxo base.

---

# Desktop Adaptation

## Main Navigation

A navegación inferior substituirase por:

- NavigationRail
- Sidebar

---

## Layout

En escritorio utilizaranse:

- múltiples columnas
- paneis simultáneos
- maior área de traballo

Especialmente en:

- GardenDetailScreen
- LayoutDesignerScreen

---

# Future Screens

Pantallas previstas para futuras versións:

- LoginScreen
- RegisterScreen
- SettingsScreen
- NotificationsScreen
- StatisticsScreen

---

# Notes

A implementación inicial priorizará funcionalidade fronte a deseño visual.

O deseño definitivo definirase posteriormente mediante o Design System e os mockups de Figma.

Este documento considérase a referencia principal para a implementación das pantallas en Flutter.