# LEARNING_NOTES.md

# MARTOLA - Flutter Learning Notes

## Purpose

Este documento recolle os conceptos aprendidos durante o desenvolvemento
de MARTOLA.

Non pretende substituír a documentación oficial de Flutter, senón servir
como guía de consulta rápida cos conceptos fundamentais que se vaian
aprendendo ao longo do proxecto.

------------------------------------------------------------------------

# Filosofía de Flutter

Flutter está baseado na composición de widgets.

Unha interface non se constrúe modificando elementos existentes, senón
combinando widgets pequenos, cada un cunha responsabilidade concreta.

Os widgets describen como debe verse a interface.

O Flutter Engine é o encargado de debuxala na pantalla.

Principios fundamentais:

-   Todo é un Widget.
-   Cada Widget ten unha única responsabilidade.
-   A interface constrúese mediante composición.
-   O estado determina a interface.
-   Flutter reconstrúe só o necesario cando cambia o estado.

------------------------------------------------------------------------

# Patróns de pensamento

## Antes de aprender un widget

Pregunta sempre:

> Cal é a responsabilidade deste widget?

------------------------------------------------------------------------

## Antes de aprender unha propiedade

Pregunta:

> Que problema intenta resolver?

------------------------------------------------------------------------

## Antes de memorizar unha API

Pregunta:

> Podo deducila a partir da responsabilidade do widget?

------------------------------------------------------------------------

## Antes de engadir un widget novo

Pregunta:

> Xa existe outro widget que resolva este problema dunha forma máis
> simple?

------------------------------------------------------------------------

# Lesson 1 - Flutter Fundamentals

## Flutter

Flutter é un framework desenvolvido por Google para crear aplicacións
multiplataforma.

A súa principal característica é que debuxa toda a interface mediante
widgets, independentemente do sistema operativo.

------------------------------------------------------------------------

## Flutter Framework

É a parte escrita en Dart.

Contén:

-   Widgets
-   MaterialApp
-   Scaffold
-   Navigator
-   Theme
-   etc.

O framework describe como debe ser a interface.

------------------------------------------------------------------------

## Flutter Engine

É o motor interno de Flutter.

Está escrito principalmente en C++.

É o encargado de:

-   debuxar a interface
-   comunicarse co sistema operativo
-   acceder á GPU
-   procesar eventos do rato e teclado

O programador normalmente traballa co Framework, non co Engine.

------------------------------------------------------------------------

## Widget

Un Widget é a unidade básica coa que se constrúe a interface dunha
aplicación Flutter.

Pode representar:

-   un elemento visual (Text)
-   unha estrutura (Column)
-   unha aliñación (Center)
-   un espazado (Padding)
-   unha pantalla completa (HomeScreen)

Un Widget non debuxa a pantalla.

Describe como debe verse.

------------------------------------------------------------------------

## Árbore de Widgets

Toda aplicación Flutter constrúese como unha árbore.

Exemplo:

main()

↓

runApp()

↓

MartolaApp

↓

MaterialApp

↓

HomeScreen

↓

Scaffold

↓

Center

↓

Text

Cada Widget pode conter outros Widgets.

------------------------------------------------------------------------

## main()

É o punto de entrada da aplicación.

Flutter comeza a executarse desde esta función.

------------------------------------------------------------------------

## runApp()

runApp() recibe o Widget raíz da aplicación.

A partir del Flutter constrúe toda a árbore de Widgets.

Non é un Widget.

É unha función.

------------------------------------------------------------------------

## Widget raíz

É o primeiro Widget da aplicación.

No proxecto MARTOLA é:

MartolaApp

Todos os demais Widgets dependen del.

------------------------------------------------------------------------

## StatelessWidget

Representa un Widget cuxos datos non cambian durante a súa vida.

Exemplos:

-   Logo
-   Texto fixo
-   Icona decorativa

Características:

-   máis sinxelo
-   máis eficiente
-   permite utilizar const cando sexa posible

------------------------------------------------------------------------

## StatefulWidget

Representa un Widget cuxos datos poden cambiar.

Exemplos:

-   Campo de texto
-   Lista de hortas
-   Información meteorolóxica
-   Contador

O Widget non cambia.

Cambian os datos que utiliza.

------------------------------------------------------------------------

## Estado

O estado son os datos empregados por un Widget para construír a súa
interface.

Cando o estado cambia:

Flutter executa novamente build().

------------------------------------------------------------------------

## const

Indica que un obxecto é inmutable e coñécese en tempo de compilación.

Flutter pode reutilizalo sen necesidade de crear unha nova instancia.

Sempre que sexa posible utilizarase const.

------------------------------------------------------------------------

## build()

É o método principal dun Widget.

A súa misión é construír e devolver a descrición da interface segundo o
estado actual da aplicación.

Non debuxa píxeles.

Describe como debe verse a interface.

------------------------------------------------------------------------

## BuildContext

Representa a posición dun Widget dentro da árbore.

Permite acceder a información do seu contorno.

Exemplos:

-   Theme
-   Navigator
-   MediaQuery
-   Providers

Non representa a aplicación completa.

Representa o contexto dese Widget.

------------------------------------------------------------------------

## MaterialApp

É o Widget que configura a aplicación baseada en Material Design.

Entre outras cousas define:

-   tema
-   navegación
-   título
-   pantalla inicial

------------------------------------------------------------------------

## Scaffold

É o esqueleto básico dunha pantalla Material.

Pode conter:

-   AppBar
-   Body
-   Drawer
-   BottomNavigationBar
-   FloatingActionButton

------------------------------------------------------------------------

## Center

Widget encargado de centrar o seu Widget fillo.

Non modifica outros Widgets.

Simplemente describe unha aliñación.

------------------------------------------------------------------------

## Composición

Flutter constrúe interfaces combinando Widgets pequenos.

Exemplo:

Padding

↓

Center

↓

Text

Cada Widget realiza unha única tarefa.

------------------------------------------------------------------------

## Principio de responsabilidade única

Cada Widget debe ter unha responsabilidade concreta.

Exemplos:

WeatherCard

↓

mostrar información meteorolóxica

GardenCard

↓

mostrar unha horta

LogoWidget

↓

mostrar o logotipo

Este principio facilita:

-   reutilización
-   mantemento
-   probas
-   reconstrución eficiente

------------------------------------------------------------------------

## Filosofía de Flutter

Flutter non modifica a interface existente.

Cada vez que cambia o estado:

1.  Executa build().
2.  Obtén unha nova descrición da interface.
3.  Compara coa anterior.
4.  Actualiza só o necesario.

------------------------------------------------------------------------

# Ideas clave

-   Todo en Flutter é un Widget.
-   Un Widget describe, non debuxa.
-   Flutter funciona mediante composición.
-   Os Widgets deben ser pequenos.
-   Os Widgets deben ter unha única responsabilidade.
-   StatelessWidget → os datos non cambian.
-   StatefulWidget → os datos poden cambiar.
-   build() describe a interface segundo o estado actual.
-   O Engine debuxa; o Framework describe.

------------------------------------------------------------------------

## Regra do eixe principal

Antes de utilizar `mainAxisAlignment` ou `crossAxisAlignment`,
identifica primeiro cal é a responsabilidade do widget.

**Pregunta clave:**

> Como organiza este widget os seus widgets fillos (`children`)?

A resposta indica automaticamente cal é o eixe principal.

### Column

Responsabilidade:

Organizar os widgets verticalmente.

-   Eixe principal → Vertical
-   Eixe secundario → Horizontal

Polo tanto:

-   `mainAxisAlignment` controla a distribución vertical.
-   `crossAxisAlignment` controla a aliñación horizontal.

------------------------------------------------------------------------

### Row

Responsabilidade:

Organizar os widgets horizontalmente.

-   Eixe principal → Horizontal
-   Eixe secundario → Vertical

Polo tanto:

-   `mainAxisAlignment` controla a distribución horizontal.
-   `crossAxisAlignment` controla a aliñación vertical.

------------------------------------------------------------------------

### Regra práctica

Nunca memorices que fai `mainAxisAlignment` ou `crossAxisAlignment`.

Primeiro responde:

> **Como organiza os seus widgets fillos este widget?**

Unha vez identificado o eixe principal, o resto dedúcese
automaticamente.

------------------------------------------------------------------------

# Lesson 3 - Layout

## Column

Widget encargado de organizar varios widgets verticalmente.

Cada widget fillo colócase debaixo do anterior.

### Responsabilidade

Organizar widgets no eixe vertical.

------------------------------------------------------------------------

## Row

Widget encargado de organizar varios widgets horizontalmente.

Cada widget fillo colócase ao lado do anterior.

### Responsabilidade

Organizar widgets no eixe horizontal.

------------------------------------------------------------------------

## Main Axis

É o eixe principal segundo o cal un widget organiza os seus widgets
fillos.

### Column

Main Axis → Vertical

### Row

Main Axis → Horizontal

------------------------------------------------------------------------

## Cross Axis

É o eixe perpendicular ao Main Axis.

### Column

Cross Axis → Horizontal

### Row

Cross Axis → Vertical

------------------------------------------------------------------------

## MainAxisAlignment

Controla como se distribúen os widgets ao longo do Main Axis.

Non depende do nome "horizontal" ou "vertical".

Depende sempre do eixe principal do widget.

------------------------------------------------------------------------

## CrossAxisAlignment

Controla a aliñación dos widgets ao longo do Cross Axis.

------------------------------------------------------------------------

## Regra do eixe principal

Antes de utilizar `mainAxisAlignment` ou `crossAxisAlignment`,
identifica primeiro a responsabilidade do widget.

Pregunta clave:

> Como organiza este widget os seus widgets fillos?

Se a resposta é:

-   Vertical → Main Axis = Vertical
-   Horizontal → Main Axis = Horizontal

O resto dedúcese automaticamente.

------------------------------------------------------------------------

## Filosofía da API de Flutter

Flutter intenta que a súa API sexa coherente e escalable.

As propiedades adoitan representarse mediante enums
(`MainAxisAlignment`, `CrossAxisAlignment`) en lugar de valores
booleanos ou cadeas de texto.

Isto permite:

-   Maior claridade.
-   Mellor autocompletado.
-   Comprobación en tempo de compilación.
-   APIs máis flexibles e fáciles de ampliar.

------------------------------------------------------------------------

## Concepto da sesión

Antes de aprender unha propiedade dun widget, identifica primeiro a súa
responsabilidade.

A maior parte da API de Flutter pode deducirse a partir desa
responsabilidade.

------------------------------------------------------------------------

# Erros frecuentes

## Confundir Widget con elemento visual

Un Widget non sempre representa un elemento visible.

Exemplos:

-   Padding
-   Center
-   SizedBox

Tamén son Widgets.

------------------------------------------------------------------------

## Pensar que build() debuxa a pantalla

Incorrecto.

build() describe a interface.

É o Engine quen a debuxa.

------------------------------------------------------------------------

## Memorizar MainAxisAlignment

Non é necesario.

Primeiro identifica o Main Axis.

O resto dedúcese automaticamente.

------------------------------------------------------------------------

# Regra de ouro

En Flutter non memorices primeiro a API.

Comprende primeiro a responsabilidade do widget.

Na maioría dos casos, a API poderá deducirse de forma natural.

------------------------------------------------------------------------

## Regra da composición

En Flutter é preferible combinar varios widgets pequenos cunha única
responsabilidade antes que utilizar un widget grande con múltiples
opcións.

Vantaxes:

-   Reutilización.
-   Mantemento.
-   Lexibilidade.
-   Flexibilidade.
-   Testabilidade.

A composición é un dos principios fundamentais de Flutter.

------------------------------------------------------------------------

# Lesson 5 - First Real Screen

## AppBar

Widget que representa a barra superior dunha pantalla Material.

Pode conter:

-   título
-   accións
-   botón de navegación
-   menú

Forma parte da estrutura proporcionada por Scaffold.

------------------------------------------------------------------------

## SafeArea

Widget que garante que o seu contido permaneza dentro da zona segura do
dispositivo.

Evita que outros widgets queden ocultos por:

-   notch
-   cámara frontal
-   barra de estado
-   xestos do sistema

------------------------------------------------------------------------

## ElevatedButton

Botón Material con elevación.

A súa responsabilidade é ofrecer unha acción principal ao usuario.

Se `onPressed` é:

``` dart
null
```

o botón queda automaticamente desactivado.

------------------------------------------------------------------------

## Arquitectura dunha pantalla

Antes de implementar unha pantalla é recomendable definir a súa árbore
de widgets.

Exemplo:

HomeScreen

↓

Scaffold

↓

AppBar

↓

SafeArea

↓

Center

↓

Padding

↓

Column

↓

Widgets da interface

------------------------------------------------------------------------

## Regra da arquitectura

Primeiro deseña a estrutura.

Despois escribe o código.

É moito máis sinxelo corrixir unha arquitectura que unha implementación
xa rematada.

------------------------------------------------------------------------

## Concepto da sesión

Construír unha pantalla Flutter consiste en combinar widgets pequenos,
cada un cunha responsabilidade concreta, ata formar unha interface
completa.

------------------------------------------------------------------------

# Lesson 6 - Refactoring & Theme

## Refactorización

Refactorizar consiste en mellorar a estrutura interna do código sen
modificar o seu comportamento.

Unha boa refactorización:

-   Reduce duplicación.
-   Mellora a lexibilidade.
-   Facilita o mantemento.
-   Non modifica o resultado visible da aplicación.

------------------------------------------------------------------------

## Widgets reutilizables

Un widget debe extraerse cando representa unha responsabilidade propia
que pode utilizarse en máis dun lugar.

Exemplo:

MartolaLogo

Responsabilidade:

Mostrar a identidade visual da aplicación.

Non debe incluír botóns nin accións porque pertencen a responsabilidades
diferentes.

------------------------------------------------------------------------

## ThemeData

`ThemeData` centraliza a configuración visual da aplicación.

Permite definir:

-   cores
-   tipografías
-   botóns
-   AppBar
-   formularios
-   iconografía

Todos os widgets poden acceder ao tema mediante:

``` dart
Theme.of(context)
```

------------------------------------------------------------------------

## ColorScheme

`ColorScheme` define os diferentes roles de cor da aplicación.

Exemplo:

-   primary
-   secondary
-   surface
-   error

Os widgets deben utilizar estes roles en lugar de cores fixas.

Incorrecto:

``` dart
color: Colors.green
```

Correcto:

``` dart
color: Theme.of(context).colorScheme.primary
```

------------------------------------------------------------------------

## Concepto da sesión

Primeiro conseguimos que unha aplicación funcione.

Despois organizamos o código para que sexa fácil de manter.

------------------------------------------------------------------------

# Regra do Navigator

push()

→ Engade unha pantalla enriba da pila.

pop()

→ Elimina a pantalla superior da pila.

A pantalla anterior nunca desaparece mentres permaneza na pila.

------------------------------------------------------------------------

## Navigator e a pila de rutas

O `Navigator` mantén unha pila (stack) de rutas.

-   `push()` engade unha nova ruta enriba da pila.
-   `pop()` elimina a ruta superior.

Cada chamada a `push()` crea unha nova ruta, aínda que xa exista outra
pantalla do mesmo tipo na pila.

As rutas inferiores permanecen na pila ata que son eliminadas
explicitamente.

------------------------------------------------------------------------

# Lesson 7 - Navigation

## Navigator

O Navigator xestiona a navegación mediante unha pila (stack) de rutas.

Cada pantalla normalmente corresponde a unha ruta.

------------------------------------------------------------------------

## push()

Engade unha nova ruta enriba da pila.

A pantalla anterior permanece na pila.

------------------------------------------------------------------------

## pop()

Elimina a ruta superior da pila.

A pantalla anterior volve mostrarse.

------------------------------------------------------------------------

## MaterialPageRoute

Representa unha ruta Material que sabe como construír unha pantalla.

------------------------------------------------------------------------

## Organización das pantallas

Cada pantalla debe ter unha responsabilidade clara.

As vistas organízanse por funcionalidade:

views/

├── home/

├── dashboard/

├── gardens/

├── plants/

├── weather/

└── settings/

------------------------------------------------------------------------

## SingleChildScrollView

Permite desprazar vertical ou horizontalmente un único widget fillo.

Habitualmente utilízase xunto cunha Column para pantallas cun número
reducido de elementos que poden exceder o tamaño da pantalla.

------------------------------------------------------------------------

## Column vs SingleChildScrollView vs ListView

Column

-   Sen scroll.
-   Poucos elementos.

SingleChildScrollView + Column

-   Poucos elementos.
-   Scroll completo.

ListView

-   Moitos elementos.
-   Construción eficiente dos elementos visibles.

------------------------------------------------------------------------

## Concepto da sesión

A navegación en Flutter baséase nunha pila de rutas, non nun cambio
directo dunha pantalla a outra.

------------------------------------------------------------------------

## Regra para organizar widgets

Un widget debe permanecer preto da funcionalidade á que pertence.

Só debe moverse a `lib/widgets/` cando exista unha necesidade real de
reutilizalo noutras partes da aplicación.

Non se deben crear compoñentes globais "por se acaso".

Primeiro constrúese para resolver un problema concreto.

Despois reutilízase cando aparece unha segunda necesidade real.

------------------------------------------------------------------------

## Regra dos callbacks

Un widget reutilizable debería expoñer as accións mediante callbacks en
lugar de decidir directamente a navegación ou a lóxica externa.

O widget define **cando ocorre unha acción**.

O widget pai decide **que debe facer esa acción**.

Isto reduce o acoplamento e facilita a reutilización.

------------------------------------------------------------------------

# Lesson 8 - Reusable Components and Callbacks

## Deseño dun widget

Antes de implementar un widget débese determinar:

1.  Cal é a súa responsabilidade.
2.  Que datos necesita.
3.  Que accións debe expoñer.
4.  Como se organizará visualmente.

Un widget debe recibir só a información necesaria para cumprir a súa
responsabilidade.

------------------------------------------------------------------------

## Datos mediante o construtor

Os widgets poden recibir datos desde o widget pai:

``` dart
const WeatherCard(
  temperature: 28,
  condition: 'Ceo despexado',
  location: 'Ourense',
)
```

Isto permite separar a presentación da orixe dos datos.

Os datos poden ser ficticios (`mock data`) durante as primeiras fases do
desenvolvemento. Isto permite construír e probar a interface antes de
dispoñer de SQLite, APIs ou outras fontes de datos reais.

------------------------------------------------------------------------

## Interface pública dun widget

Os parámetros do construtor forman parte da interface pública do widget.

Por exemplo:

``` dart
class GardenCard extends StatelessWidget {
  const GardenCard({
    super.key,
    required this.gardenCount,
    required this.onViewGardens,
  });

  final int gardenCount;
  final VoidCallback onViewGardens;

  // ...
}
```

Neste caso `GardenCard` declara explicitamente que necesita:

-   Un dato: `gardenCount`.
-   Un comportamento: `onViewGardens`.

A implementación interna do widget pode cambiar sen que necesariamente
cambie esta interface.

------------------------------------------------------------------------

## Callbacks

Un widget pode recibir non só datos, senón tamén comportamento.

En Flutter podemos utilizar, entre outros mecanismos, `VoidCallback`:

``` dart
final VoidCallback onViewGardens;
```

O widget fillo pode executar ese callback cando se produce unha
interacción:

``` dart
TextButton(
  onPressed: onViewGardens,
  child: const Text('Ver hortas'),
)
```

O widget pai determina posteriormente que debe ocorrer:

``` dart
GardenCard(
  gardenCount: 2,
  onViewGardens: () {
    // Acción decidida polo widget pai
  },
)
```

### Regra dos callbacks

O widget fillo determina **cando ocorre unha acción**.

O widget pai determina **que debe facer esa acción**.

Por exemplo, `GardenCard` sabe que existe unha acción chamada "Ver
hortas", pero non necesita saber a que pantalla debe navegar.

Isto reduce o acoplamento e facilita a reutilización dos widgets.

------------------------------------------------------------------------

## Separación entre presentación e comportamento

Un widget de presentación non debería asumir responsabilidades que
pertencen a outros niveis da aplicación.

Por exemplo, en lugar de introducir directamente dentro de `GardenCard`:

``` dart
Navigator.of(context).push(...);
```

a tarxeta expón:

``` dart
final VoidCallback onViewGardens;
```

e deixa que `DashboardScreen` decida o comportamento.

Deste xeito:

-   `GardenCard` é responsable de mostrar información sobre as hortas.
-   `DashboardScreen` coñece o fluxo da pantalla e decide que facer coa
    acción.
-   A navegación non queda acoplada ao widget visual.

------------------------------------------------------------------------

## Organización de widgets

Un widget debe permanecer preto da funcionalidade á que pertence.

Por exemplo:

``` text
views/
└── dashboard/
    ├── dashboard_screen.dart
    └── widgets/
        ├── weather_card.dart
        ├── garden_card.dart
        ├── tasks_card.dart
        └── quick_actions_card.dart
```

Só debe moverse a `lib/widgets/` cando exista unha necesidade real de
reutilizalo noutras funcionalidades.

Non se deben crear compoñentes globais "por se acaso".

Primeiro constrúese o widget para resolver unha necesidade concreta e
posteriormente refactorízase se aparece unha necesidade real de
reutilización.

------------------------------------------------------------------------

## Card

`Card` é un widget de Material Design pensado para representar un bloque
de información relacionado visualmente.

No Dashboard utilizámolo como base dos distintos compoñentes:

-   `WeatherCard`
-   `GardenCard`
-   `TasksCard`
-   `QuickActionsCard`

Cada tarxeta representa unha responsabilidade diferente.

------------------------------------------------------------------------

## SingleChildScrollView

`SingleChildScrollView` permite facer scroll sobre un único widget
fillo.

Pode combinarse cunha `Column` cando unha pantalla ten un número
reducido de bloques pero estes poden superar o espazo visible.

Estrutura utilizada no Dashboard:

``` text
SafeArea
└── Padding
    └── SingleChildScrollView
        └── Column
            ├── WeatherCard
            ├── GardenCard
            ├── TasksCard
            └── QuickActionsCard
```

A `Column` organiza os elementos verticalmente e `SingleChildScrollView`
permite desprazalos cando non caben no espazo dispoñible.

------------------------------------------------------------------------

## SafeArea

`SafeArea` evita que o contido quede oculto por zonas reservadas ou
elementos físicos e de sistema do dispositivo.

Por exemplo:

-   Barra de estado.
-   Notches ou recortes.
-   Outras zonas reservadas polo sistema.

------------------------------------------------------------------------

## Padding

`Padding` introduce separación entre o seu widget fillo e os límites que
o rodean.

No Dashboard utilizamos:

``` dart
const EdgeInsets.all(16)
```

para evitar que as tarxetas queden pegadas aos bordos da zona
dispoñible.

------------------------------------------------------------------------

## Column e os seus eixes

Nunha `Column`:

-   O eixe principal (`main axis`) é o vertical.
-   O eixe secundario (`cross axis`) é o horizontal.

Por tanto:

``` dart
crossAxisAlignment: CrossAxisAlignment.stretch
```

actúa sobre o eixe horizontal.

------------------------------------------------------------------------

## CrossAxisAlignment.stretch

`CrossAxisAlignment.stretch` fai que os fillos dunha `Column` intenten
ocupar todo o espazo dispoñible no seu eixe secundario.

Nunha `Column`, isto significa estender os fillos horizontalmente.

Non significa necesariamente ocupar todo o ancho da pantalla.

Os widgets ocupan o ancho que lles permite o seu pai.

No Dashboard:

``` text
Pantalla
└── SafeArea
    └── Padding (16)
        └── SingleChildScrollView
            └── Column (stretch)
                └── WeatherCard
```

A `WeatherCard` esténdese polo ancho dispoñible dentro do `Padding`, non
ata os bordos físicos da pantalla.

Isto tamén permite que o contido se adapte cando cambia o tamaño da
ventá.

------------------------------------------------------------------------

## Theme dentro dos compoñentes

En lugar de definir estilos independentes en cada widget:

``` dart
TextStyle(
  fontSize: 32,
)
```

podemos utilizar os estilos centralizados no `Theme`:

``` dart
Theme.of(context).textTheme.titleLarge
```

ou cores:

``` dart
Theme.of(context).colorScheme.primary
```

Isto facilita:

-   Manter a coherencia visual.
-   Modificar o deseño desde un punto central.
-   Evitar valores visuais repetidos por toda a aplicación.

------------------------------------------------------------------------

## Xerarquía visual

Non toda a información dunha interface ten a mesma importancia.

Os elementos máis importantes deben destacar visualmente mediante
recursos como:

-   Tamaño.
-   Peso tipográfico.
-   Cor.
-   Posición.
-   Espazado.

Por exemplo, en `WeatherCard` a temperatura é un dos datos principais e
debe ter máis peso visual que a descrición do estado do ceo.

------------------------------------------------------------------------

## Accións no contexto adecuado

Unha acción debe situarse no contexto no que ten sentido.

Durante o deseño do Dashboard considerouse incluír:

-   Crear nova horta.
-   Engadir nova tarefa.
-   Engadir planta.

Decidiuse non incluír `Engadir planta` nas accións rápidas do Dashboard
porque unha planta debe estar asociada a unha horta concreta.

Polo tanto, esta acción terá máis sentido dentro do contexto dunha horta
seleccionada.

### Regra

**As accións deberían aparecer no contexto no que teñen sentido.**

Isto pode reducir pasos innecesarios e evitar solicitar ao usuario
información que o contexto xa podería proporcionar.

------------------------------------------------------------------------

## Composición do Dashboard

Ao finalizar a sesión, `DashboardScreen` está composto por:

``` text
DashboardScreen
├── WeatherCard
├── GardenCard
├── TasksCard
└── QuickActionsCard
```

Cada compoñente ten unha responsabilidade propia:

### WeatherCard

Mostra información meteorolóxica mediante datos ficticios:

-   Temperatura.
-   Estado do ceo.
-   Localidade.

### GardenCard

Mostra:

-   Número de hortas.
-   Acción para acceder ás hortas.

### TasksCard

Mostra:

-   Número de tarefas pendentes.
-   Acción para acceder ás tarefas.

### QuickActionsCard

Agrupa accións frecuentes:

-   Crear horta.
-   Engadir tarefa.

------------------------------------------------------------------------

## Principio principal da sesión

Unha pantalla complexa pode construírse mediante a composición de
widgets pequenos con responsabilidades ben definidas.

Os widgets poden recibir desde niveis superiores:

-   **Datos**, mediante parámetros do construtor.
-   **Comportamento**, mediante callbacks.

Deste xeito podemos separar:

``` text
Datos
        ↓
DashboardScreen
        ↓
Compoñentes
        ↓
Presentación
```

e, para as interaccións:

``` text
Usuario realiza unha acción
        ↓
Widget fillo
        ↓
Callback
        ↓
Widget pai
        ↓
Comportamento / navegación
```

Esta separación reduce o acoplamento e facilita o mantemento, a
reutilización e a evolución da aplicación.

------------------------------------------------------------------------

# Lesson 9 - Callbacks and Navigation

## Conexión entre callbacks e navegación

Na sesión anterior utilizamos callbacks para permitir que os widgets
comuniquen accións ao seu widget pai.

Nesta sesión conectamos estes callbacks co sistema de navegación de
Flutter.

O patrón utilizado é:

``` text
Interacción do usuario
        ↓
Widget de presentación
        ↓
Callback
        ↓
Widget pai
        ↓
Navigator
        ↓
Pantalla destino
```

Por exemplo:

``` dart
GardenCard(
  gardenCount: 2,
  onViewGardens: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const GardensScreen(),
      ),
    );
  },
)
```

Neste exemplo:

-   `GardenCard` mostra a información das hortas.
-   `GardenCard` detecta que o usuario pulsa `Ver hortas`.
-   O callback `onViewGardens` comunica a acción.
-   `DashboardScreen` decide que esa acción debe abrir `GardensScreen`.
-   `Navigator` realiza a navegación.

------------------------------------------------------------------------

## Separación de responsabilidades

Un widget de presentación non debería coñecer necesariamente o fluxo
completo da aplicación.

Por exemplo:

``` text
GardenCard
```

