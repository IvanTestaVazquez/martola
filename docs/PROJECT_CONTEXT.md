# PROJECT_CONTEXT.md

# Project Information

## Project Name

**MARTOLA**

**Modelo Avanzado de Rexistro e Tratamento de Organización de Leiras e Agricultura**

## Project Type

- Traballo de Fin de Ciclo (TFC)
- DAM Dual Intensiva
- CIFP A Carballeira Marcos Valcárcel

## Project Summary

MARTOLA é unha aplicación multiplataforma desenvolvida con Flutter para a xestión de hortas e xardíns.

A aplicación permitirá:

- Crear, editar e eliminar hortas e xardíns.
- Rexistrar, editar e eliminar plantas.
- Manter un catálogo de especies vexetais.
- Realizar seguemento da evolución das plantas mediante rexistros históricos.
- Consultar información meteorolóxica.
- Almacenar históricos climáticos.
- Deseñar visualmente a distribución dunha horta.
- Servir como ferramenta de apoio á planificación e mantemento de cultivos.

O proxecto está pensado inicialmente para:

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
- `ChangeNotifier`
- `MultiProvider`

## Database

- SQLite
- `sqflite`
- `sqflite_common_ffi`
- `path`
- `path_provider`

A infraestrutura de persistencia está deseñada para soportar Android, Windows e Linux.

## HTTP / External APIs

- Paquete `http`
- OpenWeather API para condicións meteorolóxicas actuais.
- MeteoSIX prevista para información e predición meteorolóxica adicional.

A integración actual con OpenWeather está implementada e operativa.

As credenciais das APIs non se almacenan directamente no código fonte. Durante o desenvolvemento proporciónanse mediante `--dart-define` ou `--dart-define-from-file`.

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

Para datos persistentes locais:

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

Para servizos externos:

```text
View
  ↓
ViewModel
  ↓
Repository
  ↓
Service
  ↓
External API
```

## Strategy

Arquitectura MVVM simplificada orientada a:

- Separación de responsabilidades.
- Mantemento sinxelo.
- Escalabilidade futura.
- Curva de aprendizaxe moderada.
- Independencia entre interface, estado, persistencia e fontes externas de datos.

## Current Implementation State

A arquitectura está aplicada actualmente aos módulos de hortas, plantas, especies, evolución das plantas e meteoroloxía.

A composición principal realízase en `main.dart`, onde se crean e inxectan as implementacións concretas dos Repositories, Services e ViewModels mediante `MultiProvider`.

Para a persistencia local:

```text
main.dart
   ↓
DatabaseService
   ↓
Repositories SQLite
   ↓
ViewModels
   ↓
ChangeNotifierProvider / MultiProvider
   ↓
Views
```

Para a meteoroloxía:

```text
main.dart
   ↓
WeatherService
   ↓
OpenWeatherRepository
   ↓
WeatherViewModel
   ↓
ChangeNotifierProvider / MultiProvider
   ↓
DashboardScreen
```

O fluxo dunha petición meteorolóxica desde a interface é:

```text
DashboardScreen
   ↓
WeatherViewModel
   ↓
WeatherRepository
   ↓
OpenWeatherRepository
   ↓
WeatherService
   ↓
OpenWeather API
```

Os ViewModels implementados son:

- `GardensViewModel`
- `PlantSpeciesViewModel`
- `PlantsViewModel`
- `PlantEvolutionViewModel`
- `WeatherViewModel`

As Views acceden ao estado mediante:

- `context.read()` para executar accións sen subscribirse aos cambios.
- `context.watch()` para observar un estado.
- `context.select()` para observar só unha parte concreta.

Os ViewModels manteñen estado de presentación xa cargado, mentres que os Repositories constitúen unha abstracción fronte á fonte concreta dos datos.

Esta abstracción aplícase tanto á persistencia SQLite como ás APIs externas.

## Implemented Repositories

Contratos:

- `GardenRepository`
- `PlantSpeciesRepository`
- `GardenPlantRepository`
- `PlantEvolutionRecordRepository`
- `WeatherRepository`

Implementacións:

- `SQLiteGardenRepository`
- `SQLitePlantSpeciesRepository`
- `SQLiteGardenPlantRepository`
- `SQLitePlantEvolutionRecordRepository`
- `OpenWeatherRepository`

`MemoryGardenRepository` mantense como implementación alternativa útil para probas ou desenvolvemento.

