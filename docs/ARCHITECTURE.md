# ARCHITECTURE.md

# MARTOLA - Architecture Documentation

## Purpose

Este documento define a arquitectura software da aplicación MARTOLA.

O seu obxectivo é proporcionar unha guía clara para:

- Organización do código.
- Separación de responsabilidades.
- Escalabilidade futura.
- Mantemento do proxecto.

---

# Architecture Overview

A aplicación seguirá unha arquitectura baseada en MVVM (Model-View-ViewModel) simplificada combinada cun patrón Repository.

O fluxo principal será:

View
↓
ViewModel
↓
Repository
↓
Database / API
↓
SQLite / External Services

## Current Implementation State

A arquitectura completa está definida e a súa implementación realízase de maneira incremental.

Ao finalizar a sesión 11, o módulo de hortas chegou ao seguinte nivel:

```text
View
 ↓
GardensViewModel
 ↓
Estado en memoria
```

Xa están implementadas e separadas as capas de:

```text
View
 ↓
ViewModel
```

Provider permite compartir unha única instancia de `GardensViewModel` entre as diferentes Views da aplicación.

`GardensViewModel` actúa actualmente como fonte de verdade para o estado das hortas e centraliza as operacións:

```text
addGarden()
getGardenById()
updateGarden()
removeGarden()
```

As capas seguintes continúan pendentes de implementación:

```text
Repository
 ↓
DatabaseService
 ↓
SQLite
```

Polo tanto, os datos das hortas aínda se almacenan exclusivamente en memoria e desaparecen ao finalizar a aplicación.

A seguinte evolución arquitectónica será introducir o Repository para separar a xestión do estado do acceso aos datos.

A arquitectura evolucionará progresivamente cara ao fluxo definitivo:

```text
View
 ↓
ViewModel
 ↓
Repository
 ↓
Database / API
 ↓
SQLite / External Services
```

---

# Architecture Layers

## Model Layer

Responsable de representar os datos e entidades do dominio da aplicación.

Os modelos deben ser independentes da súa representación visual e, na medida do posible, da fonte concreta da que procedan os datos.

Funcións:

- Representar entidades do dominio.
- Definir os datos asociados a cada entidade.
- Proporcionar tipos claros entre as diferentes capas da aplicación.

Non debe conter:

- Widgets.
- Navegación.
- Consultas SQL directas.
- Chamadas HTTP.
- Lóxica específica da interface.

Exemplo actualmente implementado:

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

O identificador pode ser `null` antes de que a entidade entre no estado compartido ou sexa almacenada na futura capa de persistencia.

Durante a fase actual, sen SQLite, `GardensViewModel` asigna temporalmente identificadores ás hortas mediante un contador interno.

Esta estratexia é provisional e será substituída polo mecanismo de identificación definido pola futura capa de persistencia.

Os modelos de dominio manteranse, na medida do posible, inmutables. Por este motivo, a actualización dunha entidade realízase creando unha nova instancia cos datos modificados en lugar de modificar directamente a instancia existente.

Modelos previstos:

- `User`
- `Garden`
- `PlantSpecies`
- `GardenPlant`
- `PlantEvolutionRecord`
- `WeatherRecord`
- `GardenLayoutItem`

## View Layer

Responsable da interface gráfica.

Funcións:

- Mostrar información.
- Capturar interaccións do usuario.
- Xestionar a navegación cando a pantalla coñece o fluxo correspondente.
- Delegar progresivamente a lóxica de presentación ao ViewModel.
- Comunicar interaccións desde widgets de presentación mediante callbacks.

Non debe conter:

- Consultas SQL.
- Chamadas HTTP directas.
- Acceso directo á futura base de datos.
- Regras de negocio complexas.

Exemplos actualmente implementados:

- `HomeScreen`
- `DashboardScreen`
- `GardensScreen`
- `GardenDetailsScreen`
- `CreateGardenScreen`
- `TasksScreen`
- `CreateTaskScreen`
- `EditGardenScreen`

