# LEARNING_NOTES.md

# MARTOLA - Flutter Learning Notes

## Purpose

Este documento recolle os conceptos aprendidos durante o desenvolvemento de MARTOLA.

Non pretende substituír a documentación oficial de Flutter, senón servir como guía de consulta rápida cos conceptos fundamentais que se vaian aprendendo ao longo do proxecto.

---

# Filosofía de Flutter

Flutter está baseado na composición de widgets.

Unha interface non se constrúe modificando elementos existentes, senón combinando widgets pequenos, cada un cunha responsabilidade concreta.

Os widgets describen como debe verse a interface.

O Flutter Engine é o encargado de debuxala na pantalla.

Principios fundamentais:

- Todo é un Widget.
- Cada Widget ten unha única responsabilidade.
- A interface constrúese mediante composición.
- O estado determina a interface.
- Flutter reconstrúe só o necesario cando cambia o estado.

---

# Patróns de pensamento

## Antes de aprender un widget

Pregunta sempre:

> Cal é a responsabilidade deste widget?

---

## Antes de aprender unha propiedade

Pregunta:

> Que problema intenta resolver?

---

## Antes de memorizar unha API

Pregunta:

> Podo deducila a partir da responsabilidade do widget?

---

## Antes de engadir un widget novo

Pregunta:

> Xa existe outro widget que resolva este problema dunha forma máis simple?

---

# Lesson 1 - Flutter Fundamentals

## Flutter

Flutter é un framework desenvolvido por Google para crear aplicacións multiplataforma.

A súa principal característica é que debuxa toda a interface mediante widgets, independentemente do sistema operativo.

---

## Flutter Framework

É a parte escrita en Dart.

Contén:

- Widgets
- MaterialApp
- Scaffold
- Navigator
- Theme
- etc.

O framework describe como debe ser a interface.

---

## Flutter Engine

É o motor interno de Flutter.

Está escrito principalmente en C++.

É o encargado de:

- debuxar a interface
- comunicarse co sistema operativo
- acceder á GPU
- procesar eventos do rato e teclado

O programador normalmente traballa co Framework, non co Engine.

---

## Widget

Un Widget é a unidade básica coa que se constrúe a interface dunha aplicación Flutter.

Pode representar:

- un elemento visual (Text)
- unha estrutura (Column)
- unha aliñación (Center)
- un espazado (Padding)
- unha pantalla completa (HomeScreen)

Un Widget non debuxa a pantalla.

Describe como debe verse.

---

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

---

## main()

É o punto de entrada da aplicación.

Flutter comeza a executarse desde esta función.

---

## runApp()

runApp() recibe o Widget raíz da aplicación.

A partir del Flutter constrúe toda a árbore de Widgets.

Non é un Widget.

É unha función.

---

## Widget raíz

É o primeiro Widget da aplicación.

No proxecto MARTOLA é:

MartolaApp

Todos os demais Widgets dependen del.

---

## StatelessWidget

Representa un Widget cuxos datos non cambian durante a súa vida.

Exemplos:

- Logo
- Texto fixo
- Icona decorativa

Características:

- máis sinxelo
- máis eficiente
- permite utilizar const cando sexa posible

---

## StatefulWidget

Representa un Widget cuxos datos poden cambiar.

Exemplos:

- Campo de texto
- Lista de hortas
- Información meteorolóxica
- Contador

O Widget non cambia.

Cambian os datos que utiliza.

---

## Estado

O estado son os datos empregados por un Widget para construír a súa interface.

Cando o estado cambia:

Flutter executa novamente build().

---

## const

Indica que un obxecto é inmutable e coñécese en tempo de compilación.

Flutter pode reutilizalo sen necesidade de crear unha nova instancia.

Sempre que sexa posible utilizarase const.

---

## build()

É o método principal dun Widget.

A súa misión é construír e devolver a descrición da interface segundo o estado actual da aplicación.

Non debuxa píxeles.

Describe como debe verse a interface.

---

## BuildContext

Representa a posición dun Widget dentro da árbore.

Permite acceder a información do seu contorno.

Exemplos:

- Theme
- Navigator
- MediaQuery
- Providers

Non representa a aplicación completa.

Representa o contexto dese Widget.

---

## MaterialApp

É o Widget que configura a aplicación baseada en Material Design.

Entre outras cousas define:

- tema
- navegación
- título
- pantalla inicial

---

## Scaffold

É o esqueleto básico dunha pantalla Material.

Pode conter:

- AppBar
- Body
- Drawer
- BottomNavigationBar
- FloatingActionButton

---

## Center

Widget encargado de centrar o seu Widget fillo.

Non modifica outros Widgets.

Simplemente describe unha aliñación.

---

## Composición

Flutter constrúe interfaces combinando Widgets pequenos.

Exemplo:

Padding

↓

Center

↓

Text

Cada Widget realiza unha única tarefa.

---

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

- reutilización
- mantemento
- probas
- reconstrución eficiente

---

## Filosofía de Flutter

Flutter non modifica a interface existente.

Cada vez que cambia o estado:

1. Executa build().
2. Obtén unha nova descrición da interface.
3. Compara coa anterior.
4. Actualiza só o necesario.

---

# Ideas clave

- Todo en Flutter é un Widget.
- Un Widget describe, non debuxa.
- Flutter funciona mediante composición.
- Os Widgets deben ser pequenos.
- Os Widgets deben ter unha única responsabilidade.
- StatelessWidget → os datos non cambian.
- StatefulWidget → os datos poden cambiar.
- build() describe a interface segundo o estado actual.
- O Engine debuxa; o Framework describe.

---

## Regra do eixe principal

Antes de utilizar `mainAxisAlignment` ou `crossAxisAlignment`, identifica primeiro cal é a responsabilidade do widget.

**Pregunta clave:**

> Como organiza este widget os seus widgets fillos (`children`)?

A resposta indica automaticamente cal é o eixe principal.

### Column

Responsabilidade:

Organizar os widgets verticalmente.

- Eixe principal → Vertical
- Eixe secundario → Horizontal

Polo tanto:

- `mainAxisAlignment` controla a distribución vertical.
- `crossAxisAlignment` controla a aliñación horizontal.

---

### Row

Responsabilidade:

Organizar os widgets horizontalmente.

- Eixe principal → Horizontal
- Eixe secundario → Vertical

Polo tanto:

- `mainAxisAlignment` controla a distribución horizontal.
- `crossAxisAlignment` controla a aliñación vertical.

---

### Regra práctica

Nunca memorices que fai `mainAxisAlignment` ou `crossAxisAlignment`.

Primeiro responde:

> **Como organiza os seus widgets fillos este widget?**

Unha vez identificado o eixe principal, o resto dedúcese automaticamente.

---

# Lesson 3 - Layout

## Column

Widget encargado de organizar varios widgets verticalmente.

Cada widget fillo colócase debaixo do anterior.

### Responsabilidade

Organizar widgets no eixe vertical.

---

## Row

Widget encargado de organizar varios widgets horizontalmente.

Cada widget fillo colócase ao lado do anterior.

### Responsabilidade

Organizar widgets no eixe horizontal.

---

## Main Axis

É o eixe principal segundo o cal un widget organiza os seus widgets fillos.

### Column

Main Axis → Vertical

### Row

Main Axis → Horizontal

---

## Cross Axis

É o eixe perpendicular ao Main Axis.

### Column

Cross Axis → Horizontal

### Row

Cross Axis → Vertical

---

## MainAxisAlignment

Controla como se distribúen os widgets ao longo do Main Axis.

Non depende do nome "horizontal" ou "vertical".

Depende sempre do eixe principal do widget.

---

## CrossAxisAlignment

Controla a aliñación dos widgets ao longo do Cross Axis.

---

## Regra do eixe principal

Antes de utilizar `mainAxisAlignment` ou `crossAxisAlignment`, identifica primeiro a responsabilidade do widget.

Pregunta clave:

> Como organiza este widget os seus widgets fillos?

Se a resposta é:

- Vertical → Main Axis = Vertical
- Horizontal → Main Axis = Horizontal

O resto dedúcese automaticamente.

---

## Filosofía da API de Flutter

Flutter intenta que a súa API sexa coherente e escalable.

As propiedades adoitan representarse mediante enums (`MainAxisAlignment`, `CrossAxisAlignment`) en lugar de valores booleanos ou cadeas de texto.

Isto permite:

- Maior claridade.
- Mellor autocompletado.
- Comprobación en tempo de compilación.
- APIs máis flexibles e fáciles de ampliar.

---

## Concepto da sesión

Antes de aprender unha propiedade dun widget, identifica primeiro a súa responsabilidade.

A maior parte da API de Flutter pode deducirse a partir desa responsabilidade.

---

# Erros frecuentes

## Confundir Widget con elemento visual

Un Widget non sempre representa un elemento visible.

Exemplos:

- Padding
- Center
- SizedBox

Tamén son Widgets.

---

## Pensar que build() debuxa a pantalla

Incorrecto.

build() describe a interface.

É o Engine quen a debuxa.

---

## Memorizar MainAxisAlignment

Non é necesario.

Primeiro identifica o Main Axis.

O resto dedúcese automaticamente.

---

# Regra de ouro

En Flutter non memorices primeiro a API.

Comprende primeiro a responsabilidade do widget.

Na maioría dos casos, a API poderá deducirse de forma natural.

---

## Regra da composición

En Flutter é preferible combinar varios widgets pequenos cunha única responsabilidade antes que utilizar un widget grande con múltiples opcións.

Vantaxes:

- Reutilización.
- Mantemento.
- Lexibilidade.
- Flexibilidade.
- Testabilidade.

A composición é un dos principios fundamentais de Flutter.

---

# Lesson 5 - First Real Screen

## AppBar

Widget que representa a barra superior dunha pantalla Material.

Pode conter:

- título
- accións
- botón de navegación
- menú

Forma parte da estrutura proporcionada por Scaffold.

---

## SafeArea

Widget que garante que o seu contido permaneza dentro da zona segura do dispositivo.

Evita que outros widgets queden ocultos por:

- notch
- cámara frontal
- barra de estado
- xestos do sistema

---

## ElevatedButton

Botón Material con elevación.

A súa responsabilidade é ofrecer unha acción principal ao usuario.

Se `onPressed` é:

```dart
null
```

o botón queda automaticamente desactivado.

---

## Arquitectura dunha pantalla

Antes de implementar unha pantalla é recomendable definir a súa árbore de widgets.

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

---

## Regra da arquitectura

Primeiro deseña a estrutura.

Despois escribe o código.

É moito máis sinxelo corrixir unha arquitectura que unha implementación xa rematada.

---

## Concepto da sesión

Construír unha pantalla Flutter consiste en combinar widgets pequenos, cada un cunha responsabilidade concreta, ata formar unha interface completa.

---

# Lesson 6 - Refactoring & Theme

## Refactorización

Refactorizar consiste en mellorar a estrutura interna do código sen modificar o seu comportamento.

Unha boa refactorización:

- Reduce duplicación.
- Mellora a lexibilidade.
- Facilita o mantemento.
- Non modifica o resultado visible da aplicación.

---

## Widgets reutilizables

Un widget debe extraerse cando representa unha responsabilidade propia que pode utilizarse en máis dun lugar.

Exemplo:

MartolaLogo

Responsabilidade:

Mostrar a identidade visual da aplicación.

Non debe incluír botóns nin accións porque pertencen a responsabilidades diferentes.

---

## ThemeData

`ThemeData` centraliza a configuración visual da aplicación.

Permite definir:

- cores
- tipografías
- botóns
- AppBar
- formularios
- iconografía

Todos os widgets poden acceder ao tema mediante:

```dart
Theme.of(context)
```

---

## ColorScheme

`ColorScheme` define os diferentes roles de cor da aplicación.

Exemplo:

- primary
- secondary
- surface
- error

Os widgets deben utilizar estes roles en lugar de cores fixas.

Incorrecto:

```dart
color: Colors.green
```

Correcto:

```dart
color: Theme.of(context).colorScheme.primary
```

---

## Concepto da sesión

Primeiro conseguimos que unha aplicación funcione.

Despois organizamos o código para que sexa fácil de manter.