ten a responsabilidade de:

-   Mostrar información sobre as hortas.
-   Mostrar a acción `Ver hortas`.
-   Comunicar que o usuario executou esa acción.

Non ten a responsabilidade de decidir a que pantalla debe navegar a
aplicación.

Esta decisión pertence neste caso a:

``` text
DashboardScreen
```

porque é a pantalla que coñece o fluxo das accións do Dashboard.

### Regra

**O widget fillo comunica a intención mediante un callback e o widget
que coñece o fluxo decide a navegación.**

------------------------------------------------------------------------

## Aplicación do mesmo patrón a diferentes módulos

O mesmo patrón pode aplicarse sen modificar a arquitectura:

``` text
GardenCard
    ↓ onViewGardens
DashboardScreen
    ↓
GardensScreen
```

``` text
TasksCard
    ↓ onViewTasks
DashboardScreen
    ↓
TasksScreen
```

E tamén ás accións rápidas:

``` text
QuickActionsCard
    ↓ onCreateGarden
DashboardScreen
    ↓
CreateGardenScreen
```

``` text
QuickActionsCard
    ↓ onAddTask
DashboardScreen
    ↓
CreateTaskScreen
```

Isto demostra que o patrón pode reutilizarse para diferentes
funcionalidades.

------------------------------------------------------------------------

## Pantallas provisionais

Non é necesario implementar unha pantalla completa no momento de crear
unha ruta de navegación.

Podemos crear primeiro unha pantalla provisional:

``` dart
class GardensScreen extends StatelessWidget {
  const GardensScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('As miñas hortas'),
      ),
      body: const Center(
        child: Text('Lista de hortas'),
      ),
    );
  }
}
```

Isto permite comprobar primeiro:

1.  Que a ruta funciona.
2.  Que a pantalla se constrúe correctamente.
3.  Que a pila de navegación funciona.
4.  Que podemos regresar á pantalla anterior.

Posteriormente a pantalla provisional pode substituírse progresivamente
pola implementación real.

------------------------------------------------------------------------

## Organización por funcionalidade

As pantallas deben agruparse segundo a funcionalidade á que pertencen.

A estrutura actual pasa a incluír:

``` text
views/
├── home/
├── dashboard/
│   ├── dashboard_screen.dart
│   └── widgets/
├── gardens/
│   ├── gardens_screen.dart
│   └── create_garden_screen.dart
└── tasks/
    ├── tasks_screen.dart
    └── create_task_screen.dart
```

Isto facilita localizar o código relacionado cun módulo e mantén
separadas as distintas responsabilidades da aplicación.

------------------------------------------------------------------------

## Principio principal da sesión

Os callbacks e a navegación poden combinarse mantendo separadas as
responsabilidades:

``` text
Widget fillo
    ↓
Comunica unha intención
    ↓
Callback
    ↓
Widget que coñece o fluxo
    ↓
Decide o destino
    ↓
Navigator
```

Deste xeito, os compoñentes visuais non quedan acoplados directamente ás
pantallas destino.

------------------------------------------------------------------------

## Sesión 10 --- Modelos, listas dinámicas e formularios

### Obxectivos da sesión

-   Introducir un modelo de dominio para representar unha horta.
-   Mostrar coleccións de obxectos mediante listas dinámicas.
-   Crear widgets especializados para representar elementos dunha lista.
-   Xestionar interaccións mediante callbacks con parámetros.
-   Navegar a unha pantalla de detalle pasando un obxecto do modelo.
-   Introducir `StatefulWidget` e o ciclo de vida do estado.
-   Crear o primeiro formulario funcional da aplicación.
-   Validar os datos introducidos polo usuario.
-   Converter datos de texto aos tipos requiridos polo modelo.
-   Introducir conceptos básicos de null safety.
-   Devolver datos entre rutas mediante `Navigator`.
-   Introducir de maneira práctica `Future`, `async` e `await`.

------------------------------------------------------------------------

### 1. Modelo `Garden`

Creouse unha clase `Garden` para representar unha horta dentro da
aplicación.

``` dart
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

Responsabilidade:

-   `Garden` representa os datos dunha horta.
-   Non é responsable da súa representación visual.
-   Non é responsable da navegación.
-   Non é responsable da persistencia dos datos.

O identificador declárase como:

``` dart
String? id;
```

porque unha horta pode existir temporalmente antes de ser gardada na
base de datos e, polo tanto, antes de recibir un identificador.

------------------------------------------------------------------------

### 2. Instancias dun modelo

Unha clase define a estrutura común dos obxectos.

Cada `Garden` é unha instancia distinta do mesmo modelo con valores
diferentes nos seus atributos.

Por exemplo:

``` dart
Garden(
  id: '1',
  name: 'Horta casa',
  location: 'Ourense',
  area: 40.0,
)
```

e:

``` dart
Garden(
  id: '2',
  name: 'Horta aldea',
  location: 'Amoeiro',
  area: 800.0,
)
```

son dous obxectos diferentes da mesma clase `Garden`.

Non é necesario crear unha clase diferente para cada horta.

------------------------------------------------------------------------

### 3. Colección `List<Garden>`

Para simular os datos que no futuro procederán da persistencia
utilizouse unha lista de obxectos `Garden`.

``` dart
const List<Garden> gardens = [
  Garden(
    id: '1',
    name: 'Horta casa',
    location: 'Ourense',
    area: 40.0,
  ),
  Garden(
    id: '2',
    name: 'Horta aldea',
    location: 'Amoeiro',
    area: 800.0,
  ),
  Garden(
    id: '3',
    name: 'Horta Mexide',
    location: 'Mexide',
    area: 120.0,
  ),
];
```

Estes datos son temporais e serán substituídos posteriormente por datos
procedentes da capa de persistencia.

------------------------------------------------------------------------

### 4. `ListView.builder`

Utilizouse `ListView.builder` para construír dinamicamente a lista de
hortas.

``` dart
ListView.builder(
  itemCount: gardens.length,
  itemBuilder: (context, index) {
    final garden = gardens[index];

    return GardenListItem(
      garden: garden,
      onTap: (garden) {
        // Acción
      },
    );
  },
)
```

Responsabilidades principais:

-   `itemCount`: indica cantos elementos ten a lista.
-   `itemBuilder`: define como se constrúe cada elemento.
-   `index`: identifica a posición do elemento que se está construíndo.

`ListView.builder` permite traballar con listas grandes sen ter que
declarar manualmente un widget por cada elemento.

Fluxo:

``` text
List<Garden>
    ↓
ListView.builder
    ↓
gardens[index]
    ↓
GardenListItem
```

------------------------------------------------------------------------

### 5. `GardenListItem`

Creouse un widget específico para representar visualmente unha horta
dentro da lista.

Localización:

``` text
views/
└── gardens/
    └── widgets/
        └── garden_list_item.dart
```

O widget recibe directamente un obxecto do modelo:

``` dart
final Garden garden;
```

Deste modo non é necesario pasar individualmente `name`, `location` e
`area`.

Responsabilidade:

> `GardenListItem` representa visualmente unha horta dentro dunha lista
> e comunica ao widget pai cando o usuario selecciona esa horta.

------------------------------------------------------------------------

### 6. `InkWell`

Utilizouse `InkWell` para detectar a pulsación sobre un elemento da
lista.

Estrutura:

``` text
Card
└── InkWell
    └── Padding
        └── Column
```

Un widget non necesita converterse en `StatefulWidget` simplemente
porque permita interacción.

A interacción e o estado son conceptos diferentes.

------------------------------------------------------------------------

### 7. Callbacks con parámetros

Ata este momento utilizáranse callbacks sen parámetros:

``` dart
VoidCallback
```

que equivalen conceptualmente a:

``` dart
void Function()
```

Para comunicar que horta foi seleccionada utilizouse:

``` dart
final void Function(Garden) onTap;
```

Isto permite executar:

``` dart
onTap(garden);
```

e enviar o obxecto seleccionado ao widget pai.

Fluxo:

``` text
InkWell
    ↓
GardenListItem
    ↓
onTap(garden)
    ↓
GardensScreen
```

------------------------------------------------------------------------

### 8. Paso de modelos entre pantallas

Creouse `GardenDetailsScreen`, que recibe obrigatoriamente un `Garden`.

``` dart
final Garden garden;
```

O mesmo widget pode representar calquera horta dependendo do obxecto
recibido.

A navegación realízase mediante:

``` dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => GardenDetailsScreen(
      garden: garden,
    ),
  ),
);
```

Fluxo:

``` text
GardensScreen
    ↓
GardenListItem
    ↓
Garden seleccionado
    ↓
Navigator.push()
    ↓
GardenDetailsScreen(garden)
```

Unha única clase `GardenDetailsScreen` permite crear distintas
instancias con datos diferentes.

------------------------------------------------------------------------

### 9. `StatefulWidget`

`CreateGardenScreen` converteuse de `StatelessWidget` a
`StatefulWidget`.

Estrutura básica:

``` dart
class CreateGardenScreen extends StatefulWidget {
  const CreateGardenScreen({super.key});

  @override
  State<CreateGardenScreen> createState() {
    return _CreateGardenScreenState();
  }
}

class _CreateGardenScreenState
    extends State<CreateGardenScreen> {

  @override
  Widget build(BuildContext context) {
    // Interface
  }
}
```

Distinción:

-   `CreateGardenScreen`: representa o widget e a súa configuración.
-   `_CreateGardenScreenState`: mantén o estado e os recursos asociados
    á instancia.

Que un widget permita interacción non significa automaticamente que
necesite ser `StatefulWidget`.

------------------------------------------------------------------------

### 10. `TextEditingController`

Creáronse controladores para acceder aos datos introducidos polo
usuario:

``` dart
final TextEditingController nameController =
    TextEditingController();

final TextEditingController locationController =
    TextEditingController();

final TextEditingController areaController =
    TextEditingController();
```

O texto actual dun campo pode consultarse mediante:

``` dart
nameController.text
```

Os controladores pertencen ao `State` porque é este quen xestiona o seu
ciclo de vida.

------------------------------------------------------------------------

### 11. `dispose()`

Os `TextEditingController` deben liberarse cando desaparece
definitivamente o estado da pantalla.

``` dart
@override
void dispose() {
  nameController.dispose();
  locationController.dispose();
  areaController.dispose();

  super.dispose();
}
```

Regra aprendida:

> Se un `State` crea e posúe un recurso que require `dispose()`, tamén é
> responsabilidade dese `State` liberalo.

------------------------------------------------------------------------

### 12. `TextFormField`

Utilizouse `TextFormField` para introducir os datos dunha nova horta.

Exemplo:

``` dart
TextFormField(
  controller: nameController,
  decoration: const InputDecoration(
    labelText: 'Nome',
  ),
)
```

Para a superficie indicouse unha entrada numérica:

``` dart
keyboardType: TextInputType.number
```

O `TextFormField` permite combinar a entrada de datos coa validación do
campo.

------------------------------------------------------------------------

### 13. `Form` e `GlobalKey<FormState>`

Os campos agrupáronse mediante un `Form`.

Creouse unha clave:

``` dart
final _formKey = GlobalKey<FormState>();
```

e asociouse ao formulario:

``` dart
Form(
  key: _formKey,
  child: Column(
    // campos
  ),
)
```

Isto permite acceder ao estado do formulario e solicitar a validación
dos seus campos.

------------------------------------------------------------------------

### 14. Validación

A validación completa do formulario pode executarse mediante:

``` dart
final isValid = _formKey.currentState!.validate();

if (!isValid) {
  return;
}
```

Cada `TextFormField` pode definir o seu propio `validator`.

Exemplo para o nome:

``` dart
validator: (value) {
  if (value == null || value.trim().isEmpty) {
    return 'Introduce un nome para a horta';
  }

  return null;
},
```

Tamén se utilizou unha versión compacta mediante o operador ternario:

``` dart
validator: (value) =>
    value == null || value.trim().isEmpty
        ? 'Introduce un nome para a horta'
        : null,
```

Regra:

``` text
validator devolve String
        ↓
campo non válido
        ↓
móstrase a mensaxe de erro

validator devolve null
        ↓
campo válido
```

Para a superficie comprobouse:

-   Que exista un valor.
-   Que non estea baleiro.
-   Que sexa convertible a número.
-   Que sexa maior que cero.

Exemplo:

``` dart
validator: (value) {
  if (value == null || value.trim().isEmpty) {
    return 'Introduce unha superficie';
  }

  final area = double.tryParse(value);

  if (area == null) {
    return 'Introduce unha superficie válida';
  }

  if (area <= 0) {
    return 'A superficie debe ser maior que 0';
  }

  return null;
},
```

------------------------------------------------------------------------

### 15. Conversión de `String` a `double`

Os datos dun campo de texto obtéñense inicialmente como `String`.

O modelo `Garden`, pola contra, require:

``` dart
final double area;
```

Estudáronse dous métodos:

``` dart
double.parse(value)
```

e:

``` dart
double.tryParse(value)
```

Diferenza:

``` text
double.parse("120.5")     → 120.5
double.parse("abc")       → excepción

double.tryParse("120.5")  → 120.5
double.tryParse("abc")    → null
```

`tryParse()` é especialmente útil para validar datos procedentes do
usuario.

Unha vez validado o formulario, pode empregarse `parse()` sabendo que o
valor xa é correcto.

------------------------------------------------------------------------

### 16. Null safety

Introduciuse o concepto de tipo nullable.

Un tipo:

``` dart
double
```

debe conter un valor `double`.

En cambio:

``` dart
double?
```

pode conter:

``` text
double ou null
```

O mesmo principio aplicouse ao identificador de `Garden`:

``` dart
final String? id;
```

Isto permite representar unha horta que aínda non foi persistida:

``` dart
Garden(
  name: 'Horta nova',
  location: 'Ourense',
  area: 125.0,
)
```

Neste caso:

``` dart
garden.id == null
```

Tamén se utilizou o operador de acceso condicional:

``` dart
?.
```

Por exemplo:

``` dart
garden?.name
```

que accede a `name` unicamente se `garden` non é `null`.

------------------------------------------------------------------------

### 17. Creación dun modelo desde un formulario

Despois de validar os datos, pode construírse unha instancia de
`Garden`.

``` dart
final area = double.parse(areaController.text);

final garden = Garden(
  name: nameController.text.trim(),
  location: locationController.text.trim(),
  area: area,
);
```

Neste momento a horta xa existe como obxecto dentro da aplicación, aínda
que non foi gardada nunha base de datos.

Fluxo conseguido:

``` text
Usuario
   ↓
TextFormField
   ↓
TextEditingController
   ↓
Form / validator
   ↓
conversión de tipos
   ↓
Garden
```

------------------------------------------------------------------------

### 18. Devolución de datos entre rutas

`Navigator.pop()` pode eliminar unha ruta da pila e, ademais, devolver
un resultado.

Desde `CreateGardenScreen`:

``` dart
Navigator.of(context).pop(garden);
```

Isto:

1.  Elimina `CreateGardenScreen` da pila.
2.  Volve á pantalla que abriu o formulario.
3.  Devolve o obxecto `Garden` como resultado.

A pantalla que abriu a ruta pode esperar ese resultado:

``` dart
final garden = await Navigator.of(context).push<Garden>(
  MaterialPageRoute(
    builder: (context) => const CreateGardenScreen(),
  ),
);
```

Se o usuario crea unha horta:

``` text
CreateGardenScreen
        ↓
pop(garden)
        ↓
Garden
```

Se abandona o formulario sen crear nada:

``` text
CreateGardenScreen
        ↓
Atrás
        ↓
null
```

Por este motivo o resultado que recibe a pantalla anterior pode ser
nullable.

------------------------------------------------------------------------

### 19. `Future`, `async` e `await`

A navegación permitiu introducir de maneira práctica algúns conceptos
básicos de programación asíncrona.

Exemplo:

``` dart
onCreateGarden: () async {
  final garden =
      await Navigator.of(context).push<Garden>(
    MaterialPageRoute(
      builder: (context) =>
          const CreateGardenScreen(),
    ),
  );

  debugPrint('Resultado: ${garden?.name}');
},
```

`push<Garden>()` indica o tipo de resultado que esperamos que devolva a
ruta.

`await` permite esperar a que a navegación remate e obter o resultado.

Para poder utilizar `await`, o callback declárase como `async`.

Fluxo conceptual:

``` text
push<Garden>()
      ↓
ábrese CreateGardenScreen
      ↓
o Future queda pendente
      ↓
o usuario utiliza o formulario
      ↓
pop(garden) ou regreso sen resultado
      ↓
o Future complétase
      ↓
await obtén Garden?
```

Nesta sesión estes conceptos introducíronse de maneira práctica.

A programación asíncrona estudarase con maior profundidade cando sexa
necesaria para a persistencia e para o consumo de APIs.

------------------------------------------------------------------------

## Decisións de deseño tomadas

-   Os datos dunha horta represéntanse mediante o modelo `Garden`.
-   `GardenListItem` pertence ao módulo `gardens` porque a súa
    responsabilidade é específica deste módulo.
-   Os widgets poden recibir obxectos completos do modelo cando resulta
    máis coherente que pasar todos os seus atributos individualmente.
-   `GardenListItem` segue sendo `StatelessWidget`; unha interacción non
    implica por si mesma estado mutable.
-   `CreateGardenScreen` é `StatefulWidget` porque xestiona recursos
    asociados ao ciclo de vida da pantalla.
-   Os `TextEditingController` son responsabilidade de
    `_CreateGardenScreenState`.
-   Os controladores libéranse mediante `dispose()`.
-   O identificador dunha horta pode ser `null` antes da persistencia.
-   Os datos introducidos polo usuario valídanse antes de construír o
    modelo.
-   A creación dunha horta aínda non modifica a lista real da
    aplicación.
-   Non se implementará unha solución temporal para compartir a nova
    horta entre `DashboardScreen` e `GardensScreen`.
-   A xestión compartida dos datos resolverase posteriormente mediante a
    arquitectura prevista e a persistencia.

------------------------------------------------------------------------

## Estado ao finalizar a sesión

O módulo de hortas xa permite:

1.  Representar hortas mediante un modelo `Garden`.
2.  Manter temporalmente unha colección de hortas.
3.  Mostrar unha colección mediante `ListView.builder`.
4.  Representar cada elemento mediante `GardenListItem`.
5.  Seleccionar unha horta mediante `InkWell`.
6.  Comunicar a horta seleccionada mediante un callback con parámetro.
7.  Navegar á pantalla de detalle.
8.  Pasar un `Garden` entre pantallas.
9.  Abrir un formulario de creación.
10. Introducir os datos dunha nova horta.
11. Validar os datos do formulario.
12. Converter a superficie de `String` a `double`.
13. Construír un novo obxecto `Garden`.
14. Devolver ese obxecto á ruta anterior mediante
    `Navigator.pop(garden)`.
15. Recibir o resultado mediante `await Navigator.push<Garden>()`.

A persistencia da nova horta e a actualización compartida da interface
quedan deliberadamente pendentes para fases posteriores.

------------------------------------------------------------------------

## Conceptos clave da sesión

-   Modelo de dominio.
-   Clase e instancia.
-   `List<T>`.
-   `ListView.builder`.
-   `itemCount`.
-   `itemBuilder`.
-   `index`.
-   Widgets reutilizables.
-   `InkWell`.
-   `VoidCallback`.
-   `void Function(T)`.
-   Paso de obxectos entre widgets.
-   Paso de obxectos entre pantallas.
-   `StatefulWidget`.
-   `State<T>`.
-   `createState()`.
-   Ciclo de vida.
-   `TextEditingController`.
-   `dispose()`.
-   `TextFormField`.
-   `Form`.
-   `GlobalKey<FormState>`.
-   `validator`.
-   `double.parse()`.
-   `double.tryParse()`.
-   Null safety.
-   Tipos nullable (`?`).
-   Acceso condicional (`?.`).
-   `Navigator.push<T>()`.
-   `Navigator.pop(resultado)`.
-   `Future`.
-   `async`.
-   `await`.

------------------------------------------------------------------------

# Sesión 11 - Estado compartido con Provider

## Obxectivo

Introducir a xestión de estado compartido en MARTOLA mediante Provider e
aplicar os conceptos ao módulo de hortas.

Durante esta sesión substituíronse os datos temporais almacenados
directamente nas Views por un estado centralizado nun
`GardensViewModel`.

------------------------------------------------------------------------

## Estado local e estado compartido

Non todo o estado dunha aplicación debe almacenarse no mesmo lugar.

### Estado local

É aquel que só afecta a un widget ou pantalla concreta.

Exemplo:

``` dart
final TextEditingController nameController =
    TextEditingController();
```

O contido dun campo dun formulario é responsabilidade da propia
pantalla.

### Estado compartido

É información que debe ser utilizada ou modificada por diferentes partes
da aplicación.

Exemplo:

``` dart
List<Garden> gardens
```

A colección de hortas é utilizada por diferentes pantallas:

-   `DashboardScreen`
-   `GardensScreen`
-   `GardenDetailsScreen`
-   `CreateGardenScreen`
-   `EditGardenScreen`

Por este motivo non debe pertencer exclusivamente a ningunha delas.

------------------------------------------------------------------------

## GardensViewModel

Creouse:

``` text
lib/
└── viewmodels/
    └── gardens_viewmodel.dart
```

O `GardensViewModel` é responsable de manter e modificar o estado
relacionado coas hortas.

A colección interna mantense privada:

``` dart
final List<Garden> _gardens = [];
```

e exponse mediante un getter:

``` dart
List<Garden> get gardens =>
    List.unmodifiable(_gardens);
```

`List.unmodifiable()` evita que as Views poidan modificar directamente a
colección.

As modificacións deben realizarse mediante métodos do ViewModel.

------------------------------------------------------------------------

## Encapsulación do estado

Evítase:

``` dart
viewModel.gardens.add(garden);
```

e utilízase:

``` dart
viewModel.addGarden(garden);
```

Deste xeito, a responsabilidade de modificar o estado permanece no
ViewModel.

------------------------------------------------------------------------

## ChangeNotifier

`GardensViewModel` estende:

``` dart
ChangeNotifier
```

Isto permite que o ViewModel notifique ás Views cando o estado cambia.

Exemplo:

``` dart
void addGarden(Garden garden) {
    // modificar estado

    notifyListeners();
}
```

O fluxo é:

``` text
modificación do estado
        ↓
notifyListeners()
        ↓
widgets subscritos
        ↓
rebuild
```

------------------------------------------------------------------------

## Provider

Engadiuse o paquete `provider` ao proxecto.

O `GardensViewModel` proporciónase por enriba de `MaterialApp`:

``` text
MartolaApp
└── ChangeNotifierProvider
    └── MaterialApp
        └── resto da aplicación
```

Isto permite compartir unha única instancia de `GardensViewModel` entre
as diferentes pantallas.

------------------------------------------------------------------------

## context.watch

Utilízase cando unha View necesita acceder ao estado e reaccionar aos
seus cambios.

Exemplo:

``` dart
final gardensViewModel =
    context.watch<GardensViewModel>();

final gardens = gardensViewModel.gardens;
```

Aplicado en:

``` text
GardensScreen
```

Cando `GardensViewModel` executa `notifyListeners()`, a pantalla
reconstrúese.

------------------------------------------------------------------------

## context.read

Utilízase cando unha View necesita acceder ao ViewModel para executar
unha acción pero non necesita subscribirse aos seus cambios.

Exemplo:

``` dart
context
    .read<GardensViewModel>()
    .addGarden(garden);
```

Aplicado en:

``` text
CreateGardenScreen
```

------------------------------------------------------------------------

## context.select

Utilízase cando unha View só necesita reaccionar aos cambios dunha parte
concreta do estado.

Exemplo:

``` dart
final gardenCount =
    context.select<GardensViewModel, int>(
        (viewModel) => viewModel.gardens.length,
    );
```

Aplicado no Dashboard para mostrar o número de hortas.

Isto permite evitar reconstrucións innecesarias cando cambia outra
información do ViewModel.

------------------------------------------------------------------------

## Regra práctica

``` text
read
→ acceder ao ViewModel sen escoitar cambios

watch
→ escoitar os cambios do ViewModel

select
→ escoitar un valor concreto do ViewModel
```

------------------------------------------------------------------------

## Provider non é persistencia

Provider permite manter estado compartido mentres a aplicación está en
execución.

Non almacena os datos de forma permanente.

Actualmente:

``` text
GardensViewModel
      ↓
estado en memoria
```

Ao pechar completamente a aplicación, as hortas desaparecen.

A persistencia implementarase posteriormente mediante:

``` text
View
 ↓
ViewModel
 ↓
Repository
 ↓
SQLite
```

------------------------------------------------------------------------

## CRUD en memoria

Durante a sesión implementouse un primeiro CRUD completo sobre as
hortas.

### CREATE

``` dart
addGarden()
```

### READ

``` dart
gardens
```

e:

``` dart
getGardenById()
```

### UPDATE

``` dart
updateGarden()
```

### DELETE

``` dart
removeGarden()
```

Todo o estado está centralizado en:

``` text
GardensViewModel
```

------------------------------------------------------------------------

## Identidade temporal das hortas

Antes de SQLite, as hortas creadas desde o formulario non dispoñían dun
identificador.

Engadiuse temporalmente un contador ao ViewModel:

``` dart
int _nextId = 1;
```

Ao engadir unha horta, o ViewModel crea unha nova instancia cun
identificador:

``` text
Garden sen ID
     ↓
addGarden()
     ↓
asignación de ID temporal
     ↓
Garden almacenado
```

Exemplo:

``` text
1
2
3
...
```

Os IDs almacénanse como `String`.

Este mecanismo é provisional e será substituído pola estratexia de
identificación utilizada pola capa de persistencia.

------------------------------------------------------------------------

## Modelos inmutables

`Garden` utiliza propiedades `final`.

Por este motivo unha edición non modifica directamente a instancia
existente.

Evítase:

``` dart
garden.name = 'Novo nome';
```

En cambio créase unha nova instancia:

``` dart
final updatedGarden = Garden(
    id: widget.garden.id,
    name: nameController.text.trim(),
    location: locationController.text.trim(),
    area: area,
);
```

e o ViewModel substitúe a instancia anterior:

``` dart
_gardens[index] = updatedGarden;
```

------------------------------------------------------------------------

## updateGarden

A actualización localiza primeiro a instancia existente:

``` dart
final index = _gardens.indexOf(oldGarden);
```

Se non existe:

``` dart
if (index == -1) {
    return;
}
```

Se existe, substitúese:

``` dart
_gardens[index] = updatedGarden;
notifyListeners();
```

A nova instancia conserva o mesmo ID.

------------------------------------------------------------------------

## getGardenById

Engadiuse unha operación para recuperar unha horta mediante a súa
identidade:

``` dart
Garden? getGardenById(String id)
```

Pode devolver:

``` text
Garden
```

ou:

``` text
null
```

se non existe ningunha horta co identificador solicitado.

------------------------------------------------------------------------

## GardenDetailsScreen e fonte de verdade

Inicialmente `GardenDetailsScreen` recibía directamente:

``` dart
Garden garden
```

Isto provocaba que, despois dunha edición, a pantalla puidese conservar
unha referencia á instancia antiga.

A solución foi facer que a pantalla traballe coa identidade:

``` dart
String gardenId
```

e obteña a versión actual desde `GardensViewModel`:

``` dart
final garden =
    context.select<GardensViewModel, Garden?>(
        (viewModel) =>
            viewModel.getGardenById(gardenId),
    );
```

Deste xeito o ViewModel actúa como fonte de verdade.

``` text
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

------------------------------------------------------------------------

## Eliminación por identidade

Inicialmente:

``` dart
removeGarden(Garden garden)
```

Posteriormente cambiouse a operación para traballar mediante identidade:

``` dart
removeGarden(String id)
```

O ViewModel localiza internamente a horta mediante:

``` dart
getGardenById(id)
```

Isto evita depender dunha instancia concreta do modelo.

------------------------------------------------------------------------

## initState

Na pantalla de edición utilizouse `initState()` para inicializar os
controladores cos valores actuais da horta.

``` dart
@override
void initState() {
    super.initState();

    nameController = TextEditingController(
        text: widget.garden.name,
    );
}
```