O módulo de hortas xa non almacena a súa colección de datos directamente nas Views.

As pantallas relacionadas co módulo acceden ao estado compartido mediante `GardensViewModel` e Provider.

As Views manteñen unicamente o estado local que pertence á propia interface, como os `TextEditingController` e o `FormState` dos formularios.

---

## Presentation Widgets

Os compoñentes visuais reutilizables ou específicos dunha funcionalidade deben limitarse, sempre que sexa posible, á presentación dos datos e á comunicación das interaccións.

Exemplos actualmente implementados:

### Dashboard

- `WeatherCard`
- `GardenCard`
- `TasksCard`
- `QuickActionsCard`

### Gardens

- `GardenListItem`

Os widgets de presentación non deben coñecer innecesariamente o fluxo global da aplicación.

As interaccións comunícanse ao widget pai mediante callbacks.

Exemplo sen parámetros:

```dart
final VoidCallback onViewGardens;
```

Exemplo cun modelo como parámetro:

```dart
final void Function(Garden) onTap;
```

Fluxo recomendado:

```text
Presentation Widget
        ↓
     Callback
        ↓
      Screen
        ↓
Navigation / ViewModel
```

Deste modo, a responsabilidade da navegación permanece na pantalla que coñece o fluxo da aplicación.

Os widgets específicos dunha funcionalidade permanecerán dentro do directorio desa funcionalidade mentres non exista unha necesidade real de reutilización global.

---

## ViewModel Layer

Responsable da lóxica de presentación e da xestión do estado compartido asociado ás Views.

Funcións:

- Procesar accións solicitadas polas Views.
- Manter o estado compartido necesario para a interface.
- Expoñer os datos sen permitir modificacións externas non controladas.
- Notificar cambios mediante `ChangeNotifier`.
- Solicitar datos aos repositorios cando estes sexan implementados.
- Preparar os datos necesarios para as Views.

### GardensViewModel

Primeiro ViewModel funcional implementado no proxecto.

Actualmente é responsable de:

- Manter a colección de hortas en memoria.
- Asignar identificadores temporais.
- Crear hortas.
- Recuperar unha horta mediante o seu identificador.
- Actualizar hortas.
- Eliminar hortas.
- Notificar cambios ás Views.

Operacións actuais:

```dart
addGarden()
getGardenById()
updateGarden()
removeGarden()
```

A colección interna:

```dart
final List<Garden> _gardens = [];
```

mantense privada.

As Views acceden a ela mediante:

```dart
List<Garden> get gardens =>
    List.unmodifiable(_gardens);
```

Isto evita modificacións directas desde a interface.

As modificacións deben realizarse mediante as operacións proporcionadas polo ViewModel.

### ViewModels previstos

- `HomeViewModel`
- `PlantDetailViewModel`
- Outros ViewModels que resulten necesarios segundo evolucione a aplicación.
---

## Repository Layer

Responsable do acceso aos datos.

Funcións:

- Abstraer a fonte dos datos.
- Combinar SQLite e APIs.
- Proporcionar unha interface común.

Exemplos:

- GardenRepository
- PlantRepository
- WeatherRepository

---

## Data Layer

Responsable do almacenamento.

Fontes previstas:

### SQLite

Persistencia local.

### APIs externas

Inicialmente:

- OpenWeatherMap

Futuras:

- APIs botánicas
- Servizos cloud

---

# Folder Structure

lib/
├── core/
│
├── models/
│
├── views/
│
├── viewmodels/
│
├── repositories/
│
├── services/
│
├── database/
│
├── widgets/
│
├── utils/
│
└── main.dart

---

# Folder Description

## core/

Configuración global.

Contido previsto:

- themes
- constants
- routes

---

## models/

Modelos de datos.

Exemplos:

- User
- Garden
- PlantSpecies
- GardenPlant
- WeatherRecord

---

## views/

Pantallas da aplicación.

Exemplos:

- home_screen.dart
- gardens_screen.dart
- garden_detail_screen.dart

---

## viewmodels/