---

# Regra do Navigator

push()

→ Engade unha pantalla enriba da pila.

pop()

→ Elimina a pantalla superior da pila.

A pantalla anterior nunca desaparece mentres permaneza na pila.

---

## Navigator e a pila de rutas

O `Navigator` mantén unha pila (stack) de rutas.

- `push()` engade unha nova ruta enriba da pila.
- `pop()` elimina a ruta superior.

Cada chamada a `push()` crea unha nova ruta, aínda que xa exista outra pantalla do mesmo tipo na pila.

As rutas inferiores permanecen na pila ata que son eliminadas explicitamente.

---

# Lesson 7 - Navigation

## Navigator

O Navigator xestiona a navegación mediante unha pila (stack) de rutas.

Cada pantalla normalmente corresponde a unha ruta.

---

## push()

Engade unha nova ruta enriba da pila.

A pantalla anterior permanece na pila.

---

## pop()

Elimina a ruta superior da pila.

A pantalla anterior volve mostrarse.

---

## MaterialPageRoute

Representa unha ruta Material que sabe como construír unha pantalla.

---

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

---

## SingleChildScrollView

Permite desprazar vertical ou horizontalmente un único widget fillo.

Habitualmente utilízase xunto cunha Column para pantallas cun número reducido de elementos que poden exceder o tamaño da pantalla.

---

## Column vs SingleChildScrollView vs ListView

Column

- Sen scroll.
- Poucos elementos.

SingleChildScrollView + Column

- Poucos elementos.
- Scroll completo.

ListView

- Moitos elementos.
- Construción eficiente dos elementos visibles.

---

## Concepto da sesión

A navegación en Flutter baséase nunha pila de rutas, non nun cambio directo dunha pantalla a outra.

---

## Regra para organizar widgets

Un widget debe permanecer preto da funcionalidade á que pertence.

Só debe moverse a `lib/widgets/` cando exista unha necesidade real de reutilizalo noutras partes da aplicación.

Non se deben crear compoñentes globais "por se acaso".

Primeiro constrúese para resolver un problema concreto.

Despois reutilízase cando aparece unha segunda necesidade real.

---

## Regra dos callbacks

Un widget reutilizable debería expoñer as accións mediante callbacks en lugar de decidir directamente a navegación ou a lóxica externa.

O widget define **cando ocorre unha acción**.

O widget pai decide **que debe facer esa acción**.

Isto reduce o acoplamento e facilita a reutilización.

---

# Lesson 8 - Reusable Components and Callbacks

## Deseño dun widget

Antes de implementar un widget débese determinar:

1. Cal é a súa responsabilidade.
2. Que datos necesita.
3. Que accións debe expoñer.
4. Como se organizará visualmente.

Un widget debe recibir só a información necesaria para cumprir a súa responsabilidade.

---

## Datos mediante o construtor

Os widgets poden recibir datos desde o widget pai:

```dart
const WeatherCard(
  temperature: 28,
  condition: 'Ceo despexado',
  location: 'Ourense',
)
```

Isto permite separar a presentación da orixe dos datos.

Os datos poden ser ficticios (`mock data`) durante as primeiras fases do desenvolvemento. Isto permite construír e probar a interface antes de dispoñer de SQLite, APIs ou outras fontes de datos reais.

---

## Interface pública dun widget

Os parámetros do construtor forman parte da interface pública do widget.

Por exemplo:

```dart
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

- Un dato: `gardenCount`.
- Un comportamento: `onViewGardens`.

A implementación interna do widget pode cambiar sen que necesariamente cambie esta interface.

---

## Callbacks

Un widget pode recibir non só datos, senón tamén comportamento.

En Flutter podemos utilizar, entre outros mecanismos, `VoidCallback`:

```dart
final VoidCallback onViewGardens;
```

O widget fillo pode executar ese callback cando se produce unha interacción:

```dart
TextButton(
  onPressed: onViewGardens,
  child: const Text('Ver hortas'),
)
```

O widget pai determina posteriormente que debe ocorrer:

```dart
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

Por exemplo, `GardenCard` sabe que existe unha acción chamada "Ver hortas", pero non necesita saber a que pantalla debe navegar.

Isto reduce o acoplamento e facilita a reutilización dos widgets.

---

## Separación entre presentación e comportamento

Un widget de presentación non debería asumir responsabilidades que pertencen a outros niveis da aplicación.

Por exemplo, en lugar de introducir directamente dentro de `GardenCard`:

```dart
Navigator.of(context).push(...);
```

a tarxeta expón:

```dart
final VoidCallback onViewGardens;
```

e deixa que `DashboardScreen` decida o comportamento.

Deste xeito:

- `GardenCard` é responsable de mostrar información sobre as hortas.
- `DashboardScreen` coñece o fluxo da pantalla e decide que facer coa acción.
- A navegación non queda acoplada ao widget visual.

---

## Organización de widgets

Un widget debe permanecer preto da funcionalidade á que pertence.

Por exemplo:

```text
views/
└── dashboard/
    ├── dashboard_screen.dart
    └── widgets/
        ├── weather_card.dart
        ├── garden_card.dart
        ├── tasks_card.dart
        └── quick_actions_card.dart
```

Só debe moverse a `lib/widgets/` cando exista unha necesidade real de reutilizalo noutras funcionalidades.

Non se deben crear compoñentes globais "por se acaso".

Primeiro constrúese o widget para resolver unha necesidade concreta e posteriormente refactorízase se aparece unha necesidade real de reutilización.

---

## Card

`Card` é un widget de Material Design pensado para representar un bloque de información relacionado visualmente.

No Dashboard utilizámolo como base dos distintos compoñentes:

- `WeatherCard`
- `GardenCard`
- `TasksCard`
- `QuickActionsCard`

Cada tarxeta representa unha responsabilidade diferente.

---

## SingleChildScrollView

`SingleChildScrollView` permite facer scroll sobre un único widget fillo.

Pode combinarse cunha `Column` cando unha pantalla ten un número reducido de bloques pero estes poden superar o espazo visible.

Estrutura utilizada no Dashboard:

```text
SafeArea
└── Padding
    └── SingleChildScrollView
        └── Column
            ├── WeatherCard
            ├── GardenCard
            ├── TasksCard
            └── QuickActionsCard
```

A `Column` organiza os elementos verticalmente e `SingleChildScrollView` permite desprazalos cando non caben no espazo dispoñible.

---

## SafeArea

`SafeArea` evita que o contido quede oculto por zonas reservadas ou elementos físicos e de sistema do dispositivo.

Por exemplo:

- Barra de estado.
- Notches ou recortes.
- Outras zonas reservadas polo sistema.

---

## Padding

`Padding` introduce separación entre o seu widget fillo e os límites que o rodean.

No Dashboard utilizamos:

```dart
const EdgeInsets.all(16)
```

para evitar que as tarxetas queden pegadas aos bordos da zona dispoñible.

---

## Column e os seus eixes

Nunha `Column`:

- O eixe principal (`main axis`) é o vertical.
- O eixe secundario (`cross axis`) é o horizontal.

Por tanto:

```dart
crossAxisAlignment: CrossAxisAlignment.stretch
```

actúa sobre o eixe horizontal.

---

## CrossAxisAlignment.stretch

`CrossAxisAlignment.stretch` fai que os fillos dunha `Column` intenten ocupar todo o espazo dispoñible no seu eixe secundario.

Nunha `Column`, isto significa estender os fillos horizontalmente.

Non significa necesariamente ocupar todo o ancho da pantalla.

Os widgets ocupan o ancho que lles permite o seu pai.

No Dashboard:

```text
Pantalla
└── SafeArea
    └── Padding (16)
        └── SingleChildScrollView
            └── Column (stretch)
                └── WeatherCard
```

A `WeatherCard` esténdese polo ancho dispoñible dentro do `Padding`, non ata os bordos físicos da pantalla.

Isto tamén permite que o contido se adapte cando cambia o tamaño da ventá.

---

## Theme dentro dos compoñentes

En lugar de definir estilos independentes en cada widget:

```dart
TextStyle(
  fontSize: 32,
)
```

podemos utilizar os estilos centralizados no `Theme`:

```dart
Theme.of(context).textTheme.titleLarge
```

ou cores:

```dart
Theme.of(context).colorScheme.primary
```

Isto facilita:

- Manter a coherencia visual.
- Modificar o deseño desde un punto central.
- Evitar valores visuais repetidos por toda a aplicación.

---

## Xerarquía visual

Non toda a información dunha interface ten a mesma importancia.

Os elementos máis importantes deben destacar visualmente mediante recursos como:

- Tamaño.
- Peso tipográfico.
- Cor.
- Posición.
- Espazado.

Por exemplo, en `WeatherCard` a temperatura é un dos datos principais e debe ter máis peso visual que a descrición do estado do ceo.

---

## Accións no contexto adecuado

Unha acción debe situarse no contexto no que ten sentido.

Durante o deseño do Dashboard considerouse incluír:

- Crear nova horta.
- Engadir nova tarefa.
- Engadir planta.

Decidiuse non incluír `Engadir planta` nas accións rápidas do Dashboard porque unha planta debe estar asociada a unha horta concreta.

Polo tanto, esta acción terá máis sentido dentro do contexto dunha horta seleccionada.

### Regra

**As accións deberían aparecer no contexto no que teñen sentido.**

Isto pode reducir pasos innecesarios e evitar solicitar ao usuario información que o contexto xa podería proporcionar.

---

## Composición do Dashboard

Ao finalizar a sesión, `DashboardScreen` está composto por:

```text
DashboardScreen
├── WeatherCard
├── GardenCard
├── TasksCard
└── QuickActionsCard
```

Cada compoñente ten unha responsabilidade propia:

### WeatherCard

Mostra información meteorolóxica mediante datos ficticios:

- Temperatura.
- Estado do ceo.
- Localidade.

### GardenCard

Mostra:

- Número de hortas.
- Acción para acceder ás hortas.

### TasksCard

Mostra:

- Número de tarefas pendentes.
- Acción para acceder ás tarefas.

### QuickActionsCard

Agrupa accións frecuentes:

- Crear horta.
- Engadir tarefa.

---

## Principio principal da sesión

Unha pantalla complexa pode construírse mediante a composición de widgets pequenos con responsabilidades ben definidas.

Os widgets poden recibir desde niveis superiores:

- **Datos**, mediante parámetros do construtor.
- **Comportamento**, mediante callbacks.

Deste xeito podemos separar:

```text
Datos
        ↓
DashboardScreen
        ↓
Compoñentes
        ↓
Presentación
```

e, para as interaccións:

```text
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

Esta separación reduce o acoplamento e facilita o mantemento, a reutilización e a evolución da aplicación.

---

# Lesson 9 - Callbacks and Navigation

## Conexión entre callbacks e navegación

Na sesión anterior utilizamos callbacks para permitir que os widgets comuniquen accións ao seu widget pai.

Nesta sesión conectamos estes callbacks co sistema de navegación de Flutter.

O patrón utilizado é:

```text
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

```dart
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

- `GardenCard` mostra a información das hortas.
- `GardenCard` detecta que o usuario pulsa `Ver hortas`.
- O callback `onViewGardens` comunica a acción.
- `DashboardScreen` decide que esa acción debe abrir `GardensScreen`.
- `Navigator` realiza a navegación.

---

## Separación de responsabilidades

Un widget de presentación non debería coñecer necesariamente o fluxo completo da aplicación.

Por exemplo:

```text
GardenCard
```

ten a responsabilidade de:

- Mostrar información sobre as hortas.
- Mostrar a acción `Ver hortas`.
- Comunicar que o usuario executou esa acción.

Non ten a responsabilidade de decidir a que pantalla debe navegar a aplicación.

Esta decisión pertence neste caso a:

```text
DashboardScreen
```

porque é a pantalla que coñece o fluxo das accións do Dashboard.

### Regra

**O widget fillo comunica a intención mediante un callback e o widget que coñece o fluxo decide a navegación.**

---

## Aplicación do mesmo patrón a diferentes módulos

O mesmo patrón pode aplicarse sen modificar a arquitectura:

```text
GardenCard
    ↓ onViewGardens
DashboardScreen
    ↓