`initState()` execútase unha vez cando se crea o estado do widget.

------------------------------------------------------------------------

## late final

Os controladores de `EditGardenScreen` decláranse mediante:

``` dart
late final TextEditingController nameController;
```

Isto permite declaralos antes de coñecer o valor inicial e inicializalos
posteriormente en `initState()`.

`final` garante que a referencia ao controlador non será substituída
despois da inicialización.

------------------------------------------------------------------------

## widget dentro dun State

Dentro dunha clase:

``` dart
State<EditGardenScreen>
```

pódese acceder á configuración do `StatefulWidget` asociado mediante:

``` dart
widget
```

Por exemplo:

``` dart
widget.garden.name
```

------------------------------------------------------------------------

## Conceptos principais aprendidos

-   Estado local.
-   Estado compartido.
-   Encapsulación do estado.
-   ViewModel como fonte de verdade.
-   Provider.
-   `ChangeNotifier`.
-   `notifyListeners()`.
-   `ChangeNotifierProvider`.
-   `context.read`.
-   `context.watch`.
-   `context.select`.
-   Modelos inmutables.
-   Identidade de entidades.
-   `Garden?` e tratamento de ausencia de datos.
-   `initState()`.
-   `late final`.
-   Acceso mediante `widget` desde un `State`.
-   CRUD en memoria.
-   Diferencia entre estado e persistencia.

------------------------------------------------------------------------

## Estado ao finalizar a sesión

O módulo de hortas permite actualmente:

``` text
Crear horta
    ↓
Listar hortas
    ↓
Consultar detalle
    ↓
Editar horta
    ↓
Eliminar horta
```

Os cambios sincronízanse entre:

-   `DashboardScreen`
-   `GardensScreen`
-   `GardenDetailsScreen`
-   `CreateGardenScreen`
-   `EditGardenScreen`

mediante `GardensViewModel` e Provider.

Os datos aínda se almacenan exclusivamente en memoria.

------------------------------------------------------------------------

# LEARNING_NOTES.md

# MARTOLA - Flutter Learning Notes

## Purpose

Este documento recolle os conceptos aprendidos durante o desenvolvemento
de MARTOLA.

Non pretende substituír a documentación oficial de Flutter, senón servir
como guía de consulta rápida cos conceptos fundamentais que se vaian
aprendendo ao longo do proxecto.

------------------------------------------------------------------------

# Filosofía de Flutter

Flutter está baseado na composición de widgets.

Unha interface non se constrúe modificando elementos existentes, senón
combinando widgets pequenos, cada un cunha responsabilidade concreta.

Os widgets describen como debe verse a interface.

O Flutter Engine é o encargado de debuxala na pantalla.

Principios fundamentais:

-   Todo é un Widget.
-   Cada Widget ten unha única responsabilidade.
-   A interface constrúese mediante composición.
-   O estado determina a interface.
-   Flutter reconstrúe só o necesario cando cambia o estado.

------------------------------------------------------------------------

# Patróns de pensamento

## Antes de aprender un widget

Pregunta sempre:

> Cal é a responsabilidade deste widget?

------------------------------------------------------------------------

## Antes de aprender unha propiedade

Pregunta:

> Que problema intenta resolver?

------------------------------------------------------------------------

## Antes de memorizar unha API

Pregunta:

> Podo deducila a partir da responsabilidade do widget?

------------------------------------------------------------------------

## Antes de engadir un widget novo

Pregunta:

> Xa existe outro widget que resolva este problema dunha forma máis
> simple?

------------------------------------------------------------------------

# Lesson 1 - Flutter Fundamentals

## Flutter

Flutter é un framework desenvolvido por Google para crear aplicacións
multiplataforma.

A súa principal característica é que debuxa toda a interface mediante
widgets, independentemente do sistema operativo.

------------------------------------------------------------------------

## Flutter Framework

É a parte escrita en Dart.

Contén:

-   Widgets
-   MaterialApp
-   Scaffold
-   Navigator
-   Theme
-   etc.

O framework describe como debe ser a interface.

------------------------------------------------------------------------

## Flutter Engine

É o motor interno de Flutter.

Está escrito principalmente en C++.

É o encargado de:

-   debuxar a interface
-   comunicarse co sistema operativo
-   acceder á GPU
-   procesar eventos do rato e teclado

O programador normalmente traballa co Framework, non co Engine.

------------------------------------------------------------------------

## Widget

Un Widget é a unidade básica coa que se constrúe a interface dunha
aplicación Flutter.

Pode representar:

-   un elemento visual (Text)
-   unha estrutura (Column)
-   unha aliñación (Center)
-   un espazado (Padding)
-   unha pantalla completa (HomeScreen)

Un Widget non debuxa a pantalla.

Describe como debe verse.

------------------------------------------------------------------------

## Árbore de Widgets

Toda aplicación Flutter constrúese como unha árbore.

Exemplo:

main()

↓

runApp()

↓

MartolaApp

↓

MaterialApp

↓

HomeScreen

↓

Scaffold

↓

Center

↓

Text

Cada Widget pode conter outros Widgets.

------------------------------------------------------------------------

## main()

É o punto de entrada da aplicación.

Flutter comeza a executarse desde esta función.

------------------------------------------------------------------------

## runApp()

runApp() recibe o Widget raíz da aplicación.

A partir del Flutter constrúe toda a árbore de Widgets.

Non é un Widget.

É unha función.

------------------------------------------------------------------------

## Widget raíz

É o primeiro Widget da aplicación.

No proxecto MARTOLA é:

MartolaApp

Todos os demais Widgets dependen del.

------------------------------------------------------------------------

## StatelessWidget

Representa un Widget cuxos datos non cambian durante a súa vida.

Exemplos:

-   Logo
-   Texto fixo
-   Icona decorativa

Características:

-   máis sinxelo
-   máis eficiente
-   permite utilizar const cando sexa posible

------------------------------------------------------------------------

## StatefulWidget

Representa un Widget cuxos datos poden cambiar.

Exemplos:

-   Campo de texto
-   Lista de hortas
-   Información meteorolóxica
-   Contador

O Widget non cambia.

Cambian os datos que utiliza.

------------------------------------------------------------------------

## Estado

O estado son os datos empregados por un Widget para construír a súa
interface.

Cando o estado cambia:

Flutter executa novamente build().

------------------------------------------------------------------------

## const

Indica que un obxecto é inmutable e coñécese en tempo de compilación.

Flutter pode reutilizalo sen necesidade de crear unha nova instancia.

Sempre que sexa posible utilizarase const.

------------------------------------------------------------------------

## build()

É o método principal dun Widget.

A súa misión é construír e devolver a descrición da interface segundo o
estado actual da aplicación.

Non debuxa píxeles.

Describe como debe verse a interface.

------------------------------------------------------------------------

## BuildContext

Representa a posición dun Widget dentro da árbore.

Permite acceder a información do seu contorno.

Exemplos:

-   Theme
-   Navigator
-   MediaQuery
-   Providers

Non representa a aplicación completa.

Representa o contexto dese Widget.

------------------------------------------------------------------------

## MaterialApp

É o Widget que configura a aplicación baseada en Material Design.

Entre outras cousas define:

-   tema
-   navegación
-   título
-   pantalla inicial

------------------------------------------------------------------------

## Scaffold

É o esqueleto básico dunha pantalla Material.

Pode conter:

-   AppBar
-   Body
-   Drawer
-   BottomNavigationBar
-   FloatingActionButton

------------------------------------------------------------------------

## Center

Widget encargado de centrar o seu Widget fillo.

Non modifica outros Widgets.

Simplemente describe unha aliñación.

------------------------------------------------------------------------

## Composición

Flutter constrúe interfaces combinando Widgets pequenos.

Exemplo:

Padding

↓

Center

↓

Text

Cada Widget realiza unha única tarefa.

------------------------------------------------------------------------

## Principio de responsabilidade única

Cada Widget debe ter unha responsabilidade concreta.

Exemplos:

WeatherCard

↓

mostrar información meteorolóxica

GardenCard

↓

mostrar unha horta

LogoWidget

↓

mostrar o logotipo

Este principio facilita:

-   reutilización
-   mantemento
-   probas
-   reconstrución eficiente

------------------------------------------------------------------------

## Filosofía de Flutter

Flutter non modifica a interface existente.

Cada vez que cambia o estado:

1.  Executa build().
2.  Obtén unha nova descrición da interface.
3.  Compara coa anterior.
4.  Actualiza só o necesario.

------------------------------------------------------------------------

# Ideas clave

-   Todo en Flutter é un Widget.
-   Un Widget describe, non debuxa.
-   Flutter funciona mediante composición.
-   Os Widgets deben ser pequenos.
-   Os Widgets deben ter unha única responsabilidade.
-   StatelessWidget → os datos non cambian.
-   StatefulWidget → os datos poden cambiar.
-   build() describe a interface segundo o estado actual.
-   O Engine debuxa; o Framework describe.

------------------------------------------------------------------------

## Regra do eixe principal

Antes de utilizar `mainAxisAlignment` ou `crossAxisAlignment`,
identifica primeiro cal é a responsabilidade do widget.

**Pregunta clave:**

> Como organiza este widget os seus widgets fillos (`children`)?

A resposta indica automaticamente cal é o eixe principal.

### Column

Responsabilidade:

Organizar os widgets verticalmente.

-   Eixe principal → Vertical
-   Eixe secundario → Horizontal

Polo tanto:

-   `mainAxisAlignment` controla a distribución vertical.
-   `crossAxisAlignment` controla a aliñación horizontal.

------------------------------------------------------------------------

### Row

Responsabilidade:

Organizar os widgets horizontalmente.

-   Eixe principal → Horizontal
-   Eixe secundario → Vertical

Polo tanto:

-   `mainAxisAlignment` controla a distribución horizontal.
-   `crossAxisAlignment` controla a aliñación vertical.

------------------------------------------------------------------------

### Regra práctica

Nunca memorices que fai `mainAxisAlignment` ou `crossAxisAlignment`.

Primeiro responde:

> **Como organiza os seus widgets fillos este widget?**

Unha vez identificado o eixe principal, o resto dedúcese
automaticamente.

------------------------------------------------------------------------

# Lesson 3 - Layout

## Column

Widget encargado de organizar varios widgets verticalmente.

Cada widget fillo colócase debaixo do anterior.

### Responsabilidade

Organizar widgets no eixe vertical.

------------------------------------------------------------------------

## Row

Widget encargado de organizar varios widgets horizontalmente.

Cada widget fillo colócase ao lado do anterior.

### Responsabilidade

Organizar widgets no eixe horizontal.

------------------------------------------------------------------------

## Main Axis

É o eixe principal segundo o cal un widget organiza os seus widgets
fillos.

### Column

Main Axis → Vertical

### Row

Main Axis → Horizontal

------------------------------------------------------------------------

## Cross Axis

É o eixe perpendicular ao Main Axis.

### Column

Cross Axis → Horizontal

### Row

Cross Axis → Vertical

------------------------------------------------------------------------

## MainAxisAlignment

Controla como se distribúen os widgets ao longo do Main Axis.

Non depende do nome "horizontal" ou "vertical".

Depende sempre do eixe principal do widget.

------------------------------------------------------------------------

## CrossAxisAlignment

Controla a aliñación dos widgets ao longo do Cross Axis.

------------------------------------------------------------------------

## Regra do eixe principal

Antes de utilizar `mainAxisAlignment` ou `crossAxisAlignment`,
identifica primeiro a responsabilidade do widget.

Pregunta clave:

> Como organiza este widget os seus widgets fillos?

Se a resposta é:

-   Vertical → Main Axis = Vertical
-   Horizontal → Main Axis = Horizontal

O resto dedúcese automaticamente.

------------------------------------------------------------------------

## Filosofía da API de Flutter

Flutter intenta que a súa API sexa coherente e escalable.

As propiedades adoitan representarse mediante enums
(`MainAxisAlignment`, `CrossAxisAlignment`) en lugar de valores
booleanos ou cadeas de texto.

Isto permite:

-   Maior claridade.
-   Mellor autocompletado.
-   Comprobación en tempo de compilación.
-   APIs máis flexibles e fáciles de ampliar.

------------------------------------------------------------------------

## Concepto da sesión

Antes de aprender unha propiedade dun widget, identifica primeiro a súa
responsabilidade.

A maior parte da API de Flutter pode deducirse a partir desa
responsabilidade.

------------------------------------------------------------------------

# Erros frecuentes

## Confundir Widget con elemento visual

Un Widget non sempre representa un elemento visible.

Exemplos:

-   Padding
-   Center
-   SizedBox

Tamén son Widgets.

------------------------------------------------------------------------

## Pensar que build() debuxa a pantalla

Incorrecto.

build() describe a interface.

É o Engine quen a debuxa.

------------------------------------------------------------------------

## Memorizar MainAxisAlignment

Non é necesario.

Primeiro identifica o Main Axis.

O resto dedúcese automaticamente.

------------------------------------------------------------------------

# Regra de ouro

En Flutter non memorices primeiro a API.

Comprende primeiro a responsabilidade do widget.

Na maioría dos casos, a API poderá deducirse de forma natural.

------------------------------------------------------------------------

## Regra da composición

En Flutter é preferible combinar varios widgets pequenos cunha única
responsabilidade antes que utilizar un widget grande con múltiples
opcións.

Vantaxes:

-   Reutilización.
-   Mantemento.
-   Lexibilidade.
-   Flexibilidade.
-   Testabilidade.

A composición é un dos principios fundamentais de Flutter.

------------------------------------------------------------------------

# Lesson 5 - First Real Screen

## AppBar

Widget que representa a barra superior dunha pantalla Material.

Pode conter:

-   título
-   accións
-   botón de navegación
-   menú

Forma parte da estrutura proporcionada por Scaffold.

------------------------------------------------------------------------

## SafeArea

Widget que garante que o seu contido permaneza dentro da zona segura do
dispositivo.

Evita que outros widgets queden ocultos por:

-   notch
-   cámara frontal
-   barra de estado
-   xestos do sistema

------------------------------------------------------------------------

## ElevatedButton

Botón Material con elevación.

A súa responsabilidade é ofrecer unha acción principal ao usuario.

Se `onPressed` é:

``` dart
null
```

o botón queda automaticamente desactivado.

------------------------------------------------------------------------

## Arquitectura dunha pantalla

Antes de implementar unha pantalla é recomendable definir a súa árbore
de widgets.

Exemplo:

HomeScreen

↓

Scaffold

↓

AppBar

↓

SafeArea

↓

Center

↓

Padding

↓

Column

↓

Widgets da interface

------------------------------------------------------------------------

## Regra da arquitectura

Primeiro deseña a estrutura.

Despois escribe o código.

É moito máis sinxelo corrixir unha arquitectura que unha implementación
xa rematada.

------------------------------------------------------------------------

## Concepto da sesión

Construír unha pantalla Flutter consiste en combinar widgets pequenos,
cada un cunha responsabilidade concreta, ata formar unha interface
completa.

------------------------------------------------------------------------

# Lesson 6 - Refactoring & Theme

## Refactorización

Refactorizar consiste en mellorar a estrutura interna do código sen
modificar o seu comportamento.

Unha boa refactorización:

-   Reduce duplicación.
-   Mellora a lexibilidade.
-   Facilita o mantemento.
-   Non modifica o resultado visible da aplicación.

------------------------------------------------------------------------

## Widgets reutilizables

Un widget debe extraerse cando representa unha responsabilidade propia
que pode utilizarse en máis dun lugar.

Exemplo:

MartolaLogo

Responsabilidade:

Mostrar a identidade visual da aplicación.

Non debe incluír botóns nin accións porque pertencen a responsabilidades
diferentes.

------------------------------------------------------------------------

## ThemeData

`ThemeData` centraliza a configuración visual da aplicación.

Permite definir:

-   cores
-   tipografías
-   botóns
-   AppBar
-   formularios
-   iconografía

Todos os widgets poden acceder ao tema mediante:

``` dart
Theme.of(context)
```

------------------------------------------------------------------------

## ColorScheme

`ColorScheme` define os diferentes roles de cor da aplicación.

Exemplo:

-   primary
-   secondary
-   surface
-   error

Os widgets deben utilizar estes roles en lugar de cores fixas.

Incorrecto:

``` dart
color: Colors.green
```

Correcto:

``` dart
color: Theme.of(context).colorScheme.primary
```

------------------------------------------------------------------------

## Concepto da sesión

Primeiro conseguimos que unha aplicación funcione.

Despois organizamos o código para que sexa fácil de manter.

------------------------------------------------------------------------

# Regra do Navigator

push()

→ Engade unha pantalla enriba da pila.

pop()

→ Elimina a pantalla superior da pila.

A pantalla anterior nunca desaparece mentres permaneza na pila.

------------------------------------------------------------------------

## Navigator e a pila de rutas

O `Navigator` mantén unha pila (stack) de rutas.

-   `push()` engade unha nova ruta enriba da pila.
-   `pop()` elimina a ruta superior.

Cada chamada a `push()` crea unha nova ruta, aínda que xa exista outra
pantalla do mesmo tipo na pila.

As rutas inferiores permanecen na pila ata que son eliminadas
explicitamente.

------------------------------------------------------------------------

# Lesson 7 - Navigation

## Navigator

O Navigator xestiona a navegación mediante unha pila (stack) de rutas.

Cada pantalla normalmente corresponde a unha ruta.

------------------------------------------------------------------------

## push()

Engade unha nova ruta enriba da pila.

A pantalla anterior permanece na pila.

------------------------------------------------------------------------

## pop()

Elimina a ruta superior da pila.

A pantalla anterior volve mostrarse.

------------------------------------------------------------------------

## MaterialPageRoute

Representa unha ruta Material que sabe como construír unha pantalla.

------------------------------------------------------------------------

## Organización das pantallas

Cada pantalla debe ter unha responsabilidade clara.

As vistas organízanse por funcionalidade:

views/

├── home/

├── dashboard/

├── gardens/

├── plants/

├── weather/

└── settings/

------------------------------------------------------------------------

## SingleChildScrollView

Permite desprazar vertical ou horizontalmente un único widget fillo.

Habitualmente utilízase xunto cunha Column para pantallas cun número
reducido de elementos que poden exceder o tamaño da pantalla.

------------------------------------------------------------------------

## Column vs SingleChildScrollView vs ListView

Column

-   Sen scroll.
-   Poucos elementos.

SingleChildScrollView + Column

-   Poucos elementos.
-   Scroll completo.

ListView

-   Moitos elementos.
-   Construción eficiente dos elementos visibles.

------------------------------------------------------------------------

## Concepto da sesión

A navegación en Flutter baséase nunha pila de rutas, non nun cambio
directo dunha pantalla a outra.

------------------------------------------------------------------------

## Regra para organizar widgets

Un widget debe permanecer preto da funcionalidade á que pertence.

Só debe moverse a `lib/widgets/` cando exista unha necesidade real de
reutilizalo noutras partes da aplicación.

Non se deben crear compoñentes globais "por se acaso".

Primeiro constrúese para resolver un problema concreto.

Despois reutilízase cando aparece unha segunda necesidade real.

------------------------------------------------------------------------

## Regra dos callbacks

Un widget reutilizable debería expoñer as accións mediante callbacks en
lugar de decidir directamente a navegación ou a lóxica externa.

O widget define **cando ocorre unha acción**.

O widget pai decide **que debe facer esa acción**.

Isto reduce o acoplamento e facilita a reutilización.

------------------------------------------------------------------------

# Lesson 8 - Reusable Components and Callbacks

## Deseño dun widget

Antes de implementar un widget débese determinar:

1.  Cal é a súa responsabilidade.
2.  Que datos necesita.
3.  Que accións debe expoñer.
4.  Como se organizará visualmente.

Un widget debe recibir só a información necesaria para cumprir a súa
responsabilidade.

------------------------------------------------------------------------

## Datos mediante o construtor

Os widgets poden recibir datos desde o widget pai:

``` dart
const WeatherCard(
  temperature: 28,
  condition: 'Ceo despexado',
  location: 'Ourense',
)
```

Isto permite separar a presentación da orixe dos datos.

Os datos poden ser ficticios (`mock data`) durante as primeiras fases do
desenvolvemento. Isto permite construír e probar a interface antes de
dispoñer de SQLite, APIs ou outras fontes de datos reais.

------------------------------------------------------------------------

## Interface pública dun widget

Os parámetros do construtor forman parte da interface pública do widget.

Por exemplo:

``` dart
class GardenCard extends StatelessWidget {
  const GardenCard({
    super.key,
    required this.gardenCount,
    required this.onViewGardens,
  });

  final int gardenCount;
  final VoidCallback onViewGardens;

  // ...
}
```

Neste caso `GardenCard` declara explicitamente que necesita:

-   Un dato: `gardenCount`.
-   Un comportamento: `onViewGardens`.

A implementación interna do widget pode cambiar sen que necesariamente
cambie esta interface.

------------------------------------------------------------------------

## Callbacks

Un widget pode recibir non só datos, senón tamén comportamento.

En Flutter podemos utilizar, entre outros mecanismos, `VoidCallback`:

``` dart
final VoidCallback onViewGardens;
```

O widget fillo pode executar ese callback cando se produce unha
interacción:

``` dart
TextButton(
  onPressed: onViewGardens,
  child: const Text('Ver hortas'),
)
```

O widget pai determina posteriormente que debe ocorrer:

``` dart
GardenCard(
  gardenCount: 2,
  onViewGardens: () {
    // Acción decidida polo widget pai
  },
)
```

### Regra dos callbacks

O widget fillo determina **cando ocorre unha acción**.

O widget pai determina **que debe facer esa acción**.

Por exemplo, `GardenCard` sabe que existe unha acción chamada "Ver
hortas", pero non necesita saber a que pantalla debe navegar.

Isto reduce o acoplamento e facilita a reutilización dos widgets.

------------------------------------------------------------------------

## Separación entre presentación e comportamento

Un widget de presentación non debería asumir responsabilidades que
pertencen a outros niveis da aplicación.

Por exemplo, en lugar de introducir directamente dentro de `GardenCard`:

``` dart
Navigator.of(context).push(...);
```

a tarxeta expón:

``` dart
final VoidCallback onViewGardens;
```

e deixa que `DashboardScreen` decida o comportamento.

Deste xeito:

-   `GardenCard` é responsable de mostrar información sobre as hortas.
-   `DashboardScreen` coñece o fluxo da pantalla e decide que facer coa
    acción.
-   A navegación non queda acoplada ao widget visual.

------------------------------------------------------------------------

## Organización de widgets

Un widget debe permanecer preto da funcionalidade á que pertence.

Por exemplo:

``` text
views/
└── dashboard/
    ├── dashboard_screen.dart
    └── widgets/
        ├── weather_card.dart
        ├── garden_card.dart
        ├── tasks_card.dart
        └── quick_actions_card.dart
```

Só debe moverse a `lib/widgets/` cando exista unha necesidade real de
reutilizalo noutras funcionalidades.

Non se deben crear compoñentes globais "por se acaso".

Primeiro constrúese o widget para resolver unha necesidade concreta e
posteriormente refactorízase se aparece unha necesidade real de
reutilización.

------------------------------------------------------------------------

## Card

`Card` é un widget de Material Design pensado para representar un bloque
de información relacionado visualmente.

No Dashboard utilizámolo como base dos distintos compoñentes:

-   `WeatherCard`
-   `GardenCard`
-   `TasksCard`
-   `QuickActionsCard`

Cada tarxeta representa unha responsabilidade diferente.

------------------------------------------------------------------------

## SingleChildScrollView

`SingleChildScrollView` permite facer scroll sobre un único widget
fillo.

Pode combinarse cunha `Column` cando unha pantalla ten un número
reducido de bloques pero estes poden superar o espazo visible.

Estrutura utilizada no Dashboard:

``` text
SafeArea
└── Padding
    └── SingleChildScrollView
        └── Column
            ├── WeatherCard
            ├── GardenCard
            ├── TasksCard
            └── QuickActionsCard
```

A `Column` organiza os elementos verticalmente e `SingleChildScrollView`
permite desprazalos cando non caben no espazo dispoñible.

------------------------------------------------------------------------

## SafeArea

`SafeArea` evita que o contido quede oculto por zonas reservadas ou
elementos físicos e de sistema do dispositivo.

Por exemplo:

-   Barra de estado.
-   Notches ou recortes.
-   Outras zonas reservadas polo sistema.

------------------------------------------------------------------------

## Padding

`Padding` introduce separación entre o seu widget fillo e os límites que
o rodean.

No Dashboard utilizamos:

``` dart
const EdgeInsets.all(16)
```

para evitar que as tarxetas queden pegadas aos bordos da zona
dispoñible.

------------------------------------------------------------------------

## Column e os seus eixes

Nunha `Column`:

-   O eixe principal (`main axis`) é o vertical.
-   O eixe secundario (`cross axis`) é o horizontal.

Por tanto:

``` dart
crossAxisAlignment: CrossAxisAlignment.stretch
```

actúa sobre o eixe horizontal.

------------------------------------------------------------------------

## CrossAxisAlignment.stretch

`CrossAxisAlignment.stretch` fai que os fillos dunha `Column` intenten
ocupar todo o espazo dispoñible no seu eixe secundario.

Nunha `Column`, isto significa estender os fillos horizontalmente.

Non significa necesariamente ocupar todo o ancho da pantalla.

Os widgets ocupan o ancho que lles permite o seu pai.

No Dashboard:

``` text
Pantalla
└── SafeArea
    └── Padding (16)
        └── SingleChildScrollView
            └── Column (stretch)
                └── WeatherCard
```

A `WeatherCard` esténdese polo ancho dispoñible dentro do `Padding`, non
ata os bordos físicos da pantalla.

Isto tamén permite que o contido se adapte cando cambia o tamaño da
ventá.

------------------------------------------------------------------------

## Theme dentro dos compoñentes

En lugar de definir estilos independentes en cada widget:

``` dart
TextStyle(
  fontSize: 32,
)
```

podemos utilizar os estilos centralizados no `Theme`:

``` dart
Theme.of(context).textTheme.titleLarge
```

ou cores:

``` dart
Theme.of(context).colorScheme.primary
```

Isto facilita:

-   Manter a coherencia visual.
-   Modificar o deseño desde un punto central.
-   Evitar valores visuais repetidos por toda a aplicación.

------------------------------------------------------------------------

## Xerarquía visual

Non toda a información dunha interface ten a mesma importancia.

Os elementos máis importantes deben destacar visualmente mediante
recursos como:

-   Tamaño.
-   Peso tipográfico.
-   Cor.
-   Posición.
-   Espazado.

Por exemplo, en `WeatherCard` a temperatura é un dos datos principais e
debe ter máis peso visual que a descrición do estado do ceo.

------------------------------------------------------------------------

## Accións no contexto adecuado

Unha acción debe situarse no contexto no que ten sentido.

Durante o deseño do Dashboard considerouse incluír:

-   Crear nova horta.
-   Engadir nova tarefa.
-   Engadir planta.

Decidiuse non incluír `Engadir planta` nas accións rápidas do Dashboard
porque unha planta debe estar asociada a unha horta concreta.

Polo tanto, esta acción terá máis sentido dentro do contexto dunha horta
seleccionada.

### Regra

**As accións deberían aparecer no contexto no que teñen sentido.**

Isto pode reducir pasos innecesarios e evitar solicitar ao usuario
información que o contexto xa podería proporcionar.

------------------------------------------------------------------------

## Composición do Dashboard

Ao finalizar a sesión, `DashboardScreen` está composto por:

``` text
DashboardScreen
├── WeatherCard
├── GardenCard
├── TasksCard
└── QuickActionsCard
```

Cada compoñente ten unha responsabilidade propia:

### WeatherCard

Mostra información meteorolóxica mediante datos ficticios:

-   Temperatura.
-   Estado do ceo.
-   Localidade.

### GardenCard

Mostra:

-   Número de hortas.
-   Acción para acceder ás hortas.

### TasksCard

Mostra:

-   Número de tarefas pendentes.
-   Acción para acceder ás tarefas.

### QuickActionsCard

Agrupa accións frecuentes:

-   Crear horta.
-   Engadir tarefa.