`WeatherRepository` permite que `WeatherViewModel` non dependa directamente de OpenWeather. Isto facilita substituír ou combinar no futuro diferentes provedores meteorolóxicos sen modificar o ViewModel.

---

# Database Design

## Current SQLite Version

```text
version: 3
```

Migracións implementadas e comprobadas:

```text
v1 → v2
v2 → v3
```

As migracións son acumulativas e conservan os datos existentes.

## Current Physical Schema

```text
gardens
plant_species
garden_plants
plant_evolution_records
```

## Main Entities

### gardens

Hortas ou xardíns creados na aplicación.

### plant_species

Información común das especies vexetais.

### garden_plants

Plantas concretas rexistradas dentro dunha horta.

### plant_evolution_records

Histórico de evolución dunha planta concreta.

Campos actualmente implementados:

- `id`
- `plant_id`
- `date`
- `height`
- `notes`

`height` e `notes` son opcionais.

### Future Entities

Previstas no deseño global, pero aínda non implementadas fisicamente:

- `users`
- `weather_records`
- `garden_layout_items`

## Current Relationships

```text
gardens 1:N garden_plants
plant_species 1:N garden_plants
garden_plants 1:N plant_evolution_records
```

Integridade referencial:

- `garden_plants.garden_id → gardens.id` con `ON DELETE CASCADE`.
- `garden_plants.species_id → plant_species.id` con `ON DELETE RESTRICT`.
- `plant_evolution_records.plant_id → garden_plants.id` con `ON DELETE CASCADE`.

As claves foráneas actívanse mediante:

```sql
PRAGMA foreign_keys = ON
```

## Persistence Decisions

- Os identificadores do dominio mantéñense como `String`, aínda que SQLite utiliza `INTEGER`.
- A conversión realízase na fronteira coa persistencia.
- Os `DateTime` almacénanse como `TEXT` en formato ISO 8601.
- Os valores decimais, como superficie ou altura, almacénanse como `REAL`.
- Os campos opcionais poden persistirse como `NULL`.

## Future Location Evolution

A integración meteorolóxica actual utiliza temporalmente coordenadas fixas de Ourense para validar o fluxo completo.

Está previsto ampliar `Garden` para asociar cada horta a coordenadas xeográficas:

- latitude
- longitude

A obtención da localización deberá poder realizarse mediante:

- Busca por localidade.
- Selección nun mapa.

Esta ampliación requirirá unha futura migración da base de datos e non forma parte aínda do esquema SQLite v3.

---

# Implemented Functional Modules

## Gardens

CRUD completo desde a interface:

- Crear horta.
- Listar hortas.
- Consultar detalle.
- Editar horta.
- Eliminar horta.
- Persistencia SQLite.
- Recuperación dos datos entre reinicios.

Fluxo:

```text
Views
  ↓
GardensViewModel
  ↓
GardenRepository
  ↓
SQLiteGardenRepository
  ↓
DatabaseService
  ↓
SQLite
```

## Plant Species

Implementado:

- Modelo `PlantSpecies`.
- `PlantSpeciesRepository`.
- `SQLitePlantSpeciesRepository`.
- `PlantSpeciesViewModel`.
- Catálogo inicial local de especies.
- Inserción do catálogo só cando `plant_species` está baleira.
- Uso do catálogo desde os formularios mediante selector de especies.

O catálogo local é unha solución provisional para o MVP e poderá substituírse ou ampliarse no futuro.

## Plants

CRUD completo desde a interface:

- Listar plantas dunha horta.
- Crear planta.
- Consultar detalle.
- Resolver o nome da especie asociada.
- Editar planta.
- Eliminar planta.
- Persistencia SQLite.
- Actualización reactiva das Views.

`PlantsViewModel` conserva `_currentGardenId` e mantén unicamente as plantas correspondentes á horta actualmente cargada.

Fluxo principal:

```text
GardenDetailsScreen
  ↓
PlantListScreen
  ↓
PlantDetailsScreen
```

Pantallas implementadas:

- `PlantListScreen`
- `AddPlantScreen`
- `PlantDetailsScreen`
- `EditPlantScreen`

## Plant Evolution

O módulo de evolución está implementado cun CRUD completo desde a interface.

Modelo:

- `PlantEvolutionRecord`

Campos:

- `id`
- `plantId`
- `date`
- `height` opcional
- `notes` opcionais

Infraestrutura:

- `PlantEvolutionRecordRepository`
- `SQLitePlantEvolutionRecordRepository`
- `PlantEvolutionViewModel`

