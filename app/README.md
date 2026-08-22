# MARTOLA - Flutter App

Aplicación Flutter do proxecto MARTOLA.

Este directorio contén o código fonte da aplicación multiplataforma para a xestión de hortas e xardíns.

## Tecnoloxías

- Flutter / Dart
- Provider
- SQLite
- HTTP
- OpenWeather

## Arquitectura

A aplicación utiliza unha arquitectura MVVM simplificada combinada co Repository Pattern:

```text
View
  ↓
ViewModel
  ↓
Repository
  ↓
Data Source / Service
```

O código principal atópase en `lib/`:

```text
lib/
├── models/
├── repositories/
├── services/
├── viewmodels/
├── views/
└── widgets/
```

## Execución

Instalar as dependencias:

```bash
flutter pub get
```

Executar a aplicación:

```bash
flutter run --dart-define-from-file=config/secrets.json
```

Comprobar o código co analizador de Flutter:

```bash
flutter analyze
```

## Persistencia

A aplicación utiliza SQLite para a persistencia local.

O esquema actual da base de datos é a versión 6.

## Documentación

A documentación completa do proxecto atópase no directorio `docs/` da raíz do repositorio.