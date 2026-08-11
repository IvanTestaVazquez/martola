# PROJECT_CONTEXT.md

# Project Information

## Project Name

MARTOLA

**Modelo Avanzado de Rexistro e Tratamento de Organización de Leiras e Agricultura**

## Project Type

Traballo de Fin de Ciclo (TFC)
DAM Dual Intensiva
CIFP A Carballeira Marcos Valcárcel

## Project Summary

MARTOLA é unha aplicación multiplataforma para a xestión de hortas e xardíns desenvolvida con Flutter.

A aplicación permitirá:

- Crear e administrar hortas e xardíns.
- Rexistrar plantas.
- Consultar información meteorolóxica.
- Almacenar históricos climáticos.
- Realizar seguemento da evolución das plantas.
- Deseñar visualmente a distribución dunha horta.
- Servir como ferramenta de apoio á planificación e mantemento de cultivos.

O proxecto está pensado para funcionar inicialmente en:

- Android
- Windows
- Linux
- Tablets

Posible soporte futuro:

- Web
- Sincronización cloud

iOS descártase inicialmente debido ás limitacións e custos asociados ao desenvolvemento para a plataforma Apple.

---

# Project Documentation

## Documentation Structure

```text
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

Esta documentación constitúe o sistema principal de seguemento e contexto do proxecto.

Todos os cambios relevantes deberán reflectirse nestes documentos para facilitar:

- Desenvolvemento.
- Mantemento.
- Elaboración da memoria final.
- Recuperación de contexto.
- Seguemento da evolución do proxecto.

---

# Technical Stack

## Frontend

- Flutter
- Dart

## Architecture

- MVVM simplificado
- Repository Pattern

## State Management

- Provider

## Database

- SQLite
- `sqflite`
- `sqflite_common_ffi`
- `path`
- `path_provider`

A infraestrutura de persistencia está deseñada para soportar Android, Windows e Linux.

## APIs

- OpenWeatherMap (prevista)

## Design Tools

- Figma
- draw.io

## Version Control

- Git
- GitHub

---

# Architecture

## Folder Structure

```text
lib/
├── core/
├── models/
├── views/
├── viewmodels/
├── repositories/
├── services/
├── database/
├── widgets/
├── utils/
└── main.dart
```

## Architecture Flow

```text
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

## Strategy

Arquitectura MVVM simplificada orientada a:

- Separación de responsabilidades.
- Mantemento sinxelo.
- Escalabilidade futura.
- Curva de aprendizaxe moderada.

## Current Implementation State

A arquitectura MVVM simplificada está implementada no módulo de hortas e evolucionou para preparar a integración dunha fonte de datos persistente.

O fluxo actual é:

    View
      ↓
    GardensViewModel
      ↓ async
    GardenRepository
      ↑
    MemoryGardenRepository
      ↓
    Estado en memoria

Xa existe unha separación efectiva entre:

- Interface de usuario.
- Estado e lóxica de presentación.
- Contrato de acceso aos datos.
- Implementación concreta da fonte de datos.

`GardensViewModel` actúa como intermediario entre as Views e a capa Repository e é compartido mediante Provider.

O ViewModel mantén unha colección local cos datos xa cargados:

    List<Garden> _gardens

Esta colección representa o estado de presentación e non a fonte de persistencia.

A carga inicial realízase mediante:

    loadGardens()

que recupera de maneira asíncrona os datos desde o Repository e actualiza o estado observable.

As principais operacións do módulo son:

    loadGardens()
    addGarden()
    getGardenById()
    updateGarden()
    removeGarden()

As Views acceden ao ViewModel mediante:

    context.read()
    context.watch()
    context.select()

segundo necesiten executar unha acción, observar o estado completo ou reaccionar a unha parte concreta.

A capa Repository está definida mediante:

    GardenRepository
          ↑
    MemoryGardenRepository

`GardenRepository` define actualmente un contrato asíncrono mediante `Future`.

`MemoryGardenRepository` proporciona unha implementación temporal en memoria que respecta ese mesmo contrato.

