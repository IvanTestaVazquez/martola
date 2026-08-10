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

A arquitectura completa está definida, pero a súa implementación realízase de maneira incremental.

Ao finalizar a sesión 10, o estado aproximado é:

```text
View
 ↓
Models
 ↓
Mock / Local Data
```

Xa se iniciou a separación entre interface e modelos de dominio mediante a clase `Garden`.

As capas seguintes aínda están pendentes de implementación:

```text
ViewModel
 ↓
Repository
 ↓
DatabaseService
 ↓
SQLite
```

O seguinte paso arquitectónico será introducir Provider e os primeiros ViewModels, evitando conectar directamente as Views coa futura capa SQLite.

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

O identificador pode ser `null` antes da persistencia, permitindo representar unha entidade que aínda non foi almacenada na base de datos.

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

Actualmente algunhas Views utilizan datos ficticios locais como parte da fase inicial de desenvolvemento.

Estes datos serán extraídos progresivamente das Views cando se introduzan Provider e os ViewModels.

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

Responsable da lóxica de presentación.

Funcións:

- Procesar accións do usuario.
- Solicitar datos aos repositorios.
- Preparar datos para a vista.
- Notificar cambios mediante Provider.

Exemplos:

- HomeViewModel
- GardensViewModel
- GardenDetailViewModel
- PlantDetailViewModel

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

Lóxica de presentación.

Exemplos:

- home_viewmodel.dart
- gardens_viewmodel.dart

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

Utilizarase Provider como sistema principal de xestión de estado.

Motivos:

- Sinxeleza.
- Boa integración con Flutter.
- Curva de aprendizaxe moderada.
- Adecuado para o tamaño do proxecto.
- Permite separar progresivamente o estado das Views.

## Current Status

Provider aínda non está implementado.

Actualmente existen dous tipos de datos na interface:

- Datos ficticios utilizados para construír e probar as Views.
- Estado local necesario para widgets concretos, como os controladores de `CreateGardenScreen`.

A introdución de Provider permitirá xestionar estado compartido entre pantallas.

Por exemplo:

```text
CreateGardenScreen
        ↓
    crea Garden
        ↓
GardensViewModel
        ↓
   actualiza estado
        ↓
GardensScreen
        ↓
reconstrúe a lista
```

Posteriormente o ViewModel utilizará o Repository para persistir os cambios.

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

Exemplos previstos:

- Lista de hortas.
- Lista de plantas dunha horta.
- Tarefas pendentes.
- Información meteorolóxica compartida.

Este tipo de estado será xestionado mediante ViewModels e Provider.

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

Tamén se permite pasar modelos entre pantallas:

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => GardenDetailsScreen(
      garden: garden,
    ),
  ),
);
```

E devolver resultados desde unha ruta:

```dart
Navigator.of(context).pop(garden);
```

que poden ser recibidos mediante:

```dart
final garden =
    await Navigator.of(context).push<Garden>(
  MaterialPageRoute(
    builder: (context) =>
        const CreateGardenScreen(),
  ),
);
```

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

# Dependency Flow

As dependencias deben seguir esta dirección:

View
→ ViewModel
→ Repository
→ Service / Database

Nunca:

Database
→ View

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