------------------------------------------------------------------------

## Principio principal da sesión

Unha pantalla complexa pode construírse mediante a composición de
widgets pequenos con responsabilidades ben definidas.

Os widgets poden recibir desde niveis superiores:

-   **Datos**, mediante parámetros do construtor.
-   **Comportamento**, mediante callbacks.

Deste xeito podemos separar:

``` text
Datos
        ↓
DashboardScreen
        ↓
Compoñentes
        ↓
Presentación
```

e, para as interaccións:

``` text
Usuario realiza unha acción
        ↓
Widget fillo
        ↓
Callback
        ↓
Widget pai
        ↓
Comportamento / navegación
```

Esta separación reduce o acoplamento e facilita o mantemento, a
reutilización e a evolución da aplicación.

------------------------------------------------------------------------

# Lesson 9 - Callbacks and Navigation

## Conexión entre callbacks e navegación

Na sesión anterior utilizamos callbacks para permitir que os widgets
comuniquen accións ao seu widget pai.

Nesta sesión conectamos estes callbacks co sistema de navegación de
Flutter.

O patrón utilizado é:

``` text
Interacción do usuario
        ↓
Widget de presentación
        ↓
Callback
        ↓
Widget pai
        ↓
Navigator
        ↓
Pantalla destino
```

Por exemplo:

``` dart
GardenCard(
  gardenCount: 2,
  onViewGardens: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const GardensScreen(),
      ),
    );
  },
)
```

Neste exemplo:

-   `GardenCard` mostra a información das hortas.
-   `GardenCard` detecta que o usuario pulsa `Ver hortas`.
-   O callback `onViewGardens` comunica a acción.
-   `DashboardScreen` decide que esa acción debe abrir `GardensScreen`.
-   `Navigator` realiza a navegación.

------------------------------------------------------------------------

## Separación de responsabilidades

Un widget de presentación non debería coñecer necesariamente o fluxo
completo da aplicación.

Por exemplo:

``` text
GardenCard
```

ten a responsabilidade de:

-   Mostrar información sobre as hortas.
-   Mostrar a acción `Ver hortas`.
-   Comunicar que o usuario executou esa acción.

Non ten a responsabilidade de decidir a que pantalla debe navegar a
aplicación.

Esta decisión pertence neste caso a:

``` text
DashboardScreen
```

porque é a pantalla que coñece o fluxo das accións do Dashboard.

### Regra

**O widget fillo comunica a intención mediante un callback e o widget
que coñece o fluxo decide a navegación.**

------------------------------------------------------------------------

## Aplicación do mesmo patrón a diferentes módulos

O mesmo patrón pode aplicarse sen modificar a arquitectura:

``` text
GardenCard
    ↓ onViewGardens
DashboardScreen
    ↓
GardensScreen
```

``` text
TasksCard
    ↓ onViewTasks
DashboardScreen
    ↓
TasksScreen
```

E tamén ás accións rápidas:

``` text
QuickActionsCard
    ↓ onCreateGarden
DashboardScreen
    ↓
CreateGardenScreen
```

``` text
QuickActionsCard
    ↓ onAddTask
DashboardScreen
    ↓
CreateTaskScreen
```

Isto demostra que o patrón pode reutilizarse para diferentes
funcionalidades.

------------------------------------------------------------------------

## Pantallas provisionais

Non é necesario implementar unha pantalla completa no momento de crear
unha ruta de navegación.

Podemos crear primeiro unha pantalla provisional:

``` dart
class GardensScreen extends StatelessWidget {
  const GardensScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('As miñas hortas'),
      ),
      body: const Center(
        child: Text('Lista de hortas'),
      ),
    );
  }
}
```

Isto permite comprobar primeiro:

1.  Que a ruta funciona.
2.  Que a pantalla se constrúe correctamente.
3.  Que a pila de navegación funciona.
4.  Que podemos regresar á pantalla anterior.

Posteriormente a pantalla provisional pode substituírse progresivamente
pola implementación real.

------------------------------------------------------------------------

## Organización por funcionalidade

As pantallas deben agruparse segundo a funcionalidade á que pertencen.

A estrutura actual pasa a incluír:

``` text
views/
├── home/
├── dashboard/
│   ├── dashboard_screen.dart
│   └── widgets/
├── gardens/
│   ├── gardens_screen.dart
│   └── create_garden_screen.dart
└── tasks/
    ├── tasks_screen.dart
    └── create_task_screen.dart
```

Isto facilita localizar o código relacionado cun módulo e mantén
separadas as distintas responsabilidades da aplicación.

------------------------------------------------------------------------

## Principio principal da sesión

Os callbacks e a navegación poden combinarse mantendo separadas as
responsabilidades:

``` text
Widget fillo
    ↓
Comunica unha intención
    ↓
Callback
    ↓
Widget que coñece o fluxo
    ↓
Decide o destino
    ↓
Navigator
```

Deste xeito, os compoñentes visuais non quedan acoplados directamente ás
pantallas destino.

------------------------------------------------------------------------

## Sesión 10 --- Modelos, listas dinámicas e formularios

### Obxectivos da sesión

-   Introducir un modelo de dominio para representar unha horta.
-   Mostrar coleccións de obxectos mediante listas dinámicas.
-   Crear widgets especializados para representar elementos dunha lista.
-   Xestionar interaccións mediante callbacks con parámetros.
-   Navegar a unha pantalla de detalle pasando un obxecto do modelo.
-   Introducir `StatefulWidget` e o ciclo de vida do estado.
-   Crear o primeiro formulario funcional da aplicación.
-   Validar os datos introducidos polo usuario.
-   Converter datos de texto aos tipos requiridos polo modelo.
-   Introducir conceptos básicos de null safety.
-   Devolver datos entre rutas mediante `Navigator`.
-   Introducir de maneira práctica `Future`, `async` e `await`.

------------------------------------------------------------------------

### 1. Modelo `Garden`

Creouse unha clase `Garden` para representar unha horta dentro da
aplicación.

``` dart
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

Responsabilidade:

-   `Garden` representa os datos dunha horta.
-   Non é responsable da súa representación visual.
-   Non é responsable da navegación.
-   Non é responsable da persistencia dos datos.

O identificador declárase como:

``` dart
String? id;
```

porque unha horta pode existir temporalmente antes de ser gardada na
base de datos e, polo tanto, antes de recibir un identificador.

------------------------------------------------------------------------

### 2. Instancias dun modelo

Unha clase define a estrutura común dos obxectos.

Cada `Garden` é unha instancia distinta do mesmo modelo con valores
diferentes nos seus atributos.

Por exemplo:

``` dart
Garden(
  id: '1',
  name: 'Horta casa',
  location: 'Ourense',
  area: 40.0,
)
```

e:

``` dart
Garden(
  id: '2',
  name: 'Horta aldea',
  location: 'Amoeiro',
  area: 800.0,
)
```

son dous obxectos diferentes da mesma clase `Garden`.

Non é necesario crear unha clase diferente para cada horta.

------------------------------------------------------------------------

### 3. Colección `List<Garden>`

Para simular os datos que no futuro procederán da persistencia
utilizouse unha lista de obxectos `Garden`.

``` dart
const List<Garden> gardens = [
  Garden(
    id: '1',
    name: 'Horta casa',
    location: 'Ourense',
    area: 40.0,
  ),
  Garden(
    id: '2',
    name: 'Horta aldea',
    location: 'Amoeiro',
    area: 800.0,
  ),
  Garden(
    id: '3',
    name: 'Horta Mexide',
    location: 'Mexide',
    area: 120.0,
  ),
];
```

Estes datos son temporais e serán substituídos posteriormente por datos
procedentes da capa de persistencia.

------------------------------------------------------------------------

### 4. `ListView.builder`

Utilizouse `ListView.builder` para construír dinamicamente a lista de
hortas.

``` dart
ListView.builder(
  itemCount: gardens.length,
  itemBuilder: (context, index) {
    final garden = gardens[index];

    return GardenListItem(
      garden: garden,
      onTap: (garden) {
        // Acción
      },
    );
  },
)
```

Responsabilidades principais:

-   `itemCount`: indica cantos elementos ten a lista.
-   `itemBuilder`: define como se constrúe cada elemento.
-   `index`: identifica a posición do elemento que se está construíndo.

`ListView.builder` permite traballar con listas grandes sen ter que
declarar manualmente un widget por cada elemento.

Fluxo:

``` text
List<Garden>
    ↓
ListView.builder
    ↓
gardens[index]
    ↓
GardenListItem
```

------------------------------------------------------------------------

### 5. `GardenListItem`

Creouse un widget específico para representar visualmente unha horta
dentro da lista.

Localización:

``` text
views/
└── gardens/
    └── widgets/
        └── garden_list_item.dart
```

O widget recibe directamente un obxecto do modelo:

``` dart
final Garden garden;
```

Deste modo non é necesario pasar individualmente `name`, `location` e
`area`.

Responsabilidade:

> `GardenListItem` representa visualmente unha horta dentro dunha lista
> e comunica ao widget pai cando o usuario selecciona esa horta.

------------------------------------------------------------------------

### 6. `InkWell`

Utilizouse `InkWell` para detectar a pulsación sobre un elemento da
lista.

Estrutura:

``` text
Card
└── InkWell
    └── Padding
        └── Column
```

Un widget non necesita converterse en `StatefulWidget` simplemente
porque permita interacción.

A interacción e o estado son conceptos diferentes.

------------------------------------------------------------------------

### 7. Callbacks con parámetros

Ata este momento utilizáranse callbacks sen parámetros:

``` dart
VoidCallback
```

que equivalen conceptualmente a:

``` dart
void Function()
```

Para comunicar que horta foi seleccionada utilizouse:

``` dart
final void Function(Garden) onTap;
```

Isto permite executar:

``` dart
onTap(garden);
```

e enviar o obxecto seleccionado ao widget pai.

Fluxo:

``` text
InkWell
    ↓
GardenListItem
    ↓
onTap(garden)
    ↓
GardensScreen
```

------------------------------------------------------------------------

### 8. Paso de modelos entre pantallas

Creouse `GardenDetailsScreen`, que recibe obrigatoriamente un `Garden`.

``` dart
final Garden garden;
```

O mesmo widget pode representar calquera horta dependendo do obxecto
recibido.

A navegación realízase mediante:

``` dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => GardenDetailsScreen(
      garden: garden,
    ),
  ),
);
```

Fluxo:

``` text
GardensScreen
    ↓
GardenListItem
    ↓
Garden seleccionado
    ↓
Navigator.push()
    ↓
GardenDetailsScreen(garden)
```

Unha única clase `GardenDetailsScreen` permite crear distintas
instancias con datos diferentes.

------------------------------------------------------------------------

### 9. `StatefulWidget`

`CreateGardenScreen` converteuse de `StatelessWidget` a
`StatefulWidget`.

Estrutura básica:

``` dart
class CreateGardenScreen extends StatefulWidget {
  const CreateGardenScreen({super.key});

  @override
  State<CreateGardenScreen> createState() {
    return _CreateGardenScreenState();
  }
}

class _CreateGardenScreenState
    extends State<CreateGardenScreen> {

  @override
  Widget build(BuildContext context) {
    // Interface
  }
}
```

Distinción:

-   `CreateGardenScreen`: representa o widget e a súa configuración.
-   `_CreateGardenScreenState`: mantén o estado e os recursos asociados
    á instancia.

Que un widget permita interacción non significa automaticamente que
necesite ser `StatefulWidget`.

------------------------------------------------------------------------

### 10. `TextEditingController`

Creáronse controladores para acceder aos datos introducidos polo
usuario:

``` dart
final TextEditingController nameController =
    TextEditingController();

final TextEditingController locationController =
    TextEditingController();

final TextEditingController areaController =
    TextEditingController();
```

O texto actual dun campo pode consultarse mediante:

``` dart
nameController.text
```

Os controladores pertencen ao `State` porque é este quen xestiona o seu
ciclo de vida.

------------------------------------------------------------------------

### 11. `dispose()`

Os `TextEditingController` deben liberarse cando desaparece
definitivamente o estado da pantalla.

``` dart
@override
void dispose() {
  nameController.dispose();
  locationController.dispose();
  areaController.dispose();

  super.dispose();
}
```

Regra aprendida:

> Se un `State` crea e posúe un recurso que require `dispose()`, tamén é
> responsabilidade dese `State` liberalo.

------------------------------------------------------------------------

### 12. `TextFormField`

Utilizouse `TextFormField` para introducir os datos dunha nova horta.

Exemplo:

``` dart
TextFormField(
  controller: nameController,
  decoration: const InputDecoration(
    labelText: 'Nome',
  ),
)
```

Para a superficie indicouse unha entrada numérica:

``` dart
keyboardType: TextInputType.number
```

O `TextFormField` permite combinar a entrada de datos coa validación do
campo.

------------------------------------------------------------------------

### 13. `Form` e `GlobalKey<FormState>`

Os campos agrupáronse mediante un `Form`.

Creouse unha clave:

``` dart
final _formKey = GlobalKey<FormState>();
```

e asociouse ao formulario:

``` dart
Form(
  key: _formKey,
  child: Column(
    // campos
  ),
)
```

Isto permite acceder ao estado do formulario e solicitar a validación
dos seus campos.

------------------------------------------------------------------------

### 14. Validación

A validación completa do formulario pode executarse mediante:

``` dart
final isValid = _formKey.currentState!.validate();

if (!isValid) {
  return;
}
```

Cada `TextFormField` pode definir o seu propio `validator`.

Exemplo para o nome:

``` dart
validator: (value) {
  if (value == null || value.trim().isEmpty) {
    return 'Introduce un nome para a horta';
  }

  return null;
},
```

Tamén se utilizou unha versión compacta mediante o operador ternario:

``` dart
validator: (value) =>
    value == null || value.trim().isEmpty
        ? 'Introduce un nome para a horta'
        : null,
```

Regra:

``` text
validator devolve String
        ↓
campo non válido
        ↓
móstrase a mensaxe de erro

validator devolve null
        ↓
campo válido
```

Para a superficie comprobouse:

-   Que exista un valor.
-   Que non estea baleiro.
-   Que sexa convertible a número.
-   Que sexa maior que cero.

Exemplo:

``` dart
validator: (value) {
  if (value == null || value.trim().isEmpty) {
    return 'Introduce unha superficie';
  }

  final area = double.tryParse(value);

  if (area == null) {
    return 'Introduce unha superficie válida';
  }

  if (area <= 0) {
    return 'A superficie debe ser maior que 0';
  }

  return null;
},
```

------------------------------------------------------------------------

### 15. Conversión de `String` a `double`

Os datos dun campo de texto obtéñense inicialmente como `String`.

O modelo `Garden`, pola contra, require:

``` dart
final double area;
```

Estudáronse dous métodos:

``` dart
double.parse(value)
```

e:

``` dart
double.tryParse(value)
```

Diferenza:

``` text
double.parse("120.5")     → 120.5
double.parse("abc")       → excepción

double.tryParse("120.5")  → 120.5
double.tryParse("abc")    → null
```

`tryParse()` é especialmente útil para validar datos procedentes do
usuario.

Unha vez validado o formulario, pode empregarse `parse()` sabendo que o
valor xa é correcto.

------------------------------------------------------------------------

### 16. Null safety

Introduciuse o concepto de tipo nullable.

Un tipo:

``` dart
double
```

debe conter un valor `double`.

En cambio:

``` dart
double?
```

pode conter:

``` text
double ou null
```

O mesmo principio aplicouse ao identificador de `Garden`:

``` dart
final String? id;
```

Isto permite representar unha horta que aínda non foi persistida:

``` dart
Garden(
  name: 'Horta nova',
  location: 'Ourense',
  area: 125.0,
)
```

Neste caso:

``` dart
garden.id == null
```

Tamén se utilizou o operador de acceso condicional:

``` dart
?.
```

Por exemplo:

``` dart
garden?.name
```

que accede a `name` unicamente se `garden` non é `null`.

------------------------------------------------------------------------

### 17. Creación dun modelo desde un formulario

Despois de validar os datos, pode construírse unha instancia de
`Garden`.

``` dart
final area = double.parse(areaController.text);

final garden = Garden(
  name: nameController.text.trim(),
  location: locationController.text.trim(),
  area: area,
);
```

Neste momento a horta xa existe como obxecto dentro da aplicación, aínda
que non foi gardada nunha base de datos.

Fluxo conseguido:

``` text
Usuario
   ↓
TextFormField
   ↓
TextEditingController
   ↓
Form / validator
   ↓
conversión de tipos
   ↓
Garden
```

------------------------------------------------------------------------

### 18. Devolución de datos entre rutas

`Navigator.pop()` pode eliminar unha ruta da pila e, ademais, devolver
un resultado.

Desde `CreateGardenScreen`:

``` dart
Navigator.of(context).pop(garden);
```

Isto:

1.  Elimina `CreateGardenScreen` da pila.
2.  Volve á pantalla que abriu o formulario.
3.  Devolve o obxecto `Garden` como resultado.

A pantalla que abriu a ruta pode esperar ese resultado:

``` dart
final garden = await Navigator.of(context).push<Garden>(
  MaterialPageRoute(
    builder: (context) => const CreateGardenScreen(),
  ),
);
```

Se o usuario crea unha horta:

``` text
CreateGardenScreen
        ↓
pop(garden)
        ↓
Garden
```

Se abandona o formulario sen crear nada:

``` text
CreateGardenScreen
        ↓
Atrás
        ↓
null
```

Por este motivo o resultado que recibe a pantalla anterior pode ser
nullable.

------------------------------------------------------------------------

### 19. `Future`, `async` e `await`

A navegación permitiu introducir de maneira práctica algúns conceptos
básicos de programación asíncrona.

Exemplo:

``` dart
onCreateGarden: () async {
  final garden =
      await Navigator.of(context).push<Garden>(
    MaterialPageRoute(
      builder: (context) =>
          const CreateGardenScreen(),
    ),
  );

  debugPrint('Resultado: ${garden?.name}');
},
```

`push<Garden>()` indica o tipo de resultado que esperamos que devolva a
ruta.

`await` permite esperar a que a navegación remate e obter o resultado.

Para poder utilizar `await`, o callback declárase como `async`.

Fluxo conceptual:

``` text
push<Garden>()
      ↓
ábrese CreateGardenScreen
      ↓
o Future queda pendente
      ↓
o usuario utiliza o formulario
      ↓
pop(garden) ou regreso sen resultado
      ↓
o Future complétase
      ↓
await obtén Garden?
```

Nesta sesión estes conceptos introducíronse de maneira práctica.

A programación asíncrona estudarase con maior profundidade cando sexa
necesaria para a persistencia e para o consumo de APIs.

------------------------------------------------------------------------

## Decisións de deseño tomadas

-   Os datos dunha horta represéntanse mediante o modelo `Garden`.
-   `GardenListItem` pertence ao módulo `gardens` porque a súa
    responsabilidade é específica deste módulo.
-   Os widgets poden recibir obxectos completos do modelo cando resulta
    máis coherente que pasar todos os seus atributos individualmente.
-   `GardenListItem` segue sendo `StatelessWidget`; unha interacción non
    implica por si mesma estado mutable.
-   `CreateGardenScreen` é `StatefulWidget` porque xestiona recursos
    asociados ao ciclo de vida da pantalla.
-   Os `TextEditingController` son responsabilidade de
    `_CreateGardenScreenState`.
-   Os controladores libéranse mediante `dispose()`.
-   O identificador dunha horta pode ser `null` antes da persistencia.
-   Os datos introducidos polo usuario valídanse antes de construír o
    modelo.
-   A creación dunha horta aínda non modifica a lista real da
    aplicación.
-   Non se implementará unha solución temporal para compartir a nova
    horta entre `DashboardScreen` e `GardensScreen`.
-   A xestión compartida dos datos resolverase posteriormente mediante a
    arquitectura prevista e a persistencia.

------------------------------------------------------------------------

## Estado ao finalizar a sesión

O módulo de hortas xa permite:

1.  Representar hortas mediante un modelo `Garden`.
2.  Manter temporalmente unha colección de hortas.
3.  Mostrar unha colección mediante `ListView.builder`.
4.  Representar cada elemento mediante `GardenListItem`.
5.  Seleccionar unha horta mediante `InkWell`.
6.  Comunicar a horta seleccionada mediante un callback con parámetro.
7.  Navegar á pantalla de detalle.
8.  Pasar un `Garden` entre pantallas.
9.  Abrir un formulario de creación.
10. Introducir os datos dunha nova horta.
11. Validar os datos do formulario.
12. Converter a superficie de `String` a `double`.
13. Construír un novo obxecto `Garden`.
14. Devolver ese obxecto á ruta anterior mediante
    `Navigator.pop(garden)`.
15. Recibir o resultado mediante `await Navigator.push<Garden>()`.

A persistencia da nova horta e a actualización compartida da interface
quedan deliberadamente pendentes para fases posteriores.

------------------------------------------------------------------------

## Conceptos clave da sesión

-   Modelo de dominio.
-   Clase e instancia.
-   `List<T>`.
-   `ListView.builder`.
-   `itemCount`.
-   `itemBuilder`.
-   `index`.
-   Widgets reutilizables.
-   `InkWell`.
-   `VoidCallback`.
-   `void Function(T)`.
-   Paso de obxectos entre widgets.
-   Paso de obxectos entre pantallas.
-   `StatefulWidget`.
-   `State<T>`.
-   `createState()`.
-   Ciclo de vida.
-   `TextEditingController`.
-   `dispose()`.
-   `TextFormField`.
-   `Form`.
-   `GlobalKey<FormState>`.
-   `validator`.
-   `double.parse()`.
-   `double.tryParse()`.
-   Null safety.
-   Tipos nullable (`?`).
-   Acceso condicional (`?.`).
-   `Navigator.push<T>()`.
-   `Navigator.pop(resultado)`.
-   `Future`.
-   `async`.
-   `await`.

------------------------------------------------------------------------

# Sesión 11 - Estado compartido con Provider

## Obxectivo

Introducir a xestión de estado compartido en MARTOLA mediante Provider e
aplicar os conceptos ao módulo de hortas.

Durante esta sesión substituíronse os datos temporais almacenados
directamente nas Views por un estado centralizado nun
`GardensViewModel`.

------------------------------------------------------------------------

## Estado local e estado compartido

Non todo o estado dunha aplicación debe almacenarse no mesmo lugar.

### Estado local

É aquel que só afecta a un widget ou pantalla concreta.

Exemplo:

``` dart
final TextEditingController nameController =
    TextEditingController();
```

O contido dun campo dun formulario é responsabilidade da propia
pantalla.

### Estado compartido

É información que debe ser utilizada ou modificada por diferentes partes
da aplicación.

Exemplo:

``` dart
List<Garden> gardens
```

A colección de hortas é utilizada por diferentes pantallas:

-   `DashboardScreen`
-   `GardensScreen`
-   `GardenDetailsScreen`
-   `CreateGardenScreen`
-   `EditGardenScreen`

Por este motivo non debe pertencer exclusivamente a ningunha delas.

------------------------------------------------------------------------

## GardensViewModel

Creouse:

``` text
lib/
└── viewmodels/
    └── gardens_viewmodel.dart
```

O `GardensViewModel` é responsable de manter e modificar o estado
relacionado coas hortas.

A colección interna mantense privada:

``` dart
final List<Garden> _gardens = [];
```

e exponse mediante un getter:

``` dart
List<Garden> get gardens =>
    List.unmodifiable(_gardens);
```

`List.unmodifiable()` evita que as Views poidan modificar directamente a
colección.

As modificacións deben realizarse mediante métodos do ViewModel.

------------------------------------------------------------------------

## Encapsulación do estado

Evítase:

``` dart
viewModel.gardens.add(garden);
```

e utilízase:

``` dart
viewModel.addGarden(garden);
```

Deste xeito, a responsabilidade de modificar o estado permanece no
ViewModel.

------------------------------------------------------------------------

## ChangeNotifier

`GardensViewModel` estende:

``` dart
ChangeNotifier
```

Isto permite que o ViewModel notifique ás Views cando o estado cambia.

Exemplo:

``` dart
void addGarden(Garden garden) {
    // modificar estado

    notifyListeners();
}
```

O fluxo é:

``` text
modificación do estado
        ↓
notifyListeners()
        ↓
widgets subscritos
        ↓
rebuild
```

------------------------------------------------------------------------

## Provider

Engadiuse o paquete `provider` ao proxecto.

O `GardensViewModel` proporciónase por enriba de `MaterialApp`:

``` text
MartolaApp
└── ChangeNotifierProvider
    └── MaterialApp
        └── resto da aplicación
```

Isto permite compartir unha única instancia de `GardensViewModel` entre
as diferentes pantallas.

------------------------------------------------------------------------

## context.watch

Utilízase cando unha View necesita acceder ao estado e reaccionar aos
seus cambios.

Exemplo:

``` dart
final gardensViewModel =
    context.watch<GardensViewModel>();

final gardens = gardensViewModel.gardens;
```

Aplicado en:

``` text
GardensScreen
```

Cando `GardensViewModel` executa `notifyListeners()`, a pantalla
reconstrúese.

------------------------------------------------------------------------

## context.read

Utilízase cando unha View necesita acceder ao ViewModel para executar
unha acción pero non necesita subscribirse aos seus cambios.

Exemplo:

``` dart
context
    .read<GardensViewModel>()
    .addGarden(garden);
```

Aplicado en:

``` text
CreateGardenScreen
```

------------------------------------------------------------------------

## context.select

Utilízase cando unha View só necesita reaccionar aos cambios dunha parte
concreta do estado.

Exemplo:

``` dart
final gardenCount =
    context.select<GardensViewModel, int>(
        (viewModel) => viewModel.gardens.length,
    );
```

Aplicado no Dashboard para mostrar o número de hortas.

Isto permite evitar reconstrucións innecesarias cando cambia outra
información do ViewModel.

------------------------------------------------------------------------

## Regra práctica

``` text
read
→ acceder ao ViewModel sen escoitar cambios

watch
→ escoitar os cambios do ViewModel

select
→ escoitar un valor concreto do ViewModel
```

------------------------------------------------------------------------

## Provider non é persistencia

Provider permite manter estado compartido mentres a aplicación está en
execución.

Non almacena os datos de forma permanente.

Actualmente:

``` text
GardensViewModel
      ↓
estado en memoria
```

Ao pechar completamente a aplicación, as hortas desaparecen.

A persistencia implementarase posteriormente mediante:

``` text
View
 ↓
ViewModel
 ↓
Repository
 ↓
SQLite
```

------------------------------------------------------------------------

## CRUD en memoria

Durante a sesión implementouse un primeiro CRUD completo sobre as
hortas.

### CREATE

``` dart
addGarden()
```

### READ

``` dart
gardens
```

e:

``` dart
getGardenById()
```

### UPDATE

``` dart
updateGarden()
```

### DELETE

``` dart
removeGarden()
```

Todo o estado está centralizado en:

``` text
GardensViewModel
```

------------------------------------------------------------------------

## Identidade temporal das hortas

Antes de SQLite, as hortas creadas desde o formulario non dispoñían dun
identificador.

Engadiuse temporalmente un contador ao ViewModel:

``` dart
int _nextId = 1;
```

Ao engadir unha horta, o ViewModel crea unha nova instancia cun
identificador:

``` text
Garden sen ID
     ↓
addGarden()
     ↓
asignación de ID temporal
     ↓
