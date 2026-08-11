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

Durante a sesión 13 introduciuse asincronía na fronteira entre o ViewModel e a capa Repository.

O fluxo actual do módulo de hortas é:

    View
      ↓
    GardensViewModel
      ↓ async
    GardenRepository
      ↑
    MemoryGardenRepository
      ↓
    Estado en memoria

`GardenRepository` define agora un contrato asíncrono para permitir que as súas implementacións poidan acceder a fontes de datos que requiran operacións de entrada e saída.

`MemoryGardenRepository` continúa sendo a implementación temporal e mantén actualmente os datos mediante unha colección en memoria.

`GardensViewModel` mantén unha colección propia:

    List<Garden> _gardens

pero a súa responsabilidade xa non é actuar como fonte de persistencia.

Esta colección representa o estado actualmente cargado e preparado para ser consumido polas Views.

A separación actual é:

    MemoryGardenRepository
    → fonte de datos temporal

    GardensViewModel._gardens
    → estado de presentación observable

O ViewModel depende da abstracción `GardenRepository` e utiliza operacións asíncronas para acceder e modificar a fonte de datos:

    getGardens()
    addGarden()
    updateGarden()
    removeGarden()

A consulta dunha entidade xa cargada pode realizarse de forma síncrona sobre o estado local do ViewModel mediante:

    getGardenById()

Isto evita expoñer `Future` innecesariamente ás Views.

Provider continúa permitindo compartir unha única instancia de `GardensViewModel` entre as diferentes pantallas.

A inicialización actual é conceptualmente:

    main.dart
       ↓
    MemoryGardenRepository
       ↓
    GardensViewModel
       ↓
    loadGardens()
       ↓
    Provider
       ↓
    Views

A futura capa de persistencia manterá o mesmo contrato:

    GardenRepository
          ↑
    SQLiteGardenRepository
          ↓
    DatabaseService
          ↓
    SQLite

A infraestrutura SQLite comezou a prepararse durante a sesión 13.

Xa están instaladas as dependencias necesarias para unha implementación multiplataforma e iniciouse a creación de `DatabaseService`.

O seguinte punto de implementación é abrir o ficheiro:

    martola.db

desde `DatabaseService`, utilizando a factoría SQLite correspondente á plataforma.

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

O identificador pode ser `null` antes de que a entidade sexa almacenada por un Repository.

Durante a fase actual, sen SQLite, `MemoryGardenRepository` asigna temporalmente identificadores ás hortas mediante un contador interno.

Esta responsabilidade pertence á implementación da capa de acceso aos datos e non ao ViewModel.

A estratexia actual é provisional e será substituída polo mecanismo de identificación proporcionado pola futura capa de persistencia.

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

É responsable de:

- Xestionar o estado de presentación relacionado coas hortas.
- Recibir as accións solicitadas polas Views.
- Delegar o acceso e modificación da fonte de datos en `GardenRepository`.
- Manter unha representación local dos datos xa cargados.
- Expoñer os datos necesarios para as Views.
- Notificar cambios mediante `notifyListeners()`.

`GardensViewModel` recibe o Repository mediante inxección de dependencias:

    final GardenRepository repository;

    GardensViewModel({
      required this.repository,
    });

O ViewModel mantén tamén:

    final List<Garden> _gardens = [];

Esta colección non substitúe o Repository.

Representa o estado de presentación xa recuperado da fonte de datos.

O acceso desde as Views realízase mediante:

    List<Garden> get gardens =>
        List.unmodifiable(_gardens);

A carga completa realízase mediante unha operación asíncrona:

    Future<void> loadGardens() async {
      final gardens =
          await repository.getGardens();

      _gardens.clear();
      _gardens.addAll(gardens);

      notifyListeners();
    }

O fluxo é:

    Repository
        ↓ async
    GardensViewModel
        ↓
    _gardens
        ↓ sync
    Views

As operacións de creación, actualización e eliminación esperan a que o Repository complete a operación antes de actualizar o estado local.