A implementación concreta inxéctase en `GardensViewModel` desde `main.dart`, permitindo que o ViewModel dependa da abstracción e non dunha implementación concreta.

Actualmente os datos continúan almacenándose exclusivamente en memoria e desaparecen ao finalizar a aplicación.

A arquitectura está preparada para evolucionar a:

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

Durante a sesión 13 iniciouse a infraestrutura SQLite.

Xa se completou:

- Adaptación asíncrona de `GardenRepository`.
- Adaptación asíncrona de `MemoryGardenRepository`.
- Introdución de `Future`, `async` e `await` no fluxo de datos.
- Carga inicial mediante `loadGardens()`.
- Adaptación das operacións CRUD ao modelo asíncrono.
- Instalación das dependencias SQLite multiplataforma.
- Inicio da implementación de `DatabaseService`.

O seguinte paso é completar a apertura de `martola.db` desde `DatabaseService`.

---

# Database Design

## Main Entities

### users

Usuarios da aplicación.

### gardens

Hortas ou xardíns creados polos usuarios.

### plant_species

Información xeral das especies vexetais.

### garden_plants

Plantas concretas rexistradas dentro dunha horta.

### plant_evolution_records

Histórico de evolución dunha planta.

### weather_records

Histórico meteorolóxico asociado ás hortas.

### garden_layout_items

Posición visual das plantas dentro do deseño da horta.

---

## Database Relationships

```text
users 1:N gardens

gardens 1:N garden_plants

plant_species 1:N garden_plants

garden_plants 1:N plant_evolution_records

gardens 1:N weather_records

gardens 1:N garden_layout_items

garden_plants 1:1 garden_layout_items
```

---

# Navigation Flow

```text
Inicio / Splash
        ↓
Benvida / Login
        ↓
Panel Principal
        ↓
Lista de Hortas
        ↓
Detalle dunha Horta
        ├── Plantas
        │     └── Detalle Planta
        │            └── Evolución
        ├── Meteoroloxía
        │     └── Histórico Climático
        ├── Deseño Visual
        └── Configuración
```

---

# Responsive Design

## Mobile

Navegación secuencial vertical.

## Tablet

Uso de múltiples columnas.

Paneis simultáneos.

## Desktop

Sidebar lateral.

Maior aproveitamento do espazo horizontal.

Especialmente importante para:

- GardenDetailScreen
- LayoutDesignerScreen

---

# Figma Structure

Debido ás limitacións da versión gratuíta de Figma (3 páxinas), o proxecto estrutúrase do seguinte modo:

## Page 1

### 00_System_&_Wireframes

Contido:

- Design System
- Assets
- Wireframes

## Page 2

### 01_Mobile_UI

Mockups finais para móbil.

## Page 3

### 02_Desktop_&_Prototype

Mockups escritorio.

Prototipo navegable.

---

# Design System

## Current Status

Pendente de definición final.

Durante a fase de deseño definiranse:

- Paleta de cores.
- Tipografías.
- Sistema de espazado.
- Compoñentes reutilizables.
- Comportamento responsive.
- Iconografía.

---

# Existing Documentation

## UI_REFERENCE.md

Referencia funcional das pantallas e widgets.

## ARCHITECTURE.md

Definición da arquitectura software.

## DATABASE_DESIGN.md

Modelo de datos e estrutura SQLite.

## ROADMAP.md

Planificación técnica do desenvolvemento.

## DEVELOPMENT_GUIDE.md

Plan de aprendizaxe e desenvolvemento progresivo de Flutter e Dart aplicado a MARTOLA.

---

# Current Version

## Version

0.1.0-alpha

## Status

🟢 En desenvolvemento activo

## Last Updated

2026-08-11

## Current Phase

Desenvolvemento da infraestrutura de persistencia SQLite, co módulo de hortas xa adaptado a unha arquitectura Repository asíncrona.

---

# Current Progress

## Analysis & Planning

✅ Descrición inicial do proxecto

