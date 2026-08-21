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

\- GardenDetailsScreen

**\### Estado**

✅ Implementado con datos meteorolóxicos reais.

O widget permanece en `lib/widgets/` como compoñente reutilizable. Na
versión actual utilízase de forma contextual no detalle dunha horta.

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

✅ Implementado con datos reais procedentes de `TasksViewModel`.

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

\- Resumo de hortas. - Resumo de tarefas. - Accións rápidas.

**\### Widgets utilizados**

\- GardenCard - TasksCard - QuickActionsCard

**\### Navegación actual**

\`\`\`text DashboardScreen ├── GardenCard │      └── GardensScreen │ ├──
TasksCard │      └── TasksScreen │ └── QuickActionsCard        ├──
CreateGardenScreen        └── CreateTaskScreen \`\`\`

**\### Estado**

✅ Primeira versión funcional implementada.

A información mostrada procede actualmente do estado real da aplicación:

\- O número de hortas procede de \`GardensViewModel\`. - O número de
tarefas pendentes procede de `TasksViewModel`.

A meteoroloxía deixa de mostrarse no Dashboard e permanece asociada ao
contexto dunha horta concreta mediante `GardenDetailsScreen`.

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

\- Nome. - Localización. - Superficie. - Número de plantas. - Condicións
meteorolóxicas actuais cando a horta dispón de coordenadas.

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

\- Editar horta. - Eliminar horta. - Acceder á lista de plantas. -
Acceder ao deseño visual da horta.

**\### Eliminación**

A eliminación utiliza o identificador da horta.

Antes de eliminar móstrase un diálogo de confirmación mediante
\`AlertDialog\`.

Se o usuario confirma:

\`\`\`text GardenDetailsScreen         ↓ removeGarden(gardenId)        
↓ GardensViewModel         ↓ eliminación do estado \`\`\`

**\### Funcionalidades previstas**

\- Plantas. - Evolución. - Meteoroloxía. - Outras accións relacionadas
coa horta.

**\### Estado**

✅ Visualización funcional conectada ao estado compartido.

✅ Edición integrada.

✅ Eliminación integrada.

✅ Acceso ao módulo de plantas integrado.

✅ Meteoroloxía contextualizada mediante as coordenadas persistidas da
horta.

✅ Acceso ao deseño visual da horta mediante `LayoutDesignerScreen`.

`GardenDetailsScreen` carga as plantas da horta para mostrar o seu
número e utiliza `WeatherViewModel` para consultar as condicións
meteorolóxicas correspondentes a `garden.latitude` e `garden.longitude`.

`WeatherCard` reutilízase nesta pantalla como widget global.

**\*\*---\*\***

**\## CreateGardenScreen**

**\### Propósito**

Permitir introducir e validar os datos necesarios para crear unha nova
horta.

**\### Tipo**

StatefulWidget

**\### Campos actuais**

\- Nome. - Localización. - Superficie. - Latitude e longitude obtidas
mediante xeocodificación cando o usuario selecciona un resultado.

**\### Xestión do formulario**

Utiliza:

\- Form. - GlobalKey\<FormState\>. - TextFormField. -
TextEditingController. - Validators.

**\### Validación**

Compróbase que:

\- O nome sexa válido. - A localización sexa válida. - A superficie
poida converterse correctamente a \`double\`. - A superficie cumpra as
condicións definidas polo formulario.

**\### Xeocodificación**

O campo de localización permite realizar unha procura mediante
`GeocodingViewModel`.

A API pode devolver varias coincidencias. A interface mostra os
resultados e require unha selección explícita antes de utilizar as
coordenadas.

Ao seleccionar unha opción:

``` text
localización introducida
    ↓
GeocodingViewModel
    ↓
List<GeocodingResult>
    ↓
selección do usuario
    ↓
nome + latitude + longitude
    ↓