Deste modo sepáranse as responsabilidades:

    GardensViewModel
    → estado de presentación
    → coordinación coas Views
    → sincronización co Repository
    → notifyListeners()

    GardenRepository
    → contrato de acceso á fonte de datos

### ViewModels previstos

- `HomeViewModel`
- `PlantDetailViewModel`
- Outros ViewModels que resulten necesarios segundo evolucione a aplicación.

---

## Repository Layer

Responsable de abstraer o acceso e manipulación dos datos.

A capa Repository permite que os ViewModels non dependan directamente da tecnoloxía utilizada para almacenar ou recuperar información.

## Database Service Layer

`DatabaseService` representa a infraestrutura común de acceso a SQLite.

A súa responsabilidade é diferente da dun Repository.

### DatabaseService

Responsabilidades:

- Abrir a base de datos.
- Xestionar a conexión.
- Localizar o ficheiro da base de datos.
- Crear as táboas.
- Xestionar versións e migracións.
- Resolver diferenzas de infraestrutura entre plataformas.

Non debe conter lóxica específica dunha entidade concreta.

Por exemplo, `DatabaseService` non debería decidir como se crea un `Garden` ou como se actualiza unha planta.

### Relación cos Repositories

Os Repositories utilizarán `DatabaseService` para acceder á infraestrutura SQLite.

Fluxo previsto:

    SQLiteGardenRepository ──┐
                            │
    SQLitePlantRepository ───┼──→ DatabaseService → SQLite
                            │
    Outros Repositories ─────┘

Deste modo existe unha única infraestrutura compartida en lugar de duplicar a apertura e configuración da base de datos en cada Repository.

### SQLite multiplataforma

A aplicación está preparada para utilizar diferentes factorías SQLite segundo a plataforma.

Conceptualmente:

    Android
       ↓
    sqflite

    Windows / Linux
       ↓
    sqflite_common_ffi

`DatabaseService` encapsulará esta diferenza.

As capas superiores non deben coñecer que factoría se utiliza.

### Ruta da base de datos

A base de datos utilizará inicialmente o nome:

    martola.db

A ruta construirase utilizando:

    getApplicationDocumentsDirectory()

e:

    join()

para evitar depender das convencións específicas de rutas de cada sistema operativo.

### GardenRepository

`GardenRepository` está implementado como unha clase abstracta que define o contrato do módulo de hortas.

Durante a sesión 13 o contrato evolucionou para representar operacións asíncronas:

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

O contrato define que operacións están dispoñibles, pero non como se realizan.

O uso de `Future` permite que o mesmo contrato sexa válido para:

- Unha implementación en memoria.
- Unha implementación SQLite.
- Outras posibles fontes de datos futuras.

O contrato non obriga ás Views a traballar directamente con `Future`, xa que `GardensViewModel` mantén o estado xa cargado para a interface.

### Repository Abstraction

`GardensViewModel` depende da abstracción:

```dart
GardenRepository
```

e non da implementación concreta:

```dart
MemoryGardenRepository
```

Isto permite substituír a fonte de datos sen modificar o ViewModel.

Por exemplo:

```text
                 ┌─ MemoryGardenRepository
                 │
GardensViewModel → GardenRepository
                 │
                 └─ SQLiteGardenRepository
```

Esta separación facilita:

- Substituír o almacenamento en memoria por SQLite.
- Crear implementacións alternativas.
- Realizar probas sen depender dunha base de datos real.
- Reducir o acoplamento entre a lóxica de presentación e a persistencia.

### Dependency Injection

O Repository é proporcionado ao ViewModel mediante inxección de dependencias.

`GardensViewModel` non crea internamente a súa implementación de Repository.

A implementación concreta selecciónase no punto de composición da aplicación:

```text
main.dart
   ↓
MemoryGardenRepository()
   ↓
GardensViewModel
```

Isto permite cambiar posteriormente a implementación concreta sen modificar as Views nin a lóxica principal do ViewModel.