✅ Análise de requisitos

✅ Planificación inicial

✅ Estrutura da memoria final

---

## Design

✅ Fluxo de navegación

✅ Estrutura Figma definida

✅ Wireframes definidos

⏳ Design System

⬜ Mockups finais

---

## Architecture

✅ Arquitectura MVVM simplificada

✅ Repository Pattern definido

✅ Estrutura de carpetas

✅ Primeiro ViewModel funcional (`GardensViewModel`)

✅ Estado compartido mediante Provider

✅ Separación entre Views e estado do módulo de hortas

✅ Implementación da capa Repository no módulo de hortas

✅ Creación da abstracción `GardenRepository`

✅ Creación de `MemoryGardenRepository`

✅ Inxección de dependencias entre `GardensViewModel` e `GardenRepository`

✅ Configuración de `main.dart` como punto de composición

✅ Conversión de `GardenRepository` a contrato asíncrono

✅ Adaptación de `MemoryGardenRepository` ao contrato asíncrono

✅ Estado de presentación cargado en `GardensViewModel`

✅ Carga inicial mediante `loadGardens()`

⏳ Implementación de `DatabaseService`

⬜ Implementación de `SQLiteGardenRepository`

⬜ Integración da capa de persistencia SQLite

---

## Database

✅ Modelo ER

✅ Documentación SQLite

✅ Dependencias SQLite multiplataforma configuradas

⏳ `DatabaseService`

⬜ Apertura de `martola.db`

⬜ Creación das táboas

⬜ `SQLiteGardenRepository`

⬜ Integración SQLite co módulo de hortas

---

## Documentation

✅ PROJECT_CONTEXT.md

✅ UI_REFERENCE.md

✅ ARCHITECTURE.md

✅ DATABASE_DESIGN.md

✅ ROADMAP.md

✅ DEVELOPMENT_GUIDE.md

---

## Development

✅ Creación proxecto Flutter

✅ Configuración inicial Git/GitHub

✅ Estrutura de carpetas da arquitectura

✅ Creación da primeira HomeScreen funcional

✅ Primeira interface funcional implementada

✅ Primeiro widget reutilizable (`MartolaLogo`)

✅ Configuración inicial do Theme global

✅ Creación de `DashboardScreen`

✅ Creación dos widgets principais do Dashboard:
- `WeatherCard`
- `GardenCard`
- `TasksCard`
- `QuickActionsCard`

✅ Navegación do Dashboard aos módulos de hortas e tarefas

✅ Pantallas provisionais `TasksScreen` e `CreateTaskScreen`

✅ Callbacks desacoplados da navegación nos widgets do Dashboard

✅ Creación do modelo de dominio `Garden`

✅ Implementación inicial de `GardensScreen`

✅ Listado dinámico de hortas mediante `ListView.builder`

✅ Creación do widget reutilizable `GardenListItem`

✅ Selección dunha horta mediante `InkWell`

✅ Navegación desde a lista ao detalle dunha horta

✅ Creación de `GardenDetailsScreen`

✅ Paso dun obxecto `Garden` entre pantallas

✅ Conversión de `CreateGardenScreen` a `StatefulWidget`

✅ Implementación do formulario de creación de hortas

✅ Xestión dos campos mediante `TextEditingController`

✅ Validación do formulario mediante `Form` e `GlobalKey<FormState>`

✅ Validación de nome, localización e superficie

✅ Conversión da superficie de `String` a `double`

✅ Creación dun obxecto `Garden` a partir dos datos do formulario

✅ Devolución dun `Garden` entre rutas mediante `Navigator.pop(garden)`

✅ Recepción de resultados mediante `await Navigator.push<Garden>()`

✅ Integración do paquete Provider

✅ Creación de `GardensViewModel`

✅ Centralización da colección de hortas no ViewModel

✅ Encapsulación da colección mediante `List.unmodifiable`

✅ Implementación de `ChangeNotifier` e `notifyListeners()`

✅ Configuración de `ChangeNotifierProvider` por enriba de `MaterialApp`