GardensScreen
```

```text
TasksCard
    ↓ onViewTasks
DashboardScreen
    ↓
TasksScreen
```

E tamén ás accións rápidas:

```text
QuickActionsCard
    ↓ onCreateGarden
DashboardScreen
    ↓
CreateGardenScreen
```

```text
QuickActionsCard
    ↓ onAddTask
DashboardScreen
    ↓
CreateTaskScreen
```

Isto demostra que o patrón pode reutilizarse para diferentes funcionalidades.

---

## Pantallas provisionais

Non é necesario implementar unha pantalla completa no momento de crear unha ruta de navegación.

Podemos crear primeiro unha pantalla provisional:

```dart
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

1. Que a ruta funciona.
2. Que a pantalla se constrúe correctamente.
3. Que a pila de navegación funciona.
4. Que podemos regresar á pantalla anterior.

Posteriormente a pantalla provisional pode substituírse progresivamente pola implementación real.

---

## Organización por funcionalidade

As pantallas deben agruparse segundo a funcionalidade á que pertencen.

A estrutura actual pasa a incluír:

```text
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

Isto facilita localizar o código relacionado cun módulo e mantén separadas as distintas responsabilidades da aplicación.

---

## Principio principal da sesión

Os callbacks e a navegación poden combinarse mantendo separadas as responsabilidades:

```text
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

Deste xeito, os compoñentes visuais non quedan acoplados directamente ás pantallas destino.

---

## Sesión 10 — Modelos, listas dinámicas e formularios

### Obxectivos da sesión

- Introducir un modelo de dominio para representar unha horta.
- Mostrar coleccións de obxectos mediante listas dinámicas.
- Crear widgets especializados para representar elementos dunha lista.
- Xestionar interaccións mediante callbacks con parámetros.
- Navegar a unha pantalla de detalle pasando un obxecto do modelo.
- Introducir `StatefulWidget` e o ciclo de vida do estado.
- Crear o primeiro formulario funcional da aplicación.
- Validar os datos introducidos polo usuario.
- Converter datos de texto aos tipos requiridos polo modelo.
- Introducir conceptos básicos de null safety.
- Devolver datos entre rutas mediante `Navigator`.
- Introducir de maneira práctica `Future`, `async` e `await`.

---

### 1. Modelo `Garden`

Creouse unha clase `Garden` para representar unha horta dentro da aplicación.

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

Responsabilidade:

- `Garden` representa os datos dunha horta.
- Non é responsable da súa representación visual.
- Non é responsable da navegación.
- Non é responsable da persistencia dos datos.

O identificador declárase como:

```dart
String? id;
```

porque unha horta pode existir temporalmente antes de ser gardada na base de datos e, polo tanto, antes de recibir un identificador.

---

### 2. Instancias dun modelo

Unha clase define a estrutura común dos obxectos.

Cada `Garden` é unha instancia distinta do mesmo modelo con valores diferentes nos seus atributos.

Por exemplo:

```dart
Garden(
  id: '1',
  name: 'Horta casa',
  location: 'Ourense',
  area: 40.0,
)
```

e:

```dart
Garden(
  id: '2',
  name: 'Horta aldea',
  location: 'Amoeiro',
  area: 800.0,
)
```

son dous obxectos diferentes da mesma clase `Garden`.

Non é necesario crear unha clase diferente para cada horta.

---

### 3. Colección `List<Garden>`

Para simular os datos que no futuro procederán da persistencia utilizouse unha lista de obxectos `Garden`.

```dart
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

Estes datos son temporais e serán substituídos posteriormente por datos procedentes da capa de persistencia.

---

### 4. `ListView.builder`

Utilizouse `ListView.builder` para construír dinamicamente a lista de hortas.

```dart
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

- `itemCount`: indica cantos elementos ten a lista.
- `itemBuilder`: define como se constrúe cada elemento.
- `index`: identifica a posición do elemento que se está construíndo.

`ListView.builder` permite traballar con listas grandes sen ter que declarar manualmente un widget por cada elemento.

Fluxo:

```text
List<Garden>
    ↓
ListView.builder
    ↓
gardens[index]
    ↓
GardenListItem
```

---

### 5. `GardenListItem`

Creouse un widget específico para representar visualmente unha horta dentro da lista.

Localización:

```text
views/
└── gardens/
    └── widgets/
        └── garden_list_item.dart
```

O widget recibe directamente un obxecto do modelo:

```dart
final Garden garden;
```

Deste modo non é necesario pasar individualmente `name`, `location` e `area`.

Responsabilidade:

> `GardenListItem` representa visualmente unha horta dentro dunha lista e comunica ao widget pai cando o usuario selecciona esa horta.

---

### 6. `InkWell`

Utilizouse `InkWell` para detectar a pulsación sobre un elemento da lista.

Estrutura:

```text
Card
└── InkWell
    └── Padding
        └── Column
```

Un widget non necesita converterse en `StatefulWidget` simplemente porque permita interacción.

A interacción e o estado son conceptos diferentes.

---

### 7. Callbacks con parámetros

Ata este momento utilizáranse callbacks sen parámetros:

```dart
VoidCallback
```

que equivalen conceptualmente a:

```dart
void Function()
```

Para comunicar que horta foi seleccionada utilizouse:

```dart
final void Function(Garden) onTap;
```

Isto permite executar:

```dart
onTap(garden);
```

e enviar o obxecto seleccionado ao widget pai.

Fluxo:

```text
InkWell
    ↓
GardenListItem
    ↓
onTap(garden)
    ↓
GardensScreen
```

---

### 8. Paso de modelos entre pantallas

Creouse `GardenDetailsScreen`, que recibe obrigatoriamente un `Garden`.

```dart
final Garden garden;
```

O mesmo widget pode representar calquera horta dependendo do obxecto recibido.

A navegación realízase mediante:

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => GardenDetailsScreen(
      garden: garden,
    ),
  ),
);
```

Fluxo:

```text
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

Unha única clase `GardenDetailsScreen` permite crear distintas instancias con datos diferentes.

---

### 9. `StatefulWidget`

`CreateGardenScreen` converteuse de `StatelessWidget` a `StatefulWidget`.

Estrutura básica:

```dart
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

- `CreateGardenScreen`: representa o widget e a súa configuración.
- `_CreateGardenScreenState`: mantén o estado e os recursos asociados á instancia.

Que un widget permita interacción non significa automaticamente que necesite ser `StatefulWidget`.

---

### 10. `TextEditingController`

Creáronse controladores para acceder aos datos introducidos polo usuario:

```dart
final TextEditingController nameController =
    TextEditingController();

final TextEditingController locationController =
    TextEditingController();

final TextEditingController areaController =
    TextEditingController();
```

O texto actual dun campo pode consultarse mediante:

```dart
nameController.text
```

Os controladores pertencen ao `State` porque é este quen xestiona o seu ciclo de vida.

---

### 11. `dispose()`

Os `TextEditingController` deben liberarse cando desaparece definitivamente o estado da pantalla.

```dart
@override
void dispose() {
  nameController.dispose();
  locationController.dispose();
  areaController.dispose();

  super.dispose();
}
```

Regra aprendida:

> Se un `State` crea e posúe un recurso que require `dispose()`, tamén é responsabilidade dese `State` liberalo.

---

### 12. `TextFormField`

Utilizouse `TextFormField` para introducir os datos dunha nova horta.

Exemplo:

```dart
TextFormField(
  controller: nameController,
  decoration: const InputDecoration(
    labelText: 'Nome',
  ),
)
```

Para a superficie indicouse unha entrada numérica:

```dart
keyboardType: TextInputType.number
```

O `TextFormField` permite combinar a entrada de datos coa validación do campo.

---

### 13. `Form` e `GlobalKey<FormState>`

Os campos agrupáronse mediante un `Form`.

Creouse unha clave:

```dart
final _formKey = GlobalKey<FormState>();
```

e asociouse ao formulario:

```dart
Form(
  key: _formKey,
  child: Column(
    // campos
  ),
)
```

Isto permite acceder ao estado do formulario e solicitar a validación dos seus campos.

---

### 14. Validación

A validación completa do formulario pode executarse mediante:

```dart
final isValid = _formKey.currentState!.validate();

if (!isValid) {
  return;
}
```

Cada `TextFormField` pode definir o seu propio `validator`.

Exemplo para o nome:

```dart
validator: (value) {
  if (value == null || value.trim().isEmpty) {
    return 'Introduce un nome para a horta';
  }

  return null;
},
```

Tamén se utilizou unha versión compacta mediante o operador ternario:

```dart
validator: (value) =>
    value == null || value.trim().isEmpty
        ? 'Introduce un nome para a horta'
        : null,
```

Regra:

```text
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

- Que exista un valor.
- Que non estea baleiro.
- Que sexa convertible a número.
- Que sexa maior que cero.

Exemplo:

```dart
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

---

### 15. Conversión de `String` a `double`

Os datos dun campo de texto obtéñense inicialmente como `String`.

O modelo `Garden`, pola contra, require:

```dart
final double area;
```

Estudáronse dous métodos:

```dart
double.parse(value)
```

e:

```dart
double.tryParse(value)
```

Diferenza:

```text
double.parse("120.5")     → 120.5
double.parse("abc")       → excepción

double.tryParse("120.5")  → 120.5
double.tryParse("abc")    → null
```

`tryParse()` é especialmente útil para validar datos procedentes do usuario.

Unha vez validado o formulario, pode empregarse `parse()` sabendo que o valor xa é correcto.

---

### 16. Null safety

Introduciuse o concepto de tipo nullable.

Un tipo:

```dart
double
```

debe conter un valor `double`.

En cambio:

```dart
double?
```

pode conter:

```text
double ou null
```

O mesmo principio aplicouse ao identificador de `Garden`:

```dart
final String? id;
```

Isto permite representar unha horta que aínda non foi persistida:

```dart
Garden(
  name: 'Horta nova',
  location: 'Ourense',
  area: 125.0,
)
```

Neste caso:

```dart
garden.id == null
```

Tamén se utilizou o operador de acceso condicional:

```dart
?.
```

Por exemplo:

```dart
garden?.name
```

que accede a `name` unicamente se `garden` non é `null`.

---

### 17. Creación dun modelo desde un formulario

Despois de validar os datos, pode construírse unha instancia de `Garden`.

```dart
final area = double.parse(areaController.text);

final garden = Garden(
  name: nameController.text.trim(),
  location: locationController.text.trim(),
  area: area,
);
```

Neste momento a horta xa existe como obxecto dentro da aplicación, aínda que non foi gardada nunha base de datos.

Fluxo conseguido:

```text
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

---

### 18. Devolución de datos entre rutas

`Navigator.pop()` pode eliminar unha ruta da pila e, ademais, devolver un resultado.

Desde `CreateGardenScreen`:

```dart
Navigator.of(context).pop(garden);
```

Isto:

1. Elimina `CreateGardenScreen` da pila.
2. Volve á pantalla que abriu o formulario.
3. Devolve o obxecto `Garden` como resultado.

A pantalla que abriu a ruta pode esperar ese resultado:

```dart
final garden = await Navigator.of(context).push<Garden>(
  MaterialPageRoute(
    builder: (context) => const CreateGardenScreen(),
  ),
);
```

Se o usuario crea unha horta:

```text
CreateGardenScreen
        ↓
pop(garden)
        ↓
Garden
```

Se abandona o formulario sen crear nada:

```text
CreateGardenScreen
        ↓
Atrás
        ↓
null
```

Por este motivo o resultado que recibe a pantalla anterior pode ser nullable.

---

### 19. `Future`, `async` e `await`

A navegación permitiu introducir de maneira práctica algúns conceptos básicos de programación asíncrona.

Exemplo:

```dart
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

`push<Garden>()` indica o tipo de resultado que esperamos que devolva a ruta.

`await` permite esperar a que a navegación remate e obter o resultado.

Para poder utilizar `await`, o callback declárase como `async`.

Fluxo conceptual:

```text
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

A programación asíncrona estudarase con maior profundidade cando sexa necesaria para a persistencia e para o consumo de APIs.

---

## Decisións de deseño tomadas