Garden almacenado
```

Exemplo:

``` text
1
2
3
...
```

Os IDs almacénanse como `String`.

Este mecanismo é provisional e será substituído pola estratexia de
identificación utilizada pola capa de persistencia.

------------------------------------------------------------------------

## Modelos inmutables

`Garden` utiliza propiedades `final`.

Por este motivo unha edición non modifica directamente a instancia
existente.

Evítase:

``` dart
garden.name = 'Novo nome';
```

En cambio créase unha nova instancia:

``` dart
final updatedGarden = Garden(
    id: widget.garden.id,
    name: nameController.text.trim(),
    location: locationController.text.trim(),
    area: area,
);
```

e o ViewModel substitúe a instancia anterior:

``` dart
_gardens[index] = updatedGarden;
```

------------------------------------------------------------------------

## updateGarden

A actualización localiza primeiro a instancia existente:

``` dart
final index = _gardens.indexOf(oldGarden);
```

Se non existe:

``` dart
if (index == -1) {
    return;
}
```

Se existe, substitúese:

``` dart
_gardens[index] = updatedGarden;
notifyListeners();
```

A nova instancia conserva o mesmo ID.

------------------------------------------------------------------------

## getGardenById

Engadiuse unha operación para recuperar unha horta mediante a súa
identidade:

``` dart
Garden? getGardenById(String id)
```

Pode devolver:

``` text
Garden
```

ou:

``` text
null
```

se non existe ningunha horta co identificador solicitado.

------------------------------------------------------------------------

## GardenDetailsScreen e fonte de verdade

Inicialmente `GardenDetailsScreen` recibía directamente:

``` dart
Garden garden
```

Isto provocaba que, despois dunha edición, a pantalla puidese conservar
unha referencia á instancia antiga.

A solución foi facer que a pantalla traballe coa identidade:

``` dart
String gardenId
```

e obteña a versión actual desde `GardensViewModel`:

``` dart
final garden =
    context.select<GardensViewModel, Garden?>(
        (viewModel) =>
            viewModel.getGardenById(gardenId),
    );
```

Deste xeito o ViewModel actúa como fonte de verdade.

``` text
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

------------------------------------------------------------------------

## Eliminación por identidade

Inicialmente:

``` dart
removeGarden(Garden garden)
```

Posteriormente cambiouse a operación para traballar mediante identidade:

``` dart
removeGarden(String id)
```

O ViewModel localiza internamente a horta mediante:

``` dart
getGardenById(id)
```

Isto evita depender dunha instancia concreta do modelo.

------------------------------------------------------------------------

## initState

Na pantalla de edición utilizouse `initState()` para inicializar os
controladores cos valores actuais da horta.

``` dart
@override
void initState() {
    super.initState();

    nameController = TextEditingController(
        text: widget.garden.name,
    );
}
```

`initState()` execútase unha vez cando se crea o estado do widget.

------------------------------------------------------------------------

## late final

Os controladores de `EditGardenScreen` decláranse mediante:

``` dart
late final TextEditingController nameController;
```

Isto permite declaralos antes de coñecer o valor inicial e inicializalos
posteriormente en `initState()`.

`final` garante que a referencia ao controlador non será substituída
despois da inicialización.

------------------------------------------------------------------------

## widget dentro dun State

Dentro dunha clase:

``` dart
State<EditGardenScreen>
```

pódese acceder á configuración do `StatefulWidget` asociado mediante:

``` dart
widget
```

Por exemplo:

``` dart
widget.garden.name
```

------------------------------------------------------------------------

## Conceptos principais aprendidos

-   Estado local.
-   Estado compartido.
-   Encapsulación do estado.
-   ViewModel como fonte de verdade.
-   Provider.
-   `ChangeNotifier`.
-   `notifyListeners()`.
-   `ChangeNotifierProvider`.
-   `context.read`.
-   `context.watch`.
-   `context.select`.
-   Modelos inmutables.
-   Identidade de entidades.
-   `Garden?` e tratamento de ausencia de datos.
-   `initState()`.
-   `late final`.
-   Acceso mediante `widget` desde un `State`.
-   CRUD en memoria.
-   Diferencia entre estado e persistencia.

------------------------------------------------------------------------

## Estado ao finalizar a sesión

O módulo de hortas permite actualmente:

``` text
Crear horta
    ↓
Listar hortas
    ↓
Consultar detalle
    ↓
Editar horta
    ↓
Eliminar horta
```

Os cambios sincronízanse entre:

-   `DashboardScreen`
-   `GardensScreen`
-   `GardenDetailsScreen`
-   `CreateGardenScreen`
-   `EditGardenScreen`

mediante `GardensViewModel` e Provider.

Os datos aínda se almacenan exclusivamente en memoria.

------------------------------------------------------------------------

------------------------------------------------------------------------

# Sesión 13 - Asincronía e preparación da persistencia SQLite

## Programación asíncrona

Unha operación asíncrona é unha operación cuxo resultado pode non estar
dispoñible inmediatamente.

Isto é especialmente importante cando traballamos con:

-   Bases de datos.
-   Ficheiros.
-   APIs.
-   Rede.
-   Navegación que devolve resultados.

A aplicación non debería bloquear a interface mentres espera a que estas
operacións rematen.

------------------------------------------------------------------------

## Future

`Future<T>` representa un valor de tipo `T` que estará dispoñible no
futuro.

Por exemplo:

    Future<Garden> addGarden(Garden garden)

significa:

> O método devolverá un `Garden`, pero ese resultado pode non estar
> dispoñible inmediatamente.

Outro exemplo:

    Future<Garden?> getGardenById(String id)

significa que no futuro obteremos:

    Garden

ou:

    null

A diferenza entre:

    Garden

e:

    Future<Garden>

é conceptual:

    Garden
       ↓
    resultado dispoñible agora

    Future<Garden>
       ↓
    resultado que estará dispoñible máis adiante

------------------------------------------------------------------------

## async

A palabra clave:

    async

indica que unha función é asíncrona e permite utilizar `await` no seu
interior.

Exemplo:

    Future<void> loadGardens() async {
      // operacións asíncronas
    }

Un método `async` devolve un `Future`.

Por exemplo:

    Future<void>

representa unha operación asíncrona que non necesita devolver un valor
útil cando remata.

------------------------------------------------------------------------

## await

`await` permite esperar dentro dunha función asíncrona a que un `Future`
se complete.

Exemplo:

    final gardens =
        await repository.getGardens();

Conceptualmente:

    repository.getGardens()
            ↓
        Future pendente
            ↓
           await
            ↓
    Future completado
            ↓
       List<Garden>

O código situado despois do `await` dentro desa función non continúa ata
que esa operación remata.

Isto non significa que toda a aplicación quede bloqueada.

------------------------------------------------------------------------

## Relación entre Future, async e await

Os tres conceptos están relacionados:

    Future
       ↓
    representa un resultado futuro

    async
       ↓
    permite escribir unha función asíncrona

    await
       ↓
    permite esperar polo resultado dun Future

Exemplo:

    Future<void> loadGardens() async {
      final gardens =
          await repository.getGardens();

      _gardens.clear();
      _gardens.addAll(gardens);

      notifyListeners();
    }

------------------------------------------------------------------------

## Por que o Repository debe ser asíncrono

Un Repository en memoria pode responder practicamente de maneira
inmediata.

SQLite, pola contra, realiza operacións de entrada e saída que deben
tratarse de maneira asíncrona.

Se o contrato fose síncrono:

    Garden addGarden(Garden garden);

sería máis difícil substituír posteriormente a implementación en memoria
por SQLite.

Por este motivo o contrato evolucionou a:

    Future<Garden> addGarden(Garden garden);

O mesmo principio aplícase ao resto das operacións.

A interface do Repository queda preparada para fontes de datos
asíncronas independentemente da implementación concreta.

------------------------------------------------------------------------

## Contrato asíncrono do Repository

A abstracción utilizada no módulo de hortas pasa a seguir esta
estrutura:

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

Isto permite ter diferentes implementacións:

    GardenRepository
          ↑
          │
    ┌─────┴──────────────┐
    │                    │
    MemoryGardenRepository
                         │
                 SQLiteGardenRepository
                       (futuro)

As Views e o ViewModel dependen do contrato, non da tecnoloxía concreta
utilizada para almacenar os datos.

------------------------------------------------------------------------

## MemoryGardenRepository asíncrono

`MemoryGardenRepository` continúa almacenando os datos nunha colección
en memoria.

Porén, implementa o mesmo contrato asíncrono que utilizará
posteriormente SQLite.

Exemplo:

    Future<Garden> addGarden(
      Garden garden,
    ) async {
      // gardado en memoria

      return newGarden;
    }

A operación realmente non necesita esperar por unha base de datos neste
momento.

A vantaxe é arquitectónica:

> Podemos desenvolver e probar o fluxo asíncrono antes de introducir a
> persistencia real.

------------------------------------------------------------------------

## Estado do ViewModel e fonte de datos

Ao introducir asincronía aparece unha distinción importante.

O Repository representa o acceso á fonte de datos:

    Repository
        ↓
    memoria / SQLite

O ViewModel mantén o estado que necesita a interface:

    final List<Garden> _gardens = [];

A interface pode consultar:

    List<Garden> get gardens =>
        List.unmodifiable(_gardens);

sen ter que esperar continuamente por unha operación asíncrona.

Fluxo:

    Fonte de datos
          ↓
    GardenRepository
          ↓
        await
          ↓
    GardensViewModel
          ↓
       _gardens
          ↓
        Views

------------------------------------------------------------------------

## loadGardens()

Creouse unha operación específica para cargar as hortas desde o
Repository:

    Future<void> loadGardens() async {
      final gardens =
          await repository.getGardens();

      _gardens.clear();
      _gardens.addAll(gardens);

      notifyListeners();
    }

Responsabilidade:

> Recuperar o estado inicial desde a fonte de datos e trasladalo ao
> estado observable do ViewModel.

Primeiro:

    await repository.getGardens()

obtén os datos.

Despois:

    _gardens.clear();
    _gardens.addAll(gardens);

actualiza o estado local.

Finalmente:

    notifyListeners();

informa ás Views.

------------------------------------------------------------------------

## Por que facer clear() antes de addAll()

Se `loadGardens()` se executase máis dunha vez e só utilizásemos:

    _gardens.addAll(gardens);

poderiamos duplicar elementos xa cargados.

Por iso utilizamos:

    _gardens.clear();
    _gardens.addAll(gardens);

Conceptualmente:

    estado anterior
         ↓
       clear()
         ↓
      lista baleira
         ↓
       addAll()
         ↓
    estado recuperado

------------------------------------------------------------------------

## Actualización eficiente do estado

Despois dunha operación como:

    final newGarden =
        await repository.addGarden(garden);

non é necesario volver cargar inmediatamente toda a colección desde o
Repository.

Podemos utilizar directamente o resultado:

    _gardens.add(newGarden);

e despois:

    notifyListeners();

Fluxo:

    View
      ↓
    ViewModel
      ↓
    Repository
      ↓
    gardar
      ↓
    Garden gardado
      ↓
    ViewModel
      ↓
    actualizar _gardens
      ↓
    notifyListeners()
      ↓
    View

Isto evita unha segunda consulta innecesaria á fonte de datos.

------------------------------------------------------------------------

## context.mounted

Despois dun `await` pode pasar tempo antes de que a función continúe.

Durante ese intervalo, o widget podería desaparecer da árbore.

Por exemplo:

    await context
        .read<GardensViewModel>()
        .addGarden(garden);

Antes de volver utilizar `context` comprobamos:

    if (!context.mounted) {
      return;
    }

E só despois:

    Navigator.of(context).pop();

Regra:

> Se utilizamos `BuildContext` despois dun `await`, debemos comprobar
> que o contexto continúa montado cando exista a posibilidade de que o
> widget xa non forme parte da árbore.

------------------------------------------------------------------------

## Operador de cascada

Introduciuse o operador:

    ..

Este operador permite executar operacións sobre un obxecto mantendo como
resultado a referencia ao propio obxecto.

Aplicado á creación do ViewModel:

    GardensViewModel(
      repository: MemoryGardenRepository(),
    )..loadGardens()

Conceptualmente:

    crear GardensViewModel
             ↓
       executar loadGardens()
             ↓
    conservar GardensViewModel

Isto permite inicializar o ViewModel e iniciar a súa carga inicial nunha
mesma expresión.

------------------------------------------------------------------------

## Separación entre Repository e DatabaseService

O Repository e `DatabaseService` teñen responsabilidades diferentes.

### DatabaseService

Responsable da infraestrutura da base de datos:

-   Determinar onde se almacena o ficheiro.
-   Abrir a base de datos.
-   Manter a conexión.
-   Crear as táboas.
-   Xestionar versións.
-   Preparar futuras migracións.

### Repository

Responsable das operacións relacionadas cun tipo de datos concreto.

Por exemplo:

    SQLiteGardenRepository

será responsable de operacións como:

    getGardens()
    addGarden()
    updateGarden()
    removeGarden()

pero utilizará `DatabaseService` para acceder á base de datos.

Fluxo previsto:

    View
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

------------------------------------------------------------------------

## Por que separar DatabaseService do Repository

Se cada Repository fose responsable de abrir e configurar a súa propia
base de datos:

    GardenRepository
         ↓
    abre SQLite

    PlantRepository
         ↓
    abre SQLite

    WeatherRepository
         ↓
    abre SQLite

duplicariamos responsabilidades.

Co servizo compartido:

    GardenRepository ───┐
                       │
    PlantRepository ────┼──→ DatabaseService → SQLite
                       │
    WeatherRepository ──┘

a infraestrutura da base de datos queda centralizada.

------------------------------------------------------------------------

## SQLite multiplataforma

MARTOLA pretende funcionar tanto en Android como en escritorio.

Por este motivo preparouse unha solución SQLite que poida adaptarse á
plataforma.

Dependencias introducidas:

    sqflite
    sqflite_common_ffi
    path
    path_provider

Responsabilidades xerais:

### sqflite

Permite traballar con SQLite nas plataformas soportadas polo paquete.

### sqflite_common_ffi

Permite utilizar SQLite mediante FFI nas plataformas de escritorio
previstas.

### path_provider

Permite obter directorios apropiados proporcionados polo sistema
operativo.

### path

Permite construír rutas de ficheiros de forma independente da
plataforma.

------------------------------------------------------------------------

## DatabaseFactory

A factoría determina como se crea e utiliza a conexión SQLite.

Conceptualmente:

    DatabaseFactory
          ↓
    sabe como abrir
    unha base SQLite

Segundo a plataforma, `DatabaseService` pode seleccionar a factoría
apropiada.

Isto evita que o resto da aplicación necesite coñecer as diferenzas
entre Android e escritorio.

------------------------------------------------------------------------

## Platform

`Platform` permite consultar información sobre o sistema operativo no
que se está executando a aplicación.

Isto permite tomar decisións como:

    Windows / Linux
          ↓
    SQLite mediante FFI

    outras plataformas soportadas
          ↓
    factoría SQLite correspondente

A responsabilidade de tomar esta decisión pertence á infraestrutura, non
ás Views nin ao ViewModel.

------------------------------------------------------------------------

## Ruta da base de datos

Un ficheiro SQLite necesita unha localización no sistema de ficheiros.

`path_provider` permite obter un directorio apropiado:

    final directory =
        await getApplicationDocumentsDirectory();

O obxecto devolto representa un directorio.

A súa ruta pode obterse mediante:

    directory.path

Posteriormente debe engadirse o nome da base de datos:

    martola.db

------------------------------------------------------------------------

## join()

Non é recomendable construír unha ruta concatenando manualmente Strings.

Evítase:

    '${directory.path}/martola.db'

porque os sistemas operativos poden utilizar diferentes convencións para
as rutas.

Utilízase:

    join(
      directory.path,
      'martola.db',
    )

`join()` constrúe correctamente a ruta segundo a plataforma.

Conceptualmente:

    directorio da aplicación
             +
         martola.db
             ↓
    ruta completa da base de datos

------------------------------------------------------------------------

## Apertura da base de datos

Completouse a implementación de `DatabaseService` para abrir a base de
datos SQLite.

O getter:

    Future<Database> get database async {
      _database ??= await _openDatabase();

      return _database!;
    }

mantén unha única referencia á base de datos.

O operador:

    ??=

asigna un valor unicamente se a variable situada á esquerda é `null`.

Conceptualmente:

    _database
        ↓
    é null?
     ┌──┴──┐
     si    non
     ↓      ↓
    abrir   reutilizar
    BD      BD existente
     └──┬───┘
        ↓
    return _database!

Deste xeito, a base de datos ábrese cando se necesita por primeira vez e
posteriormente reutilízase a instancia existente.

O operador:

    !

indica a Dart que nese punto sabemos que `_database` xa non é `null`.

------------------------------------------------------------------------

## Creación da táboa `gardens`

A base de datos configurouse inicialmente coa táboa:

    gardens

O identificador utiliza:

    id INTEGER PRIMARY KEY AUTOINCREMENT

Responsabilidades:

-   `INTEGER`: almacena un número enteiro.
-   `PRIMARY KEY`: identifica de forma única cada fila.
-   `AUTOINCREMENT`: permite que SQLite xere automaticamente novos
    identificadores.

A primeira versión do esquema utilizada actualmente é:

    CREATE TABLE gardens (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      location TEXT NOT NULL,
      area REAL NOT NULL
    )

A creación da táboa confirmou que a infraestrutura SQLite estaba
funcionando.

Ao consultar as táboas existentes obtivéronse:

    gardens
    sqlite_sequence

`sqlite_sequence` é unha táboa interna utilizada por SQLite para manter
información relacionada cos valores xerados mediante `AUTOINCREMENT`.

------------------------------------------------------------------------

## Localización física da base de datos

Durante as probas en Windows comprobouse a ruta real utilizada pola
aplicación:

    C:\Users\briga\OneDrive\Documentos\martola.db

Isto confirmou o seguinte fluxo:

    getApplicationDocumentsDirectory()
            ↓
    directorio proporcionado polo sistema
            ↓
    join(..., 'martola.db')
            ↓
    ruta completa
            ↓
    ficheiro SQLite

A localización concreta depende do sistema operativo no que se execute
MARTOLA.

------------------------------------------------------------------------

## Conversión entre `Garden` e SQLite

SQLite non traballa directamente con obxectos `Garden`.

As filas recupéranse mediante estruturas do tipo:

    Map<String, Object?>

Por este motivo engadíronse ao modelo `Garden` mecanismos de conversión
entre o modelo de dominio e a representación utilizada para a
persistencia.

### Garden.fromMap()

Responsabilidade:

Construír unha instancia de `Garden` a partir dos datos dunha fila
recuperada da base de datos.

    factory Garden.fromMap(Map<String, Object?> map) {
      return Garden(
        id: map['id'].toString(),
        name: map['name'] as String,
        location: map['location'] as String,
        area: (map['area'] as num).toDouble(),
      );
    }

Fluxo:

    Map<String, Object?>
            ↓
    Garden.fromMap()
            ↓
    Garden

Para `area` utilízase:

    (map['area'] as num).toDouble()

para garantir que o modelo reciba un `double`, independentemente da
representación numérica recuperada.

### toMap()

Responsabilidade:

Transformar os datos dun `Garden` nun mapa que poida utilizarse nas
operacións de persistencia.

    Map<String, Object?> toMap() {
      return {
        'name': name,
        'location': location,
        'area': area,
      };
    }

O `id` non se inclúe neste mapa.

Ao crear unha horta nova, SQLite debe xerar o identificador mediante
`AUTOINCREMENT`.

Ao actualizar unha horta, o identificador utilízase para localizar a
fila mediante `WHERE`, pero non debe modificarse.

------------------------------------------------------------------------

## SQLiteGardenRepository

Creouse unha implementación real do contrato:

    GardenRepository

denominada:

    SQLiteGardenRepository

A súa responsabilidade é realizar as operacións de persistencia das
hortas utilizando SQLite.

Recibe `DatabaseService` mediante o construtor:

    SQLiteGardenRepository({
      required this.databaseService,
    });

Isto mantén separadas as responsabilidades:

    SQLiteGardenRepository
            ↓
    operacións sobre Garden

    DatabaseService
            ↓
    infraestrutura SQLite

------------------------------------------------------------------------

## Lectura de todas as hortas

`getGardens()` consulta a táboa mediante:

    final maps = await db.query('gardens');

SQLite devolve:

    List<Map<String, Object?>>

pero o Repository debe devolver:

    List<Garden>

A transformación realízase mediante:

    final gardens =
        maps.map((map) => Garden.fromMap(map)).toList();

`map()` transforma cada elemento da colección.

Neste caso:

    Map<String, Object?>
            ↓
    Garden

O resultado de `map()` é un:

    Iterable<Garden>

Mediante:

    toList()

convértese finalmente en:

    List<Garden>

------------------------------------------------------------------------

## Inserción dunha horta

Para gardar unha nova horta utilízase:

    db.insert()

O `Garden` convértese previamente mediante:

    garden.toMap()

Fluxo:

    Garden sen id
         ↓
    toMap()
         ↓
    Map<String, Object?>
         ↓
    db.insert()
         ↓
    SQLite
         ↓
    id xerado

`insert()` devolve o identificador xerado por SQLite como `int`.

Como o modelo `Garden` utiliza actualmente:

    String? id

o identificador convértese mediante:

    id.toString()

Finalmente o Repository devolve unha nova instancia de `Garden` cos
mesmos datos e co identificador asignado por SQLite.

------------------------------------------------------------------------

## Consulta dunha horta por identificador

Para localizar unha horta concreta utilízase:

    where: 'id = ?',
    whereArgs: [id],

Conceptualmente equivale a:

    WHERE id = ?

`where` define a condición.

`whereArgs` proporciona os valores utilizados nos marcadores `?`.

Esta aproximación permite separar a consulta SQL dos valores utilizados
nela e evita construír condicións concatenando Strings manualmente.

Se a consulta non devolve filas:

    maps.isEmpty

`getGardenById()` devolve:

    null

Se existe unha fila:

    Garden.fromMap(maps.first)

convértea nun obxecto do dominio.

------------------------------------------------------------------------

## Actualización dunha horta

Para modificar unha horta utilízase:

    db.update()

Os novos datos proceden de:

    updatedGarden.toMap()

e a fila localízase mediante:

    where: 'id = ?',
    whereArgs: [gardenId],

`update()` devolve o número de filas afectadas.

    0 filas
       ↓
    null

    1 fila
       ↓
    Garden actualizado

O Repository devolve unha nova instancia de `Garden` cos datos
actualizados conservando o identificador orixinal.

------------------------------------------------------------------------

## Eliminación dunha horta

Para eliminar unha horta utilízase:

    db.delete()

A fila localízase mediante:

    where: 'id = ?',
    whereArgs: [id],

`delete()` devolve o número de filas eliminadas.

Isto permite implementar:

    return affectedRows > 0;

Conceptualmente:

    0 filas eliminadas
            ↓
          false

    1 ou máis filas eliminadas
            ↓
           true

------------------------------------------------------------------------

## CRUD SQLite completo

`SQLiteGardenRepository` implementa actualmente:

    CREATE
      ↓
    addGarden()
      ↓
    INSERT

    READ
      ↓
    getGardens()
    getGardenById()
      ↓
    SELECT

    UPDATE
      ↓
    updateGarden()
      ↓
    UPDATE

    DELETE
      ↓
    removeGarden()
      ↓
    DELETE

Deste xeito o módulo de hortas xa dispón dun CRUD persistente completo.

------------------------------------------------------------------------

## Substitución da implementación do Repository

Ata este punto utilizábase:

    MemoryGardenRepository

como implementación de:

    GardenRepository

En `main.dart` substituíuse pola implementación:

    SQLiteGardenRepository

As dependencias créanse no punto de composición da aplicación:

    main()
       ↓
    DatabaseService
       ↓
    SQLiteGardenRepository
       ↓
    GardensViewModel
       ↓
    Provider
       ↓
    Views

`GardensViewModel` continúa dependendo de:

    GardenRepository

e non necesita coñecer a implementación concreta.

Como consecuencia, a substitución:

    MemoryGardenRepository
            ↓
    SQLiteGardenRepository

non requiriu modificar:

-   `GardensViewModel`.
-   `GardensScreen`.
-   `GardenDetailsScreen`.
-   `CreateGardenScreen`.
-   `EditGardenScreen`.

Isto comproba na práctica a utilidade do desacoplamento mediante o
Repository Pattern.

------------------------------------------------------------------------

## Persistencia comprobada

Realizáronse probas manuais do CRUD completo utilizando SQLite.

Comprobouse:

    CREATE → persiste despois de reiniciar
    READ   → recupera os datos gardados
    UPDATE → os cambios persisten
    DELETE → a eliminación persiste

Polo tanto, os datos das hortas xa non dependen exclusivamente da
memoria durante a execución da aplicación.

O fluxo actual é:

    View
      ↓
    GardensViewModel
      ↓
    GardenRepository
      ↑
    SQLiteGardenRepository
      ↓
    DatabaseService
      ↓
    martola.db

------------------------------------------------------------------------

## Versionado e migracións SQLite

Unha base de datos instalada pode conter datos que deben conservarse
cando a aplicación evoluciona.

Modificar un `CREATE TABLE` dentro de `onCreate` non modifica unha base
de datos que xa existe.

`onCreate` execútase cando a base de datos se crea por primeira vez.

Conceptualmente:

    base de datos non existe
              ↓
          onCreate()
              ↓
      creación do esquema

Cando unha nova versión da aplicación necesita modificar o esquema dunha
base de datos existente, increméntase a versión da base de datos.

Por exemplo:

    version: 1

podería evolucionar no futuro a:

    version: 2

SQLite pode entón executar:

    onUpgrade

para transformar o esquema existente.

Conceptualmente:

    Base de datos v1
           ↓
    aplicación solicita v2
           ↓
       onUpgrade()
           ↓
       migración
           ↓
    Base de datos v2

`onUpgrade` recibe:

    oldVersion
    newVersion

Isto permite determinar que cambios necesita unha base de datos
concreta.

Un patrón posible para migracións sucesivas é:

    if (oldVersion < 2) {
      // cambios introducidos na versión 2
    }

    if (oldVersion < 3) {
      // cambios introducidos na versión 3
    }

    if (oldVersion < 4) {
      // cambios introducidos na versión 4
    }

Deste xeito unha base de datos antiga pode aplicar todos os cambios
necesarios.

Por exemplo, se:

    oldVersion = 2
    newVersion = 4

executaríanse:

    oldVersion < 3
    oldVersion < 4

pero non:

    oldVersion < 2

O obxectivo final é que a base de datos alcance o esquema correspondente
á versión máis recente conservando os datos existentes.

A versión da base de datos non ten que coincidir coa versión da
aplicación.

Por exemplo:

    MARTOLA 0.1 → Database v1
    MARTOLA 0.2 → Database v1
    MARTOLA 0.3 → Database v1
    MARTOLA 0.4 → Database v2

A versión da base de datos só debe incrementarse cando cambia o esquema
que necesita ser migrado.

Actualmente MARTOLA continúa utilizando:

    version: 1

porque aínda non se realizou ningún cambio no esquema inicial.

Por este motivo non se engadiu aínda un `onUpgrade` real. Introducirase
cando exista unha migración necesaria.

------------------------------------------------------------------------

## Estado final da sesión 13

A sesión 13 queda completada.

Durante esta sesión realizouse a transición desde unha fonte de datos
temporal en memoria cara á primeira persistencia SQLite real de MARTOLA.

Completouse:

-   Conversión do contrato `GardenRepository` a operacións asíncronas.
-   Adaptación de `MemoryGardenRepository`.
-   Adaptación de `GardensViewModel`.
-   Uso de `Future`, `async` e `await`.
-   Carga inicial mediante `loadGardens()`.
-   Adaptación das Views ás operacións asíncronas.
-   Creación de `DatabaseService`.
-   Configuración multiplataforma de SQLite.
-   Apertura real de `martola.db`.
-   Creación do esquema SQLite inicial.
-   Creación da táboa `gardens`.
-   Conversión `Garden ↔ Map<String, Object?>`.
-   Implementación de `SQLiteGardenRepository`.
-   Implementación do CRUD SQLite completo.
-   Substitución de `MemoryGardenRepository` por
    `SQLiteGardenRepository` como implementación utilizada pola
    aplicación.
-   Verificación do CRUD completo.
-   Verificación da persistencia entre reinicios.
-   Introdución ao versionado da base de datos.
-   Comprensión da diferenza entre `onCreate` e `onUpgrade`.
-   Introdución ao concepto de migración.
-   Comprensión das migracións acumulativas.
-   Revisión e limpeza final de `DatabaseService`.

A base de datos permanece actualmente na:

    version: 1

Non se implementou unha migración real porque o esquema actual aínda non
necesita evolucionar.

`onUpgrade` introducirase cando exista un cambio real de esquema que
requira unha nova versión da base de datos.

