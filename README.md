# MARTOLA

**Modelo Avanzado de Rexistro e Tratamento de Organización de Leiras e Agricultura**

Aplicación multiplataforma desenvolvida con Flutter para a xestión de hortas e xardíns.

MARTOLA é un proxecto desenvolvido como Traballo de Fin de Ciclo do Ciclo Superior de Desenvolvemento de Aplicacións Multiplataforma (DAM).

## Estado actual

**MVP funcional — 1.0.0**

Actualmente están implementados:

- Xestión de hortas e xardíns.
- Xestión das plantas asociadas a cada horta.
- Catálogo local de especies.
- Rexistro da evolución das plantas.
- Consulta meteorolóxica contextualizada por horta.
- Busca de localizacións mediante xeocodificación.
- Deseño visual da disposición das plantas.
- Xestión básica de tarefas.
- Persistencia local mediante SQLite.
- Xestión de estado mediante Provider.
- Interface adaptada a diferentes tamaños de pantalla.

O núcleo funcional do proxecto está completado. O traballo restante céntrase principalmente no testing, revisión final, documentación e preparación da entrega e defensa.

## Tecnoloxías

- Flutter.
- Dart.
- Provider.
- SQLite.
- HTTP.
- OpenWeather.

## Arquitectura

A aplicación utiliza unha arquitectura **MVVM simplificada** combinada co **Repository Pattern**.

O fluxo principal é:

```text
View
  ↓
ViewModel
  ↓
Repository
  ↓
Data Source / Service
```

Para os datos locais:

```text
View
  ↓
ViewModel
  ↓
Repository
  ↓
SQLite
```

Para os servizos externos:

```text
View
  ↓
ViewModel
  ↓
Repository
  ↓
API externa
```

Esta separación permite manter desacopladas a interface, a lóxica de presentación, o acceso aos datos e os servizos externos.

## Funcionalidades principais

### Hortas

Permite crear, consultar, editar e eliminar hortas.

Cada horta pode almacenar información como:

- nome;
- localización;
- superficie;
- coordenadas xeográficas.

### Plantas

Cada horta pode conter múltiples plantas.

Para cada planta rexístranse datos como:

- nome personalizado;
- especie;
- data de plantación.

### Evolución das plantas

Permite crear un histórico de evolución para cada planta mediante rexistros que poden incluír:

- data;
- altura;
- notas.

### Meteoroloxía

As hortas que dispoñen de coordenadas poden consultar información meteorolóxica mediante OpenWeather.

A meteoroloxía obtense baixo demanda e non se persiste actualmente en SQLite.

### Xeocodificación

Durante a creación ou edición dunha horta é posible buscar unha localización e seleccionar un resultado xeográfico.

As coordenadas obtidas almacénanse coa horta e permiten posteriormente realizar consultas meteorolóxicas contextualizadas.

### Deseño da horta

O Layout Designer permite representar visualmente as plantas dunha horta.

Inclúe:

- colocación de plantas;
- arrastre dos elementos;
- prevención de solapamentos;
- retirada de elementos do deseño;
- persistencia das posicións;
- adaptación das coordenadas ao tamaño do taboleiro.

### Tarefas

MARTOLA incorpora unha xestión básica de tarefas pendentes.

As tarefas persístense localmente e intégranse no Dashboard da aplicación.

## Persistencia

A aplicación utiliza SQLite como sistema de persistencia local.

O esquema actual atópase na **versión 6** e inclúe as táboas principais:

```text
gardens
plant_species
garden_plants
plant_evolution_records
garden_layout_items
tasks
```

As actualizacións do esquema realízanse mediante migracións incrementais.

## Plataformas

O proxecto está orientado inicialmente a:

- Android.
- Windows.
- Linux.
- Tablets.

A interface utiliza layouts adaptables para manter o mesmo fluxo funcional en diferentes tamaños de pantalla.

## Estrutura do repositorio

```text
martola/
├── app/
│   └── lib/
│       ├── models/
│       ├── repositories/
│       ├── services/
│       ├── viewmodels/
│       ├── views/
│       └── widgets/
│
├── docs/
└── README.md
```

## Documentación

A documentación técnica e de desenvolvemento atópase no directorio `docs/`.

Entre os documentos principais están:

- `PROJECT_CONTEXT.md`
- `ROADMAP.md`
- `ARCHITECTURE.md`
- `DATABASE_DESIGN.md`
- `UI_REFERENCE.md`
- `DEVELOPMENT_GUIDE.md`
- `LEARNING_NOTES.md`

## Execución

Desde o directorio `app/`:

```bash
flutter pub get
```

Para executar a aplicación:

```bash
flutter run
```

Para comprobar o código mediante o analizador de Flutter:

```bash
flutter analyze
```

## Estado da análise

Na revisión técnica actual:

```text
flutter analyze
No issues found!
```

## Posibles ampliacións futuras

Unha vez completado o alcance principal do TFC, MARTOLA podería ampliarse con funcionalidades como:

- autenticación de usuarios;
- sincronización cloud;
- histórico meteorolóxico persistente;
- melloras avanzadas do Layout Designer;
- ampliación do sistema de tarefas;
- versión web.

Estas funcionalidades non forman parte dos requisitos necesarios do MVP actual.