- Os datos dunha horta represéntanse mediante o modelo `Garden`.
- `GardenListItem` pertence ao módulo `gardens` porque a súa responsabilidade é específica deste módulo.
- Os widgets poden recibir obxectos completos do modelo cando resulta máis coherente que pasar todos os seus atributos individualmente.
- `GardenListItem` segue sendo `StatelessWidget`; unha interacción non implica por si mesma estado mutable.
- `CreateGardenScreen` é `StatefulWidget` porque xestiona recursos asociados ao ciclo de vida da pantalla.
- Os `TextEditingController` son responsabilidade de `_CreateGardenScreenState`.
- Os controladores libéranse mediante `dispose()`.
- O identificador dunha horta pode ser `null` antes da persistencia.
- Os datos introducidos polo usuario valídanse antes de construír o modelo.
- A creación dunha horta aínda non modifica a lista real da aplicación.
- Non se implementará unha solución temporal para compartir a nova horta entre `DashboardScreen` e `GardensScreen`.
- A xestión compartida dos datos resolverase posteriormente mediante a arquitectura prevista e a persistencia.

---

## Estado ao finalizar a sesión

O módulo de hortas xa permite:

1. Representar hortas mediante un modelo `Garden`.
2. Manter temporalmente unha colección de hortas.
3. Mostrar unha colección mediante `ListView.builder`.
4. Representar cada elemento mediante `GardenListItem`.
5. Seleccionar unha horta mediante `InkWell`.
6. Comunicar a horta seleccionada mediante un callback con parámetro.
7. Navegar á pantalla de detalle.
8. Pasar un `Garden` entre pantallas.
9. Abrir un formulario de creación.
10. Introducir os datos dunha nova horta.
11. Validar os datos do formulario.
12. Converter a superficie de `String` a `double`.
13. Construír un novo obxecto `Garden`.
14. Devolver ese obxecto á ruta anterior mediante `Navigator.pop(garden)`.
15. Recibir o resultado mediante `await Navigator.push<Garden>()`.

A persistencia da nova horta e a actualización compartida da interface quedan deliberadamente pendentes para fases posteriores.

---

## Conceptos clave da sesión

- Modelo de dominio.
- Clase e instancia.
- `List<T>`.
- `ListView.builder`.
- `itemCount`.
- `itemBuilder`.
- `index`.
- Widgets reutilizables.
- `InkWell`.
- `VoidCallback`.
- `void Function(T)`.
- Paso de obxectos entre widgets.
- Paso de obxectos entre pantallas.
- `StatefulWidget`.
- `State<T>`.
- `createState()`.
- Ciclo de vida.
- `TextEditingController`.
- `dispose()`.
- `TextFormField`.
- `Form`.
- `GlobalKey<FormState>`.
- `validator`.
- `double.parse()`.
- `double.tryParse()`.
- Null safety.
- Tipos nullable (`?`).
- Acceso condicional (`?.`).
- `Navigator.push<T>()`.
- `Navigator.pop(resultado)`.
- `Future`.
- `async`.
- `await`.

---

# Sesión 11 - Estado compartido con Provider

## Obxectivo

Introducir a xestión de estado compartido en MARTOLA mediante Provider e aplicar os conceptos ao módulo de hortas.

Durante esta sesión substituíronse os datos temporais almacenados directamente nas Views por un estado centralizado nun `GardensViewModel`.

---

## Estado local e estado compartido

Non todo o estado dunha aplicación debe almacenarse no mesmo lugar.

### Estado local

É aquel que só afecta a un widget ou pantalla concreta.

Exemplo:

```dart
final TextEditingController nameController =
    TextEditingController();
```

O contido dun campo dun formulario é responsabilidade da propia pantalla.

### Estado compartido

É información que debe ser utilizada ou modificada por diferentes partes da aplicación.

Exemplo:

```dart
List<Garden> gardens
```

A colección de hortas é utilizada por diferentes pantallas:

- `DashboardScreen`
- `GardensScreen`
- `GardenDetailsScreen`
- `CreateGardenScreen`
- `EditGardenScreen`

Por este motivo non debe pertencer exclusivamente a ningunha delas.

---

## GardensViewModel

Creouse:

```text
lib/
└── viewmodels/
    └── gardens_viewmodel.dart
```

O `GardensViewModel` é responsable de manter e modificar o estado relacionado coas hortas.

A colección interna mantense privada:

```dart
final List<Garden> _gardens = [];
```

e exponse mediante un getter:

```dart
List<Garden> get gardens =>
    List.unmodifiable(_gardens);
```

`List.unmodifiable()` evita que as Views poidan modificar directamente a colección.

As modificacións deben realizarse mediante métodos do ViewModel.

---

## Encapsulación do estado

Evítase:

```dart
viewModel.gardens.add(garden);
```

e utilízase:

```dart
viewModel.addGarden(garden);
```

Deste xeito, a responsabilidade de modificar o estado permanece no ViewModel.

---

## ChangeNotifier

`GardensViewModel` estende:

```dart
ChangeNotifier
```

Isto permite que o ViewModel notifique ás Views cando o estado cambia.

Exemplo:

```dart
void addGarden(Garden garden) {
    // modificar estado

    notifyListeners();
}
```

O fluxo é:

```text
modificación do estado
        ↓
notifyListeners()
        ↓
widgets subscritos
        ↓
rebuild
```

---

## Provider

Engadiuse o paquete `provider` ao proxecto.

O `GardensViewModel` proporciónase por enriba de `MaterialApp`:

```text
MartolaApp
└── ChangeNotifierProvider
    └── MaterialApp
        └── resto da aplicación
```

Isto permite compartir unha única instancia de `GardensViewModel` entre as diferentes pantallas.

---

## context.watch

Utilízase cando unha View necesita acceder ao estado e reaccionar aos seus cambios.

Exemplo:

```dart
final gardensViewModel =
    context.watch<GardensViewModel>();

final gardens = gardensViewModel.gardens;
```

Aplicado en:

```text
GardensScreen
```

Cando `GardensViewModel` executa `notifyListeners()`, a pantalla reconstrúese.

---

## context.read

Utilízase cando unha View necesita acceder ao ViewModel para executar unha acción pero non necesita subscribirse aos seus cambios.

Exemplo:

```dart
context
    .read<GardensViewModel>()
    .addGarden(garden);
```

Aplicado en:

```text
CreateGardenScreen
```

---

## context.select

Utilízase cando unha View só necesita reaccionar aos cambios dunha parte concreta do estado.

Exemplo:

```dart
final gardenCount =
    context.select<GardensViewModel, int>(
        (viewModel) => viewModel.gardens.length,
    );
```

Aplicado no Dashboard para mostrar o número de hortas.

Isto permite evitar reconstrucións innecesarias cando cambia outra información do ViewModel.

---

## Regra práctica

```text
read
→ acceder ao ViewModel sen escoitar cambios

watch
→ escoitar os cambios do ViewModel

select
→ escoitar un valor concreto do ViewModel
```

---

## Provider non é persistencia

Provider permite manter estado compartido mentres a aplicación está en execución.

Non almacena os datos de forma permanente.

Actualmente:

```text
GardensViewModel
      ↓
estado en memoria
```

Ao pechar completamente a aplicación, as hortas desaparecen.

A persistencia implementarase posteriormente mediante:

```text
View
 ↓
ViewModel
 ↓
Repository
 ↓
SQLite
```

---

## CRUD en memoria

Durante a sesión implementouse un primeiro CRUD completo sobre as hortas.

### CREATE

```dart
addGarden()
```

### READ

```dart
gardens
```

e:

```dart
getGardenById()
```

### UPDATE

```dart
updateGarden()
```

### DELETE

```dart
removeGarden()
```

Todo o estado está centralizado en:

```text
GardensViewModel
```

---

## Identidade temporal das hortas

Antes de SQLite, as hortas creadas desde o formulario non dispoñían dun identificador.

Engadiuse temporalmente un contador ao ViewModel:

```dart
int _nextId = 1;
```

Ao engadir unha horta, o ViewModel crea unha nova instancia cun identificador:

```text
Garden sen ID
     ↓
addGarden()
     ↓
asignación de ID temporal
     ↓
Garden almacenado
```

Exemplo:

```text
1
2
3
...
```

Os IDs almacénanse como `String`.

Este mecanismo é provisional e será substituído pola estratexia de identificación utilizada pola capa de persistencia.

---

## Modelos inmutables

`Garden` utiliza propiedades `final`.

Por este motivo unha edición non modifica directamente a instancia existente.

Evítase:

```dart
garden.name = 'Novo nome';
```

En cambio créase unha nova instancia:

```dart
final updatedGarden = Garden(
    id: widget.garden.id,
    name: nameController.text.trim(),
    location: locationController.text.trim(),
    area: area,
);
```

e o ViewModel substitúe a instancia anterior:

```dart
_gardens[index] = updatedGarden;
```

---

## updateGarden

A actualización localiza primeiro a instancia existente:

```dart
final index = _gardens.indexOf(oldGarden);
```

Se non existe:

```dart
if (index == -1) {
    return;
}
```

Se existe, substitúese:

```dart
_gardens[index] = updatedGarden;
notifyListeners();
```

A nova instancia conserva o mesmo ID.

---

## getGardenById

Engadiuse unha operación para recuperar unha horta mediante a súa identidade:

```dart
Garden? getGardenById(String id)
```

Pode devolver:

```text
Garden
```

ou:

```text
null
```

se non existe ningunha horta co identificador solicitado.

---

## GardenDetailsScreen e fonte de verdade

Inicialmente `GardenDetailsScreen` recibía directamente:

```dart
Garden garden
```

Isto provocaba que, despois dunha edición, a pantalla puidese conservar unha referencia á instancia antiga.

A solución foi facer que a pantalla traballe coa identidade:

```dart
String gardenId
```

e obteña a versión actual desde `GardensViewModel`:

```dart
final garden =
    context.select<GardensViewModel, Garden?>(
        (viewModel) =>
            viewModel.getGardenById(gardenId),
    );
```

Deste xeito o ViewModel actúa como fonte de verdade.

```text
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

---

## Eliminación por identidade

Inicialmente:

```dart
removeGarden(Garden garden)
```

Posteriormente cambiouse a operación para traballar mediante identidade:

```dart
removeGarden(String id)
```

O ViewModel localiza internamente a horta mediante:

```dart
getGardenById(id)
```

Isto evita depender dunha instancia concreta do modelo.

---

## initState

Na pantalla de edición utilizouse `initState()` para inicializar os controladores cos valores actuais da horta.

```dart
@override
void initState() {
    super.initState();

    nameController = TextEditingController(
        text: widget.garden.name,
    );
}
```

`initState()` execútase unha vez cando se crea o estado do widget.

---

## late final

Os controladores de `EditGardenScreen` decláranse mediante:

```dart
late final TextEditingController nameController;
```

Isto permite declaralos antes de coñecer o valor inicial e inicializalos posteriormente en `initState()`.

`final` garante que a referencia ao controlador non será substituída despois da inicialización.

---

## widget dentro dun State

Dentro dunha clase:

```dart
State<EditGardenScreen>
```

pódese acceder á configuración do `StatefulWidget` asociado mediante:

```dart
widget
```

Por exemplo:

```dart
widget.garden.name
```

---

## Conceptos principais aprendidos

- Estado local.
- Estado compartido.
- Encapsulación do estado.
- ViewModel como fonte de verdade.
- Provider.
- `ChangeNotifier`.
- `notifyListeners()`.
- `ChangeNotifierProvider`.
- `context.read`.
- `context.watch`.
- `context.select`.
- Modelos inmutables.
- Identidade de entidades.
- `Garden?` e tratamento de ausencia de datos.
- `initState()`.
- `late final`.
- Acceso mediante `widget` desde un `State`.
- CRUD en memoria.
- Diferencia entre estado e persistencia.

---

## Estado ao finalizar a sesión

O módulo de hortas permite actualmente:

```text
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

- `DashboardScreen`
- `GardensScreen`
- `GardenDetailsScreen`
- `CreateGardenScreen`
- `EditGardenScreen`

mediante `GardensViewModel` e Provider.

Os datos aínda se almacenan exclusivamente en memoria.

