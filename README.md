# MARTOLA

**Modelo Avanzado de Rexistro e Tratamento de Organización de Leiras e Agricultura**

Aplicación multiplataforma desenvolvida con Flutter para a xestión de hortas e xardíns.

## Estado actual

🚧 **En desenvolvemento — 0.1.0-alpha**

Actualmente están implementados:

- Xestión de hortas.
- Xestión de plantas asociadas a cada horta.
- Catálogo local de especies.
- Persistencia mediante SQLite.
- CRUD completo de hortas e plantas.
- Xestión de estado mediante Provider.

O proxecto continúa en desenvolvemento como parte do TFC de DAM.

## Tecnoloxías

- Flutter
- Dart
- SQLite
- Provider

## Arquitectura

A aplicación utiliza unha arquitectura MVVM simplificada combinada co Repository Pattern:

View → ViewModel → Repository → SQLite

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