Lóxica de presentación e estado compartido.

Actualmente implementado:

```text
viewmodels/
└── gardens_viewmodel.dart
```

Futuros ViewModels engadiranse cando exista unha responsabilidade concreta que xustifique a súa creación.

---

## repositories/

Acceso aos datos.

Exemplos:

- garden_repository.dart
- plant_repository.dart
- weather_repository.dart

---

## services/

Servizos externos.

Exemplos:

- weather_service.dart
- storage_service.dart

---

## database/

Configuración SQLite.

Exemplos:

- database_service.dart
- migrations/

---

## widgets/

Compoñentes reutilizables a nivel global da aplicación.

Só deben situarse neste directorio os widgets que teñan unha reutilización real entre diferentes funcionalidades.

Exemplo:

- `martola_logo.dart`

Os widgets específicos dunha funcionalidade deben permanecer dentro do seu módulo.

Exemplo:

```text
views/
├── dashboard/
│   └── widgets/
│       ├── weather_card.dart
│       ├── garden_card.dart
│       ├── tasks_card.dart
│       └── quick_actions_card.dart
│
└── gardens/
    └── widgets/
        └── garden_list_item.dart
```

Isto evita converter `widgets/` nun directorio global con compoñentes que realmente só pertencen a unha funcionalidade concreta.

---

## utils/

Utilidades xerais.

Exemplos:

- date_utils.dart
- validators.dart

---

# State Management

## Provider

Provider é o sistema principal de xestión e distribución do estado compartido da aplicación.

Motivos:

- Sinxeleza.
- Boa integración con Flutter.
- Curva de aprendizaxe moderada.
- Adecuado para o tamaño do proxecto.
- Permite separar o estado das Views.
- Facilita que diferentes pantallas compartan unha mesma fonte de verdade.

## Current Status

Provider está integrado e funcional no módulo de hortas.

`GardensViewModel` estende:

```dart
ChangeNotifier
```

e utiliza:

```dart
notifyListeners();
```

para informar ás Views cando cambia o estado.

A instancia do ViewModel proporciónase por enriba de `MaterialApp` mediante:

```dart
ChangeNotifierProvider
```

O fluxo actual é:

```text
ChangeNotifierProvider
        ↓
GardensViewModel
        ↓
   estado compartido
        ↓
 ┌──────┼───────────┐
 ↓      ↓           ↓
Dashboard   GardensScreen   GardenDetailsScreen
```

### context.read

Utilízase cando unha View necesita executar unha acción sobre o ViewModel pero non necesita reaccionar aos seus cambios.

Exemplo:

```dart
context
    .read<GardensViewModel>()
    .addGarden(garden);
```

### context.watch

Utilízase cando unha View depende do estado do ViewModel e debe reconstruírse cando este cambia.

Exemplo:

```dart
final gardensViewModel =
    context.watch<GardensViewModel>();
```

### context.select

Utilízase cando unha View só necesita observar unha parte concreta do estado.

Exemplo:

```dart
final gardenCount =
    context.select<GardensViewModel, int>(
        (viewModel) => viewModel.gardens.length,
    );
```

Isto permite limitar reconstrucións innecesarias.

Tamén se utiliza para obter a versión actual dunha entidade concreta:

```dart
final garden =
    context.select<GardensViewModel, Garden?>(
        (viewModel) =>
            viewModel.getGardenById(gardenId),
    );
```

## Provider vs Persistence

Provider non constitúe unha capa de persistencia.

Actualmente:

```text
Provider
 ↓
GardensViewModel
 ↓
Estado en memoria
```

Ao finalizar a aplicación, o estado desaparece.

A futura arquitectura será:

```text
Provider
 ↓
ViewModel
 ↓
Repository
 ↓
SQLite
```

Provider continuará xestionando e distribuíndo o estado mentres SQLite será responsable da persistencia.

---

# Local State vs Shared Application State

Non todo estado da aplicación debe ser xestionado mediante Provider.

## Local State

Pertence exclusivamente a unha pantalla ou widget concreto.

