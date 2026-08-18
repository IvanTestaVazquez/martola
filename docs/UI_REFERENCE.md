**\# UI_REFERENCE.md**

**\# MARTOLA - User Interface Reference**

**\## Purpose**

Este documento describe a estrutura visual e funcional das pantallas da
aplicación MARTOLA.

Non pretende definir o deseño visual final da aplicación. O seu
obxectivo é servir como referencia para:

\- Desenvolvemento en Flutter - Deseño en Figma - Organización da
navegación - Identificación de widgets reutilizables

**\*\*---\*\***

**\# General Layout Rules**

**\## Mobile First**

Resolución base:

390 x 844

**\*\*---\*\***

**\## Spacing System**

Valores base:

\- XS = 4 - SM = 8 - MD = 16 - LG = 24 - XL = 32

**\*\*---\*\***

**\## Horizontal Padding**

Padding estándar:

16 px

**\*\*---\*\***

**\## Border Radius**

Tarxetas e elementos principais:

12 px

**\*\*---\*\***

**\# Reusable Widgets**

Os widgets reutilizables poden ser globais ou específicos dunha
funcionalidade.

Os widgets específicos dun módulo permanecerán dentro do directorio dese
módulo mentres non exista unha necesidade real de reutilización global.

**\*\*---\*\***

**\## MartolaLogo**

**\### Descrición**

Representa o elemento visual de identidade de MARTOLA.

**\### Uso actual**

\- HomeScreen

**\### Estado**

✅ Implementado

**\*\*---\*\***

**\## WeatherCard**

**\### Descrición**

Mostra un resumo da información meteorolóxica.

**\### Información actual**

\- Temperatura - Estado meteorolóxico - Localización

**\### Uso actual**

\- DashboardScreen

**\### Estado**

✅ Implementado con datos ficticios.

A información será substituída posteriormente por datos procedentes do
módulo meteorolóxico.

**\*\*---\*\***

**\## GardenCard**

**\### Descrición**

Mostra un resumo da información relacionada coas hortas do usuario.

**\### Información actual**

\- Número de hortas dispoñibles. - Acción para acceder ao módulo de
hortas.

**\### Uso actual**

\- DashboardScreen

**\### Estado**

✅ Implementado.

