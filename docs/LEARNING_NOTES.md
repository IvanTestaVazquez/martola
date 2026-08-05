# LEARNING_NOTES.md

# MARTOLA - Flutter Learning Notes

## Purpose

Este documento recolle os conceptos aprendidos durante o desenvolvemento de MARTOLA.

Non pretende substituír a documentación oficial de Flutter, senón servir como guía de consulta rápida cos conceptos fundamentais que se vaian aprendendo ao longo do proxecto.

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