Exemplo actual:

```text
CreateGardenScreen
├── nameController
├── locationController
├── areaController
└── formKey
```

Estes recursos forman parte do estado local do formulario e son responsabilidade de `_CreateGardenScreenState`.

## Shared Application State

Representa datos que deben ser accesibles ou observables desde diferentes partes da aplicación.

Exemplos:

- Lista de hortas — actualmente xestionada por `GardensViewModel`.
- Lista de plantas dunha horta — prevista.
- Tarefas pendentes — prevista.
- Información meteorolóxica compartida — prevista.

Este tipo de estado xestiónase mediante ViewModels e Provider cando debe ser compartido ou observado por diferentes partes da aplicación.

A regra xeral será:

```text
Só o necesita un widget/pantalla
            ↓
       Estado local

Necesítano varias partes da aplicación
            ↓
   ViewModel + Provider
```

---

# Navigation

## Current Strategy

Durante a primeira versión utilizarase o `Navigator` estándar de Flutter mediante `Navigator.push()` e `Navigator.pop()`.

Esta aproximación é suficiente para os fluxos actuais e evita introducir complexidade adicional durante as primeiras fases do proxecto.

Exemplo:

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => const GardensScreen(),
  ),
);
```

As pantallas poden recibir os datos mínimos necesarios para identificar o recurso que deben representar.

No módulo de hortas, `GardenDetailsScreen` recibe actualmente o identificador:

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => GardenDetailsScreen(
      gardenId: garden.id!,
    ),
  ),
);
```

A pantalla utiliza posteriormente ese identificador para obter a versión actual da entidade desde `GardensViewModel`.

```text
GardensScreen
      ↓
gardenId
      ↓
GardenDetailsScreen
      ↓
GardensViewModel
      ↓
getGardenById()
```

Isto evita que unha pantalla de longa duración conserve unha instancia antiga dunha entidade despois dunha actualización.

`Navigator.pop()` continúa utilizándose para pechar rutas:

```dart
Navigator.of(context).pop();
```

A devolución de resultados mediante `Navigator.pop(result)` segue sendo unha ferramenta válida de Flutter, pero non se utiliza para sincronizar o estado compartido do módulo de hortas, xa que esa responsabilidade corresponde ao ViewModel.

## Navigation Responsibility

Os widgets puramente visuais non deben controlar directamente a navegación cando non coñecen o fluxo da aplicación.

Estes widgets comunicarán a interacción mediante callbacks.

A pantalla que coñece o fluxo será responsable de executar a navegación.

Exemplo:

```text
GardenListItem
      ↓
onTap(garden)
      ↓
GardensScreen
      ↓
Navigator.push()
      ↓
GardenDetailsScreen
```

## Future Evolution

Se a complexidade da navegación aumenta significativamente, poderá avaliarse posteriormente a utilización de solucións como GoRouter.

Non se introducirá esta complexidade mentres o `Navigator` estándar cubra correctamente as necesidades do proxecto.

---

## Current Dependency Flow

Actualmente, no módulo de hortas:

```text
View
 ↓
GardensViewModel
 ↓
Estado en memoria
```

Seguinte evolución:

```text
View
 ↓
GardensViewModel
 ↓
GardenRepository
 ↓
DatabaseService
 ↓
SQLite
```

---

# Local First Strategy

A aplicación priorizará o almacenamento local.

Beneficios:

- Funciona sen conexión.
- Menor complexidade inicial.
- Desenvolvemento máis rápido.

A sincronización cloud poderá incorporarse posteriormente.

---

# Future Architecture Evolution

Posibles melloras futuras:

- Firebase
- Supabase
- Cloud Sync
- Authentication
- Push Notifications
- AI Services

---

# Notes

A arquitectura debe manterse simple durante as primeiras fases do proxecto.

O obxectivo principal é construír unha aplicación funcional antes de introducir capas adicionais de complexidade.

As futuras ampliacións deberán respectar a separación de responsabilidades definida neste documento.

---