A infraestrutura actual queda preparada conceptualmente para esa
evolución.

------------------------------------------------------------------------

## Conceptos clave da sesión

-   Programación asíncrona.
-   `Future<T>`.
-   `Future<void>`.
-   `async`.
-   `await`.
-   Repository asíncrono.
-   Estado local do ViewModel.
-   Fonte de datos.
-   `loadGardens()`.
-   `List.clear()`.
-   `List.addAll()`.
-   `context.mounted`.
-   Operador de cascada `..`.
-   `DatabaseService`.
-   Separación entre infraestrutura e acceso aos datos.
-   SQLite.
-   SQLite multiplataforma.
-   `DatabaseFactory`.
-   `Platform`.
-   `path_provider`.
-   `getApplicationDocumentsDirectory()`.
-   `path`.
-   `join()`.
-   Getter asíncrono de `Database`.
-   Operador `??=`.
-   Operador de aserción non nula `!`.
-   `INTEGER PRIMARY KEY AUTOINCREMENT`.
-   `sqlite_sequence`.
-   `Map<String, Object?>`.
-   `factory constructor`.
-   `Garden.fromMap()`.
-   `Garden.toMap()`.
-   `Iterable<T>`.
-   `map()`.
-   `toList()`.
-   `db.query()`.
-   `db.insert()`.
-   `db.update()`.
-   `db.delete()`.
-   `where`.
-   `whereArgs`.
-   Filas afectadas.
-   `SQLiteGardenRepository`.
-   CRUD persistente.
-   Inxección de dependencias desde `main()`.
-   Persistencia entre reinicios.
-   Versión do esquema dunha base de datos.
-   `version` en `OpenDatabaseOptions`.
-   `onCreate`.
-   `onUpgrade`.
-   `oldVersion`.
-   `newVersion`.
-   Migración dunha base de datos.
-   Migracións acumulativas.
-   Evolución do esquema conservando datos.
-   Diferenza entre versión da aplicación e versión da base de datos.

------------------------------------------------------------------------

## Regra principal da sesión

A interface non debe depender de como ou onde se almacenan os datos.

A separación:

    View
      ↓
    ViewModel
      ↓
    Repository
      ↓
    DatabaseService
      ↓
    SQLite

permite cambiar a implementación da persistencia mantendo desacopladas
as capas superiores da aplicación.

------------------------------------------------------------------------

------------------------------------------------------------------------

# Sesión 14 - Relacións, claves foráneas e primeira migración SQLite

## Obxectivo

Ampliar o modelo de datos de MARTOLA para introducir as primeiras
entidades relacionadas coas plantas e aplicar na práctica o sistema de
versionado e migracións SQLite estudado na sesión anterior.

Durante esta sesión:

-   Creáronse os modelos `GardenPlant` e `PlantSpecies`.
-   Definíronse as relacións entre hortas, plantas e especies.
-   Ampliouse o esquema SQLite.
-   Introducíronse claves foráneas.
-   Implementouse a primeira migración real da base de datos.
-   Comprobouse a integridade referencial.
-   Definíronse os contratos Repository para plantas e especies.

------------------------------------------------------------------------

## Separación entre planta e especie

Unha especie vexetal e unha planta concreta representan conceptos
diferentes.

Por exemplo:

    PlantSpecies
        ↓
    Tomate
    Solanum lycopersicum

representa información común á especie.

En cambio:

    GardenPlant
        ↓
    Tomateira concreta
    pertencente a unha horta

representa unha planta individual.

Varias plantas poden pertencer á mesma especie:

    PlantSpecies
         1
         │
         │
         N
    GardenPlant

Isto evita repetir en cada planta toda a información común da especie.

------------------------------------------------------------------------

## Modelo `GardenPlant`

Creouse o modelo:

    GardenPlant

cunha primeira implementación formada por:

    id
    gardenId
    speciesId
    customName
    plantingDate

O modelo mantén referencias tanto á horta como á especie:

    GardenPlant
       │
       ├── gardenId
       │      ↓
       │    Garden
       │
       └── speciesId
              ↓
         PlantSpecies

`id` é nullable porque unha planta pode existir no dominio antes de ser
persistida.

------------------------------------------------------------------------

## Modelo `PlantSpecies`

Creouse:

    PlantSpecies

cunha primeira implementación mínima:

    id
    commonName
    scientificName

A responsabilidade deste modelo é representar a información compartida
dunha especie vexetal.

A primeira versión é deliberadamente pequena e poderá ampliarse
posteriormente con información como:

-   Tipo de planta.
-   Necesidades de rega.
-   Exposición solar.
-   Tipo de solo.
-   Temperaturas recomendadas.
-   Notas.

------------------------------------------------------------------------

## Relación entre Garden e GardenPlant

Unha horta pode conter múltiples plantas:

    Garden
      1
      │
      │
      N
    GardenPlant

Cada `GardenPlant`, pola contra, pertence a unha única horta.

Por este motivo `GardenPlant` almacena:

    gardenId

en lugar de introducir unha colección de plantas directamente dentro de
`Garden`.

Isto mantén os modelos separados e evita cargar información innecesaria
dentro dunha horta.

------------------------------------------------------------------------

## Identificadores no dominio e en SQLite

Os modelos continúan utilizando:

    String?

ou:

    String

para os identificadores.

SQLite utiliza:

    INTEGER

para as claves primarias e foráneas.

Esta diferenza non obriga a modificar os tipos utilizados polo dominio.

A conversión pode realizarse na fronteira coa persistencia.

Por exemplo, en `GardenPlant.toMap()`:

    'garden_id': int.parse(gardenId),
    'species_id': int.parse(speciesId),

e ao recuperar os datos:

    gardenId: map['garden_id'].toString(),
    speciesId: map['species_id'].toString(),

Conceptualmente:

    Dominio
    String
      ↓
    toMap()
      ↓
    int.parse()
      ↓
    SQLite INTEGER

e:

    SQLite INTEGER
      ↓
    fromMap()
      ↓
    toString()
      ↓
    Dominio String

Isto permite manter o dominio menos acoplado á tecnoloxía concreta de
persistencia.

------------------------------------------------------------------------

## Conversión de DateTime

`GardenPlant` utiliza:

    DateTime plantingDate

SQLite non dispón dun tipo `DateTime` equivalente ao utilizado por Dart.

A data almacénase como texto utilizando:

    plantingDate.toIso8601String()

Fluxo:

    DateTime
       ↓
    toIso8601String()
       ↓
    TEXT en SQLite

Ao recuperar a planta:

    DateTime.parse(
      map['planting_date'] as String,
    )

Fluxo inverso:

    TEXT
       ↓
    DateTime.parse()
       ↓
    DateTime

------------------------------------------------------------------------

## GardenPlant.toMap()

A conversión utilizada é:

    Map<String, Object?> toMap() {
      return {
        'garden_id': int.parse(gardenId),
        'species_id': int.parse(speciesId),
        'custom_name': customName,
        'planting_date': plantingDate.toIso8601String(),
      };
    }

O `id` non se inclúe porque SQLite será responsable de xeralo mediante
`AUTOINCREMENT`.

------------------------------------------------------------------------

## GardenPlant.fromMap()

A conversión inversa permite transformar unha fila SQLite nun obxecto do
dominio:

    factory GardenPlant.fromMap(
      Map<String, Object?> map,
    ) {
      return GardenPlant(
        id: map['id'].toString(),
        gardenId: map['garden_id'].toString(),
        speciesId: map['species_id'].toString(),
        customName: map['custom_name'] as String,
        plantingDate: DateTime.parse(
          map['planting_date'] as String,
        ),
      );
    }

Deste xeito o resto da aplicación traballa con `GardenPlant` e non
directamente con mapas SQLite.

------------------------------------------------------------------------

## PlantSpecies e SQLite

`PlantSpecies` utiliza o mesmo patrón:

    PlantSpecies
         ↓
       toMap()
         ↓
    Map<String, Object?>
         ↓
       SQLite

e:

    SQLite
       ↓
    Map<String, Object?>
       ↓
    fromMap()
       ↓
    PlantSpecies

Isto mantén a conversión entre dominio e persistencia encapsulada no
modelo.

------------------------------------------------------------------------

## Táboa `plant_species`

A versión 2 incorpora:

    CREATE TABLE plant_species (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      common_name TEXT NOT NULL,
      scientific_name TEXT NOT NULL
    )

Esta táboa representa o catálogo de especies.

Unha mesma fila de `plant_species` pode ser referenciada por múltiples
plantas.

------------------------------------------------------------------------

## Táboa `garden_plants`

Tamén se incorpora:

    CREATE TABLE garden_plants (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      garden_id INTEGER NOT NULL,
      species_id INTEGER NOT NULL,
      custom_name TEXT NOT NULL,
      planting_date TEXT NOT NULL,

      FOREIGN KEY (garden_id)
        REFERENCES gardens(id)
        ON DELETE CASCADE,

      FOREIGN KEY (species_id)
        REFERENCES plant_species(id)
        ON DELETE RESTRICT
    )

Esta é a primeira táboa de MARTOLA que introduce relacións mediante
claves foráneas.

------------------------------------------------------------------------

## Clave foránea

Unha clave foránea permite establecer unha relación entre filas de
diferentes táboas.

Por exemplo:

    garden_plants.garden_id
             ↓
         gardens.id

garante que o identificador da horta almacenado nunha planta corresponda
cunha horta existente.

Do mesmo xeito:

    garden_plants.species_id
             ↓
       plant_species.id

relaciona unha planta concreta coa súa especie.

------------------------------------------------------------------------

## Integridade referencial

A integridade referencial busca evitar relacións inconsistentes entre os
datos.

Por exemplo, non debería existir:

    GardenPlant
        ↓
    garden_id = 25

se non existe:

    Garden
        ↓
    id = 25

As claves foráneas permiten que SQLite axude a garantir estas regras.

------------------------------------------------------------------------

## Activación das foreign keys en SQLite

En SQLite a comprobación de claves foráneas debe activarse
explicitamente para a conexión.

Configurouse en `DatabaseService`:

    onConfigure: (db) async {
      await db.execute(
        'PRAGMA foreign_keys = ON',
      );
    }

`onConfigure` execútase ao configurar a conexión coa base de datos.

A activación foi comprobada mediante:

    PRAGMA foreign_keys

obtendo:

    foreign_keys: 1

Isto confirma que as restricións están activas.

------------------------------------------------------------------------

## ON DELETE CASCADE

A relación entre `Garden` e `GardenPlant` utiliza:

    ON DELETE CASCADE

Conceptualmente:

    eliminar Garden
          ↓
    existen GardenPlant asociadas
          ↓
    SQLite elimínaas automaticamente

Isto ten sentido porque unha planta rexistrada dentro dunha horta non
debe quedar almacenada sen a horta á que pertence.

Realizouse unha proba transaccional:

    Plantas antes de eliminar a horta: 1
    Plantas despois de eliminar a horta: 0

Polo tanto comprobouse que `CASCADE` funciona correctamente.

------------------------------------------------------------------------

## ON DELETE RESTRICT

A relación entre `PlantSpecies` e `GardenPlant` utiliza:

    ON DELETE RESTRICT

Conceptualmente:

    intentar eliminar PlantSpecies
              ↓
    existen GardenPlant que a utilizan
              ↓
    SQLite bloquea a eliminación

A especie representa información compartida e non debe desaparecer
mentres existan plantas que dependan dela.

A proba realizada confirmou:

    SQLite impediu eliminar a especie en uso
    A especie segue existindo

Polo tanto `RESTRICT` funciona correctamente.

------------------------------------------------------------------------

## Probas mediante transacción e rollback

As probas de integridade referencial realizáronse dentro dunha
transacción.

Creáronse datos temporais:

    especie de proba
          ↓
    horta de proba
          ↓
    planta de proba

e posteriormente comprobáronse as restricións.

Ao final provocouse un rollback intencionado.

Conceptualmente:

    BEGIN TRANSACTION
          ↓
    crear datos temporais
          ↓
    realizar proba
          ↓
       excepción
          ↓
       ROLLBACK
          ↓
    estado anterior restaurado

Isto permitiu probar o comportamento real de SQLite sen deixar datos de
proba permanentes.

------------------------------------------------------------------------

## Orde de creación das táboas

As táboas independentes deben existir antes de crear unha táboa que as
referencie mediante claves foráneas.

Na versión actual:

    gardens
       │
       ├──────────┐
       │          │
       ↓          ↓
    garden_plants ← plant_species

Por claridade, `onCreate` crea:

    1. gardens
    2. plant_species
    3. garden_plants

`garden_plants` créase despois das táboas ás que fan referencia as súas
claves foráneas.

------------------------------------------------------------------------

## Primeira migración real de MARTOLA

A base de datos evolucionou de:

    version: 1

a:

    version: 2

A versión 1 contiña:

    gardens

A versión 2 incorpora:

    gardens
    plant_species
    garden_plants

Esta é a primeira aplicación práctica do sistema de migracións estudado
na sesión 13.

------------------------------------------------------------------------

## onCreate e onUpgrade

`onCreate` e `onUpgrade` resolven situacións diferentes.

### Instalación nova

Se a base de datos non existe:

    openDatabase()
         ↓
      onCreate
         ↓
    crear directamente
    esquema v2

Créanse:

    gardens
    plant_species
    garden_plants

Non é necesario crear primeiro a versión 1 e migrala posteriormente.

### Base de datos existente

Se existe unha base de datos v1:

    Base de datos v1
          ↓
    aplicación solicita v2
          ↓
       onUpgrade
          ↓
    oldVersion < 2
          ↓
    crear novas táboas
          ↓
    Base de datos v2

Os datos existentes de `gardens` consérvanse.

------------------------------------------------------------------------

## Migración acumulativa

A primeira migración utiliza conceptualmente:

    if (oldVersion < 2) {
      // cambios introducidos na versión 2
    }

No futuro poderemos ter:

    if (oldVersion < 2) {
      // cambios v2
    }

    if (oldVersion < 3) {
      // cambios v3
    }

    if (oldVersion < 4) {
      // cambios v4
    }

Por exemplo, unha base de datos v1 que necesitase chegar directamente á
v4 executaría:

    oldVersion < 2
    oldVersion < 3
    oldVersion < 4

Isto permite aplicar sucesivamente todas as transformacións necesarias.

------------------------------------------------------------------------

## Migración v1 → v2 comprobada

A migración executouse sobre a base de datos existente.

Comprobouse que:

-   A aplicación arrinca correctamente.
-   Os datos anteriores de `gardens` permanecen almacenados.
-   Existe `plant_species`.
-   Existe `garden_plants`.
-   As claves foráneas están activadas.
-   `ON DELETE CASCADE` funciona.
-   `ON DELETE RESTRICT` funciona.

Polo tanto, a primeira migración real de MARTOLA queda validada.

------------------------------------------------------------------------

## GardenPlantRepository

Definiuse un contrato independente para as plantas concretas dunha
horta:

    GardenPlantRepository

A operación principal de colección é:

    Future<List<GardenPlant>> getPlantsByGardenId(
      String gardenId,
    );

En lugar de recuperar todas as plantas da aplicación, a consulta está
contextualizada pola horta.

Isto corresponde ao dominio:

    Garden
      1
      │
      N
    GardenPlant

O contrato inclúe:

    getPlantsByGardenId()
    addPlant()
    getPlantById()
    updatePlant()
    removePlant()

------------------------------------------------------------------------

## PlantSpeciesRepository

O catálogo de especies ten unha responsabilidade diferente das plantas
concretas.

Por este motivo definiuse outro contrato:

    PlantSpeciesRepository

en lugar de introducir as operacións de especies dentro de
`GardenPlantRepository`.

O contrato inclúe:

    getSpecies()
    addSpecies()
    getSpeciesById()
    updateSpecies()
    removeSpecies()

Isto aplica novamente o principio de responsabilidade única:

    GardenPlantRepository
          ↓
    plantas concretas dunha horta

    PlantSpeciesRepository
          ↓
    catálogo de especies

------------------------------------------------------------------------

## Un DatabaseService compartido

Os diferentes Repositories SQLite non necesitan crear ou abrir bases de
datos independentes.

Todos poden utilizar a mesma infraestrutura:

    SQLiteGardenRepository ───────────┐
                                     │
    SQLiteGardenPlantRepository ─────┼──→ DatabaseService
                                     │          ↓
    SQLitePlantSpeciesRepository ────┘        SQLite

`DatabaseService` mantén a responsabilidade sobre a infraestrutura.

Cada Repository mantén a responsabilidade sobre as operacións da súa
entidade.

------------------------------------------------------------------------

## Estado ao finalizar a sesión

Ao finalizar a sesión 14:

-   `Garden` continúa persistido mediante `SQLiteGardenRepository`.
-   A base de datos está na versión 2.
-   A migración v1 → v2 está implementada e comprobada.
-   Os datos existentes consérvanse durante a migración.
-   `plant_species` está creada.
-   `garden_plants` está creada.
-   As claves foráneas están activadas.
-   `ON DELETE CASCADE` está comprobado.
-   `ON DELETE RESTRICT` está comprobado.
-   Existe o modelo `GardenPlant`.
-   Existe o modelo `PlantSpecies`.
-   Existe `GardenPlantRepository`.
-   Existe `PlantSpeciesRepository`.
-   As implementacións SQLite dos novos Repositories aínda están
    pendentes.

O seguinte paso será iniciar:

    SQLitePlantSpeciesRepository

e posteriormente:

    SQLiteGardenPlantRepository

------------------------------------------------------------------------

## Conceptos clave da sesión

-   Relación 1:N.
-   Relación N:1.
-   Separación entre entidade concreta e información compartida.
-   `GardenPlant`.
-   `PlantSpecies`.
-   Claves primarias.
-   Claves foráneas.
-   Integridade referencial.
-   `FOREIGN KEY`.
-   `REFERENCES`.
-   `ON DELETE CASCADE`.
-   `ON DELETE RESTRICT`.
-   `PRAGMA foreign_keys = ON`.
-   `onConfigure`.
-   Conversión `String ↔ INTEGER` para identificadores.
-   `int.parse()`.
-   `toString()`.
-   `DateTime`.
-   ISO 8601.
-   `toIso8601String()`.
-   `DateTime.parse()`.
-   Relación entre modelos e táboas.
-   Versionado SQLite.
-   Primeira migración real.
-   Migración v1 → v2.
-   `onCreate`.
-   `onUpgrade`.
-   Migracións acumulativas.
-   Conservación de datos durante unha migración.
-   Transacción.
-   Rollback.
-   Probas de integridade referencial.
-   Separación de responsabilidades entre Repositories.
-   `GardenPlantRepository`.
-   `PlantSpeciesRepository`.

------------------------------------------------------------------------

## Regra principal da sesión

Unha base de datos relacional non só almacena entidades independentes:
tamén debe protexer as relacións entre elas.

En MARTOLA:

    Garden ────────┐
       │            │
       │            ↓
       └──────→ GardenPlant
                    ↑
                    │
              PlantSpecies

O dominio define as relacións.

Os Repositories separan as responsabilidades de acceso aos datos.

`DatabaseService` proporciona a infraestrutura.

SQLite garante parte da integridade mediante claves foráneas.

Esta separación permite que o modelo de datos medre mantendo unha
arquitectura comprensible e consistente.

------------------------------------------------------------------------

# Sesión 15 - Repositories SQLite, ViewModels e CRUD persistente de plantas

## Obxectivo

Completar a primeira funcionalidade relacional de MARTOLA de extremo a
extremo.

Partiuse dos contratos e táboas creados na sesión anterior e
implementáronse:

-   `SQLitePlantSpeciesRepository`.
-   `SQLiteGardenPlantRepository`.
-   `PlantSpeciesViewModel`.
-   `PlantsViewModel`.
-   Integración mediante `MultiProvider`.
-   Seed inicial do catálogo de especies.
-   Listado de plantas dunha horta.
-   Creación de plantas.
-   Detalle dunha planta.
-   Edición de plantas.
-   Eliminación de plantas.

Ao finalizar a sesión, o módulo de plantas dispón dun CRUD completo e
persistente.

------------------------------------------------------------------------

## Reutilizar un patrón arquitectónico

Na sesión anterior xa existía:

``` text
GardenRepository
        ↑
SQLiteGardenRepository
        ↓
DatabaseService
        ↓
SQLite
```

Na sesión 15 aplicouse o mesmo patrón a novas entidades:

``` text
PlantSpeciesRepository
        ↑
SQLitePlantSpeciesRepository
        ↓
DatabaseService
        ↓
SQLite
```

e:

``` text
GardenPlantRepository
        ↑
SQLiteGardenPlantRepository
        ↓
DatabaseService
        ↓
SQLite
```

A idea importante non é copiar código, senón recoñecer unha estrutura
coñecida e adaptala á responsabilidade da nova entidade.

### Regra

> Cando unha arquitectura xa resolve correctamente un tipo de problema,
> primeiro debemos comprobar se o novo problema encaixa nese mesmo
> patrón antes de inventar unha solución diferente.

------------------------------------------------------------------------

## SQLitePlantSpeciesRepository

`SQLitePlantSpeciesRepository` implementa o contrato:

``` text
PlantSpeciesRepository
```

e utiliza `DatabaseService` para acceder a SQLite.

As operacións implementadas son:

``` text
getSpecies()
addSpecies()
getSpeciesById()
updateSpecies()
removeSpecies()
```

O Repository é responsable de traducir entre:

``` text
SQLite
  ↕
Map<String, Object?>
  ↕
PlantSpecies
```

As Views e o ViewModel non necesitan coñecer os nomes das táboas nin as
consultas SQLite.

------------------------------------------------------------------------

## SQLiteGardenPlantRepository

`SQLiteGardenPlantRepository` implementa:

``` text
GardenPlantRepository
```

As operacións son:

``` text
getPlantsByGardenId()
addPlant()
getPlantById()
updatePlant()
removePlant()
```

A consulta principal está contextualizada por horta:

``` dart
getPlantsByGardenId(gardenId)
```

Isto representa directamente a relación:

``` text
Garden
  1
  │
  N
GardenPlant
```

Non sempre é necesario cargar todas as entidades dunha táboa. A consulta
debe responder á necesidade real do dominio e da interface.

------------------------------------------------------------------------

## PlantSpeciesViewModel

Creouse:

``` text
PlantSpeciesViewModel
```

que mantén en memoria o catálogo de especies xa cargado.

Estado interno:

``` dart
final List<PlantSpecies> _species = [];
```

Exposición:

``` dart
List<PlantSpecies> get species =>
    List.unmodifiable(_species);
```

Isto conserva o principio aprendido con `GardensViewModel`:

``` text
View
  ↓ lectura
ViewModel
  ↓
estado privado
```

As Views poden consultar o estado, pero non modificar directamente a
colección.

------------------------------------------------------------------------

## Consulta local mediante getSpeciesById()

Unha vez cargadas as especies no ViewModel, non é necesario consultar
SQLite cada vez que unha pantalla necesita mostrar o nome dunha especie.

Pode utilizarse:

``` dart
PlantSpecies? getSpeciesById(String id)
```

sobre a colección xa cargada.

Fluxo:

``` text
speciesId
   ↓
PlantSpeciesViewModel
   ↓
_species
   ↓
PlantSpecies
```

Isto permite resolver, por exemplo:

``` text
GardenPlant.speciesId
        ↓
PlantSpecies.commonName
```

sen acoplar a View ao Repository ou á base de datos.

------------------------------------------------------------------------

## indexWhere()

`indexWhere()` permite buscar a posición do primeiro elemento dunha
colección que cumpra unha condición.

Exemplo conceptual:

``` dart
final index = _species.indexWhere(
  (species) => species.id == updatedSpecies.id,
);
```

O resultado é:

``` text
índice >= 0
    ↓
elemento atopado

-1
    ↓
elemento non atopado
```

É especialmente útil cando necesitamos substituír un elemento concreto
dunha lista.

Exemplo:

``` dart
_species[index] = updatedSpecies;
```

### Regra práctica

-   Se necesitamos o **elemento**, podemos buscalo polo seu ID.
-   Se necesitamos **substituílo dentro da lista**, necesitamos coñecer
    a súa posición.
-   `indexWhere()` resolve precisamente esa segunda necesidade.

------------------------------------------------------------------------

## removeWhere()

`removeWhere()` elimina dunha colección todos os elementos que cumpren
unha condición.

Exemplo:

``` dart
_plants.removeWhere(
  (plant) => plant.id == id,
);
```

Neste caso a condición identifica a planta eliminada.

Fluxo:

``` text
Repository elimina en SQLite
        ↓
resultado correcto
        ↓
removeWhere()
        ↓
estado local actualizado
        ↓
notifyListeners()
```

------------------------------------------------------------------------

## Estado contextual

`PlantsViewModel` introduce un concepto novo respecto a
`GardensViewModel`.

Non mantén simplemente todas as plantas da aplicación.

Mantén as plantas da horta actualmente cargada:

``` dart
String? _currentGardenId;
final List<GardenPlant> _plants = [];
```

Ao executar:

``` dart
loadPlants(gardenId)
```

o ViewModel:

1.  Garda `gardenId` en `_currentGardenId`.
2.  Consulta o Repository.
3.  Baleira `_plants`.
4.  Engade as plantas recuperadas.
5.  Notifica ás Views.

Fluxo:

``` text
Horta seleccionada
        ↓
gardenId
        ↓
PlantsViewModel
        ↓
_currentGardenId
        ↓
GardenPlantRepository
        ↓
plantas desa horta
        ↓
_plants
```

### Por que baleirar a colección?

Se simplemente engadísemos os novos resultados:

``` dart
_plants.addAll(...)
```

sen limpar previamente o estado, poderiamos mesturar plantas de
diferentes hortas.

Por iso:

``` text
cambiar de contexto
      ↓
substituír o subconxunto cargado
```

e non:

``` text
cambiar de contexto
      ↓
acumular datos anteriores
```

------------------------------------------------------------------------

## Estado global e estado contextual

Nesta fase aparecen dous tipos de estado compartido.

### Estado global do módulo

Exemplo:

``` text
PlantSpeciesViewModel
```

O catálogo de especies pode ser útil desde diferentes partes da
aplicación.

### Estado contextual

Exemplo:

``` text
PlantsViewModel
```

A colección visible depende da horta seleccionada.

Isto permite distinguir:

``` text
Estado compartido
    ├── global
    └── contextual
```

Compartido non significa necesariamente que todos os datos da aplicación
deban estar cargados ao mesmo tempo.

------------------------------------------------------------------------

## MultiProvider

Ao existir varios `ChangeNotifier`, utilizouse:

``` dart
MultiProvider
```

Estrutura conceptual:

``` text
MultiProvider
├── GardensViewModel
├── PlantSpeciesViewModel
└── PlantsViewModel
    ↓
MaterialApp
    ↓
resto da aplicación
```

`MultiProvider` permite declarar varios Providers sen crear unha árbore
difícil de ler de Providers aniñados manualmente.

Conceptualmente é equivalente a proporcionar varias dependencias por
enriba da aplicación.

------------------------------------------------------------------------

## Inxección de dependencias no punto de composición

As dependencias créanse nun punto central.

Exemplo conceptual:

``` text
DatabaseService
    ↓
Repositories
    ↓
ViewModels
    ↓
Providers
    ↓
Views
```

Isto mantén claras as dependencias:

``` text
View
  ↓
ViewModel
  ↓
Repository
  ↓
DatabaseService
```

Unha View non crea o seu propio Repository.

Un ViewModel non crea a súa propia base de datos.

As dependencias entréganse desde fóra.

------------------------------------------------------------------------

## Carga inicial e carga contextual

Non todos os ViewModels deben cargar os datos no mesmo momento.

### GardensViewModel

Pode cargar as hortas ao crear o Provider.

### PlantSpeciesViewModel

Pode cargar o catálogo de especies ao crear o Provider.

### PlantsViewModel

Non pode saber que plantas cargar ata coñecer unha horta.

Por iso a carga realízase cando aparece ese contexto:

``` dart
loadPlants(gardenId)
```

### Regra

> Un dato debe cargarse cando xa existe a información necesaria para
> determinar que dato necesitamos.

