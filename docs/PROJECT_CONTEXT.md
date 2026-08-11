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
- sqflite package

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

A arquitectura MVVM simplificada comezou a implementarse no módulo de hortas.

O fluxo actual é:

```text
View
 ↓
GardensViewModel
 ↓
Estado en memoria
```

Xa existe unha separación efectiva entre a interface e o estado das hortas.

`GardensViewModel` actúa actualmente como fonte de verdade do módulo e é compartido entre as Views mediante Provider.

As principais operacións do módulo están centralizadas no ViewModel:

```text
addGarden()
getGardenById()
updateGarden()
removeGarden()
```

As Views acceden ao estado mediante:

```text
context.read()
context.watch()
context.select()
```

segundo necesiten executar unha acción, observar o estado completo ou reaccionar a unha parte concreta.

Actualmente os datos continúan almacenándose exclusivamente en memoria.

A arquitectura aínda non chegou ás capas:

```text
Repository
 ↓
DatabaseService
 ↓
SQLite
```

A seguinte evolución arquitectónica será introducir a capa Repository e posteriormente substituír o estado temporal en memoria por persistencia SQLite.

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

Desenvolvemento funcional do módulo de hortas con xestión de estado mediante Provider.

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

✅ Separación inicial entre Views e estado do módulo de hortas

⬜ Implementación da capa Repository

⬜ Integración da capa de persistencia

---

## Database

✅ Modelo ER

✅ Documentación SQLite

⬜ Implementación SQLite

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

⏳ Desenvolvemento funcional do módulo de hortas

⬜ Repository

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
- O identificador de `Garden` pode ser `null` antes de que a entidade entre no estado compartido. Durante a fase sen persistencia, `GardensViewModel` asignará identificadores temporais ás hortas almacenadas.
- `Navigator` poderá utilizarse para devolver resultados entre rutas cando o fluxo o requira.
- Non se implementarán solucións temporais para manter sincronizados datos locais entre pantallas cando esa responsabilidade corresponda posteriormente á xestión de estado.
- Provider utilízase como mecanismo de distribución e observación do estado compartido.

- `GardensViewModel` constitúe actualmente a fonte de verdade do módulo de hortas.

- As Views non modificarán directamente as coleccións do ViewModel; as modificacións realizaranse mediante operacións específicas como `addGarden()`, `updateGarden()` e `removeGarden()`.

- Utilizarase `context.read` para executar accións sen subscribirse aos cambios, `context.watch` cando a View dependa do estado completo e `context.select` cando só necesite observar unha parte concreta.

- Os modelos de dominio manteranse inmutables. As actualizacións realizaranse creando unha nova instancia e substituíndo a anterior no estado.

- A xestión de estado e a persistencia considéranse responsabilidades diferentes. Provider mantén o estado compartido da aplicación, mentres que SQLite proporcionará posteriormente persistencia.

- A xeración actual de identificadores mediante un contador en `GardensViewModel` é temporal e será substituída pola estratexia de identificación da futura capa de persistencia.

---

# Next Milestone

### Current Objective

Introducir a capa Repository no módulo de hortas e preparar a transición desde o estado exclusivamente en memoria cara á persistencia local con SQLite.

### Starting Point

Actualmente o módulo de hortas xa permite:

- Crear hortas mediante formulario validado.
- Listar as hortas almacenadas no estado compartido.
- Consultar o detalle dunha horta mediante o seu identificador.
- Editar unha horta existente.
- Eliminar unha horta con confirmación previa.
- Manter sincronizadas as diferentes Views mediante Provider.
- Mostrar dinamicamente no Dashboard o número real de hortas.
- Centralizar as operacións CRUD en `GardensViewModel`.

O fluxo actual é:

```text
View
 ↓
GardensViewModel
 ↓
Estado en memoria
```

A principal limitación actual é que os datos desaparecen ao finalizar a aplicación.

### Implementation Tasks

- Comprender a responsabilidade da capa Repository.
- Crear `GardenRepository`.
- Separar progresivamente o acceso aos datos do `GardensViewModel`.
- Definir a comunicación entre ViewModel e Repository.
- Preparar a integración de SQLite.
- Implementar posteriormente a persistencia local das hortas.
- Substituír os identificadores temporais pola estratexia de identificación da capa de persistencia.

## Deliverable

Módulo de hortas cunha separación clara entre estado de presentación e acceso aos datos, preparado para almacenar información de forma persistente mediante SQLite.
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