---

# LEARNING_NOTES.md

# MARTOLA - Flutter Learning Notes

## Purpose

Este documento recolle os conceptos aprendidos durante o desenvolvemento de MARTOLA.

Non pretende substituír a documentación oficial de Flutter, senón servir como guía de consulta rápida cos conceptos fundamentais que se vaian aprendendo ao longo do proxecto.

---

# Filosofía de Flutter

Flutter está baseado na composición de widgets.

Unha interface non se constrúe modificando elementos existentes, senón combinando widgets pequenos, cada un cunha responsabilidade concreta.

Os widgets describen como debe verse a interface.

O Flutter Engine é o encargado de debuxala na pantalla.

Principios fundamentais:

- Todo é un Widget.
- Cada Widget ten unha única responsabilidade.
- A interface constrúese mediante composición.
- O estado determina a interface.
- Flutter reconstrúe só o necesario cando cambia o estado.

---

# Patróns de pensamento

## Antes de aprender un widget

Pregunta sempre:

> Cal é a responsabilidade deste widget?

---

## Antes de aprender unha propiedade

Pregunta:

> Que problema intenta resolver?

---

## Antes de memorizar unha API

Pregunta:

> Podo deducila a partir da responsabilidade do widget?

---

## Antes de engadir un widget novo

Pregunta:

> Xa existe outro widget que resolva este problema dunha forma máis simple?

---

# Lesson 1 - Flutter Fundamentals

## Flutter

Flutter é un framework desenvolvido por Google para crear aplicacións multiplataforma.

A súa principal característica é que debuxa toda a interface mediante widgets, independentemente do sistema operativo.

---

## Flutter Framework

É a parte escrita en Dart.

Contén:

- Widgets
- MaterialApp
- Scaffold
- Navigator
- Theme
- etc.

O framework describe como debe ser a interface.

---

## Flutter Engine

É o motor interno de Flutter.

Está escrito principalmente en C++.

É o encargado de:

- debuxar a interface
- comunicarse co sistema operativo
- acceder á GPU
- procesar eventos do rato e teclado

O programador normalmente traballa co Framework, non co Engine.

---

## Widget

Un Widget é a unidade básica coa que se constrúe a interface dunha aplicación Flutter.

Pode representar:

- un elemento visual (Text)
- unha estrutura (Column)
- unha aliñación (Center)
- un espazado (Padding)
- unha pantalla completa (HomeScreen)

Un Widget non debuxa a pantalla.

Describe como debe verse.

---

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

---

## main()

É o punto de entrada da aplicación.

Flutter comeza a executarse desde esta función.

---

## runApp()

runApp() recibe o Widget raíz da aplicación.

A partir del Flutter constrúe toda a árbore de Widgets.

Non é un Widget.

É unha función.

---

## Widget raíz

É o primeiro Widget da aplicación.

No proxecto MARTOLA é:

MartolaApp

Todos os demais Widgets dependen del.

---

## StatelessWidget

Representa un Widget cuxos datos non cambian durante a súa vida.

Exemplos:

- Logo
- Texto fixo
- Icona decorativa

Características:

- máis sinxelo
- máis eficiente
- permite utilizar const cando sexa posible

---

## StatefulWidget

Representa un Widget cuxos datos poden cambiar.

Exemplos:

- Campo de texto
- Lista de hortas
- Información meteorolóxica
- Contador

O Widget non cambia.

Cambian os datos que utiliza.

---

## Estado

O estado son os datos empregados por un Widget para construír a súa interface.

Cando o estado cambia:

Flutter executa novamente build().

---

## const

Indica que un obxecto é inmutable e coñécese en tempo de compilación.

Flutter pode reutilizalo sen necesidade de crear unha nova instancia.

Sempre que sexa posible utilizarase const.

---

## build()

É o método principal dun Widget.

A súa misión é construír e devolver a descrición da interface segundo o estado actual da aplicación.

Non debuxa píxeles.

Describe como debe verse a interface.

---

## BuildContext

Representa a posición dun Widget dentro da árbore.

Permite acceder a información do seu contorno.

Exemplos:

- Theme
- Navigator
- MediaQuery
- Providers

Non representa a aplicación completa.

Representa o contexto dese Widget.

---

## MaterialApp

É o Widget que configura a aplicación baseada en Material Design.

Entre outras cousas define:

- tema
- navegación
- título
- pantalla inicial

---

## Scaffold

É o esqueleto básico dunha pantalla Material.

Pode conter:

- AppBar
- Body
- Drawer
- BottomNavigationBar
- FloatingActionButton

---

## Center

Widget encargado de centrar o seu Widget fillo.

Non modifica outros Widgets.

Simplemente describe unha aliñación.

---

## Composición

Flutter constrúe interfaces combinando Widgets pequenos.

Exemplo:

Padding

↓

Center

↓

Text

Cada Widget realiza unha única tarefa.

---

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

- reutilización
- mantemento
- probas
- reconstrución eficiente

---

## Filosofía de Flutter

Flutter non modifica a interface existente.

Cada vez que cambia o estado:

1. Executa build().
2. Obtén unha nova descrición da interface.
3. Compara coa anterior.
4. Actualiza só o necesario.

---

# Ideas clave

- Todo en Flutter é un Widget.
- Un Widget describe, non debuxa.
- Flutter funciona mediante composición.
- Os Widgets deben ser pequenos.
- Os Widgets deben ter unha única responsabilidade.
- StatelessWidget → os datos non cambian.
- StatefulWidget → os datos poden cambiar.
- build() describe a interface segundo o estado actual.
- O Engine debuxa; o Framework describe.

---

## Regra do eixe principal

Antes de utilizar `mainAxisAlignment` ou `crossAxisAlignment`, identifica primeiro cal é a responsabilidade do widget.

**Pregunta clave:**

> Como organiza este widget os seus widgets fillos (`children`)?

A resposta indica automaticamente cal é o eixe principal.

### Column

Responsabilidade:

Organizar os widgets verticalmente.

- Eixe principal → Vertical
- Eixe secundario → Horizontal

Polo tanto:

- `mainAxisAlignment` controla a distribución vertical.
- `crossAxisAlignment` controla a aliñación horizontal.

---

### Row

Responsabilidade:

Organizar os widgets horizontalmente.

- Eixe principal → Horizontal
- Eixe secundario → Vertical

Polo tanto:

- `mainAxisAlignment` controla a distribución horizontal.
- `crossAxisAlignment` controla a aliñación vertical.

---

### Regra práctica

Nunca memorices que fai `mainAxisAlignment` ou `crossAxisAlignment`.

Primeiro responde:

> **Como organiza os seus widgets fillos este widget?**

Unha vez identificado o eixe principal, o resto dedúcese automaticamente.

---

# Lesson 3 - Layout

## Column

Widget encargado de organizar varios widgets verticalmente.

Cada widget fillo colócase debaixo do anterior.

### Responsabilidade

Organizar widgets no eixe vertical.

---

## Row

Widget encargado de organizar varios widgets horizontalmente.

Cada widget fillo colócase ao lado do anterior.

### Responsabilidade

Organizar widgets no eixe horizontal.

---

## Main Axis

É o eixe principal segundo o cal un widget organiza os seus widgets fillos.

### Column

Main Axis → Vertical

### Row

Main Axis → Horizontal

---

## Cross Axis

É o eixe perpendicular ao Main Axis.

### Column

Cross Axis → Horizontal

### Row

Cross Axis → Vertical

---

## MainAxisAlignment

Controla como se distribúen os widgets ao longo do Main Axis.

Non depende do nome "horizontal" ou "vertical".

Depende sempre do eixe principal do widget.

---

## CrossAxisAlignment

Controla a aliñación dos widgets ao longo do Cross Axis.

---

## Regra do eixe principal

Antes de utilizar `mainAxisAlignment` ou `crossAxisAlignment`, identifica primeiro a responsabilidade do widget.

Pregunta clave:

> Como organiza este widget os seus widgets fillos?

Se a resposta é:

- Vertical → Main Axis = Vertical
- Horizontal → Main Axis = Horizontal

O resto dedúcese automaticamente.

---

## Filosofía da API de Flutter

Flutter intenta que a súa API sexa coherente e escalable.

As propiedades adoitan representarse mediante enums (`MainAxisAlignment`, `CrossAxisAlignment`) en lugar de valores booleanos ou cadeas de texto.

Isto permite:

- Maior claridade.
- Mellor autocompletado.
- Comprobación en tempo de compilación.
- APIs máis flexibles e fáciles de ampliar.

---

## Concepto da sesión

Antes de aprender unha propiedade dun widget, identifica primeiro a súa responsabilidade.

A maior parte da API de Flutter pode deducirse a partir desa responsabilidade.

---

# Erros frecuentes

## Confundir Widget con elemento visual

Un Widget non sempre representa un elemento visible.

Exemplos:

- Padding
- Center
- SizedBox

Tamén son Widgets.

---

## Pensar que build() debuxa a pantalla

Incorrecto.

build() describe a interface.

É o Engine quen a debuxa.

---

## Memorizar MainAxisAlignment

Non é necesario.

Primeiro identifica o Main Axis.

O resto dedúcese automaticamente.

---

# Regra de ouro

En Flutter non memorices primeiro a API.

Comprende primeiro a responsabilidade do widget.

Na maioría dos casos, a API poderá deducirse de forma natural.

---

## Regra da composición

En Flutter é preferible combinar varios widgets pequenos cunha única responsabilidade antes que utilizar un widget grande con múltiples opcións.

Vantaxes:

- Reutilización.
- Mantemento.
- Lexibilidade.
- Flexibilidade.
- Testabilidade.

A composición é un dos principios fundamentais de Flutter.

---

# Lesson 5 - First Real Screen

## AppBar

Widget que representa a barra superior dunha pantalla Material.

Pode conter:

- título
- accións
- botón de navegación
- menú

Forma parte da estrutura proporcionada por Scaffold.

---

## SafeArea

Widget que garante que o seu contido permaneza dentro da zona segura do dispositivo.

Evita que outros widgets queden ocultos por:

- notch
- cámara frontal
- barra de estado
- xestos do sistema

---

## ElevatedButton

Botón Material con elevación.

A súa responsabilidade é ofrecer unha acción principal ao usuario.

Se `onPressed` é:

```dart
null
```

o botón queda automaticamente desactivado.

---

## Arquitectura dunha pantalla

Antes de implementar unha pantalla é recomendable definir a súa árbore de widgets.

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

---

## Regra da arquitectura

Primeiro deseña a estrutura.

Despois escribe o código.

É moito máis sinxelo corrixir unha arquitectura que unha implementación xa rematada.

---

## Concepto da sesión

Construír unha pantalla Flutter consiste en combinar widgets pequenos, cada un cunha responsabilidade concreta, ata formar unha interface completa.

---

# Lesson 6 - Refactoring & Theme

## Refactorización

Refactorizar consiste en mellorar a estrutura interna do código sen modificar o seu comportamento.

Unha boa refactorización:

- Reduce duplicación.
- Mellora a lexibilidade.
- Facilita o mantemento.
- Non modifica o resultado visible da aplicación.

---

## Widgets reutilizables

Un widget debe extraerse cando representa unha responsabilidade propia que pode utilizarse en máis dun lugar.

Exemplo:

MartolaLogo

Responsabilidade:

Mostrar a identidade visual da aplicación.

Non debe incluír botóns nin accións porque pertencen a responsabilidades diferentes.

---

## ThemeData

`ThemeData` centraliza a configuración visual da aplicación.

Permite definir:

- cores
- tipografías
- botóns
- AppBar
- formularios
- iconografía

Todos os widgets poden acceder ao tema mediante:

```dart
Theme.of(context)
```

---

## ColorScheme

`ColorScheme` define os diferentes roles de cor da aplicación.

Exemplo:

- primary
- secondary
- surface
- error

Os widgets deben utilizar estes roles en lugar de cores fixas.

Incorrecto:

```dart
color: Colors.green
```

Correcto:

```dart
color: Theme.of(context).colorScheme.primary
```

---

## Concepto da sesión

Primeiro conseguimos que unha aplicación funcione.

Despois organizamos o código para que sexa fácil de manter.