Garden
```

O texto da localización actualízase coa opción seleccionada.

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

\- Nome. - Localización. - Superficie. - Latitude e longitude asociadas
á localización seleccionada.

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

A localización pode volver buscarse mediante `GeocodingViewModel`. Se o
usuario selecciona unha nova coincidencia, a actualización conserva as
novas coordenadas xunto co resto dos datos da horta.

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

Mostrar as tarefas pendentes rexistradas na aplicación.

**\### Seccións actuais**

\- AppBar. - Lista de tarefas. - Estado baleiro cando non existen
tarefas. - Acceso á creación dunha nova tarefa.

**\### Datos**

A colección procede de `TasksViewModel` e mantense sincronizada mediante
Provider.

**\### Estado**

✅ Implementada e funcional.

✅ Integrada con Provider.

✅ Persistencia mediante SQLite.

**\*\*---\*\***

**\## CreateTaskScreen**

**\### Propósito**

Permitir crear unha nova tarefa.

**\### Tipo**

StatefulWidget

**\### Fluxo**

``` text
CreateTaskScreen
    ↓
TasksViewModel
    ↓
TaskRepository
    ↓
SQLite
    ↓
estado compartido
    ↓
notifyListeners()
```

**\### Estado**

✅ Implementada e funcional.

✅ Integrada co módulo persistente de tarefas.

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

## LayoutDesignerScreen

### Propósito

Permitir representar visualmente as plantas dunha horta e gardar a súa
disposición.

### Entrada

Recibe:

``` dart
String gardenId
```

A pantalla utiliza este identificador para cargar tanto as plantas da
horta como os elementos xa gardados no deseño.

### Carga inicial

En `initState()` solicítase:

``` text
GardenLayoutViewModel.loadItems(gardenId)
PlantsViewModel.loadPlants(gardenId)
```

Deste modo o deseño queda contextualizado pola horta seleccionada.

### Seccións actuais

-   AppBar.
-   Selector de plantas dispoñibles.
-   Botón para engadir a planta seleccionada.
-   Área de deseño.
-   Elementos posicionables correspondentes ás plantas engadidas.

### Selector de plantas

O `DropdownButton<GardenPlant>` mostra unicamente as plantas da horta
que aínda non forman parte do deseño.

Conceptualmente:

``` text
plantas da horta
        -
plantas xa colocadas
        =
plantas dispoñibles
```

Unha planta xa engadida deixa de aparecer no selector.

### Área de deseño

A área dispoñible constrúese mediante:

``` text
LayoutBuilder
    ↓
Container
    ↓
Stack
    ↓
Positioned
    ↓
GestureDetector
```

`LayoutBuilder` proporciona as dimensións reais do taboleiro.

Cada planta represéntase actualmente mediante unha caixa cadrada que
contén:

-   icona `Icons.eco`;
-   nome personalizado da planta.

### Posicionamento

As posicións persístense como coordenadas normalizadas:

``` text
xPosition
yPosition
```

A interface convérteas ás dimensións reais do taboleiro.

Isto permite que a disposición non dependa directamente do tamaño
concreto da pantalla.

### Arrastre

Cada elemento pode moverse individualmente mediante `GestureDetector`.

Durante:

``` text
onPanUpdate
```

actualízase a posición observable en memoria.

Ao finalizar:

``` text
onPanEnd
```

persístese a posición final mediante `GardenLayoutViewModel`.

### Límites

O movemento está limitado para manter toda a caixa da planta dentro da
área de deseño.

Os límites teñen en conta a metade do tamaño do elemento e aplícanse
mediante `clamp()`.

### Prevención de solapamento

Antes de aceptar unha nova posición compróbase se a planta se
superpoñería con outro elemento.

Se existe solapamento, a nova posición non se aplica.

Deste modo cada zona ocupada queda reservada para unha única planta.

### Colocación inicial

Ao engadir unha planta nova, a interface busca unha posición dispoñible
no taboleiro antes de crear o `GardenLayoutItem`.

Isto evita que unha planta recentemente engadida apareza directamente
sobre outra xa colocada e impida o movemento de ambas.

### Retirada do deseño

Unha planta pode retirarse do Layout Designer eliminando o seu
`GardenLayoutItem`.

Esta acción non elimina a `GardenPlant` da horta.

### Persistencia

O fluxo é:

``` text
LayoutDesignerScreen
        ↓