Pantallas:

- `PlantEvolutionListScreen`
- `AddPlantEvolutionRecordScreen`
- `PlantEvolutionDetailsScreen`
- `EditPlantEvolutionRecordScreen`

Funcionalidades:

- Cargar os rexistros dunha planta.
- Crear un rexistro.
- Consultar o detalle.
- Editar un rexistro.
- Eliminar un rexistro.
- Validar altura opcional.
- Gardar altura e notas como `NULL` cando non se proporcionan.
- Seleccionar a data mediante `showDatePicker`.
- Actualizar automaticamente as Views mediante `notifyListeners()`.

`PlantEvolutionViewModel` conserva `_currentPlantId`, polo que os formularios de creación non necesitan xestionar directamente a relación coa planta activa.

Fluxo:

```text
PlantDetailsScreen
  ↓
PlantEvolutionListScreen
  ↓
PlantEvolutionDetailsScreen
```

Fluxo de datos:

```text
View
  ↓
PlantEvolutionViewModel
  ↓
PlantEvolutionRecordRepository
  ↓
SQLitePlantEvolutionRecordRepository
  ↓
DatabaseService
  ↓
SQLite
```

O CRUD foi comprobado tanto directamente contra o Repository/SQLite como desde a interface.

## Weather

O módulo meteorolóxico básico está implementado e conectado con datos reais de OpenWeather.

Modelo:

- `WeatherData`

A información meteorolóxica actualmente procesada inclúe:

- Temperatura.
- Humidade.
- Descrición meteorolóxica.
- Velocidade do vento.
- Localidade.

Infraestrutura:

- `WeatherService`
- `WeatherException`
- `WeatherRepository`
- `OpenWeatherRepository`
- `WeatherViewModel`

Fluxo:

```text
DashboardScreen
  ↓
WeatherViewModel
  ↓
WeatherRepository
  ↓
OpenWeatherRepository
  ↓
WeatherService
  ↓
OpenWeather API
```

`WeatherService` é responsable de:

- Construír a URI de OpenWeather.
- Realizar a petición HTTP GET.
- Procesar a resposta JSON.
- Converter os datos mediante `WeatherData.fromJson()`.
- Interpretar erros HTTP.
- Detectar problemas de conexión.
- Controlar o timeout das peticións.
- Lanzar `WeatherException` cando a operación non pode completarse.

`WeatherViewModel` representa os estados principais da operación:

```text
loading
data
error
```

Mantén:

- `WeatherData? _weatherData`
- `bool _isLoading`
- `String? _errorMessage`

O Dashboard reacciona a estes estados mostrando:

- `CircularProgressIndicator` durante a carga.
- Mensaxe de erro cando a petición falla.
- `WeatherCard` cando existen datos.
- Mensaxe de ausencia de datos cando non se cumpre ningún dos estados anteriores.

A carga inicial realízase despois do primeiro frame mediante `WidgetsBinding.instance.addPostFrameCallback()` para evitar chamar a `notifyListeners()` durante o proceso inicial de construción da interface.

Actualmente utilízanse temporalmente as coordenadas de Ourense para validar o módulo.

A integración futura asociará a meteoroloxía ás coordenadas reais das hortas.

---

# API Configuration and Secrets

As claves de APIs non se escriben directamente no código fonte.

Durante o desenvolvemento poden proporcionarse mediante:

```text
--dart-define
```

ou mediante:

```text
--dart-define-from-file
```

Estrutura actual:

```text
config/
├── secrets.json
└── secrets.example.json
```

`secrets.json` contén as claves reais do entorno local e está excluído do control de versións mediante `.gitignore`.

`secrets.example.json` non contén credenciais reais e pode versionarse para documentar as variables necesarias.

Configuración actual:

```json
{
  "OPENWEATHER_API_KEY": ""
}
```

O código accede á clave mediante:

```dart
const apiKey = String.fromEnvironment(
  'OPENWEATHER_API_KEY',
);
```

Exemplo de execución durante o desenvolvemento:

```text
flutter run -d windows --dart-define-from-file=config/secrets.json
```

Este mecanismo evita subir accidentalmente as claves ao repositorio.

Non obstante, unha clave incorporada nunha aplicación cliente compilada non debe considerarse un segredo completamente protexido. Se no futuro MARTOLA necesitase credenciais que non puidesen ser expostas ao cliente, sería necesario utilizar un backend que almacenase esas credenciais.