---

# Regra do Navigator

push()

→ Engade unha pantalla enriba da pila.

pop()

→ Elimina a pantalla superior da pila.

A pantalla anterior nunca desaparece mentres permaneza na pila.

---

## Navigator e a pila de rutas

O `Navigator` mantén unha pila (stack) de rutas.

- `push()` engade unha nova ruta enriba da pila.
- `pop()` elimina a ruta superior.

Cada chamada a `push()` crea unha nova ruta, aínda que xa exista outra pantalla do mesmo tipo na pila.

As rutas inferiores permanecen na pila ata que son eliminadas explicitamente.

---

# Lesson 7 - Navigation

## Navigator

O Navigator xestiona a navegación mediante unha pila (stack) de rutas.

Cada pantalla normalmente corresponde a unha ruta.

---

## push()

Engade unha nova ruta enriba da pila.

A pantalla anterior permanece na pila.

---

## pop()

Elimina a ruta superior da pila.

A pantalla anterior volve mostrarse.

---

## MaterialPageRoute

Representa unha ruta Material que sabe como construír unha pantalla.

---

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

---

## SingleChildScrollView

Permite desprazar vertical ou horizontalmente un único widget fillo.

Habitualmente utilízase xunto cunha Column para pantallas cun número reducido de elementos que poden exceder o tamaño da pantalla.

---

## Column vs SingleChildScrollView vs ListView

Column

- Sen scroll.
- Poucos elementos.

SingleChildScrollView + Column

- Poucos elementos.
- Scroll completo.

ListView

- Moitos elementos.
- Construción eficiente dos elementos visibles.

---

## Concepto da sesión

A navegación en Flutter baséase nunha pila de rutas, non nun cambio directo dunha pantalla a outra.

---

## Regra para organizar widgets

Un widget debe permanecer preto da funcionalidade á que pertence.

Só debe moverse a `lib/widgets/` cando exista unha necesidade real de reutilizalo noutras partes da aplicación.

Non se deben crear compoñentes globais "por se acaso".

Primeiro constrúese para resolver un problema concreto.

Despois reutilízase cando aparece unha segunda necesidade real.

---

## Regra dos callbacks

Un widget reutilizable debería expoñer as accións mediante callbacks en lugar de decidir directamente a navegación ou a lóxica externa.

O widget define **cando ocorre unha acción**.

O widget pai decide **que debe facer esa acción**.

Isto reduce o acoplamento e facilita a reutilización.

---

# Lesson 8 - Reusable Components and Callbacks

## Deseño dun widget

Antes de implementar un widget débese determinar:

1. Cal é a súa responsabilidade.
2. Que datos necesita.
3. Que accións debe expoñer.
4. Como se organizará visualmente.

Un widget debe recibir só a información necesaria para cumprir a súa responsabilidade.

---

## Datos mediante o construtor

Os widgets poden recibir datos desde o widget pai:

```dart
const WeatherCard(
  temperature: 28,
  condition: 'Ceo despexado',
  location: 'Ourense',
)
```

Isto permite separar a presentación da orixe dos datos.

Os datos poden ser ficticios (`mock data`) durante as primeiras fases do desenvolvemento. Isto permite construír e probar a interface antes de dispoñer de SQLite, APIs ou outras fontes de datos reais.

---

## Interface pública dun widget

Os parámetros do construtor forman parte da interface pública do widget.

Por exemplo:

```dart
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

- Un dato: `gardenCount`.
- Un comportamento: `onViewGardens`.

A implementación interna do widget pode cambiar sen que necesariamente cambie esta interface.

---

## Callbacks

Un widget pode recibir non só datos, senón tamén comportamento.

En Flutter podemos utilizar, entre outros mecanismos, `VoidCallback`:

```dart
final VoidCallback onViewGardens;
```

O widget fillo pode executar ese callback cando se produce unha interacción:

```dart
TextButton(
  onPressed: onViewGardens,
  child: const Text('Ver hortas'),
)
```

O widget pai determina posteriormente que debe ocorrer:

```dart
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

Por exemplo, `GardenCard` sabe que existe unha acción chamada "Ver hortas", pero non necesita saber a que pantalla debe navegar.

Isto reduce o acoplamento e facilita a reutilización dos widgets.

---

## Separación entre presentación e comportamento

Un widget de presentación non debería asumir responsabilidades que pertencen a outros niveis da aplicación.

Por exemplo, en lugar de introducir directamente dentro de `GardenCard`:

```dart
Navigator.of(context).push(...);
```

a tarxeta expón:

```dart
final VoidCallback onViewGardens;
```

e deixa que `DashboardScreen` decida o comportamento.

Deste xeito:

- `GardenCard` é responsable de mostrar información sobre as hortas.
- `DashboardScreen` coñece o fluxo da pantalla e decide que facer coa acción.
- A navegación non queda acoplada ao widget visual.

---

## Organización de widgets

Un widget debe permanecer preto da funcionalidade á que pertence.

Por exemplo:

```text
views/
└── dashboard/
    ├── dashboard_screen.dart
    └── widgets/
        ├── weather_card.dart
        ├── garden_card.dart
        ├── tasks_card.dart
        └── quick_actions_card.dart
```

Só debe moverse a `lib/widgets/` cando exista unha necesidade real de reutilizalo noutras funcionalidades.

Non se deben crear compoñentes globais "por se acaso".

Primeiro constrúese o widget para resolver unha necesidade concreta e posteriormente refactorízase se aparece unha necesidade real de reutilización.

---

## Card

`Card` é un widget de Material Design pensado para representar un bloque de información relacionado visualmente.

No Dashboard utilizámolo como base dos distintos compoñentes:

- `WeatherCard`
- `GardenCard`
- `TasksCard`
- `QuickActionsCard`

Cada tarxeta representa unha responsabilidade diferente.

---

## SingleChildScrollView

`SingleChildScrollView` permite facer scroll sobre un único widget fillo.

Pode combinarse cunha `Column` cando unha pantalla ten un número reducido de bloques pero estes poden superar o espazo visible.

Estrutura utilizada no Dashboard:

```text
SafeArea
└── Padding
    └── SingleChildScrollView
        └── Column
            ├── WeatherCard
            ├── GardenCard
            ├── TasksCard
            └── QuickActionsCard
```

A `Column` organiza os elementos verticalmente e `SingleChildScrollView` permite desprazalos cando non caben no espazo dispoñible.

---

## SafeArea

`SafeArea` evita que o contido quede oculto por zonas reservadas ou elementos físicos e de sistema do dispositivo.

Por exemplo:

- Barra de estado.
- Notches ou recortes.
- Outras zonas reservadas polo sistema.

---

## Padding

`Padding` introduce separación entre o seu widget fillo e os límites que o rodean.

No Dashboard utilizamos:

```dart
const EdgeInsets.all(16)
```

para evitar que as tarxetas queden pegadas aos bordos da zona dispoñible.

---

## Column e os seus eixes

Nunha `Column`:

- O eixe principal (`main axis`) é o vertical.
- O eixe secundario (`cross axis`) é o horizontal.

Por tanto:

```dart
crossAxisAlignment: CrossAxisAlignment.stretch
```

actúa sobre o eixe horizontal.

---

## CrossAxisAlignment.stretch

`CrossAxisAlignment.stretch` fai que os fillos dunha `Column` intenten ocupar todo o espazo dispoñible no seu eixe secundario.

Nunha `Column`, isto significa estender os fillos horizontalmente.

Non significa necesariamente ocupar todo o ancho da pantalla.

Os widgets ocupan o ancho que lles permite o seu pai.

No Dashboard:

```text
Pantalla
└── SafeArea
    └── Padding (16)
        └── SingleChildScrollView
            └── Column (stretch)
                └── WeatherCard
```

A `WeatherCard` esténdese polo ancho dispoñible dentro do `Padding`, non ata os bordos físicos da pantalla.

Isto tamén permite que o contido se adapte cando cambia o tamaño da ventá.

---

## Theme dentro dos compoñentes

En lugar de definir estilos independentes en cada widget:

```dart
TextStyle(
  fontSize: 32,
)
```

podemos utilizar os estilos centralizados no `Theme`:

```dart
Theme.of(context).textTheme.titleLarge
```

ou cores:

```dart
Theme.of(context).colorScheme.primary
```

Isto facilita:

- Manter a coherencia visual.
- Modificar o deseño desde un punto central.
- Evitar valores visuais repetidos por toda a aplicación.

---

## Xerarquía visual

Non toda a información dunha interface ten a mesma importancia.

Os elementos máis importantes deben destacar visualmente mediante recursos como:

- Tamaño.
- Peso tipográfico.
- Cor.
- Posición.
- Espazado.

Por exemplo, en `WeatherCard` a temperatura é un dos datos principais e debe ter máis peso visual que a descrición do estado do ceo.

---

## Accións no contexto adecuado

Unha acción debe situarse no contexto no que ten sentido.

Durante o deseño do Dashboard considerouse incluír:

- Crear nova horta.
- Engadir nova tarefa.
- Engadir planta.

Decidiuse non incluír `Engadir planta` nas accións rápidas do Dashboard porque unha planta debe estar asociada a unha horta concreta.

Polo tanto, esta acción terá máis sentido dentro do contexto dunha horta seleccionada.

### Regra

**As accións deberían aparecer no contexto no que teñen sentido.**

Isto pode reducir pasos innecesarios e evitar solicitar ao usuario información que o contexto xa podería proporcionar.

---

## Composición do Dashboard

Ao finalizar a sesión, `DashboardScreen` está composto por:

```text
DashboardScreen
├── WeatherCard
├── GardenCard
├── TasksCard
└── QuickActionsCard
```

Cada compoñente ten unha responsabilidade propia:

### WeatherCard

Mostra información meteorolóxica mediante datos ficticios:

- Temperatura.
- Estado do ceo.
- Localidade.

### GardenCard

Mostra:

- Número de hortas.
- Acción para acceder ás hortas.

### TasksCard

Mostra:

- Número de tarefas pendentes.
- Acción para acceder ás tarefas.

### QuickActionsCard

Agrupa accións frecuentes:

- Crear horta.
- Engadir tarefa.

---

## Principio principal da sesión

Unha pantalla complexa pode construírse mediante a composición de widgets pequenos con responsabilidades ben definidas.

Os widgets poden recibir desde niveis superiores:

- **Datos**, mediante parámetros do construtor.
- **Comportamento**, mediante callbacks.

Deste xeito podemos separar:

```text
Datos
        ↓
DashboardScreen
        ↓
Compoñentes
        ↓
Presentación
```

e, para as interaccións:

```text
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

Esta separación reduce o acoplamento e facilita o mantemento, a reutilización e a evolución da aplicación.

---

# Lesson 9 - Callbacks and Navigation

## Conexión entre callbacks e navegación

Na sesión anterior utilizamos callbacks para permitir que os widgets comuniquen accións ao seu widget pai.

Nesta sesión conectamos estes callbacks co sistema de navegación de Flutter.

O patrón utilizado é:

```text
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

```dart
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

- `GardenCard` mostra a información das hortas.
- `GardenCard` detecta que o usuario pulsa `Ver hortas`.
- O callback `onViewGardens` comunica a acción.
- `DashboardScreen` decide que esa acción debe abrir `GardensScreen`.
- `Navigator` realiza a navegación.

---

## Separación de responsabilidades

Un widget de presentación non debería coñecer necesariamente o fluxo completo da aplicación.

Por exemplo:

```text
GardenCard
```

ten a responsabilidade de:

- Mostrar información sobre as hortas.
- Mostrar a acción `Ver hortas`.
- Comunicar que o usuario executou esa acción.

Non ten a responsabilidade de decidir a que pantalla debe navegar a aplicación.

Esta decisión pertence neste caso a:

```text
DashboardScreen
```

porque é a pantalla que coñece o fluxo das accións do Dashboard.

### Regra

**O widget fillo comunica a intención mediante un callback e o widget que coñece o fluxo decide a navegación.**

---

## Aplicación do mesmo patrón a diferentes módulos

O mesmo patrón pode aplicarse sen modificar a arquitectura:

```text
GardenCard
    ↓ onViewGardens
DashboardScreen
    ↓