O número de hortas mostrado procede do estado compartido de
\`GardensViewModel\`.

\`DashboardScreen\` obtén este valor mediante Provider e proporciónao ao
widget como dato de presentación.

\`GardenCard\` non accede directamente ao ViewModel e mantense
desacoplado da xestión do estado.

**\*\*---\*\***

**\## TasksCard**

**\### Descrición**

Mostra un resumo das tarefas pendentes.

**\### Información actual**

\- Número de tarefas pendentes. - Acción para acceder á lista de
tarefas.

**\### Uso actual**

\- DashboardScreen

**\### Estado**

✅ Implementado con datos ficticios.

**\*\*---\*\***

**\## QuickActionsCard**

**\### Descrición**

Agrupa accesos directos ás accións máis frecuentes desde o Dashboard.

**\### Accións actuais**

\- Crear nova horta. - Engadir nova tarefa.

**\### Uso actual**

\- DashboardScreen

**\### Estado**

✅ Implementado

As accións dependentes dunha horta concreta, como engadir unha planta,
non se mostrarán neste widget global e estarán dispoñibles dentro do
contexto da horta correspondente.

**\*\*---\*\***

**\## GardenListItem**

**\### Descrición**

Representa unha horta individual dentro do listado de hortas.

**\### Información**

\- Nome. - Localización. - Superficie.

**\### Interacción**

Permite seleccionar a horta mediante \`InkWell\`.

A interacción comunícase mediante:

\`\`\`dart final void Function(Garden) onTap; \`\`\`

**\### Uso actual**

\- GardensScreen

**\### Estado**

✅ Implementado

**\*\*---\*\***

\*\*## Plant List Item Pattern

### Descrición

As plantas dunha horta represéntanse actualmente directamente desde
`PlantListScreen`.

A implementación segue o mesmo criterio de interacción empregado no
listado de hortas:

-   elemento visual propio;
-   interacción mediante `InkWell`;
-   navegación ao detalle mediante o identificador da planta.

### Información actual

-   Nome personalizado.
-   Información necesaria para identificar a planta no listado.

### Uso actual

-   `PlantListScreen`

### Estado

✅ Implementado.

Poderá extraerse posteriormente a un widget reutilizable específico se
aparece unha necesidade real de reutilización ou se aumenta a
complexidade visual do elemento.

**---**

## ActionCard\*\*

**\### Descrición**

Tarxeta prevista para proporcionar acceso rápido ás funcionalidades
dunha horta.

**\### Uso previsto**

\- GardenDetailsScreen

**\### Accións previstas**

\- Plantas. - Evolución. - Meteoroloxía. - Deseño visual.

**\### Estado**

⬜ Pendente

**\*\*---\*\***

**\## MainBottomNavigation**

**\### Descrición**

Posible barra principal de navegación para dispositivos móbiles.

**\### Estado**

⬜ Pendente de validación durante a evolución da navegación.

A navegación actual utiliza \`Navigator\` estándar entre pantallas.

**\*\*---\*\***

**\# Screens**

**\## HomeScreen**

**\### Propósito**

Pantalla inicial de entrada á aplicación.

**\### Seccións actuais**

\- Identidade visual de MARTOLA. - Nome da aplicación. - Descrición
breve. - Botón de entrada.

**\### Widgets utilizados**

\- MartolaLogo - Text - ElevatedButton

**\### Navegación**

\`\`\`text HomeScreen     ↓   Entrar     ↓ DashboardScreen \`\`\`

**\### Estado**

✅ Implementada

**\*\*---\*\***

**\## DashboardScreen**

**\### Propósito**

Panel principal da aplicación e punto central de acceso aos diferentes
módulos.

**\### Seccións actuais**

\- Resumo meteorolóxico. - Resumo de hortas. - Resumo de tarefas. -
Accións rápidas.

**\### Widgets utilizados**

\- WeatherCard - GardenCard - TasksCard - QuickActionsCard

**\### Navegación actual**

\`\`\`text DashboardScreen ├── GardenCard │      └── GardensScreen │ ├──
TasksCard │      └── TasksScreen │ └── QuickActionsCard        ├──
CreateGardenScreen        └── CreateTaskScreen \`\`\`

**\### Estado**

✅ Primeira versión funcional implementada.

A información mostrada combina actualmente datos reais do estado da
aplicación con datos ficticios:

\- O número de hortas procede de \`GardensViewModel\`. - A información
meteorolóxica continúa sendo ficticia. - A información de tarefas
continúa sendo ficticia.

Os datos ficticios substituiranse progresivamente polos módulos
funcionais correspondentes.

**\*\*---\*\***

**\## GardensScreen**

**\### Propósito**

Mostrar as hortas almacenadas no estado da aplicación e permitir
seleccionar unha delas.

**\### Seccións actuais**

\- AppBar. - Lista dinámica de hortas.

**\### Widgets utilizados**

\- ListView.builder - GardenListItem

**\### Datos actuais**

A colección de hortas procede de \`GardensViewModel\`.

A pantalla observa o estado mediante Provider:

\`\`\`dart context.watch\<GardensViewModel\>() \`\`\`

Deste xeito, a lista reconstrúese automaticamente cando se crean, editan
ou eliminan hortas.

**\### Interacción**

Ao seleccionar un \`GardenListItem\`, a pantalla recibe o modelo
seleccionado mediante callback.

Para navegar ao detalle utilízase a identidade da horta:

\`\`\`text GardensScreen       ↓ GardenListItem       ↓ onTap(garden)  
    ↓ garden.id       ↓ GardenDetailsScreen \`\`\`

\`GardenDetailsScreen\` non depende da instancia recibida polo listado,
senón que utiliza o identificador para consultar a versión actual da
entidade no estado compartido.

**\### Estado**

✅ Funcional con estado compartido mediante Provider.

✅ Persistencia mediante SQLite integrada.

**\*\*---\*\***

**\## GardenDetailsScreen**

**\### Propósito**

Mostrar a información actual dunha horta concreta e actuar
progresivamente como centro de control desa horta.

**\### Información actual**

\- Nome. - Localización. - Superficie.

**\### Entrada**

A pantalla recibe:

\`\`\`dart String gardenId \`\`\`

mediante o constructor.

Non conserva unha copia independente da entidade como fonte de datos.

A versión actual da horta obtense desde \`GardensViewModel\` mediante:

\`\`\`dart getGardenById(gardenId) \`\`\`

e Provider.

O fluxo é:

\`\`\`text GardenDetailsScreen         ↓     gardenId         ↓
GardensViewModel         ↓  getGardenById()         ↓    Garden actual
\`\`\`

Deste xeito, se a horta é modificada, a pantalla pode reconstruírse
mostrando a nova instancia almacenada no ViewModel.

**\### Accións actuais**

\- Editar horta. - Eliminar horta.

**\### Eliminación**

A eliminación utiliza o identificador da horta.

Antes de eliminar móstrase un diálogo de confirmación mediante
\`AlertDialog\`.

Se o usuario confirma:

\`\`\`text GardenDetailsScreen         ↓ removeGarden(gardenId)        
↓ GardensViewModel         ↓ eliminación do estado \`\`\`

**\### Funcionalidades previstas**

\- Plantas. - Evolución. - Meteoroloxía. - Deseño da horta. - Outras
accións relacionadas coa horta.

**\### Estado**

✅ Visualización funcional conectada ao estado compartido.

✅ Edición integrada.

✅ Eliminación integrada.

✅ Acceso ao módulo de plantas integrado.

⏳ Integración da meteoroloxía coa localización específica da horta e
deseño visual pendentes.

O módulo meteorolóxico básico xa funciona no Dashboard, pero aínda non
está contextualizado por horta.

**\*\*---\*\***

**\## CreateGardenScreen**

**\### Propósito**

Permitir introducir e validar os datos necesarios para crear unha nova
horta.

**\### Tipo**

StatefulWidget

**\### Campos actuais**

\- Nome. - Localización. - Superficie.

**\### Xestión do formulario**

Utiliza:

\- Form. - GlobalKey\<FormState\>. - TextFormField. -
TextEditingController. - Validators.

**\### Validación**

Compróbase que:

\- O nome sexa válido. - A localización sexa válida. - A superficie
poida converterse correctamente a \`double\`. - A superficie cumpra as
condicións definidas polo formulario.

**\### Resultado**

Cando os datos son válidos:

1\. Convértense os valores necesarios. 2. Créase unha instancia de
\`Garden\`. 3. A pantalla solicita a creación mediante:

\`\`\`dart context     .read\<GardensViewModel\>()    
.addGarden(garden); \`\`\`

4\. \`GardensViewModel\` delega a creación no \`GardenRepository\`. 5.
SQLite xera o identificador persistente. 6. A entidade devolta polo
Repository incorpórase ao estado compartido. 7. \`notifyListeners()\`
informa ás Views subscritas. 8. A pantalla péchase mediante
\`Navigator.pop()\`.

O fluxo actual é:

\`\`\`text CreateGardenScreen         ↓     Garden         ↓
GardensViewModel         ↓    addGarden()         ↓ estado compartido  
      ↓ notifyListeners() \`\`\`

**\### Estado**

✅ Formulario funcional.

✅ Integrado coa xestión de estado mediante Provider.

✅ Persistencia mediante Repository e SQLite integrada.

**\*\*---\*\***

**\## EditGardenScreen**

**\### Propósito**

Permitir modificar os datos dunha horta existente.

**\### Tipo**

StatefulWidget

**\### Entrada**

Recibe unha instancia de \`Garden\` coa información que debe mostrarse
inicialmente no formulario.

**\### Campos**

\- Nome. - Localización. - Superficie.

**\### Inicialización**

Os \`TextEditingController\` inicialízanse en \`initState()\` utilizando
os valores da horta recibida.

\`\`\`text Garden   ↓ initState()   ↓ TextEditingController   ↓
formulario cuberto \`\`\`

Os controladores decláranse mediante \`late final\` e libéranse
posteriormente en \`dispose()\`.

**\### Validación**

Utiliza as mesmas regras básicas de validación que
\`CreateGardenScreen\`.

**\### Actualización**

Cando os datos son válidos:

1\. Créase unha nova instancia de \`Garden\`. 2. Consérvase o
identificador da entidade orixinal. 3. Solicítase a actualización a
\`GardensViewModel\`. 4. O ViewModel substitúe a instancia anterior. 5.
\`notifyListeners()\` informa ás Views. 6. Péchase a pantalla de
edición.

\`\`\`text EditGardenScreen        ↓ updatedGarden        ↓
GardensViewModel        ↓ updateGarden()        ↓ notifyListeners()
\`\`\`

A actualización non modifica directamente a instancia existente porque o
modelo \`Garden\` é inmutable.

**\### Estado**

✅ Formulario funcional.

✅ Integrado con \`GardensViewModel\`.

✅ Persistencia dos cambios mediante Repository e SQLite integrada.

**\*\*---\*\***

**\## TasksScreen**

**\### Propósito**

Mostrar as tarefas pendentes do usuario.

**\### Estado**

🟡 Pantalla provisional creada.

A implementación funcional realizarase nunha fase posterior.

**\*\*---\*\***

**\## CreateTaskScreen**

**\### Propósito**

Permitir crear unha nova tarefa.

**\### Estado**

🟡 Pantalla provisional creada.

O formulario funcional implementarase nunha fase posterior.

**\*\*---\*\***

\*\*## PlantListScreen

### Propósito

Mostrar as plantas pertencentes á horta actualmente seleccionada.

### Entrada

Recibe:

``` dart
String gardenId
```

A pantalla establece o contexto mediante:

``` text
PlantsViewModel.loadPlants(gardenId)
```

`PlantsViewModel` conserva internamente:

``` text
_currentGardenId
```

e mantén na súa colección unicamente as plantas da horta activa.

### Seccións actuais

-   AppBar.
-   Lista de plantas.
-   Estado baleiro cando non existen plantas.
-   Acción para engadir unha nova planta.

### Interacción

Ao seleccionar unha planta navega mediante o seu identificador:

``` text
PlantListScreen
      ↓
   plantId
      ↓