---

# Navigation Flow

Fluxo funcional actualmente relevante:

```text
Inicio
  ↓
Dashboard
  ├── Meteoroloxía actual
  ↓
Lista de Hortas
  ↓
Detalle dunha Horta
  ↓
Lista de Plantas
  ↓
Detalle dunha Planta
  ↓
Evolución
  ↓
Lista de Rexistros
  ↓
Detalle do Rexistro
```

Operacións asociadas:

```text
Horta
├── Crear
├── Editar
└── Eliminar

Planta
├── Crear
├── Editar
└── Eliminar

Evolución
├── Crear rexistro
├── Editar rexistro
└── Eliminar rexistro

Meteoroloxía
└── Consultar condicións actuais
```

Funcionalidades futuras previstas no fluxo:

- Meteoroloxía específica por horta.
- Predición meteorolóxica.
- Histórico climático.
- Deseño visual da horta.
- Configuración.
- Tarefas e alertas.

---

# Responsive Design

## Mobile

Navegación principalmente secuencial e vertical.

## Tablet

Prevese uso de múltiples columnas e paneis simultáneos.

## Desktop

Prevese maior aproveitamento do espazo horizontal e posible navegación mediante sidebar.

O deseño responsive será especialmente relevante para:

- `GardenDetailsScreen`
- Listas e detalles.
- Futuro `LayoutDesignerScreen`

---

# Figma Structure

Debido ás limitacións da versión gratuíta de Figma, o proxecto estrutúrase en tres páxinas:

## Page 1 — `00_System_&_Wireframes`

- Design System
- Assets
- Wireframes

## Page 2 — `01_Mobile_UI`

- Mockups finais para móbil

## Page 3 — `02_Desktop_&_Prototype`

- Mockups de escritorio
- Prototipo navegable

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

A prioridade actual continúa sendo completar e estabilizar a funcionalidade antes do refinamento visual definitivo.

---

# Current Version

## Version

`0.1.0-alpha`

## Status

🟢 En desenvolvemento activo

## Last Updated

2026-08-18

## Current Phase

A infraestrutura local principal do MVP está operativa mediante SQLite v3.

Están implementados de extremo a extremo:

- CRUD de hortas.
- Catálogo local de especies.
- CRUD de plantas.
- CRUD de rexistros de evolución.
- Consulta meteorolóxica actual mediante OpenWeather.

A persistencia foi comprobada entre reinicios e as relacións entre hortas, plantas, especies e evolución están implementadas mediante claves foráneas.

A aplicación tamén dispón xa dunha primeira integración cun servizo externo mediante HTTP, Repository Pattern e xestión reactiva dos estados de rede.

---

# Current Progress

## Analysis & Planning

- ✅ Descrición inicial do proxecto
- ✅ Análise de requisitos
- ✅ Planificación inicial
- ✅ Estrutura da memoria final

## Design

- ✅ Fluxo de navegación
- ✅ Estrutura Figma definida
- ✅ Wireframes definidos
- ⏳ Design System
- ⬜ Mockups finais

## Architecture

- ✅ MVVM simplificado
- ✅ Repository Pattern
- ✅ Estrutura de carpetas
- ✅ Provider / MultiProvider
- ✅ Inxección de dependencias desde `main.dart`
- ✅ Contratos Repository asíncronos
- ✅ ViewModels desacoplados das fontes concretas de datos
- ✅ `GardensViewModel`
- ✅ `PlantSpeciesViewModel`
- ✅ `PlantsViewModel`
- ✅ `PlantEvolutionViewModel`
- ✅ `WeatherViewModel`
- ✅ Repositories SQLite para hortas, especies, plantas e evolución
- ✅ Repository para acceso á API meteorolóxica
- ✅ Service dedicado á comunicación HTTP con OpenWeather

## Database

- ✅ SQLite multiplataforma
- ✅ `DatabaseService`
- ✅ `martola.db`
- ✅ Versionado do esquema
- ✅ Migración v1 → v2
- ✅ Migración v2 → v3
- ✅ Conservación dos datos existentes
- ✅ `gardens`
- ✅ `plant_species`
- ✅ `garden_plants`
- ✅ `plant_evolution_records`
- ✅ Claves foráneas
- ✅ `ON DELETE CASCADE`
- ✅ `ON DELETE RESTRICT`
- ✅ Datas ISO 8601
- ✅ Valores opcionais `NULL`
- ✅ Catálogo inicial de especies