A implementación foi adaptada ao contrato asíncrono.

Aínda que as operacións sobre unha colección en memoria son inmediatas, os seus métodos devolven `Future` para cumprir o mesmo contrato que utilizará posteriormente a implementación SQLite.

Isto permite validar a arquitectura asíncrona antes de introducir persistencia real.

### Future Repository Implementations

Está prevista unha implementación persistente:

```text
SQLiteGardenRepository
        ↓
DatabaseService
        ↓
SQLite
```

O contrato xa foi adaptado a operacións asíncronas mediante `Future`.

`MemoryGardenRepository` utiliza actualmente esta interface asíncrona, e a futura implementación `SQLiteGardenRepository` deberá respectar o mesmo contrato.

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
- garden_details_screen.dart

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

Define os contratos e implementacións responsables do acceso aos datos.

Estrutura actual:

```text
repositories/
├── garden_repository.dart
└── memory_garden_repository.dart
```

### garden_repository.dart

Define a abstracción `GardenRepository` utilizada polo módulo de hortas.

### memory_garden_repository.dart

Implementación temporal de `GardenRepository` baseada nunha colección en memoria.

As futuras implementacións de persistencia manteranse separadas do contrato sempre que resulte conveniente.

Implementación prevista:

```text
SQLiteGardenRepository
```

---

## services/

Servizos de infraestrutura e integración utilizados por diferentes partes da aplicación.

Estrutura actual:

    services/
    └── database_service.dart

### database_service.dart

`DatabaseService` centraliza a infraestrutura necesaria para SQLite.

Será responsable de:

- Seleccionar a implementación SQLite adecuada á plataforma.
- Inicializar FFI cando sexa necesario.
- Determinar a localización de `martola.db`.
- Abrir a base de datos.
- Manter a conexión.
- Crear as táboas iniciais.
- Xestionar versións e futuras migracións.

Outros servizos previstos:

- `weather_service.dart`
- Servizos de APIs externas.

---

## database/

Reservado para elementos específicos do esquema e evolución da base de datos cando sexan necesarios.

Contido futuro posible:

    database/
    └── migrations/

Non se almacenará aquí a conexión principal se `DatabaseService` permanece dentro de `services/`.

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
GardenRepository
 ↑
MemoryGardenRepository
 ↓
Estado en memoria
```

Ao finalizar a aplicación, os datos continúan desaparecendo porque `MemoryGardenRepository` non proporciona persistencia permanente.

A futura arquitectura será:

```text
Provider
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
```

Provider continuará xestionando e distribuíndo o estado da interface, mentres a implementación do Repository e SQLite serán responsables do acceso e persistencia dos datos.

Durante a sesión 13, `GardensViewModel` pasou a manter unha copia do estado xa cargado para a interface.

Isto non converte o ViewModel nunha capa de persistencia.

A responsabilidade queda separada:

    Repository / SQLite
    → fonte persistente dos datos

    GardensViewModel
    → estado observable actualmente cargado

    Provider
    → distribución dese estado ás Views

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

    View
      ↓
    GardensViewModel
      ↓ async
    GardenRepository
      ↑
    MemoryGardenRepository
      ↓
    Estado en memoria

`GardensViewModel` mantén ademais unha colección local cos datos xa cargados:

    Repository
        ↓
    loadGardens()
        ↓
    GardensViewModel._gardens
        ↓
    Provider
        ↓
    Views

A dirección das dependencias permite que `GardensViewModel` dependa da abstracción `GardenRepository` en lugar dunha implementación concreta.

A implementación actual selecciónase desde `main.dart`.

A arquitectura en preparación é:

    View
      ↓
    GardensViewModel
      ↓ async
    GardenRepository
      ↑
    SQLiteGardenRepository
      ↓
    DatabaseService
      ↓
    SQLite

O obxectivo continúa sendo substituír a fonte de datos sen modificar as Views nin acoplar `GardensViewModel` á tecnoloxía SQLite.

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