PlantDetailsScreen
```

### Estado

✅ Implementada.

✅ Integrada con Provider.

✅ Integrada con SQLite.

**---**

## AddPlantScreen

### Propósito

Crear unha planta dentro da horta actualmente cargada.

### Tipo

`StatefulWidget`

### Campos actuais

-   Nome personalizado.
-   Especie.
-   Data de plantación.

### Xestión do formulario

Utiliza:

-   `Form`.
-   `GlobalKey<FormState>`.
-   `TextEditingController`.
-   `DropdownButtonFormField`.
-   `showDatePicker()`.

A especie selecciónase a partir dos datos proporcionados por
`PlantSpeciesViewModel`.

A relación coa horta non se solicita ao usuario.

`PlantsViewModel` utiliza `_currentGardenId` para asociar
automaticamente a nova planta coa horta activa.

### Fluxo

``` text
AddPlantScreen
      ↓
PlantsViewModel.addPlant()
      ↓
GardenPlantRepository
      ↓
SQLite
      ↓
estado compartido
      ↓
notifyListeners()
```

### Estado

✅ Implementada e funcional.

**---**

## PlantDetailsScreen

### Propósito

Mostrar a información actual dunha planta concreta e actuar como punto
de acceso ás accións relacionadas con ela.

### Entrada

Recibe:

``` dart
String plantId
```

A planta obtense desde o estado compartido mediante:

``` text
PlantsViewModel.getPlantById(plantId)
```

A especie asociada resólvese mediante:

``` text
PlantSpeciesViewModel.getSpeciesById(speciesId)
```

### Información actual

-   Nome personalizado.
-   Nome común da especie.
-   Data de plantación.

### Accións actuais

-   Editar planta.
-   Eliminar planta.
-   Acceder ao histórico de evolución.

### Navegación

``` text
PlantDetailsScreen
├── EditPlantScreen
├── Eliminar planta
└── PlantEvolutionListScreen
```

### Estado

✅ Implementada.

✅ Sincronizada mediante Provider.

**---**

## EditPlantScreen

### Propósito

Modificar os datos dunha planta existente.

### Tipo

`StatefulWidget`

### Entrada

Recibe a planta que debe editarse.

### Inicialización

Os valores iniciais do formulario obtéñense en `initState()`:

``` text
customName
speciesId
plantingDate
```

Os `TextEditingController` libéranse en `dispose()`.

### Actualización

Ao gardar:

``` text
EditPlantScreen
      ↓