------------------------------------------------------------------------

## initState()

`GardenDetailsScreen` converteuse en `StatefulWidget` para poder iniciar
a carga asociada á horta.

En:

``` dart
initState()
```

execútase:

``` dart
context.read<PlantsViewModel>()
    .loadPlants(widget.gardenId);
```

`initState()` execútase unha vez cando se crea o `State`.

É apropiado para iniciar traballo asociado á entrada nunha pantalla
cando non queremos executalo en cada `build()`.

### Por que non en build()?

`build()` pode executarse moitas veces.

Se unha carga se inicia indiscriminadamente dentro de `build()`, cada
reconstrución podería volver solicitar os datos.

------------------------------------------------------------------------

## widget dentro dun State

Nun `StatefulWidget` existe unha separación entre:

``` text
Widget
  ↓ configuración
State
  ↓ estado e ciclo de vida
```

Desde o `State` podemos acceder á configuración recibida polo widget
mediante:

``` dart
widget
```

Por exemplo:

``` dart
widget.gardenId
```

Isto permite utilizar en `initState()` os datos recibidos polo
`StatefulWidget`.

------------------------------------------------------------------------

## context.read(), watch() e select() nesta fase

Os tres mecanismos estudados anteriormente aparecen agora nun fluxo
real.

### read

Para executar unha acción sen subscribirse:

``` dart
context.read<PlantsViewModel>()
```

Exemplo:

``` text
cargar plantas
crear planta
editar planta
eliminar planta
```

### watch

Para reconstruír unha View cando cambia o estado:

``` dart
context.watch<PlantsViewModel>()
```

Exemplo:

``` text
PlantListScreen
```

### select

Para observar só un valor concreto:

``` dart
context.select<PlantsViewModel, int>(
  (viewModel) => viewModel.plants.length,
)
```

Pode empregarse cando unha pantalla só necesita, por exemplo, o número
de plantas.

------------------------------------------------------------------------

## DropdownButtonFormField

Para seleccionar a especie dunha planta utilizouse:

``` dart
DropdownButtonFormField<String>
```

Combina:

``` text
Dropdown
+
FormField
```

Polo tanto permite:

-   Mostrar unha lista de opcións.
-   Gardar o valor seleccionado.
-   Integrarse nun `Form`.
-   Aplicar validación.

Cada opción representa unha especie, pero o valor almacenado é o seu
identificador.

Conceptualmente:

``` text
Usuario ve
"Tomate"

Aplicación almacena
speciesId
```

Isto permite mostrar información comprensible mantendo correctamente a
relación entre entidades.

------------------------------------------------------------------------

## Identificador fronte a texto visible

Unha relación entre entidades non debe depender do texto que mostramos
na interface.

Gardamos:

``` text
speciesId
```

e non:

``` text
"Tomate"
```

A interface pode resolver posteriormente:

``` text
speciesId
   ↓
PlantSpecies
   ↓
commonName
```

### Razón

O nome visible pode cambiar.

O identificador representa a identidade da entidade.

------------------------------------------------------------------------

## showDatePicker()

Para seleccionar a data de plantación utilizouse:

``` dart
showDatePicker()
```

A función abre un selector de data e devolve un resultado asíncrono:

``` text
Future<DateTime?>
```

Pode ocorrer:

``` text
usuario selecciona unha data
        ↓
DateTime

usuario cancela
        ↓
null
```

Por iso o resultado debe comprobarse antes de actualizar o estado.

------------------------------------------------------------------------

## Estado local do formulario

A selección dunha especie e dunha data son estado da propia pantalla de
formulario.

Exemplos:

``` dart
String? _selectedSpeciesId;
DateTime? _plantingDate;
```

Non todo dato relacionado cunha planta debe introducirse inmediatamente
no ViewModel.

Mentres o usuario está cubrindo o formulario, estes valores pertencen á
interacción local da pantalla.

Só ao gardar se constrúe ou actualiza a entidade.

------------------------------------------------------------------------

## late final

Na pantalla de edición, un `TextEditingController` necesita
inicializarse utilizando datos de:

``` dart
widget.plant
```

Eses datos non están dispoñibles no momento de inicializar directamente
os campos do `State`.

Por iso pode declararse:

``` dart
late final TextEditingController _customNameController;
```

e inicializarse posteriormente en:

``` dart
initState()
```

Exemplo:

``` dart
_customNameController =
    TextEditingController(
      text: widget.plant.customName,
    );
```

### Significado

``` text
late
↓
o valor asignarase máis tarde

final
↓
unha vez asignado non poderá substituírse por outra referencia
```

------------------------------------------------------------------------

## Formulario de creación fronte a formulario de edición

Os dous formularios comparten moitos conceptos:

``` text
Form
TextEditingController
DropdownButtonFormField
showDatePicker
validator
```

A diferenza principal é o estado inicial.

### Crear

``` text
campos inicialmente baleiros
```

### Editar

``` text
campos inicializados desde a entidade existente
```

Por exemplo:

``` dart
_selectedSpeciesId = widget.plant.speciesId;
_plantingDate = widget.plant.plantingDate;
```

------------------------------------------------------------------------

## Resolución de relacións na interface

`GardenPlant` contén:

``` text
speciesId
```

pero a pantalla de detalle debe mostrar un nome comprensible.

Fluxo:

``` text
GardenPlant
    ↓
speciesId
    ↓
PlantSpeciesViewModel
    ↓
getSpeciesById()
    ↓
PlantSpecies
    ↓
commonName
```

A View coordina información xa dispoñible nos ViewModels.

Non consulta directamente SQLite.

------------------------------------------------------------------------

## Seed de datos

O catálogo de especies necesita datos para poder utilizar o selector
desde o primeiro momento.

Engadiuse un seed inicial.

Antes de inserir compróbase:

``` sql
SELECT COUNT(*) AS count
FROM plant_species
```

Se existen rexistros:

``` text
count > 0
↓
non inserir
```

Se a táboa está baleira:

``` text
count == 0
↓
inserir catálogo inicial
```

Isto evita duplicar os mesmos datos en cada arranque.

------------------------------------------------------------------------

## Seed fronte a migración

Son conceptos relacionados coa inicialización da base de datos, pero non
son o mesmo.

### Migración

Transforma a estrutura ou os datos dunha versión existente para
adaptalos a unha versión nova.

``` text
v1
↓
onUpgrade
↓
v2
```

### Seed

Introduce datos iniciais necesarios ou útiles cando aínda non existen.

``` text
táboa baleira
↓
seed
↓
datos iniciais
```

Un seed debe deseñarse para non duplicar datos ao executarse de novo.

------------------------------------------------------------------------

## CRUD persistente e sincronización do estado

Agora unha operación non modifica unicamente unha lista en memoria.

Exemplo de creación:

``` text
View
  ↓
PlantsViewModel.addPlant()
  ↓
GardenPlantRepository.addPlant()
  ↓
SQLite
  ↓
GardenPlant persistida
  ↓
_plants.add(...)
  ↓
notifyListeners()
  ↓
View actualizada
```

A orde é importante.

Primeiro se realiza a operación na fonte persistente.

Despois actualízase o estado observable co resultado.

------------------------------------------------------------------------

## Actualización dunha entidade

Para editar unha planta:

``` text
EditPlantScreen
      ↓
PlantsViewModel.updatePlant()
      ↓
Repository.updatePlant()
      ↓
SQLite
      ↓
entidade actualizada
      ↓
indexWhere()
      ↓
substitución en _plants
      ↓
notifyListeners()
```

O modelo é inmutable.

Non se modifica directamente o obxecto existente.

Substitúese pola nova versión.

------------------------------------------------------------------------

## Eliminación dunha entidade

Para eliminar:

``` text
PlantDetailsScreen
      ↓
confirmación
      ↓
PlantsViewModel.removePlant()
      ↓
Repository.removePlant()
      ↓
SQLite
      ↓
removeWhere()
      ↓
notifyListeners()
```

A confirmación pertence á interface.

A eliminación dos datos pertence ao ViewModel e ao Repository segundo a
responsabilidade de cada capa.

------------------------------------------------------------------------

## Confirmación antes dunha acción destrutiva

Eliminar datos é unha acción destrutiva.

Antes de executala, a interface solicita confirmación.

Conceptualmente:

``` text
usuario pulsa Eliminar
        ↓
diálogo de confirmación
    ↙           ↘
cancelar      confirmar
                 ↓
             removePlant()
```

Isto evita que unha pulsación accidental elimine inmediatamente
información persistente.

------------------------------------------------------------------------

## notifyListeners() como final dunha modificación observable

Unha modificación do estado interno non actualiza por si soa as Views.

Despois de cambiar a colección:

``` dart
notifyListeners();
```

comunica aos widgets subscritos que deben reconstruírse.

Fluxo:

``` text
estado cambia
    ↓
notifyListeners()
    ↓
watch/select
    ↓
rebuild
```

`notifyListeners()` non garda datos en SQLite.

A súa responsabilidade é comunicar cambios do estado observable.

------------------------------------------------------------------------

## Fluxo completo do módulo de plantas

Ao finalizar a sesión:

``` text
GardenDetailsScreen
        ↓
PlantListScreen
    ├── AddPlantScreen
    │       ↓
    │   PlantsViewModel
    │       ↓
    │   Repository
    │       ↓
    │     SQLite
    │
    └── PlantDetailsScreen
            ├── EditPlantScreen
            │       ↓
            │   PlantsViewModel
            │       ↓
            │   Repository
            │       ↓
            │     SQLite
            │
            └── eliminar
                    ↓
                PlantsViewModel
                    ↓
                Repository
                    ↓
                  SQLite
```

A interface non accede directamente á base de datos.

------------------------------------------------------------------------

## Estado ao finalizar a sesión

Ao finalizar a sesión 15:

-   `SQLitePlantSpeciesRepository` está implementado.
-   `SQLiteGardenPlantRepository` está implementado.
-   `PlantSpeciesViewModel` está implementado.
-   `PlantsViewModel` está implementado.
-   Os tres ViewModels están dispoñibles mediante `MultiProvider`.
-   O catálogo inicial de especies pode sementarse automaticamente.
-   As especies poden resolverse polo seu ID.
-   As plantas cárganse segundo a horta seleccionada.
-   Existe `PlantListScreen`.
-   Existe `AddPlantScreen`.
-   Existe `PlantDetailsScreen`.
-   Existe `EditPlantScreen`.
-   As plantas poden crearse.
-   As plantas poden consultarse.
-   As plantas poden editarse.
-   As plantas poden eliminarse.
-   Os datos permanecen en SQLite.
-   As Views reaccionan aos cambios mediante Provider.
-   O estado de plantas non mestura datos de diferentes hortas.

O CRUD persistente do módulo de plantas queda completado.

------------------------------------------------------------------------

## Conceptos clave da sesión

-   Reutilización de patróns arquitectónicos.
-   `SQLitePlantSpeciesRepository`.
-   `SQLiteGardenPlantRepository`.
-   `PlantSpeciesViewModel`.
-   `PlantsViewModel`.
-   Estado contextual.
-   `_currentGardenId`.
-   Subconxuntos de datos.
-   `indexWhere()`.
-   `removeWhere()`.
-   Consulta local sobre estado xa cargado.
-   `MultiProvider`.
-   Inxección de dependencias.
-   Carga inicial.
-   Carga contextual.
-   `initState()`.
-   `widget` dentro dun `State`.
-   `context.read()`.
-   `context.watch()`.
-   `context.select()`.
-   `DropdownButtonFormField`.
-   Identificadores como relación entre entidades.
-   `showDatePicker()`.
-   `Future<DateTime?>`.
-   Estado local dun formulario.
-   `late final`.
-   Formularios de creación e edición.
-   Seed de datos.
-   Diferenza entre seed e migración.
-   Sincronización entre persistencia e estado.
-   CRUD persistente.
-   Confirmación de accións destrutivas.
-   `notifyListeners()`.
-   Resolución de relacións na interface.

------------------------------------------------------------------------

## Regra principal da sesión

O estado da interface e a persistencia son responsabilidades diferentes,
pero deben permanecer sincronizadas.

En MARTOLA:

``` text
View
  ↓
ViewModel
  ↓
Repository
  ↓
SQLite
```

e, cando a operación modifica datos:

``` text
SQLite
  ↓
resultado
  ↓
estado do ViewModel
  ↓
notifyListeners()
  ↓
View
```

As relacións entre entidades mantéñense mediante identificadores.

Os ViewModels proporcionan á interface o estado que necesita.

Os Repositories ocultan os detalles de persistencia.

`DatabaseService` mantén a infraestrutura común.

Esta separación permite completar un CRUD relacional sen romper as
responsabilidades definidas pola arquitectura.

------------------------------------------------------------------------

# Sesión 16 - Evolución das plantas: modelo, persistencia, estado e CRUD

## Obxectivo

Implementar o seguemento persistente da evolución dunha planta aplicando
os patróns xa empregados nos módulos de hortas e plantas.

Durante esta sesión completouse unha nova funcionalidade de extremo a
extremo:

``` text
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

A sesión permitiu reutilizar conceptos xa aprendidos e, ao mesmo tempo,
introducir novos detalles sobre campos opcionais, relacións 1:N,
migracións sucesivas e estado contextual.

------------------------------------------------------------------------

## PlantEvolutionRecord

Creouse o modelo `PlantEvolutionRecord` para representar unha
observación da evolución dunha planta nunha data concreta.

Conceptualmente:

``` text
PlantEvolutionRecord
├── id
├── plantId
├── date
├── height
└── notes
```

`height` e `notes` son opcionais porque un rexistro pode conter só parte
desa información.

``` dart
double? height;
String? notes;
```

Isto permite representar correctamente a ausencia dun dato mediante
`null`, en lugar de inventar valores como `0.0` ou unha cadea baleira.

### Regra

> Se a ausencia dun valor ten significado no dominio, debe representarse
> explicitamente como ausencia e non mediante un valor artificial.

------------------------------------------------------------------------

## NULL en SQLite

SQLite pode almacenar `NULL` directamente.

Se un `Map<String, Object?>` contén:

``` dart
'height': null,
'notes': null,
```

SQLite almacena eses campos como `NULL` sempre que a columna o permita.

Non transforma automaticamente:

``` text
null → 0.0
null → ''
```

Isto encaixa coa null safety de Dart e permite conservar a diferenza
entre:

``` text
altura descoñecida
```

e:

``` text
altura = 0
```

------------------------------------------------------------------------

## REAL en SQLite

Para valores decimais utilizouse:

``` sql
height REAL
```

SQLite non necesita un tipo `DOUBLE` específico para este caso.

Na aplicación:

``` text
SQLite REAL
    ↕
Dart double
```

------------------------------------------------------------------------

## Relación planta → rexistros de evolución

Unha planta pode ter múltiples rexistros de evolución.

``` text
GardenPlant 1 ───── N PlantEvolutionRecord
```

Cada rexistro pertence a unha única planta mediante:

``` text
plant_id
```

A táboa creada é:

``` text
plant_evolution_records
```

con clave foránea cara a:

``` text
garden_plants(id)
```

------------------------------------------------------------------------

## ON DELETE CASCADE no histórico

Configurouse:

``` sql
FOREIGN KEY (plant_id)
  REFERENCES garden_plants(id)
  ON DELETE CASCADE
```

A decisión responde ao dominio:

``` text
eliminar planta
      ↓
rexistros de evolución quedan sen entidade pai
      ↓
SQLite elimínaos automaticamente
```

Se no futuro se quere conservar o histórico antes de eliminar unha
planta, poderá incorporarse unha funcionalidade de exportación.

A persistencia non debe conservar datos orfos que xa non teñen sentido
dentro do modelo actual.

------------------------------------------------------------------------

## Segunda migración real de MARTOLA

O esquema evolucionou de:

``` text
version: 2
```

a:

``` text
version: 3
```

A versión 3 incorpora:

``` text
plant_evolution_records
```

A migración engadiuse a `onUpgrade()` mediante o patrón acumulativo xa
estudado:

``` dart
if (oldVersion < 2) {
  // cambios da versión 2
}

if (oldVersion < 3) {
  // cambios da versión 3
}
```

Isto confirmou na práctica unha idea importante:

> Unha migración debe transformar unha base de datos existente sen
> obrigar a borrar os datos anteriores.

Comprobouse que as hortas e plantas xa almacenadas continuaban existindo
despois da actualización á versión 3.

------------------------------------------------------------------------

## PlantEvolutionRecordRepository

Creouse un contrato específico para a persistencia dos rexistros de
evolución.

Operacións principais:

``` text
getRecordsByPlantId()
addRecord()
getRecordById()
updateRecord()
removeRecord()
```

O Repository non xestiona a interface nin o estado visual.

A súa responsabilidade é definir as operacións de acceso aos datos desta
entidade.

------------------------------------------------------------------------

## SQLitePlantEvolutionRecordRepository

Creouse a implementación SQLite do contrato.

``` text
PlantEvolutionRecordRepository
              ↑
SQLitePlantEvolutionRecordRepository
              ↓
DatabaseService
              ↓
SQLite
```

A implementación converte entre:

``` text
PlantEvolutionRecord
        ↕
Map<String, Object?>
        ↕
SQLite
```

O CRUD foi comprobado directamente antes de conectar a interface.

A proba verificou:

``` text
CREATE
READ BY PLANT
READ BY ID
UPDATE
DELETE
```

### Aprendizaxe

Probar primeiro unha capa illada facilita localizar erros antes de
engadir novas capas por enriba.

``` text
Repository correcto
      ↓
ViewModel
      ↓
Views
```

é máis fácil de depurar que intentar comprobar todas as capas
simultaneamente desde o principio.

------------------------------------------------------------------------

## Consulta por relación

A evolución non se carga como unha colección global de todos os
rexistros existentes.

Utilízase:

``` text
getRecordsByPlantId(plantId)
```

porque a pantalla traballa dentro do contexto dunha planta concreta.

Conceptualmente:

``` text
plantId
   ↓
Repository
   ↓
WHERE plant_id = ?
   ↓
rexistros desa planta
```

Isto reproduce no novo módulo o patrón xa utilizado para cargar plantas
dunha horta.

------------------------------------------------------------------------

## PlantEvolutionViewModel

Creouse `PlantEvolutionViewModel` para manter o estado observable da
evolución.

A colección interna é:

``` dart
final List<PlantEvolutionRecord> _records = [];
```

e exponse sen permitir modificación directa desde as Views.

O ViewModel implementa:

``` text
loadRecords()
addRecord()
getRecordById()
updateRecord()
removeRecord()
```

------------------------------------------------------------------------

## Estado contextual mediante \_currentPlantId

Un rexistro de evolución necesita saber a que planta pertence.

En lugar de solicitar repetidamente `plantId` ao usuario ou a cada
formulario, o ViewModel conserva o contexto actual:

``` dart
String? _currentPlantId;
```

Ao entrar na evolución dunha planta:

``` text
PlantEvolutionListScreen
        ↓
loadRecords(plantId)
        ↓
_currentPlantId = plantId
```

Posteriormente:

``` text
AddPlantEvolutionRecordScreen
        ↓
addRecord(...)
        ↓
_currentPlantId
```

permite asociar automaticamente o novo rexistro coa planta correcta.

### Regra

> Se unha acción ocorre dentro dun contexto xa coñecido, non é necesario
> volver pedir ao usuario información que a aplicación xa coñece.

Este patrón é equivalente ao empregado en `PlantsViewModel` coa horta
activa.

------------------------------------------------------------------------

## MultiProvider con varios ViewModels

A aplicación utiliza xa varios ViewModels compartidos:

``` text
GardensViewModel
PlantSpeciesViewModel
PlantsViewModel
PlantEvolutionViewModel
```

`MultiProvider` permite proporcionar todos eles desde un punto común da
árbore.

Isto evita encadear manualmente múltiples `ChangeNotifierProvider` e
mantén a configuración de dependencias máis lexible.

------------------------------------------------------------------------

## Carga inicial desde initState

`PlantEvolutionListScreen` necesita cargar os rexistros da planta cando
se abre.

Utilizouse `initState()` porque esa carga debe iniciarse unha vez ao
crear o estado da pantalla:

``` dart
@override
void initState() {
  super.initState();

  context
      .read<PlantEvolutionViewModel>()
      .loadRecords(widget.plantId);
}
```

`read()` é apropiado porque a chamada inicia unha acción; non se utiliza
para subscribirse aos cambios.

A subscrición real da interface realízase posteriormente mediante
`watch()`.

------------------------------------------------------------------------

## Separar iniciar unha acción de observar o resultado

Na lista de evolución aparecen dous usos diferentes de Provider:

``` text
initState
   ↓
context.read()
   ↓
iniciar loadRecords()
```

mentres que en `build()`:

``` text
context.watch()
   ↓
observar records
   ↓
rebuild cando cambien
```

### Regra práctica

``` text
read  → quero facer algo
watch → quero reaccionar aos cambios
select → quero reaccionar a unha parte concreta
```

------------------------------------------------------------------------

## Formulario con campos opcionais

`AddPlantEvolutionRecordScreen` introduciu unha diferenza importante
respecto aos formularios anteriores.

Non todos os campos son obrigatorios.

A altura pode estar baleira.

Por tanto, o validator debe distinguir:

``` text
campo baleiro
    ↓
válido → null
```

fronte a:

``` text
campo con texto
    ↓
intentar double.tryParse()
    ↓
valor válido ou erro
```

Un campo opcional non significa que calquera contido sexa válido.

Significa que pode non existir valor, pero se existe debe cumprir as
regras do seu tipo.

------------------------------------------------------------------------

## Conversión dun campo baleiro a null

Antes de crear o modelo:

``` dart
final heightText = _heightController.text.trim();

final height = heightText.isEmpty
    ? null
    : double.parse(heightText);
```

O mesmo criterio pode aplicarse ás notas:

``` dart
final notesText = _notesController.text.trim();

final notes = notesText.isEmpty
    ? null
    : notesText;
```

Isto mantén coherencia entre:

``` text
Formulario
   ↓
Dart nullable
   ↓
Map<String, Object?>
   ↓
SQLite NULL
```

------------------------------------------------------------------------

## showDatePicker reutilizado

A data do rexistro selecciónase mediante `showDatePicker()`.

O patrón xa coñecido é:

``` text
abrir selector
    ↓
Future<DateTime?>
    ↓
await
    ↓
usuario cancela → null
usuario escolle → DateTime
```

Se existe unha nova data:

``` dart
setState(() {
  _date = selectedDate;
});
```

Neste caso `setState()` xestiona estado local do formulario, non estado
compartido do dominio.

------------------------------------------------------------------------

## Estado local e estado compartido no mesmo fluxo

A sesión reforzou que ambos tipos de estado poden coexistir.

### Estado local

``` text
_date
_heightController
_notesController
```

pertencen ao formulario.

### Estado compartido

``` text
_records
_currentPlantId
```

pertence a `PlantEvolutionViewModel`.

A pregunta non é simplemente "uso Provider ou setState?".

A pregunta correcta é:

> Quen necesita coñecer e conservar este estado?

------------------------------------------------------------------------

## Pantalla de detalle por identificador

`PlantEvolutionDetailsScreen` recibe:

``` text
recordId
```

e consulta a versión actual mediante:

``` text
PlantEvolutionViewModel.getRecordById(recordId)
```

Isto permite que, despois dunha edición, a pantalla de detalle
reconstrúa a información desde o estado compartido actualizado.

O mesmo principio xa se empregara cos detalles dunha planta.

------------------------------------------------------------------------

## Tratamento de entidade non atopada

Un método como:

``` text
getRecordById(recordId)
```

pode devolver:

``` text
PlantEvolutionRecord?
```

A View debe contemplar explicitamente:

``` text
record == null
```

antes de acceder aos seus campos.

Isto evita asumir que un identificador sempre corresponde cunha entidade
existente.

------------------------------------------------------------------------

## Scope dunha variable en Dart

Durante a implementación de detalles de planta apareceu un caso no que
unha variable creada dentro dun `if` non estaba dispoñible fóra del.

Conceptualmente:

``` dart
if (plant != null) {
  final species = ...;
}

// species xa non existe aquí
```

Unha variable declarada dentro dun bloque pertence ao scope dese bloque.

Se debe utilizarse posteriormente, pode declararse antes:

``` dart
PlantSpecies? species;

if (plant != null) {
  species = ...;
}
```

### Regra

> O lugar no que se declara unha variable determina desde onde pode
> accederse a ela.

------------------------------------------------------------------------

## Null safety na interface

Os campos opcionais non deben mostrarse directamente se iso produce
textos como:

``` text
Altura: null
Notas: null
```

A interface traduce a ausencia de dato a unha mensaxe comprensible:

``` text
Altura: sen rexistrar
Notas: sen notas
```

A null safety non é só evitar erros de compilación; tamén obriga a
decidir como debe representarse a ausencia de información para o
usuario.

------------------------------------------------------------------------

## crossAxisAlignment e texto no detalle

Nunha `Column`, o eixe principal é vertical e o secundario é horizontal.

Para aliñar o contido ao inicio horizontal utilizouse:

``` dart
crossAxisAlignment: CrossAxisAlignment.start
```

Isto reforzou a regra xa aprendida:

``` text
Column
main axis  → vertical
cross axis → horizontal
```

Non se debe deducir o comportamento polo nome da propiedade illadamente,
senón pola responsabilidade do widget pai.

------------------------------------------------------------------------

## Edición con initState

`EditPlantEvolutionRecordScreen` recibe un rexistro existente.

Os valores iniciais do formulario deben establecerse unha única vez
cando se crea o `State`.

Por iso utilízase `initState()` para inicializar:

``` text
_heightController
_notesController
_date
```

Este patrón é o mesmo utilizado previamente en `EditGardenScreen` e
`EditPlantScreen`.

------------------------------------------------------------------------

## null.toString() e formularios de edición

Nun campo opcional hai que ter coidado con:

``` dart
widget.record.height.toString()
```

Se `height` é `null`, o resultado textual sería:

``` text
"null"
```

pero iso non representa un campo baleiro para o usuario.

Conceptualmente debe transformarse:

``` text
null → ''
valor → valor.toString()
```

A representación visual dun valor nullable pode ser distinta da súa
representación interna.

------------------------------------------------------------------------

## update fronte a add

Nun formulario de edición a operación debe corresponder coa intención do
usuario.

``` text
crear → addRecord()
editar → updateRecord()
```

A semellanza visual entre dous formularios non implica que realicen a
mesma operación de dominio.

Esta distinción reforza a importancia de revisar o fluxo completo e non
só a interface.

------------------------------------------------------------------------

## Confirmación de eliminación

`PlantEvolutionDetailsScreen` utiliza `AlertDialog` antes de eliminar un
rexistro.

O patrón é:

``` text
Eliminar
   ↓
showDialog()
   ↓
AlertDialog
   ├── Cancelar → pop diálogo
   └── Eliminar
          ↓
      removeRecord()
          ↓
      pop diálogo
          ↓
      pop detalle
```

A confirmación pertence á interface.

A eliminación persistente pertence ao ViewModel e Repository.

------------------------------------------------------------------------

## context.mounted e dialogContext.mounted

Despois dunha operación asíncrona pode ser necesario comprobar que os
contextos seguen sendo válidos antes de navegar.

Nun diálogo existen dous contextos relevantes:

``` text
context
```

da pantalla e:

``` text
dialogContext
```

do propio diálogo.

Antes de executar `pop()` tras un `await`, comprobouse que ambos
continúan montados.

Isto reforza a regra:

> Despois dun `await`, non se debe asumir automaticamente que o widget
> ou contexto segue formando parte da árbore.

------------------------------------------------------------------------

## Fluxo reactivo completo da evolución

A creación dun rexistro segue:

``` text
AddPlantEvolutionRecordScreen
          ↓
PlantEvolutionViewModel.addRecord()
          ↓
Repository.addRecord()
          ↓
SQLite INSERT
          ↓
rexistro con ID
          ↓
_records.add()
          ↓
notifyListeners()
          ↓
PlantEvolutionListScreen rebuild
```

A edición segue:

``` text
EditPlantEvolutionRecordScreen
          ↓
PlantEvolutionViewModel.updateRecord()
          ↓