✅ Lectura reactiva do estado en `GardensScreen` mediante `context.watch`

✅ Modificación do estado desde `CreateGardenScreen` mediante `context.read`

✅ Actualización dinámica do número de hortas no Dashboard mediante `context.select`

✅ Eliminación dos mock data locais de `GardensScreen`

✅ Implementación de identificadores temporais para as hortas en memoria

✅ Implementación de `getGardenById()`

✅ Creación de `EditGardenScreen`

✅ Inicialización dos formularios de edición mediante `initState()`

✅ Actualización de hortas mediante modelos inmutables

✅ Implementación de `updateGarden()`

✅ Implementación de eliminación de hortas mediante `removeGarden()`

✅ Confirmación de eliminación mediante `AlertDialog`

✅ Conversión de `GardenDetailsScreen` para traballar mediante `gardenId`

✅ Consulta da versión actual dunha horta desde `GardensViewModel`

✅ CRUD completo de hortas en memoria

✅ Creación da capa Repository para o módulo de hortas

✅ Traslado da colección de hortas desde `GardensViewModel` a `MemoryGardenRepository`

✅ Traslado da xeración temporal de identificadores ao Repository

✅ Delegación das operacións CRUD desde `GardensViewModel` ao Repository

✅ Actualización das operacións de edición e eliminación para traballar mediante `gardenId`

✅ Conservación da identidade dunha horta durante as actualizacións

✅ Creación da abstracción `GardenRepository`

✅ Creación da implementación `MemoryGardenRepository`

✅ Aplicación de inxección de dependencias en `GardensViewModel`

✅ Dependencia de `GardensViewModel` respecto da abstracción `GardenRepository`

✅ Selección de `MemoryGardenRepository` desde `main.dart`

✅ CRUD completo verificado tras a separación ViewModel/Repository
✅ Conversión das operacións de `GardenRepository` a `Future`

✅ Adaptación de `MemoryGardenRepository` ao modelo asíncrono

✅ Creación do estado local `_gardens` en `GardensViewModel`

✅ Implementación de `loadGardens()`

✅ Carga inicial dos datos ao crear `GardensViewModel`

✅ Sincronización do estado local tras creación, edición e eliminación

✅ Adaptación de `CreateGardenScreen` ao uso de `await`

✅ Adaptación de `EditGardenScreen` ao uso de `await`

✅ Adaptación da eliminación desde `GardenDetailsScreen` ao uso de `await`

✅ Uso de `context.mounted` despois de operacións asíncronas

✅ Instalación de `sqflite`

✅ Instalación de `sqflite_common_ffi`

✅ Instalación de `path`

✅ Instalación de `path_provider`

⏳ Implementación de `DatabaseService`

⏳ Preparación da persistencia SQLite

⬜ SQLite

⬜ Módulo funcional de plantas

⬜ API meteorolóxica

⬜ Layout Designer

---

# Important Technical Decisions