PlantsViewModel.updatePlant()
      ↓
GardenPlantRepository
      ↓
SQLite
      ↓
_plants
      ↓
notifyListeners()
```

### Estado

✅ Implementada e funcional.

**---**

## PlantEvolutionListScreen

### Propósito

Mostrar o histórico de evolución da planta seleccionada.

### Entrada

Recibe:

``` dart
String plantId
```

Ao inicializar a pantalla establécese o contexto mediante:

``` text
PlantEvolutionViewModel.loadRecords(plantId)
```

O ViewModel conserva:

``` text
_currentPlantId
```

### Seccións actuais

-   AppBar.
-   Lista de rexistros.
-   Estado baleiro cando non existen rexistros.
-   Acción para engadir un rexistro.

### Navegación

``` text
PlantEvolutionListScreen
├── AddPlantEvolutionRecordScreen
└── PlantEvolutionDetailsScreen
```

Cada detalle recibe:

``` text
recordId
```

### Estado

✅ Implementada.

✅ Integrada con Provider.

✅ Integrada con SQLite.

**---**

## AddPlantEvolutionRecordScreen

### Propósito

Crear unha nova observación no histórico da planta activa.

### Tipo

`StatefulWidget`

### Campos actuais

-   Data.
-   Altura opcional.
-   Notas opcionais.

### Formulario

Utiliza:

-   `Form`.
-   `GlobalKey<FormState>`.
-   `TextEditingController`.
-   `showDatePicker()`.
-   validación numérica da altura.

Unha altura baleira convértese en:

``` text
null
```

As notas baleiras convértense igualmente en `null`.

A planta asociada non se selecciona manualmente.

`PlantEvolutionViewModel` utiliza `_currentPlantId`.

### Fluxo

``` text
AddPlantEvolutionRecordScreen
          ↓