Repository.updateRecord()
          ↓
SQLite UPDATE
          ↓
substitución en _records
          ↓
notifyListeners()
          ↓
Views reconstruídas
```

A eliminación segue:

``` text
PlantEvolutionDetailsScreen
          ↓
removeRecord()
          ↓
SQLite DELETE
          ↓
_records.removeWhere()
          ↓
notifyListeners()
```

------------------------------------------------------------------------

## Reutilización da arquitectura

A sesión 16 confirmou que a arquitectura pode crecer mantendo o mesmo
patrón.

``` text
HORTAS
View → GardensViewModel → GardenRepository → SQLite

PLANTAS
View → PlantsViewModel → GardenPlantRepository → SQLite

EVOLUCIÓN
View → PlantEvolutionViewModel → PlantEvolutionRecordRepository → SQLite
```

Non se deseñou unha arquitectura nova para cada módulo.

Reutilizouse unha estrutura coñecida e adaptouse ao dominio
correspondente.

------------------------------------------------------------------------

## Estado actual do esquema SQLite

Ao finalizar a sesión 16:

``` text
version: 3
```

Táboas:

``` text
gardens
plant_species
garden_plants
plant_evolution_records
```

Relación principal:

``` text
Garden
  │
  └── 1:N GardenPlant
             │
             ├── N:1 PlantSpecies
             │
             └── 1:N PlantEvolutionRecord
```

As claves foráneas están activadas mediante:

``` sql
PRAGMA foreign_keys = ON
```

------------------------------------------------------------------------

## Estado ao finalizar a sesión 16

O módulo de evolución permite actualmente:

1.  Crear rexistros de evolución.
2.  Asocialos automaticamente á planta activa.
3.  Gardar data, altura opcional e notas opcionais.
4.  Persistir os rexistros en SQLite.
5.  Listar os rexistros dunha planta.
6.  Consultar un rexistro polo seu identificador.
7.  Editar un rexistro existente.
8.  Eliminar un rexistro con confirmación.
9.  Actualizar automaticamente as Views mediante Provider.
10. Eliminar automaticamente o histórico dunha planta mediante
    `ON DELETE CASCADE` cando a planta é eliminada.

O fluxo funcional é:

``` text
GardenDetailsScreen
        ↓
PlantListScreen
        ↓
PlantDetailsScreen
        ↓
PlantEvolutionListScreen
    ├── AddPlantEvolutionRecordScreen
    └── PlantEvolutionDetailsScreen
            ├── EditPlantEvolutionRecordScreen
            └── Eliminar rexistro
```

O núcleo local actual de MARTOLA dispón xa de CRUD persistente para:

``` text
Hortas
Plantas
Evolución das plantas
```

------------------------------------------------------------------------

## Conceptos clave da sesión 16

-   `PlantEvolutionRecord`.
-   Campos opcionais no dominio.
-   `NULL` en SQLite.
-   `REAL` en SQLite.
-   Relación 1:N planta → evolución.
-   `ON DELETE CASCADE` aplicado ao histórico.
-   SQLite `version: 3`.
-   Migración v2 → v3.
-   Migracións acumulativas.
-   Conservación dos datos existentes.
-   `PlantEvolutionRecordRepository`.
-   `SQLitePlantEvolutionRecordRepository`.
-   CRUD probado por capas.
-   Consulta mediante `plantId`.
-   `PlantEvolutionViewModel`.
-   `_currentPlantId` como estado contextual.
-   `MultiProvider` con varios ViewModels.
-   `initState()` para iniciar unha carga contextual.
-   `context.read()` para accións.
-   `context.watch()` para observar coleccións.
-   `context.select()` para observar unha entidade concreta.
-   Formularios con campos opcionais.
-   Conversión de campo baleiro a `null`.
-   `showDatePicker()`.
-   Estado local fronte a estado compartido.
-   Scope de variables.
-   Tratamento explícito de `record == null`.
-   Representación visual de valores nullable.
-   `CrossAxisAlignment.start` nunha `Column`.
-   Inicialización de formularios de edición.
-   Diferenza entre `addRecord()` e `updateRecord()`.
-   `AlertDialog` para confirmar accións destrutivas.
-   `context.mounted` despois de operacións asíncronas.
-   Sincronización Repository → ViewModel → View.

------------------------------------------------------------------------

## Regra principal da sesión 16

Un módulo novo non require necesariamente unha arquitectura nova.

Se o problema encaixa nun patrón xa probado, pode reutilizarse a mesma
separación de responsabilidades:

``` text
View
  ↓
ViewModel
  ↓
Repository
  ↓
SQLite
```

engadindo unicamente as regras propias do novo dominio.

No módulo de evolución esas regras son principalmente:

``` text
unha planta
    ↓
ten moitos rexistros
    ↓
os rexistros poden conter datos opcionais
    ↓
a súa vida depende da planta
```

A arquitectura mantense estable mentres o dominio evoluciona.

------------------------------------------------------------------------

# Sesión 17 - APIs REST e módulo meteorolóxico

## Obxectivo

Introducir o consumo dunha API REST real en MARTOLA e integrar a
información meteorolóxica coa arquitectura xa utilizada na aplicación.

Nesta sesión o fluxo deixa de limitarse a datos locais en SQLite e
incorpora unha fonte de datos remota:

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

A arquitectura mantén separadas a comunicación HTTP, o acceso aos datos,
o estado da interface e a presentación.

------------------------------------------------------------------------

## API

Unha API permite que dúas aplicacións ou sistemas se comuniquen mediante
unha interface definida.

Neste caso:

``` text
MARTOLA
   ↓
petición HTTP
   ↓
OpenWeather
   ↓
resposta JSON
   ↓
MARTOLA
```

MARTOLA non necesita coñecer como OpenWeather obtén ou almacena
internamente os datos meteorolóxicos.

Só necesita coñecer o contrato da API: endpoint, parámetros e formato da
resposta.

------------------------------------------------------------------------

## REST

REST é un estilo habitual para deseñar servizos accesibles mediante
HTTP.

Nunha API REST traballamos con recursos aos que accedemos mediante
peticións HTTP.

Na integración meteorolóxica utilizamos unha petición:

``` text
GET
```

porque MARTOLA está solicitando información e non modificando datos no
servidor.

### Regra

> A aplicación cliente debería depender do contrato público da API, non
> da implementación interna do servidor.

------------------------------------------------------------------------

## HTTP

HTTP é o protocolo utilizado para realizar a comunicación entre MARTOLA
e OpenWeather.

O fluxo básico dunha petición é:

``` text
cliente
   ↓
HTTP request
   ↓
servidor
   ↓
HTTP response
   ↓
cliente
```

A resposta inclúe, entre outras cousas:

-   un código de estado;
-   un corpo (`body`);
-   cabeceiras.

------------------------------------------------------------------------

## Paquete `http`

Engadiuse ao proxecto o paquete:

``` text
http
```

Este paquete permite realizar peticións HTTP desde Dart/Flutter.

A petición utilizada é conceptualmente:

``` dart
final response = await http.get(uri);
```

`http.get()` devolve un `Future` porque a resposta do servidor non está
dispoñible inmediatamente.

------------------------------------------------------------------------

## `Uri.https`

Para construír a dirección da petición utilizouse:

``` dart
Uri.https(...)
```

Isto permite separar:

``` text
host
path
query parameters
```

Por exemplo, conceptualmente:

``` text
api.openweathermap.org
        +
/data/2.5/weather
        +
lat
lon
appid
units
lang
```

Flutter constrúe a URI correctamente sen necesidade de concatenar
manualmente toda a URL.

### Regra

> Cando unha API recibe parámetros de consulta, é preferible construír a
> URI mediante as ferramentas específicas de `Uri` en lugar de
> concatenar Strings manualmente.

------------------------------------------------------------------------

## Query parameters

Os parámetros permiten enviar información adicional na petición.

Na consulta meteorolóxica utilizáronse:

``` text
lat
lon
appid
units
lang
```

Responsabilidades:

``` text
lat
→ latitude

lon
→ longitude

appid
→ API key

units=metric
→ unidades métricas

lang=gl
→ solicitar descricións en galego cando o provedor as ofrece
```

------------------------------------------------------------------------

## Código de estado HTTP

Unha resposta HTTP inclúe un código que indica o resultado da petición.

Accédese mediante:

``` dart
response.statusCode
```

Nesta sesión traballouse especialmente con:

``` text
200
401
5xx
```

### `200`

``` text
200 OK
```

indica que a petición se procesou correctamente.

Neste caso podemos interpretar o corpo da resposta.

### `401`

``` text
401 Unauthorized
```

indica neste contexto un problema coa API key.

Durante as primeiras probas apareceu este código mentres a clave aínda
non estaba activa ou non se estaba proporcionando correctamente.

### `5xx`

Os códigos:

``` text
500–599
```

representan erros do servidor.

Neste caso o problema non ten por que estar na aplicación cliente.

### Regra

> Unha petición HTTP completada non significa necesariamente unha
> operación correcta. Hai que comprobar o `statusCode`.

------------------------------------------------------------------------

## `response.body`

O corpo dunha resposta HTTP pode obterse mediante:

``` dart
response.body
```

OpenWeather devolve os datos meteorolóxicos en formato JSON.

Exemplo conceptual:

``` json
{
  "main": {
    "temp": 22.4,
    "humidity": 79
  },
  "weather": [
    {
      "description": "ceo claro"
    }
  ],
  "name": "Ourense"
}
```

------------------------------------------------------------------------

## JSON

JSON é un formato de intercambio de datos moi utilizado nas APIs.

Un obxecto JSON está formado principalmente por pares:

``` text
clave → valor
```

e pode conter:

-   Strings;
-   números;
-   booleanos;
-   `null`;
-   obxectos;
-   listas.

JSON é texto. Antes de traballar cos seus valores desde Dart debemos
decodificalo.

------------------------------------------------------------------------

## `jsonDecode()`

Utilízase:

``` dart
jsonDecode(response.body)
```

para converter o texto JSON nunha estrutura de datos que Dart poida
utilizar.

Conceptualmente:

``` text
String JSON
    ↓
jsonDecode()
    ↓
estrutura Dart
```

Para unha resposta JSON cuxo elemento raíz é un obxecto, normalmente
traballaremos cun:

``` dart
Map<String, dynamic>
```

------------------------------------------------------------------------

## `Map<String, dynamic>`

Un `Map` almacena pares:

``` text
clave → valor
```

Neste tipo:

``` dart
Map<String, dynamic>
```

as claves son `String`, mentres que os valores poden ter tipos
diferentes.

Isto encaixa ben cun JSON porque unha mesma resposta pode conter:

``` text
"temp"        → double
"humidity"    → int
"name"        → String
"weather"     → List
"main"        → Map
```

### Por que `dynamic`

O tipo exacto de cada valor non é necesariamente o mesmo.

Por iso non poderiamos representar toda a resposta como:

``` dart
Map<String, String>
```

sen perder a estrutura e os tipos reais dos datos.

### Regra

> `Map<String, dynamic>` é útil na fronteira coa resposta JSON, pero o
> resto da aplicación debería traballar preferentemente con modelos de
> dominio tipados.

------------------------------------------------------------------------

## JSON fronte a modelo de dominio

A View non debería acceder directamente a expresións como:

``` dart
data['main']['temp']
```

por toda a aplicación.

Creouse:

``` text
WeatherData
```

para representar os datos meteorolóxicos que MARTOLA necesita.

O fluxo é:

``` text
JSON
  ↓
Map<String, dynamic>
  ↓
WeatherData.fromJson()
  ↓
WeatherData
```

Isto permite que a estrutura externa da API quede concentrada nun punto
concreto.

### Regra

> Os datos externos deben transformarse canto antes nunha representación
> propia do dominio da aplicación.

------------------------------------------------------------------------

## `WeatherData`

`WeatherData` é o modelo utilizado para representar a información
meteorolóxica dentro de MARTOLA.

A súa responsabilidade é almacenar datos do dominio meteorolóxico que a
aplicación necesita utilizar.

Non é responsable de:

-   realizar peticións HTTP;
-   xestionar Provider;
-   mostrar widgets;
-   decidir como se obtén a API key.

------------------------------------------------------------------------

## `WeatherService`

Creouse:

``` text
WeatherService
```

como responsable da comunicación directa coa API.

Conceptualmente:

``` text
coordenadas
    ↓
WeatherService
    ↓
construír URI
    ↓
http.get()
    ↓
statusCode
    ↓
jsonDecode()
    ↓
WeatherData
```

O Service coñece:

-   o host de OpenWeather;
-   o endpoint;
-   os parámetros HTTP;
-   o formato da resposta;
-   os códigos de erro relevantes.

Non debe coñecer a interface gráfica.

------------------------------------------------------------------------

## Service fronte a Repository

O Service e o Repository teñen responsabilidades diferentes.

### Service

Coñece os detalles técnicos do servizo externo:

``` text
URL
HTTP
JSON
statusCode
API concreta
```

### Repository

Define como a aplicación accede a un tipo de datos.

Neste caso:

``` text
WeatherRepository
```

expón conceptualmente:

``` text
getCurrentWeather(...)
```

sen obrigar ao ViewModel a saber que os datos proceden de OpenWeather.

O fluxo é:

``` text
WeatherViewModel
       ↓
WeatherRepository
       ↑
OpenWeatherRepository
       ↓
WeatherService
       ↓
OpenWeather
```

### Regra

> O ViewModel debe pedir datos meteorolóxicos; non debería necesitar
> saber como se constrúe unha petición HTTP para obtelos.

------------------------------------------------------------------------

## Contrato `WeatherRepository`

Definiuse unha abstracción:

``` dart
abstract class WeatherRepository
```

O contrato establece que unha implementación meteorolóxica debe ser
capaz de obter as condicións actuais a partir de coordenadas.

Isto desacopla a aplicación do provedor concreto.

Conceptualmente:

``` text
WeatherRepository
       ↑
       ├── OpenWeatherRepository
       └── posible implementación MeteoSIX
```

------------------------------------------------------------------------

## Un Service por provedor

Se no futuro MARTOLA utiliza OpenWeather e MeteoSIX, cada API pode ter o
seu propio Service.

Por exemplo:

``` text
OpenWeatherService
      ↓
OpenWeather API
```

e:

``` text
MeteoSixService
      ↓
MeteoSIX API
```

Isto ten sentido porque poden cambiar:

-   endpoints;
-   parámetros;
-   autenticación;
-   estrutura JSON;
-   códigos ou regras específicas.

Ambas implementacións poden adaptarse posteriormente ao mesmo contrato
`WeatherRepository`.

### Regra

> Unha abstracción común non implica que dúas APIs diferentes deban
> compartir a mesma implementación técnica.

------------------------------------------------------------------------

## `WeatherException`

Creouse unha excepción específica:

``` text
WeatherException
```

para representar erros relacionados coa obtención da meteoroloxía.

Isto permite evitar que o Service devolva simplemente:

``` text
null
```

ante calquera problema.

`null` podería significar ausencia de datos, mentres que unha excepción
expresa que a operación fallou.

Exemplos tratados:

``` text
401
→ API key non válida

5xx
→ erro no servidor meteorolóxico

outro statusCode
→ erro HTTP
```

### Regra

> Se unha operación falla, é preferible representar explicitamente o
> erro cando a ausencia dun valor non describe correctamente o que
> ocorreu.

------------------------------------------------------------------------

## `Future<WeatherData>`

A consulta meteorolóxica é asíncrona.

Por iso o Service devolve:

``` dart
Future<WeatherData>
```

Isto significa:

``` text
agora
→ a operación comeza

máis tarde
→ obteremos WeatherData
   ou producirase un erro
```

`Future` xa fora introducido con navegación e persistencia, pero nesta
sesión utilízase tamén para comunicación de rede.

------------------------------------------------------------------------

## `async` e `await` nunha petición HTTP

Utilízase:

``` dart
final response = await http.get(uri);
```

`await` suspende a continuación desa función ata que o `Future` se
complete, sen bloquear a aplicación do mesmo xeito que unha espera
síncrona tradicional.

Conceptualmente:

``` text
enviar petición
      ↓
esperar resposta
      ↓
continuar cando chega
```

Para utilizar `await`, a función declárase:

``` dart
async
```

------------------------------------------------------------------------

## Propagación dun `Future`

Non sempre é necesario utilizar `async` e `await` en todas as capas.

Por exemplo, un Repository que simplemente devolve o resultado do
Service pode facer:

``` dart
return weatherService.getCurrentWeather(...);
```

O `Future<WeatherData>` propágase directamente.

### Regra

> Non engadas `async` e `await` se unha función só necesita devolver
> directamente o `Future` recibido doutra chamada.

------------------------------------------------------------------------

## Compatibilidade de tipos en `Future`

Se un método declara:

``` dart
Future<WeatherData>
```

non pode devolver unha función cuxo tipo sexa:

``` dart
Future<WeatherData?>
```

porque:

``` text
WeatherData
```

garante un valor, mentres:

``` text
WeatherData?
```

permite tamén `null`.

Durante a implementación apareceu este erro ao non estar gardada aínda a
última versión do Service.

### Regra

> A nullability forma parte do tipo. `T` e `T?` non representan o mesmo
> contrato.

------------------------------------------------------------------------

## `WeatherViewModel`

`WeatherViewModel` mantén o estado meteorolóxico utilizado pola
interface.

O estado inclúe conceptualmente:

``` text
WeatherData?
bool isLoading
String? errorMessage
```

A operación:

``` text
loadCurrentWeather()
```

coordina a carga dos datos.

Fluxo:

``` text
View
  ↓
loadCurrentWeather()
  ↓
isLoading = true
  ↓
Repository
  ↓
resultado ou erro
  ↓
actualizar estado
  ↓
isLoading = false
  ↓
notifyListeners()
```

------------------------------------------------------------------------

## Estados dunha operación asíncrona

Unha petición remota non ten só dous estados.

Na interface debemos poder representar polo menos:

``` text
cargando
éxito
erro
sen datos
```

Por iso non é suficiente comprobar unicamente:

``` dart
weatherData != null
```

A interface utiliza tamén:

``` text
isLoading
errorMessage
```

Conceptualmente:

``` text
isLoading == true
    ↓
CircularProgressIndicator

errorMessage != null
    ↓
mensaxe de erro

weatherData != null
    ↓
WeatherCard

sen ningún dos anteriores
    ↓
mensaxe sen datos
```

### Regra

> O estado dunha operación asíncrona debe representar explicitamente as
> situacións que a interface necesita distinguir.

------------------------------------------------------------------------

## `context.watch<WeatherViewModel>()`

No Dashboard utilizouse:

``` dart
context.watch<WeatherViewModel>()
```

porque a pantalla necesita reconstruírse cando cambia o estado
meteorolóxico.

Por exemplo:

``` text
isLoading cambia
       ↓
notifyListeners()
       ↓
Dashboard rebuild

weatherData cambia
       ↓
notifyListeners()
       ↓
Dashboard rebuild
```

------------------------------------------------------------------------

## `context.read<WeatherViewModel>()`

Para iniciar unha acción sen subscribirse aos cambios utilízase:

``` dart
context.read<WeatherViewModel>()
```

Neste caso serve para chamar:

``` text
loadCurrentWeather()
```

A regra xa aprendida con Provider mantense:

``` text
read
→ executar unha acción sen escoitar

watch
→ acceder e reaccionar aos cambios

select
→ reaccionar só a unha parte concreta
```

------------------------------------------------------------------------

## `initState()`

A carga meteorolóxica inicial debe executarse unha vez cando se crea o
estado do Dashboard.

Por iso `DashboardScreen` pasou a ser:

``` text
StatefulWidget
```

e a inicialización comeza desde:

``` dart
initState()
```

`initState()` execútase unha vez ao crear ese `State`.

Non debe confundirse con:

``` dart
build()
```

que pode executarse moitas veces.

------------------------------------------------------------------------

## Por que non iniciar a carga directamente durante `build()`

`loadCurrentWeather()` modifica o estado do ViewModel e executa:

``` dart
notifyListeners()
```

Se isto ocorre mentres Flutter está construíndo a árbore pode
producirse:

``` text
setState() or markNeedsBuild() called during build
```

O problema conceptual é:

``` text
Flutter está construíndo
       ↓
chamamos loadCurrentWeather()
       ↓
notifyListeners()
       ↓
pedimos outro rebuild
       ↓
a construción actual aínda non rematou
```

------------------------------------------------------------------------

## `WidgetsBinding.instance.addPostFrameCallback()`

Para iniciar a carga despois do primeiro frame utilizouse:

``` dart
WidgetsBinding.instance.addPostFrameCallback(...)
```

Conceptualmente:

``` text
initState()
    ↓
rexistrar callback
    ↓
Flutter completa o primeiro frame
    ↓
executar callback
    ↓
loadCurrentWeather()
    ↓
notifyListeners()
```

Deste modo a modificación do estado observable non se produce durante a
construción inicial.

### Regra

> Se unha inicialización necesita provocar unha notificación que non
> pode realizarse durante a fase de construción, pode programarse para
> despois do primeiro frame.

------------------------------------------------------------------------

## `String.fromEnvironment()`

Para evitar escribir a API key directamente no código utilizouse:

``` dart
String.fromEnvironment(...)
```

Este mecanismo permite obter un valor definido no contorno de
compilación de Dart.

Conceptualmente:

``` text
valor externo
     ↓
compilación / execución Flutter
     ↓
String.fromEnvironment()
     ↓
aplicación
```

A clave pode proporcionarse mediante:

``` text
--dart-define
```

ou:

``` text
--dart-define-from-file
```

------------------------------------------------------------------------

## `--dart-define-from-file`

Durante o desenvolvemento utilizouse un ficheiro local de configuración
para proporcionar a clave.

Conceptualmente:

``` text
config/secrets.json
        ↓
--dart-define-from-file
        ↓
String.fromEnvironment()
        ↓
WeatherService
```

Isto evita ter que escribir a clave directamente nos ficheiros Dart.

------------------------------------------------------------------------

## `.gitignore` e segredos

O ficheiro real que contén a API key debe quedar excluído do
repositorio.

Por iso:

``` text
config/secrets.json
```

está incluído no `.gitignore`.

En cambio pode versionarse un ficheiro de exemplo:

``` text
config/secrets.example.json
```

sen credenciais reais.

### Regra

> Os segredos locais non deben subirse ao repositorio.

------------------------------------------------------------------------

## Unha API key nun executable cliente non é un segredo absoluto

`String.fromEnvironment()` e un ficheiro local evitan publicar
accidentalmente a clave no código fonte ou no repositorio.

Porén, se unha aplicación distribuída necesita utilizar directamente
unha API key, algún valor equivalente acaba formando parte do proceso de
construción ou do executable.

Isto significa que esta solución é apropiada para configuración e para
evitar filtracións accidentais no repositorio, pero non debe confundirse
cun almacén de segredos completamente inaccesible.

Nunha arquitectura con backend propio podería facerse:

``` text
MARTOLA
   ↓
backend propio
   ↓
API externa
```

e manter a credencial sensible no servidor.

------------------------------------------------------------------------

## Datos meteorolóxicos en memoria fronte a persistencia

`WeatherData` representa actualmente información obtida da API e
utilizada en memoria.

Non implica automaticamente que eses datos deban gardarse en SQLite.

Actualmente:

``` text
OpenWeather
    ↓
WeatherData
    ↓
WeatherViewModel
    ↓
View
```

Non existe aínda:

``` text
WeatherData
    ↓
weather_records
    ↓
SQLite
```

A persistencia será necesaria cando se implemente o histórico
meteorolóxico.

### Regra

> Un modelo utilizado pola aplicación non ten que corresponder
> necesariamente cunha táboa persistente.

------------------------------------------------------------------------

## Localización mediante coordenadas

A API meteorolóxica consulta os datos mediante:

``` text
latitude
longitude
```

Nas probas utilizáronse coordenadas coñecidas de Ourense para validar
primeiro a integración completa.

No futuro a localización poderá proceder do contexto dunha horta.

Tamén poderá valorarse a selección mediante:

-   localidade;
-   mapa;
-   coordenadas.

A forma de seleccionar a localización é unha responsabilidade diferente
da obtención dos datos meteorolóxicos.

------------------------------------------------------------------------

## OpenWeather e MeteoSIX

OpenWeather utilízase como primeira implementación real porque permite
probar xa o módulo meteorolóxico.

MeteoSIX queda como posible segundo provedor.

A separación arquitectónica permite pensar en:

``` text
WeatherViewModel
       ↓
WeatherRepository
       ↑
       ├── OpenWeatherRepository
       └── MeteoSixRepository
```

sen obrigar ao ViewModel a coñecer os detalles de cada API.

Cada implementación pode utilizar o seu propio Service.

------------------------------------------------------------------------

## Evolución de `WeatherCard`

`WeatherCard` xa existía como compoñente de presentación e inicialmente
recibía datos ficticios.

Antes:

``` text
Dashboard
   ↓
mock data
   ↓
WeatherCard
```

Agora:

``` text
OpenWeather
   ↓
WeatherService
   ↓
Repository
   ↓
WeatherViewModel
   ↓
Dashboard
   ↓
WeatherCard
```

A interface pública do widget permite substituír a orixe dos datos sen
que `WeatherCard` necesite coñecela.

### Regra

> Un widget de presentación ben desacoplado pode pasar de mock data a
> datos reais sen asumir responsabilidades de acceso aos datos.

------------------------------------------------------------------------

## Conceptos clave da sesión 17

-   API.
-   REST.
-   HTTP.
-   Petición `GET`.
-   Paquete `http`.
-   `http.get()`.
-   `Uri.https()`.
-   Query parameters.
-   `response.statusCode`.
-   Código `200`.
-   Código `401`.
-   Erros `5xx`.
-   `response.body`.
-   JSON.
-   `jsonDecode()`.
-   `Map<String, dynamic>`.
-   Conversión JSON → modelo.
-   `WeatherData`.
-   Fonte de datos remota.
-   `WeatherService`.
-   Separación Service / Repository.
-   `WeatherRepository`.
-   `OpenWeatherRepository`.
-   Contrato e implementación.
-   Preparación para múltiples provedores.
-   `WeatherException`.
-   Excepción fronte a `null`.
-   `Future<WeatherData>`.
-   Compatibilidade entre `Future<T>` e `Future<T?>`.
-   Propagación directa dun `Future`.
-   `async`.
-   `await`.
-   `WeatherViewModel`.
-   Estado de carga.
-   Estado de erro.
-   Estado de éxito.
-   Estado sen datos.
-   `notifyListeners()`.
-   `context.read()`.
-   `context.watch()`.
-   `StatefulWidget` por necesidades de ciclo de vida.
-   `initState()`.
-   Fase de construción de Flutter.
-   `WidgetsBinding.instance.addPostFrameCallback()`.
-   `String.fromEnvironment()`.
-   `--dart-define`.
-   `--dart-define-from-file`.
-   `.gitignore`.
-   Configuración local de credenciais.
-   Diferenza entre ocultar unha clave do repositorio e protexela nun
    executable cliente.
-   Datos remotos en memoria fronte a persistencia SQLite.
-   Coordenadas xeográficas.
-   Desacoplamento entre selección da localización e consulta
    meteorolóxica.
-   OpenWeather como primeira implementación.
-   MeteoSIX como posible implementación futura.
-   Substitución de mock data por datos reais.

------------------------------------------------------------------------

## Regra principal da sesión 17

Unha fonte de datos remota pode integrarse mantendo a mesma separación
de responsabilidades empregada no resto da aplicación.

Neste caso:

``` text
View
  ↓
ViewModel
  ↓
Repository
  ↓
Service
  ↓
API REST
```

Cada capa responde a unha pregunta diferente:

``` text
View
→ Como se mostra o estado?

ViewModel
→ Que estado necesita a interface?

Repository
→ Como accede a aplicación aos datos meteorolóxicos?

Service
→ Como se comunica tecnicamente co provedor?

API
→ De onde proceden os datos?
```

A consecuencia máis importante é que a interface non queda acoplada a
OpenWeather.

MARTOLA pode evolucionar cara a outro provedor, como MeteoSIX, mantendo
estables as capas superiores sempre que se respecte o contrato definido
polo Repository.