- Arquitectura Local First.
- SQLite antes que Firebase.
- MVVM simplificado para reducir complexidade.
- Responsive Design desde o inicio.
- Flutter Desktop incluído como obxectivo.
- Sistema preparado para futura sincronización cloud.
- Flutter terá prioridade fronte ao deseño visual.
- Os wireframes actuarán como referencia funcional para o desenvolvemento.
- A documentación técnica converterase na principal fonte de contexto do proxecto.
- Os widgets específicos dunha funcionalidade manteranse dentro da propia funcionalidade ata que exista unha necesidade real de reutilización.
- Os widgets de presentación recibirán accións externas mediante callbacks para evitar acoplamento coa navegación.
- O Dashboard estrutúrase mediante compoñentes independentes: WeatherCard, GardenCard, TasksCard e QuickActionsCard.
- Durante a fase inicial da interface utilizaranse mock data antes da integración con SQLite e APIs.
- As accións dependentes dunha horta concreta, como engadir unha planta, situaranse dentro do contexto desa horta.
- Os widgets de presentación comunicarán as interaccións mediante callbacks; a navegación será responsabilidade das pantallas que coñecen o fluxo da aplicación.
- O desenvolvemento das novas funcionalidades seguirá unha estratexia incremental: primeiro establecerase o fluxo mediante pantallas provisionais e posteriormente implementarase o seu contido funcional.
- Os datos de dominio representaranse mediante modelos independentes da interface, comezando polo modelo `Garden`.
- As pantallas que necesiten manter sincronizada unha entidade co estado compartido traballarán preferentemente coa súa identidade e obterán a versión actual desde o ViewModel.
- Os elementos das listas recibirán o modelo completo cando os seus datos pertenzan conceptualmente á mesma entidade.
- A interacción dun widget non implica por si mesma a necesidade dun `StatefulWidget`; utilizarase estado local só cando exista estado ou recursos que deban ser xestionados polo widget.
- Os recursos asociados ao ciclo de vida dun `State`, como os `TextEditingController`, serán creados e liberados polo propio `State`.
- Os formularios utilizarán `Form`, `GlobalKey<FormState>` e validadores para comprobar os datos antes de construír os modelos de dominio.
- Os datos procedentes de campos de texto serán convertidos explicitamente ao tipo requirido polo modelo antes da creación do obxecto.
- O identificador de `Garden` pode ser `null` antes de que a entidade sexa incorporada á fonte de datos. Durante a fase sen persistencia, `MemoryGardenRepository` asignará identificadores temporais ás hortas almacenadas.
- `Navigator` poderá utilizarse para devolver resultados entre rutas cando o fluxo o requira.
- Non se implementarán solucións temporais para manter sincronizados datos locais entre pantallas cando esa responsabilidade corresponda posteriormente á xestión de estado.
- Provider utilízase como mecanismo de distribución e observación do estado compartido.
- `GardensViewModel` xestiona o estado de presentación do módulo de hortas e delega o acceso e manipulación dos datos en `GardenRepository`.
- As Views non modificarán directamente as coleccións do ViewModel; as modificacións realizaranse mediante operacións específicas como `addGarden()`, `updateGarden()` e `removeGarden()`.
- Utilizarase `context.read` para executar accións sen subscribirse aos cambios, `context.watch` cando a View dependa do estado completo e `context.select` cando só necesite observar unha parte concreta.
- Os modelos de dominio manteranse inmutables. As actualizacións realizaranse creando unha nova instancia e substituíndo a anterior no estado.
- A xestión de estado e a persistencia considéranse responsabilidades diferentes. Provider mantén o estado compartido da aplicación, mentres que SQLite proporcionará posteriormente persistencia.
- A xeración actual de identificadores mediante un contador en `MemoryGardenRepository` é temporal e será substituída pola estratexia de identificación da futura capa de persistencia.
- `GardensViewModel` dependerá da abstracción `GardenRepository` e non dunha implementación concreta.
- As implementacións concretas do acceso aos datos estarán separadas do contrato definido por `GardenRepository`.
- `MemoryGardenRepository` constitúe a implementación temporal utilizada durante o desenvolvemento previo á integración de SQLite.
- `main.dart` actúa como punto de composición para seleccionar e inxectar as implementacións concretas das dependencias.
- As operacións sobre entidades persistidas utilizarán preferentemente o identificador da entidade en lugar de depender dunha instancia concreta do modelo.
- O Repository será responsable de garantir a conservación da identidade dunha entidade durante unha actualización.
- `GardenRepository` utiliza un contrato asíncrono mediante `Future` para permitir implementacións baseadas tanto en memoria como en fontes persistentes.
- `GardensViewModel` mantén o estado xa cargado necesario para as Views, mentres que o Repository continúa sendo a abstracción de acceso á fonte de datos.
- As Views non accederán directamente á base de datos nin deberán coñecer a tecnoloxía de persistencia utilizada.
- `DatabaseService` centralizará a apertura, configuración e ciclo de vida da conexión SQLite.
- Os Repositories específicos utilizarán `DatabaseService` para acceder á infraestrutura de persistencia.
- A infraestrutura SQLite deberá soportar Android, Windows e Linux mediante a factoría apropiada para cada plataforma.
- As rutas de ficheiros construiranse mediante `path` e os directorios da aplicación obteranse mediante `path_provider`.