GardenLayoutViewModel
        ↓
GardenLayoutRepository
        ↓
SqliteGardenLayoutRepository
        ↓
SQLite
```

As posicións gardadas recupéranse ao volver entrar na pantalla e tamén
despois de reiniciar a aplicación.

### Estado

✅ Primeira versión funcional implementada.

✅ Integrada con Provider.

✅ Persistencia mediante SQLite.

✅ Movemento individual mediante arrastre.

✅ Límites do taboleiro implementados.

✅ Prevención de solapamento implementada.

✅ Colocación inicial sen solapamentos implementada.

### Melloras opcionais

-   Grid ou snapping.
-   Maior fluidez durante o arrastre.
-   Tamaños variables.
-   Representación visual específica segundo a especie.
-   Refinamento responsive do taboleiro.

**---**

# Current UI Flow

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
    │       ├── WeatherCard
    │       ├── EditGardenScreen
    │       ├── Eliminar horta
    │       ├── LayoutDesignerScreen
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
    ├── TasksScreen
    │       └── CreateTaskScreen
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

A interface utiliza actualmente oito ViewModels compartidos:

``` text
GardensViewModel
PlantSpeciesViewModel
PlantsViewModel
PlantEvolutionViewModel
WeatherViewModel
GeocodingViewModel
GardenLayoutViewModel
TasksViewModel
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

`GardenLayoutViewModel` mantén os elementos do deseño correspondentes á
horta cargada mediante:

``` text
loadItems(gardenId)
```

e actualiza as posicións observables durante o arrastre antes de
persistir a posición final.

Isto evita mesturar coleccións pertencentes a diferentes entidades pai.

`TasksViewModel` mantén a colección de tarefas cargada desde o
Repository e notifica á interface cando se crean ou modifican os datos
observables.

`WeatherViewModel` non mantén actualmente un contexto persistente por
horta. Conserva o estado da consulta meteorolóxica actual:

``` text
weatherData
isLoading
errorMessage
```

e informa á interface mediante `notifyListeners()`.

A meteoroloxía pode contextualizarse por horta utilizando as coordenadas
persistidas en `Garden`.

A xeocodificación utiliza un fluxo independente:

``` text
CreateGardenScreen / EditGardenScreen
      ↓
GeocodingViewModel
      ↓
GeocodingRepository
      ↑
OpenWeatherGeocodingRepository
      ↓
GeocodingService
      ↓
OpenWeather Geocoding API
```

`GeocodingViewModel` conserva o estado da procura:

``` text
results
isLoading
errorMessage
```

A selección dun resultado pertence á interface e as coordenadas
escollidas pasan posteriormente ao modelo `Garden`.

------------------------------------------------------------------------

# Current Persistence State

A persistencia local está integrada mediante SQLite.

Versión actual:

``` text
version: 6
```

Táboas relacionadas coa interface actual:

``` text
gardens
plant_species
garden_plants
plant_evolution_records
garden_layout_items
tasks
```

A táboa `gardens` inclúe agora `latitude` e `longitude` opcionais. Estes
campos permiten persistir a localización xeográfica seleccionada para
cada horta.

Os CRUD de:

-   hortas;
-   plantas;
-   rexistros de evolución;
-   disposición visual das plantas;
-   tarefas;

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

A versión 4 incorpora a migración v3 → v4 para engadir as coordenadas ás
hortas conservando os datos existentes.

A versión 5 incorpora a migración v4 → v5 e crea `garden_layout_items`
para persistir a disposición visual das plantas.

A versión 6 incorpora a migración v5 → v6 e crea `tasks` para persistir
o módulo básico de tarefas.

`WeatherData` continúa sen persistirse; o histórico meteorolóxico queda
pendente.

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

# Session 18 - UI Geocoding and Garden Weather Integration

## Estado

✅ Completada.

## Cambios visibles

-   `CreateGardenScreen` permite buscar unha localización.
-   `EditGardenScreen` permite volver buscar a localización dunha horta.
-   A procura pode mostrar varias coincidencias.
-   O usuario selecciona explicitamente o resultado correcto.
-   A localización seleccionada proporciona latitude e longitude ao
    `Garden`.