PlantEvolutionViewModel.addRecord()
          ↓
PlantEvolutionRecordRepository
          ↓
SQLite
          ↓
_records
          ↓
notifyListeners()
```

### Estado

✅ Implementada e funcional.

**---**

## PlantEvolutionDetailsScreen

### Propósito

Mostrar os datos actuais dun rexistro de evolución.

### Entrada

Recibe:

``` dart
String recordId
```

O rexistro obtense mediante:

``` text
PlantEvolutionViewModel.getRecordById(recordId)
```

### Información actual

-   Data.
-   Altura.
-   Notas.

Se non existe altura ou notas, a interface mostra unha mensaxe apropiada
en lugar de `null`.

### Accións

-   Editar rexistro.
-   Eliminar rexistro.

A eliminación require confirmación mediante `AlertDialog`.

### Estado

✅ Implementada e funcional.

**---**

## EditPlantEvolutionRecordScreen

### Propósito

Modificar un rexistro de evolución existente.

### Tipo

`StatefulWidget`

### Entrada

Recibe o `PlantEvolutionRecord` que debe editarse.

### Inicialización

En `initState()` inicialízanse:

-   altura;
-   notas;
-   data.

Os campos opcionais `null` represéntanse como campos baleiros no
formulario.

### Actualización

Ao gardar:

``` text
EditPlantEvolutionRecordScreen
          ↓