GardensScreen
```

```text
TasksCard
    ↓ onViewTasks
DashboardScreen
    ↓
TasksScreen
```

E tamén ás accións rápidas:

```text
QuickActionsCard
    ↓ onCreateGarden
DashboardScreen
    ↓
CreateGardenScreen
```

```text
QuickActionsCard
    ↓ onAddTask
DashboardScreen
    ↓
CreateTaskScreen
```

Isto demostra que o patrón pode reutilizarse para diferentes funcionalidades.

---

## Pantallas provisionais

Non é necesario implementar unha pantalla completa no momento de crear unha ruta de navegación.

Podemos crear primeiro unha pantalla provisional:

```dart
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

1. Que a ruta funciona.
2. Que a pantalla se constrúe correctamente.
3. Que a pila de navegación funciona.
4. Que podemos regresar á pantalla anterior.

Posteriormente a pantalla provisional pode substituírse progresivamente pola implementación real.

---

## Organización por funcionalidade

As pantallas deben agruparse segundo a funcionalidade á que pertencen.

A estrutura actual pasa a incluír:

```text
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

Isto facilita localizar o código relacionado cun módulo e mantén separadas as distintas responsabilidades da aplicación.

---

## Principio principal da sesión

Os callbacks e a navegación poden combinarse mantendo separadas as responsabilidades:

```text
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

Deste xeito, os compoñentes visuais non quedan acoplados directamente ás pantallas destino.

---

## Sesión 10 — Modelos, listas dinámicas e formularios

### Obxectivos da sesión

- Introducir un modelo de dominio para representar unha horta.
- Mostrar coleccións de obxectos mediante listas dinámicas.
- Crear widgets especializados para representar elementos dunha lista.
- Xestionar interaccións mediante callbacks con parámetros.
- Navegar a unha pantalla de detalle pasando un obxecto do modelo.
- Introducir `StatefulWidget` e o ciclo de vida do estado.
- Crear o primeiro formulario funcional da aplicación.
- Validar os datos introducidos polo usuario.
- Converter datos de texto aos tipos requiridos polo modelo.
- Introducir conceptos básicos de null safety.
- Devolver datos entre rutas mediante `Navigator`.
- Introducir de maneira práctica `Future`, `async` e `await`.

---

### 1. Modelo `Garden`

Creouse unha clase `Garden` para representar unha horta dentro da aplicación.

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

Responsabilidade:

- `Garden` representa os datos dunha horta.
- Non é responsable da súa representación visual.
- Non é responsable da navegación.
- Non é responsable da persistencia dos datos.

O identificador declárase como:

```dart
String? id;
```

porque unha horta pode existir temporalmente antes de ser gardada na base de datos e, polo tanto, antes de recibir un identificador.

---

### 2. Instancias dun modelo

Unha clase define a estrutura común dos obxectos.

Cada `Garden` é unha instancia distinta do mesmo modelo con valores diferentes nos seus atributos.

Por exemplo:

```dart
Garden(
  id: '1',
  name: 'Horta casa',
  location: 'Ourense',
  area: 40.0,
)
```

e:

```dart
Garden(
  id: '2',
  name: 'Horta aldea',
  location: 'Amoeiro',
  area: 800.0,
)
```

son dous obxectos diferentes da mesma clase `Garden`.

Non é necesario crear unha clase diferente para cada horta.

---

### 3. Colección `List<Garden>`

Para simular os datos que no futuro procederán da persistencia utilizouse unha lista de obxectos `Garden`.

```dart
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

Estes datos son temporais e serán substituídos posteriormente por datos procedentes da capa de persistencia.

---

### 4. `ListView.builder`

Utilizouse `ListView.builder` para construír dinamicamente a lista de hortas.

```dart
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

- `itemCount`: indica cantos elementos ten a lista.
- `itemBuilder`: define como se constrúe cada elemento.
- `index`: identifica a posición do elemento que se está construíndo.

`ListView.builder` permite traballar con listas grandes sen ter que declarar manualmente un widget por cada elemento.

Fluxo:

```text
List<Garden>
    ↓
ListView.builder
    ↓
gardens[index]
    ↓
GardenListItem
```

---

### 5. `GardenListItem`

Creouse un widget específico para representar visualmente unha horta dentro da lista.

Localización:

```text
views/
└── gardens/
    └── widgets/
        └── garden_list_item.dart
```

O widget recibe directamente un obxecto do modelo:

```dart
final Garden garden;
```

Deste modo non é necesario pasar individualmente `name`, `location` e `area`.

Responsabilidade:

> `GardenListItem` representa visualmente unha horta dentro dunha lista e comunica ao widget pai cando o usuario selecciona esa horta.

---

### 6. `InkWell`

Utilizouse `InkWell` para detectar a pulsación sobre un elemento da lista.

Estrutura:

```text
Card
└── InkWell
    └── Padding
        └── Column
```

Un widget non necesita converterse en `StatefulWidget` simplemente porque permita interacción.

A interacción e o estado son conceptos diferentes.

---

### 7. Callbacks con parámetros

Ata este momento utilizáranse callbacks sen parámetros:

```dart
VoidCallback
```

que equivalen conceptualmente a:

```dart
void Function()
```

Para comunicar que horta foi seleccionada utilizouse:

```dart
final void Function(Garden) onTap;
```

Isto permite executar:

```dart
onTap(garden);
```

e enviar o obxecto seleccionado ao widget pai.

Fluxo:

```text
InkWell
    ↓
GardenListItem
    ↓
onTap(garden)
    ↓
GardensScreen
```

---

### 8. Paso de modelos entre pantallas

Creouse `GardenDetailsScreen`, que recibe obrigatoriamente un `Garden`.

```dart
final Garden garden;
```

O mesmo widget pode representar calquera horta dependendo do obxecto recibido.

A navegación realízase mediante:

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => GardenDetailsScreen(
      garden: garden,
    ),
  ),
);
```

Fluxo:

```text
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

Unha única clase `GardenDetailsScreen` permite crear distintas instancias con datos diferentes.

---

### 9. `StatefulWidget`

`CreateGardenScreen` converteuse de `StatelessWidget` a `StatefulWidget`.

Estrutura básica:

```dart
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

- `CreateGardenScreen`: representa o widget e a súa configuración.
- `_CreateGardenScreenState`: mantén o estado e os recursos asociados á instancia.

Que un widget permita interacción non significa automaticamente que necesite ser `StatefulWidget`.

---

### 10. `TextEditingController`

Creáronse controladores para acceder aos datos introducidos polo usuario:

```dart
final TextEditingController nameController =
    TextEditingController();

final TextEditingController locationController =
    TextEditingController();

final TextEditingController areaController =
    TextEditingController();
```

O texto actual dun campo pode consultarse mediante:

```dart
nameController.text
```

Os controladores pertencen ao `State` porque é este quen xestiona o seu ciclo de vida.

---

### 11. `dispose()`

Os `TextEditingController` deben liberarse cando desaparece definitivamente o estado da pantalla.

```dart
@override
void dispose() {
  nameController.dispose();
  locationController.dispose();
  areaController.dispose();

  super.dispose();
}
```

Regra aprendida:

> Se un `State` crea e posúe un recurso que require `dispose()`, tamén é responsabilidade dese `State` liberalo.

---

### 12. `TextFormField`

Utilizouse `TextFormField` para introducir os datos dunha nova horta.

Exemplo:

```dart
TextFormField(
  controller: nameController,
  decoration: const InputDecoration(
    labelText: 'Nome',
  ),
)
```

Para a superficie indicouse unha entrada numérica:

```dart
keyboardType: TextInputType.number
```

O `TextFormField` permite combinar a entrada de datos coa validación do campo.

---

### 13. `Form` e `GlobalKey<FormState>`

Os campos agrupáronse mediante un `Form`.

Creouse unha clave:

```dart
final _formKey = GlobalKey<FormState>();
```

e asociouse ao formulario:

```dart
Form(
  key: _formKey,
  child: Column(
    // campos
  ),
)
```

Isto permite acceder ao estado do formulario e solicitar a validación dos seus campos.

---

### 14. Validación

A validación completa do formulario pode executarse mediante:

```dart
final isValid = _formKey.currentState!.validate();

if (!isValid) {
  return;
}
```

Cada `TextFormField` pode definir o seu propio `validator`.

Exemplo para o nome:

```dart
validator: (value) {
  if (value == null || value.trim().isEmpty) {
    return 'Introduce un nome para a horta';
  }

  return null;
},
```

Tamén se utilizou unha versión compacta mediante o operador ternario:

```dart
validator: (value) =>
    value == null || value.trim().isEmpty
        ? 'Introduce un nome para a horta'
        : null,
```

Regra:

```text
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

- Que exista un valor.
- Que non estea baleiro.
- Que sexa convertible a número.
- Que sexa maior que cero.

Exemplo:

```dart
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

---

### 15. Conversión de `String` a `double`

Os datos dun campo de texto obtéñense inicialmente como `String`.

O modelo `Garden`, pola contra, require:

```dart
final double area;
```

Estudáronse dous métodos:

```dart
double.parse(value)
```

e:

```dart
double.tryParse(value)
```

Diferenza:

```text
double.parse("120.5")     → 120.5
double.parse("abc")       → excepción

double.tryParse("120.5")  → 120.5
double.tryParse("abc")    → null
```

`tryParse()` é especialmente útil para validar datos procedentes do usuario.

Unha vez validado o formulario, pode empregarse `parse()` sabendo que o valor xa é correcto.

---

### 16. Null safety

Introduciuse o concepto de tipo nullable.

Un tipo:

```dart
double
```

debe conter un valor `double`.

En cambio:

```dart
double?
```

pode conter:

```text
double ou null
```

O mesmo principio aplicouse ao identificador de `Garden`:

```dart
final String? id;
```

Isto permite representar unha horta que aínda non foi persistida:

```dart
Garden(
  name: 'Horta nova',
  location: 'Ourense',
  area: 125.0,
)
```

Neste caso:

```dart
garden.id == null
```

Tamén se utilizou o operador de acceso condicional:

```dart
?.
```

Por exemplo:

```dart
garden?.name
```

que accede a `name` unicamente se `garden` non é `null`.

---

### 17. Creación dun modelo desde un formulario

Despois de validar os datos, pode construírse unha instancia de `Garden`.

```dart
final area = double.parse(areaController.text);

final garden = Garden(
  name: nameController.text.trim(),
  location: locationController.text.trim(),
  area: area,
);
```

Neste momento a horta xa existe como obxecto dentro da aplicación, aínda que non foi gardada nunha base de datos.

Fluxo conseguido:

```text
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

---

### 18. Devolución de datos entre rutas

`Navigator.pop()` pode eliminar unha ruta da pila e, ademais, devolver un resultado.

Desde `CreateGardenScreen`:

```dart
Navigator.of(context).pop(garden);
```

Isto:

1. Elimina `CreateGardenScreen` da pila.
2. Volve á pantalla que abriu o formulario.
3. Devolve o obxecto `Garden` como resultado.

A pantalla que abriu a ruta pode esperar ese resultado:

```dart
final garden = await Navigator.of(context).push<Garden>(
  MaterialPageRoute(
    builder: (context) => const CreateGardenScreen(),
  ),
);
```

Se o usuario crea unha horta:

```text
CreateGardenScreen
        ↓
pop(garden)
        ↓
Garden
```

Se abandona o formulario sen crear nada:

```text
CreateGardenScreen
        ↓
Atrás
        ↓
null
```

Por este motivo o resultado que recibe a pantalla anterior pode ser nullable.

---

### 19. `Future`, `async` e `await`

A navegación permitiu introducir de maneira práctica algúns conceptos básicos de programación asíncrona.

Exemplo:

```dart
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

`push<Garden>()` indica o tipo de resultado que esperamos que devolva a ruta.

`await` permite esperar a que a navegación remate e obter o resultado.

Para poder utilizar `await`, o callback declárase como `async`.

Fluxo conceptual:

```text
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

A programación asíncrona estudarase con maior profundidade cando sexa necesaria para a persistencia e para o consumo de APIs.

---

## Decisións de deseño tomadas