-   `GardenDetailsScreen` mostra o número de plantas.
-   `GardenDetailsScreen` consulta a meteoroloxía da localización
    específica da horta.
-   `WeatherCard` reutilízase no Dashboard e no detalle da horta.
-   `WeatherCard` pasa a `lib/widgets/`.

## Fluxo de creación/edición da localización

``` text
TextFormField
    ↓
Buscar localización
    ↓
GeocodingViewModel.searchLocation()
    ↓
resultados
    ↓
selección
    ↓
localización + latitude + longitude
    ↓
Garden
    ↓
SQLite
```

## Fluxo meteorolóxico no detalle

``` text
GardenDetailsScreen
    ↓
Garden(latitude, longitude)
    ↓
WeatherViewModel
    ↓
WeatherRepository
    ↓
WeatherService
    ↓
OpenWeather API
    ↓
WeatherCard
```

## Decisión de UX

Non se utiliza a xeolocalización do dispositivo como fonte principal.

A localización relevante é a da horta, que pode ser diferente da
posición actual do usuario. Por iso as coordenadas forman parte da
entidade persistida.

Tampouco se escolle automaticamente o primeiro resultado da
xeocodificación. Ante resultados ambiguos, a decisión corresponde ao
usuario.

## Estado tras a sesión

`GardenDetailsScreen` xa funciona como punto de acceso contextual á
horta: mostra información básica, número de plantas, meteoroloxía actual
e acceso ao módulo de plantas, ademais das accións de edición e
eliminación.

Ao finalizar esta sesión, o deseño visual da horta
(`LayoutDesignerScreen`) quedaba como seguinte gran bloque funcional
previsto.

------------------------------------------------------------------------

# Session 19 - UI Layout Designer

## Estado

✅ Primeira versión funcional completada.

## Cambios visibles

-   `GardenDetailsScreen` incorpora acceso ao deseño visual da horta.
-   Créase `LayoutDesignerScreen`.
-   O usuario pode seleccionar unha planta aínda non colocada.
-   As plantas engadidas aparecen dentro dunha área visual propia.
-   Cada planta pode arrastrarse individualmente.
-   Os elementos permanecen completamente dentro do taboleiro.
-   Dúas plantas non poden ocupar o mesmo espazo.
-   As posicións gardadas recupéranse ao volver entrar na pantalla.
-   A disposición persiste tamén entre reinicios da aplicación.
-   Retirar unha planta do deseño non elimina a planta da horta.

## Fluxo de acceso

``` text
GardenDetailsScreen
        ↓
LayoutDesignerScreen(gardenId)
        ↓
PlantsViewModel + GardenLayoutViewModel
```

## Fluxo visual

``` text
LayoutBuilder
    ↓
Container
    ↓
Stack
    ↓
Positioned
    ↓
GestureDetector
```

## Fluxo durante o arrastre

``` text
onPanUpdate
    ↓
nova posición normalizada
    ↓
límites
    ↓
comprobación de solapamento
    ↓
GardenLayoutViewModel.updateItemPositionLocally()
    ↓
rebuild
```

Ao finalizar:

``` text
onPanEnd
    ↓
GardenLayoutViewModel.updateItem()
    ↓
GardenLayoutRepository
    ↓
SQLite
```

## Decisión de UI

A posición das plantas non se define en píxeles absolutos.

Utilízanse coordenadas normalizadas para que a disposición almacenada
sexa independente das dimensións concretas da pantalla ou do taboleiro.

A interface é responsable de converter esas coordenadas ás dimensións
reais dispoñibles.

## Estado tras a sesión

O Layout Designer deixa de ser unha pantalla prevista e pasa a formar
parte do fluxo funcional real da aplicación.

A primeira versión prioriza funcionalidade e simplicidade. O refinamento
responsive, a posible incorporación de grid/snapping, a representación
por especie e as melloras de fluidez quedan como iteracións posteriores.

------------------------------------------------------------------------