---

# Next Milestone

### Current Objective

Completar a infraestrutura SQLite e comezar a persistencia real do módulo de hortas mantendo a separación entre Views, ViewModel, Repository e DatabaseService.

### Starting Point

Actualmente o módulo de hortas xa permite:

- Crear hortas mediante formulario validado.
- Listar as hortas almacenadas.
- Consultar o detalle dunha horta mediante o seu identificador.
- Editar unha horta existente.
- Eliminar unha horta con confirmación previa.
- Manter sincronizadas as diferentes Views mediante Provider.
- Mostrar dinamicamente no Dashboard o número real de hortas.
- Delegar as operacións de datos desde `GardensViewModel` a `GardenRepository`.
- Substituír implementacións concretas do Repository mediante inxección de dependencias.
- Traballar cun contrato Repository asíncrono.
- Cargar o estado inicial mediante `loadGardens()`.
- Esperar polas operacións de datos mediante `await`.

O fluxo actual é:

    View
      ↓
    GardensViewModel
      ↓ async
    GardenRepository
      ↑
    MemoryGardenRepository
      ↓
    Estado en memoria

A principal limitación continúa sendo que os datos desaparecen ao finalizar a aplicación.

A infraestrutura SQLite está iniciada mediante `DatabaseService`.

O punto exacto de continuación é:

    DatabaseService
          ↓
    obter directorio
          ↓
    construír ruta martola.db
          ↓
    abrir base de datos
          ↓
    crear táboas

### Implementation Tasks

- [x] Comprender `Future`, `async` e `await`.
- [x] Adaptar `GardenRepository` ao modelo asíncrono.
- [x] Adaptar `MemoryGardenRepository`.
- [x] Preparar `GardensViewModel` para unha fonte asíncrona.
- [x] Implementar `loadGardens()`.
- [x] Configurar as dependencias necesarias para SQLite.
- [x] Iniciar `DatabaseService`.
- [ ] Completar a apertura de `martola.db`.
- [ ] Crear o esquema inicial da base de datos.
- [ ] Crear `SQLiteGardenRepository`.
- [ ] Implementar o CRUD SQLite das hortas.
- [ ] Recuperar as hortas persistidas ao iniciar a aplicación.
- [ ] Substituír os identificadores temporais polos identificadores SQLite.
- [ ] Inxectar `SQLiteGardenRepository` desde `main.dart`.
- [ ] Verificar que os datos sobreviven ao reinicio da aplicación.

## Deliverable

Módulo de hortas con operacións CRUD persistidas localmente mediante SQLite, mantendo a separación entre View, ViewModel, Repository e capa de infraestrutura.

---

# Future Improvements

- Sincronización cloud.
- Autenticación avanzada.
- Notificacións.
- Sensores ambientais.
- IA para recomendacións.
- Compartición de hortas.
- Backup cloud.
- Estatísticas avanzadas.

---

# Notes

Este documento considérase a fonte principal de contexto do proxecto MARTOLA.

Calquera cambio relevante na arquitectura, navegación, base de datos ou planificación deberá reflectirse neste ficheiro e na documentación asociada.

O obxectivo principal actual é construír unha primeira versión funcional antes de introducir funcionalidades avanzadas ou melloras estéticas.

## Current Development Strategy

O desenvolvemento de MARTOLA realízase seguindo unha aprendizaxe progresiva de Flutter.

Cada funcionalidade impleméntase unha vez comprendidos os principios técnicos que a sustentan.

A prioridade actual non é a cantidade de código, senón construír unha arquitectura sólida, reutilizable e facilmente mantible.

A documentación mantense sincronizada co estado real do proxecto e constitúe a principal referencia durante o desenvolvemento.