- Os datos dunha horta represéntanse mediante o modelo `Garden`.
- `GardenListItem` pertence ao módulo `gardens` porque a súa responsabilidade é específica deste módulo.
- Os widgets poden recibir obxectos completos do modelo cando resulta máis coherente que pasar todos os seus atributos individualmente.
- `GardenListItem` segue sendo `StatelessWidget`; unha interacción non implica por si mesma estado mutable.
- `CreateGardenScreen` é `StatefulWidget` porque xestiona recursos asociados ao ciclo de vida da pantalla.
- Os `TextEditingController` son responsabilidade de `_CreateGardenScreenState`.
- Os controladores libéranse mediante `dispose()`.
- O identificador dunha horta pode ser `null` antes da persistencia.
- Os datos introducidos polo usuario valídanse antes de construír o modelo.
- A creación dunha horta aínda non modifica a lista real da aplicación.
- Non se implementará unha solución temporal para compartir a nova horta entre `DashboardScreen` e `GardensScreen`.
- A xestión compartida dos datos resolverase posteriormente mediante a arquitectura prevista e a persistencia.

---

## Estado ao finalizar a sesión

O módulo de hortas xa permite:

1. Representar hortas mediante un modelo `Garden`.
2. Manter temporalmente unha colección de hortas.
3. Mostrar unha colección mediante `ListView.builder`.
4. Representar cada elemento mediante `GardenListItem`.
5. Seleccionar unha horta mediante `InkWell`.
6. Comunicar a horta seleccionada mediante un callback con parámetro.
7. Navegar á pantalla de detalle.
8. Pasar un `Garden` entre pantallas.
9. Abrir un formulario de creación.
10. Introducir os datos dunha nova horta.
11. Validar os datos do formulario.
12. Converter a superficie de `String` a `double`.
13. Construír un novo obxecto `Garden`.
14. Devolver ese obxecto á ruta anterior mediante `Navigator.pop(garden)`.
15. Recibir o resultado mediante `await Navigator.push<Garden>()`.

A persistencia da nova horta e a actualización compartida da interface quedan deliberadamente pendentes para fases posteriores.

---

## Conceptos clave da sesión

- Modelo de dominio.
- Clase e instancia.
- `List<T>`.
- `ListView.builder`.
- `itemCount`.
- `itemBuilder`.
- `index`.
- Widgets reutilizables.
- `InkWell`.
- `VoidCallback`.
- `void Function(T)`.
- Paso de obxectos entre widgets.
- Paso de obxectos entre pantallas.
- `StatefulWidget`.
- `State<T>`.
- `createState()`.
- Ciclo de vida.
- `TextEditingController`.
- `dispose()`.
- `TextFormField`.
- `Form`.
- `GlobalKey<FormState>`.
- `validator`.
- `double.parse()`.
- `double.tryParse()`.
- Null safety.
- Tipos nullable (`?`).
- Acceso condicional (`?.`).
- `Navigator.push<T>()`.
- `Navigator.pop(resultado)`.
- `Future`.
- `async`.
- `await`.

---

# Sesión 11 - Estado compartido con Provider

## Obxectivo

Introducir a xestión de estado compartido en MARTOLA mediante Provider e aplicar os conceptos ao módulo de hortas.

Durante esta sesión substituíronse os datos temporais almacenados directamente nas Views por un estado centralizado nun `GardensViewModel`.

---

## Estado local e estado compartido

Non todo o estado dunha aplicación debe almacenarse no mesmo lugar.

### Estado local

É aquel que só afecta a un widget ou pantalla concreta.

Exemplo:

```dart
final TextEditingController nameController =
    TextEditingController();
```

O contido dun campo dun formulario é responsabilidade da propia pantalla.

### Estado compartido

É información que debe ser utilizada ou modificada por diferentes partes da aplicación.

Exemplo:

```dart
List<Garden> gardens
```

A colección de hortas é utilizada por diferentes pantallas:

- `DashboardScreen`
- `GardensScreen`
- `GardenDetailsScreen`
- `CreateGardenScreen`
- `EditGardenScreen`

Por este motivo non debe pertencer exclusivamente a ningunha delas.

---

## GardensViewModel

Creouse:

```text
lib/
└── viewmodels/
    └── gardens_viewmodel.dart
```

O `GardensViewModel` é responsable de manter e modificar o estado relacionado coas hortas.

A colección interna mantense privada:

```dart
final List<Garden> _gardens = [];
```

e exponse mediante un getter:

```dart
List<Garden> get gardens =>
    List.unmodifiable(_gardens);
```

`List.unmodifiable()` evita que as Views poidan modificar directamente a colección.

As modificacións deben realizarse mediante métodos do ViewModel.

---

## Encapsulación do estado

Evítase:

```dart
viewModel.gardens.add(garden);
```

e utilízase:

```dart
viewModel.addGarden(garden);
```

Deste xeito, a responsabilidade de modificar o estado permanece no ViewModel.

---

## ChangeNotifier

`GardensViewModel` estende:

```dart
ChangeNotifier
```

Isto permite que o ViewModel notifique ás Views cando o estado cambia.

Exemplo:

```dart
void addGarden(Garden garden) {
    // modificar estado

    notifyListeners();
}
```

O fluxo é:

```text
modificación do estado
        ↓
notifyListeners()
        ↓
widgets subscritos
        ↓
rebuild
```

---

## Provider

Engadiuse o paquete `provider` ao proxecto.

O `GardensViewModel` proporciónase por enriba de `MaterialApp`:

```text
MartolaApp
└── ChangeNotifierProvider
    └── MaterialApp
        └── resto da aplicación
```

Isto permite compartir unha única instancia de `GardensViewModel` entre as diferentes pantallas.

---

## context.watch

Utilízase cando unha View necesita acceder ao estado e reaccionar aos seus cambios.

Exemplo:

```dart
final gardensViewModel =
    context.watch<GardensViewModel>();

final gardens = gardensViewModel.gardens;
```

Aplicado en:

```text
GardensScreen
```

Cando `GardensViewModel` executa `notifyListeners()`, a pantalla reconstrúese.

---

## context.read

Utilízase cando unha View necesita acceder ao ViewModel para executar unha acción pero non necesita subscribirse aos seus cambios.

Exemplo:

```dart
context
    .read<GardensViewModel>()
    .addGarden(garden);
```

Aplicado en:

```text
CreateGardenScreen
```

---

## context.select

Utilízase cando unha View só necesita reaccionar aos cambios dunha parte concreta do estado.

Exemplo:

```dart
final gardenCount =
    context.select<GardensViewModel, int>(
        (viewModel) => viewModel.gardens.length,
    );
```

Aplicado no Dashboard para mostrar o número de hortas.

Isto permite evitar reconstrucións innecesarias cando cambia outra información do ViewModel.

---

## Regra práctica

```text
read
→ acceder ao ViewModel sen escoitar cambios

watch
→ escoitar os cambios do ViewModel

select
→ escoitar un valor concreto do ViewModel
```

---

## Provider non é persistencia

Provider permite manter estado compartido mentres a aplicación está en execución.

Non almacena os datos de forma permanente.

Actualmente:

```text
GardensViewModel
      ↓
estado en memoria
```

Ao pechar completamente a aplicación, as hortas desaparecen.

A persistencia implementarase posteriormente mediante:

```text
View
 ↓
ViewModel
 ↓
Repository
 ↓
SQLite
```

---

## CRUD en memoria

Durante a sesión implementouse un primeiro CRUD completo sobre as hortas.

### CREATE

```dart
addGarden()
```

### READ

```dart
gardens
```

e:

```dart
getGardenById()
```

### UPDATE

```dart
updateGarden()
```

### DELETE

```dart
removeGarden()
```

Todo o estado está centralizado en:

```text
GardensViewModel
```

---

## Identidade temporal das hortas

Antes de SQLite, as hortas creadas desde o formulario non dispoñían dun identificador.

Engadiuse temporalmente un contador ao ViewModel:

```dart
int _nextId = 1;
```

Ao engadir unha horta, o ViewModel crea unha nova instancia cun identificador:

```text
Garden sen ID
     ↓
addGarden()
     ↓
asignación de ID temporal
     ↓
Garden almacenado
```

Exemplo:

```text
1
2
3
...
```

Os IDs almacénanse como `String`.

Este mecanismo é provisional e será substituído pola estratexia de identificación utilizada pola capa de persistencia.

---

## Modelos inmutables

`Garden` utiliza propiedades `final`.

Por este motivo unha edición non modifica directamente a instancia existente.

Evítase:

```dart
garden.name = 'Novo nome';
```

En cambio créase unha nova instancia:

```dart
final updatedGarden = Garden(
    id: widget.garden.id,
    name: nameController.text.trim(),
    location: locationController.text.trim(),
    area: area,
);
```

e o ViewModel substitúe a instancia anterior:

```dart
_gardens[index] = updatedGarden;
```

---

## updateGarden

A actualización localiza primeiro a instancia existente:

```dart
final index = _gardens.indexOf(oldGarden);
```

Se non existe:

```dart
if (index == -1) {
    return;
}
```

Se existe, substitúese:

```dart
_gardens[index] = updatedGarden;
notifyListeners();
```

A nova instancia conserva o mesmo ID.

---

## getGardenById

Engadiuse unha operación para recuperar unha horta mediante a súa identidade:

```dart
Garden? getGardenById(String id)
```

Pode devolver:

```text
Garden
```

ou:

```text
null
```

se non existe ningunha horta co identificador solicitado.

---

## GardenDetailsScreen e fonte de verdade

Inicialmente `GardenDetailsScreen` recibía directamente:

```dart
Garden garden
```

Isto provocaba que, despois dunha edición, a pantalla puidese conservar unha referencia á instancia antiga.

A solución foi facer que a pantalla traballe coa identidade:

```dart
String gardenId
```

e obteña a versión actual desde `GardensViewModel`:

```dart
final garden =
    context.select<GardensViewModel, Garden?>(
        (viewModel) =>
            viewModel.getGardenById(gardenId),
    );
```

Deste xeito o ViewModel actúa como fonte de verdade.

```text
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

---

## Eliminación por identidade

Inicialmente:

```dart
removeGarden(Garden garden)
```

Posteriormente cambiouse a operación para traballar mediante identidade:

```dart
removeGarden(String id)
```

O ViewModel localiza internamente a horta mediante:

```dart
getGardenById(id)
```

Isto evita depender dunha instancia concreta do modelo.

---

## initState

Na pantalla de edición utilizouse `initState()` para inicializar os controladores cos valores actuais da horta.

```dart
@override
void initState() {
    super.initState();

    nameController = TextEditingController(
        text: widget.garden.name,
    );
}
```

`initState()` execútase unha vez cando se crea o estado do widget.

---

## late final

Os controladores de `EditGardenScreen` decláranse mediante:

```dart
late final TextEditingController nameController;
```

Isto permite declaralos antes de coñecer o valor inicial e inicializalos posteriormente en `initState()`.

`final` garante que a referencia ao controlador non será substituída despois da inicialización.

---

## widget dentro dun State

Dentro dunha clase:

```dart
State<EditGardenScreen>
```

pódese acceder á configuración do `StatefulWidget` asociado mediante:

```dart
widget
```

Por exemplo:

```dart
widget.garden.name
```

---

## Conceptos principais aprendidos

- Estado local.
- Estado compartido.
- Encapsulación do estado.
- ViewModel como fonte de verdade.
- Provider.
- `ChangeNotifier`.
- `notifyListeners()`.
- `ChangeNotifierProvider`.
- `context.read`.
- `context.watch`.
- `context.select`.
- Modelos inmutables.
- Identidade de entidades.
- `Garden?` e tratamento de ausencia de datos.
- `initState()`.
- `late final`.
- Acceso mediante `widget` desde un `State`.
- CRUD en memoria.
- Diferencia entre estado e persistencia.

---

## Estado ao finalizar a sesión

O módulo de hortas permite actualmente:

```text
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

- `DashboardScreen`
- `GardensScreen`
- `GardenDetailsScreen`
- `CreateGardenScreen`
- `EditGardenScreen`

mediante `GardensViewModel` e Provider.

Os datos aínda se almacenan exclusivamente en memoria.