## Development

- ✅ Home e Dashboard iniciais
- ✅ CRUD completo de hortas
- ✅ Persistencia real das hortas
- ✅ Módulo de especies
- ✅ CRUD completo de plantas
- ✅ Navegación Horta → Plantas → Detalle
- ✅ CRUD completo de evolución
- ✅ Navegación Planta → Evolución → Detalle
- ✅ Formularios con validación
- ✅ `TextEditingController`
- ✅ `showDatePicker`
- ✅ Conversión segura de datos de formulario
- ✅ Uso de `context.mounted` tras operacións asíncronas
- ✅ Actualización reactiva mediante Provider
- ✅ Petición HTTP GET real
- ✅ Deserialización JSON
- ✅ Modelo `WeatherData`
- ✅ Integración OpenWeather
- ✅ `WeatherService`
- ✅ `WeatherRepository`
- ✅ `OpenWeatherRepository`
- ✅ `WeatherViewModel`
- ✅ Estados `loading / data / error`
- ✅ Tratamento de erros HTTP
- ✅ Tratamento de fallo de conexión
- ✅ Timeout das peticións meteorolóxicas
- ✅ Datos meteorolóxicos reais no Dashboard
- ✅ Configuración da API key fóra do código fonte

## Documentation

- ✅ `PROJECT_CONTEXT.md`
- ✅ `UI_REFERENCE.md`
- ✅ `ARCHITECTURE.md`
- ✅ `DATABASE_DESIGN.md`
- ✅ `ROADMAP.md`
- ✅ `DEVELOPMENT_GUIDE.md`
- ✅ `LEARNING_NOTES.md`

---

# Important Technical Decisions

- Arquitectura Local First.
- SQLite antes que Firebase ou sincronización cloud.
- MVVM simplificado para manter unha complexidade asumible.
- Repository Pattern para desacoplar o dominio das fontes concretas de datos.
- Provider para distribuír e observar o estado compartido.
- `main.dart` como punto de composición e inxección de dependencias.
- As Views non acceden directamente á base de datos nin ás APIs externas.
- Os ViewModels dependen dos contratos Repository, non das implementacións concretas.
- Os modelos de dominio mantéñense independentes da interface.
- Os modelos poden implementar `toMap()` e `fromMap()` para a fronteira coa persistencia.
- Os identificadores poden ser `String` no dominio e `INTEGER` en SQLite.
- Os `DateTime` almacénanse como `TEXT` ISO 8601.
- Os campos opcionais persístense como `NULL` cando non existe un valor.
- As migracións SQLite son acumulativas mediante comprobacións de `oldVersion`.
- As claves foráneas actívanse explicitamente con `PRAGMA foreign_keys = ON`.
- A eliminación dunha horta elimina as súas plantas mediante `ON DELETE CASCADE`.
- A eliminación dunha planta elimina os seus rexistros de evolución mediante `ON DELETE CASCADE`.
- Unha especie utilizada por unha planta está protexida mediante `ON DELETE RESTRICT`.
- `PlantSpeciesRepository`, `GardenPlantRepository`, `PlantEvolutionRecordRepository` e `WeatherRepository` mantéñense separados por responsabilidade.
- `PlantsViewModel` conserva o contexto da horta activa mediante `_currentGardenId`.
- `PlantEvolutionViewModel` conserva o contexto da planta activa mediante `_currentPlantId`.
- Os formularios manteñen o estado temporal na propia View mediante `StatefulWidget` e `setState()`.
- Os `TextEditingController` créanse e libéranse no ciclo de vida do `State`.
- Os formularios utilizan `Form`, `GlobalKey<FormState>` e validadores.
- Os campos opcionais baleiros convértense a `null` cando esa é a semántica do dominio.
- `context.read()` úsase para accións, `context.watch()` para observar estado e `context.select()` para observar partes concretas.
- As entidades persistidas actualízanse preferentemente mediante o seu identificador.
- As pantallas de detalle consultan a versión actual da entidade desde o ViewModel cando necesitan permanecer sincronizadas.
- Os widgets de presentación comunican accións mediante callbacks cando convén desacoplalos da navegación.
- As novas funcionalidades desenvólvense incrementalmente: dominio → infraestrutura → ViewModel → interface → proba.
- Os servizos externos encapsúlanse en clases `Service` específicas.
- Os Repositories abstraen o ViewModel do provedor externo concreto.
- `WeatherViewModel` non coñece OpenWeather directamente; depende de `WeatherRepository`.
- `OpenWeatherRepository` implementa actualmente o contrato meteorolóxico utilizando `WeatherService`.
- As respostas JSON externas convértense a modelos propios antes de chegar á interface.
- O estado dunha operación de rede represéntase explicitamente mediante carga, datos e erro.
- `notifyListeners()` permite que a interface reaccione aos cambios dese estado.
- As operacións que notifican cambios non deben iniciarse durante o primeiro `build`; cando é necesario utilízase `addPostFrameCallback()`.
- Os erros técnicos das APIs detéctanse no Service.
- `WeatherException` permite propagar erros meteorolóxicos cara ás capas superiores.
- As peticións externas dispoñen dun timeout para evitar esperas indefinidas.
- As claves de APIs non se escriben directamente no código nin se versionan.
- `secrets.json` está excluído mediante `.gitignore`.
- `secrets.example.json` documenta as variables necesarias sen conter credenciais.
- `String.fromEnvironment()` permite recuperar os valores proporcionados durante a execución ou compilación.
- As claves incorporadas nun cliente compilado non se consideran segredos completamente protexidos; un backend sería necesario para credenciais que deban permanecer realmente privadas.
- Flutter e a funcionalidade teñen prioridade fronte ao refinamento visual nesta fase.
- O deseño seguirá sendo responsive desde o inicio.
- A documentación técnica mantense sincronizada co estado real do proxecto.