PlantEvolutionViewModel.updateRecord()
          ↓
PlantEvolutionRecordRepository
          ↓
SQLite
          ↓
_records
          ↓
notifyListeners()
```

`PlantEvolutionDetailsScreen` consulta o rexistro polo seu
identificador, polo que mostra a versión actualizada do estado
compartido.

### Estado

✅ Implementada e funcional.

**---**

## LayoutDesignerScreen\*\*

**\### Propósito**

Representación visual da horta.

**\### Seccións**

\- Header - Barra de ferramentas - Área de deseño - Lista de plantas

**\### Widgets utilizados**

\- ToolButton - LayoutCanvas - PlantLayoutItem

**\### Estado**

⬜ Pendente

**\*\*---\*\***

\*\*# Current UI Flow

O fluxo funcional principal actualmente implementado é:

``` text
HomeScreen
    ↓
DashboardScreen
    │
    ├── GardensScreen
    │       ↓
    │   GardenListItem
    │       ↓
    │   GardenDetailsScreen
    │       ├── EditGardenScreen
    │       ├── Eliminar horta
    │       └── PlantListScreen
    │               ├── AddPlantScreen
    │               └── PlantDetailsScreen
    │                       ├── EditPlantScreen
    │                       ├── Eliminar planta
    │                       └── PlantEvolutionListScreen
    │                               ├── AddPlantEvolutionRecordScreen
    │                               └── PlantEvolutionDetailsScreen
    │                                       ├── EditPlantEvolutionRecordScreen
    │                                       └── Eliminar rexistro
    │
    ├── WeatherCard
    │       ↑
    │   WeatherViewModel
    │
    ├── TasksScreen
    │
    ├── CreateGardenScreen
    │
    └── CreateTaskScreen
```

O fluxo principal de identidade entre pantallas utiliza:

``` text
gardenId
   ↓
plantId
   ↓
recordId
```

As pantallas de detalle consultan a versión actual das entidades desde
os ViewModels correspondentes.

------------------------------------------------------------------------

# Current UI State Management

A interface utiliza actualmente cinco ViewModels compartidos:

``` text
GardensViewModel
PlantSpeciesViewModel
PlantsViewModel
PlantEvolutionViewModel
WeatherViewModel
```

Distribuídos mediante:

``` text
MultiProvider
```

A relación conceptual xeral é:

``` text
Views
  ↓
Provider
  ↓
ViewModels
  ↓
Repositories
  ↓
fontes de datos
```

Para os módulos persistentes:

``` text
Repositories
  ↓
SQLite
```

Para a meteoroloxía actual:

``` text
WeatherViewModel
      ↓
WeatherRepository
      ↑
OpenWeatherRepository
      ↓
WeatherService
      ↓
OpenWeather API
```

Uso principal:

``` text
context.read()
→ executar accións

context.watch()
→ observar coleccións ou estado compartido