# Session 20 - Tasks and Responsive Review

## Estado

✅ Completada.

## Tasks

O módulo de tarefas deixa de ser provisional e pasa a formar parte do
fluxo funcional da aplicación.

Cambios principais:

-   `TasksScreen` funcional.
-   `CreateTaskScreen` funcional.
-   Integración con `TasksViewModel`.
-   Uso da capa `TaskRepository`.
-   Persistencia mediante SQLite.
-   Actualización de `TasksCard` con datos reais.
-   Evolución da base de datos á versión 6.

O módulo mantense deliberadamente simple para cubrir o obxectivo de
tarefas pendentes sen ampliar innecesariamente o alcance do TFC.

## Dashboard

Elimínase a meteoroloxía do Dashboard.

A información meteorolóxica queda asociada á horta correspondente dentro
de `GardenDetailsScreen`, onde existe o contexto necesario de
localización.

O Dashboard queda centrado en:

``` text
DashboardScreen
├── GardenCard
├── TasksCard
└── QuickActionsCard
```

## Layout Designer

Durante as probas detectouse que unha planta retirada e engadida de novo
podía aparecer inicialmente sobre outra xa existente.

Corrixiuse a colocación inicial para buscar unha posición libre antes de
engadir o elemento ao deseño.

Verificouse posteriormente:

-   movemento individual;
-   prevención de solapamentos;
-   retirada;
-   nova incorporación;
-   persistencia da posición.

## Responsive

Realizáronse probas manuais con diferentes anchos de pantalla sobre as
pantallas principais.

A interface mantense estable nos tamaños obxectivo habituais de móbil,
tablet e escritorio.

Detectáronse posibles overflows nalgunhas `Row` internas das Cards do
Dashboard ao reducir a ventá a anchos excepcionalmente estreitos,
aproximadamente por baixo de 314 px.

Non se modifica a estrutura actual porque ese rango queda fóra do tamaño
práctico previsto para os dispositivos obxectivo e a solución engadiría
complexidade sen beneficio relevante para o MVP.

## Pantallas descartadas do alcance actual

`SettingsScreen` e a antiga `WeatherScreen` non se consideran necesarias
para o MVP.

-   Os axustes avanzados quedan como posible ampliación.
-   A meteoroloxía xa está integrada contextualmente en
    `GardenDetailsScreen`.
-   A autenticación (`LoginScreen` / `RegisterScreen`) continúa como
    posible funcionalidade futura se existe tempo antes da entrega.

------------------------------------------------------------------------

# Desktop Adaptation

## Estado actual

A aplicación utiliza a mesma navegación baseada en `Navigator` nas
plataformas obxectivo.

Non se considera necesario introducir nesta fase unha navegación
específica mediante `NavigationRail` ou Sidebar.

A adaptación actual baséase principalmente en:

-   layouts flexibles;
-   uso de `Expanded`, `LayoutBuilder` e scroll cando corresponde;
-   coordenadas normalizadas no Layout Designer;
-   validación manual en diferentes tamaños de ventá.

Unha navegación ou composición específica para escritorio poderá
valorarse como refinamento futuro se achega unha mellora real de
usabilidade.

**---**

**\# Future Screens**

Pantallas previstas para futuras versións:

\- LoginScreen - RegisterScreen - SettingsScreen - NotificationsScreen -
StatisticsScreen

**\*\*---\*\***

**\# Notes**

A implementación actual continúa priorizando funcionalidade fronte a
deseño visual.

Os módulos de hortas, plantas, evolución, tarefas e deseño visual
dispoñen xa dunha interface funcional con persistencia real. O módulo
meteorolóxico está integrado mediante datos remotos reais e
contextualízase por horta usando as coordenadas persistidas.
`WeatherData` continúa sen persistirse.

Os refinamentos visuais poderán realizarse posteriormente sen alterar o
fluxo básico de navegación.

O Design System e os mockups de Figma poden empregarse para o
refinamento visual e para documentar a interface, sen bloquear a versión
funcional actual.

Este documento considérase a referencia principal para a implementación
das pantallas en Flutter.