---

# Current Milestone

## Achieved

A infraestrutura relacional principal do MVP está implementada ata SQLite v3.

Actualmente funciona:

```text
Garden
 1
 │
 N
GardenPlant

GardenPlant
 N
 │
 1
PlantSpecies

GardenPlant
 1
 │
 N
PlantEvolutionRecord
```

Os módulos de hortas, plantas e evolución dispoñen de CRUD persistente completo desde a interface.

O módulo de evolución, completado na sesión 16, pechou o bloque principal de seguemento manual das plantas previsto para o MVP.

Na sesión 17 completouse o primeiro módulo baseado nunha API externa.

A integración meteorolóxica básica permite actualmente:

```text
Dashboard
   ↓
WeatherViewModel
   ↓
WeatherRepository
   ↓
OpenWeatherRepository
   ↓
WeatherService
   ↓
OpenWeather
```

A aplicación obtén datos meteorolóxicos reais, transforma a resposta JSON nun modelo propio e representa na interface os estados de carga, datos e erro.

Tamén quedaron implementados o tratamento básico de erros HTTP, conexión e timeout, así como a xestión local das credenciais mediante `dart-define`.

## Next Development Step

O seguinte paso deberá decidirse segundo `ROADMAP.md`, mantendo o desenvolvemento incremental e evitando ampliar innecesariamente o alcance do MVP.

Tras completar a meteoroloxía básica, quedan pendentes dentro ou arredor deste bloque:

- Asociar coordenadas reais ás hortas.
- Permitir obter a localización mediante localidade ou mapa.
- Mostrar meteoroloxía específica para cada horta.
- Decidir o comportamento da meteoroloxía do Dashboard cando existan varias hortas.
- Valorar unha horta principal.
- Integrar MeteoSIX cando estean dispoñibles as credenciais necesarias.
- Incorporar predición meteorolóxica.
- Desenvolver o histórico climático.

Outros bloques principais aínda previstos:

- Deseño visual da distribución da horta.
- Revisión do responsive design.
- Probas.
- Refinamento da interface.
- Preparación progresiva da memoria final.

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
- Exportación de información histórica das plantas.
- Ampliación ou integración externa do catálogo de especies.
- Xeocodificación de localizacións.
- Selección de localización mediante mapa.
- Meteoroloxía específica por horta.
- Integración de múltiples provedores meteorolóxicos.

---

# Notes

Este documento considérase a fonte principal de contexto do proxecto MARTOLA.

Calquera cambio relevante na arquitectura, navegación, base de datos ou planificación deberá reflectirse neste ficheiro e na documentación asociada.

O desenvolvemento realízase seguindo unha aprendizaxe progresiva de Flutter e Dart. Cada funcionalidade impleméntase unha vez comprendidos os principios técnicos que a sustentan.

A prioridade é construír unha primeira versión funcional, coherente e mantible antes de introducir funcionalidades avanzadas ou melloras estéticas.

A documentación debe manterse sincronizada co estado real do código e servir como base para a elaboración da memoria final.