context.select()
→ observar unha entidade ou valor concreto
```

`PlantsViewModel` mantén o contexto da horta activa mediante:

``` text
_currentGardenId
```

`PlantEvolutionViewModel` mantén o contexto da planta activa mediante:

``` text
_currentPlantId
```

Isto evita mesturar coleccións pertencentes a diferentes entidades pai.

`WeatherViewModel` non mantén actualmente un contexto persistente por
horta. Conserva o estado da consulta meteorolóxica actual:

``` text
weatherData
isLoading
errorMessage
```

e informa á interface mediante `notifyListeners()`.

A asociación da meteoroloxía coa horta seleccionada implementarase nunha
ampliación posterior.

------------------------------------------------------------------------

# Current Persistence State

A persistencia local está integrada mediante SQLite.

Versión actual:

``` text
version: 3
```

Táboas relacionadas coa interface actual:

``` text
gardens
plant_species
garden_plants
plant_evolution_records
```

Os CRUD de:

-   hortas;
-   plantas;
-   rexistros de evolución;

funcionan desde a interface ata SQLite.

Provider encárgase da sincronización do estado observable.

Navigator encárgase do movemento entre pantallas.

Repository e `DatabaseService` encárganse da persistencia.

A meteoroloxía actual constitúe unha excepción a este fluxo persistente:
`WeatherData` mantense en memoria e non se almacena aínda en SQLite.

``` text
OpenWeather API
      ↓
WeatherData
      ↓
WeatherViewModel
      ↓
UI
```

Por tanto, a versión da base de datos continúa sendo:

``` text
version: 3
```

e o histórico meteorolóxico queda pendente.

**---**

# Session 17 - UI Weather Integration

## Estado

✅ Integración básica completada.

## Cambios visibles

-   `WeatherCard` deixa de utilizar datos meteorolóxicos ficticios.
-   `DashboardScreen` mostra datos reais obtidos mediante OpenWeather.
-   Engádese un estado visual de carga.
-   Engádese unha mensaxe visual de erro.
-   Mantense un estado alternativo cando non existen datos.
-   A tarxeta meteorolóxica continúa desacoplada da fonte de datos.

## Fluxo actual

``` text
OpenWeather API
      ↓
WeatherService
      ↓
OpenWeatherRepository
      ↓
WeatherViewModel
      ↓
DashboardScreen
      ↓
WeatherCard
```

## Estados de UI

``` text
loading
  ↓
CircularProgressIndicator

error
  ↓
Text(errorMessage)

data
  ↓
WeatherCard

empty
  ↓
Text("Non hai datos meteorolóxicos")
```

## Localización

A integración básica utiliza actualmente coordenadas coñecidas para
realizar a consulta.

Queda pendente deseñar a experiencia de usuario para seleccionar ou
obter a localización meteorolóxica a partir dunha horta.

As alternativas previstas inclúen:

-   localización gardada na horta;
-   coordenadas;
-   procura por localidade;
-   selección mediante mapa.

Esta decisión deberá integrarse co deseño de `GardenDetailsScreen` e co
futuro Layout Designer sen introducir dependencia directa entre os
widgets de presentación e o provedor meteorolóxico.

------------------------------------------------------------------------

# Desktop Adaptation\*\*

**\## Main Navigation**

A navegación inferior substituirase por:

\- NavigationRail - Sidebar

**\*\*---\*\***

**\## Layout**

En escritorio utilizaranse:

\- múltiples columnas - paneis simultáneos - maior área de traballo

Especialmente en:

\- GardenDetailsScreen - LayoutDesignerScreen

**\*\*---\*\***

**\# Future Screens**

Pantallas previstas para futuras versións:

\- LoginScreen - RegisterScreen - SettingsScreen - NotificationsScreen -
StatisticsScreen

**\*\*---\*\***

**\# Notes**

A implementación actual continúa priorizando funcionalidade fronte a
deseño visual.

Os módulos de hortas, plantas e evolución dispoñen xa dunha primeira
interface funcional con persistencia real. O módulo meteorolóxico básico
tamén está integrado na interface mediante datos remotos reais, aínda
sen persistencia nin contextualización por horta.

Os refinamentos visuais poderán realizarse posteriormente sen alterar o
fluxo básico de navegación.

O deseño definitivo definirase posteriormente mediante o Design System e
os mockups de Figma.

Este documento considérase a referencia principal para a implementación
das pantallas en Flutter.
