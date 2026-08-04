# DEVELOPMENT_GUIDE.md

# MARTOLA - Development Guide

## Purpose

Este documento define o plan de aprendizaxe e desenvolvemento da aplicación MARTOLA.

O seu obxectivo non é substituír o ROADMAP técnico do proxecto, senón servir como guía práctica para aprender Flutter e Dart mentres se desenvolve a aplicación.

Cada sesión de traballo terá un obxectivo concreto, conceptos asociados e un resultado funcional dentro de MARTOLA.

---

# Current Learning Status

## Preparation Completed

- [x] Repositorio GitHub configurado.
- [x] Proxecto Flutter creado.
- [x] Estrutura de carpetas creada.
- [x] Arquitectura documentada.
- [x] Interface inicial definida.
- [x] Modelo de datos documentado.

## Current Phase

Phase 1 - Flutter Fundamentals

## Next Action

Comezar a Session 1 e crear a primeira HomeScreen de MARTOLA.

---

# Working Method

Cada sesión seguirá sempre a mesma estrutura.

## 1. Theory

Introdución aos conceptos necesarios.

Só se estudará a teoría imprescindible para implementar a funcionalidade da sesión.

---

## 2. Implementation

Aplicación inmediata dos conceptos aprendidos dentro de MARTOLA.

Non se realizarán exercicios independentes do proxecto salvo que sexan imprescindibles para comprender un concepto.

---

## 3. Review

Ao finalizar a implementación revisarase:

- organización do código
- boas prácticas
- alternativas posibles
- erros frecuentes

---

## 4. Version Control

Ao finalizar cada sesión realizarase un commit en Git.

Cada commit representará un pequeno avance funcional.

---

## 5. Documentation

Actualizaranse os documentos do proxecto sempre que sexa necesario.

Especialmente:

- PROJECT_CONTEXT.md
- ARCHITECTURE.md
- DATABASE_DESIGN.md
- UI_REFERENCE.md
- ROADMAP.md

---

# Learning Objectives

Ao finalizar o proxecto deberase comprender:

- Dart
- Flutter
- Widgets
- Material Design
- Navegación
- MVVM
- Provider
- SQLite
- Consumo de APIs REST
- Responsive Design
- Arquitectura dunha aplicación Flutter
- Organización dun proxecto profesional

---

# Development Phases

## Phase 1

Flutter Fundamentals

Status:

🟡 In Progress

### Concepts

- Estrutura dun proxecto Flutter
- main.dart
- runApp()
- Widget
- StatelessWidget
- StatefulWidget
- MaterialApp
- Scaffold
- BuildContext
- Hot Reload

### Practical Objective

Crear a primeira pantalla funcional de MARTOLA.

### Deliverable

HomeScreen funcionando.

---

## Phase 2

Layouts

Status:

⬜ Pending

### Concepts

- Column
- Row
- Expanded
- Flexible
- Container
- Padding
- Margin
- Align
- Center

### Practical Objective

Construír a estrutura visual da HomeScreen.

---

## Phase 3

Navigation

Status:

⬜ Pending

### Concepts

- Navigator
- Routes
- Navigation Stack
- Paso de parámetros

### Practical Objective

Crear a navegación entre:

- HomeScreen
- GardensScreen
- GardenDetailScreen
- PlantDetailScreen
- LayoutDesignerScreen

---

## Phase 4

Reusable Widgets

Status:

⬜ Pending

### Concepts

- Composición
- Props
- Reutilización
- Organización de widgets

### Practical Objective

Crear:

- GardenCard
- WeatherCard
- PlantCard
- ActionCard

---

## Phase 5

Application Theme

Status:

⬜ Pending

### Concepts

- ThemeData
- ColorScheme
- Typography
- Icons
- Material 3

### Practical Objective

Aplicar un deseño consistente a toda a aplicación.

---

## Phase 6

State Management

Status:

⬜ Pending

### Concepts

- Provider
- ChangeNotifier
- notifyListeners()
- MVVM

### Practical Objective

Conectar vistas e ViewModels.

---

## Phase 7

Models

Status:

⬜ Pending

### Concepts

- Clases Dart
- fromMap()
- toMap()
- JSON
- Encapsulamento

### Practical Objective

Crear todos os modelos da aplicación.

---

## Phase 8

SQLite

Status:

⬜ Pending

### Concepts

- sqflite
- CRUD
- Repository Pattern
- Persistencia local

### Practical Objective

Implementar a base de datos local.

---

## Phase 9

Forms

Status:

⬜ Pending

### Concepts

- Form
- TextField
- Validation
- Controllers

### Practical Objective

Crear formularios de creación e edición.

---

## Phase 10

REST APIs

Status:

⬜ Pending

### Concepts

- HTTP
- REST
- JSON
- async/await
- Future

### Practical Objective

Integrar OpenWeatherMap.

---

## Phase 11

Garden Module

Status:

⬜ Pending

### Practical Objective

Finalizar a xestión completa das hortas.

---

## Phase 12

Plant Module

Status:

⬜ Pending

### Practical Objective

Finalizar a xestión completa das plantas.

---

## Phase 13

Plant Evolution

Status:

⬜ Pending

### Practical Objective

Implementar o seguemento da evolución das plantas.

---

## Phase 14

Layout Designer

Status:

⬜ Pending

### Concepts

- Drag & Drop
- GestureDetector
- Positioned
- Stack

### Practical Objective

Deseño visual da horta.

---

## Phase 15

Responsive Design

Status:

⬜ Pending

### Practical Objective

Adaptar a aplicación para:

- móbil
- tablet
- escritorio

---

## Phase 16

Testing & Optimization

Status:

⬜ Pending

### Concepts

- Debugging
- Performance
- Refactoring

### Practical Objective

Optimizar a aplicación.

---

## Phase 17

Final Documentation

Status:

⬜ Pending

### Practical Objective

Preparar:

- Memoria
- Capturas
- Diagramas
- Defensa

---

# Session Log

Esta sección actualizarase ao finalizar cada sesión.

## Session 1

Status:

✅ Completed

### Concepts Learned

- Estrutura xeral dunha aplicación Flutter.
- Función `main()`.
- Función `runApp()`.
- Widget raíz da aplicación.
- Que é un Widget.
- Diferenza entre `StatelessWidget` e `StatefulWidget`.
- Uso de `const`.
- Filosofía de composición mediante widgets.

### Practical Work

- Análise conceptual do ficheiro `main.dart`.
- Comprensión da árbore de widgets.
- Definición dos criterios para distinguir widgets con estado e sen estado.

### Code Implemented

Ningún.

A sesión centrouse exclusivamente na comprensión da arquitectura básica de Flutter.

### Documentation Updated

- DEVELOPMENT_GUIDE.md

### Commit

Non necesario.

### Notes

A comprensión dos fundamentos foi satisfactoria. Antes de implementar código considérase importante consolidar o funcionamento interno dunha aplicación Flutter para facilitar as seguintes fases do desenvolvemento.

---

# Next Session

Phase:

Flutter Fundamentals

Objectives:

- Comprender como nace unha aplicación Flutter.
- Crear a primeira HomeScreen.
- Entender o papel de MaterialApp.
- Comprender a estrutura dun Widget.
- Executar a primeira pantalla propia de MARTOLA.

Estimated Duration:

2 horas