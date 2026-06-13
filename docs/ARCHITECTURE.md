# ARCHITECTURE.md

# MARTOLA - Architecture Documentation

## Purpose

Este documento define a arquitectura software da aplicación MARTOLA.

O seu obxectivo é proporcionar unha guía clara para:

- Organización do código.
- Separación de responsabilidades.
- Escalabilidade futura.
- Mantemento do proxecto.

---

# Architecture Overview

A aplicación seguirá unha arquitectura baseada en MVVM (Model-View-ViewModel) simplificada combinada cun patrón Repository.

O fluxo principal será:

View
↓
ViewModel
↓
Repository
↓
Database / API
↓
SQLite / External Services

---

# Architecture Layers

## View Layer

Responsable da interface gráfica.

Funcións:

- Mostrar información.
- Capturar interaccións do usuario.
- Delegar a lóxica ao ViewModel.

Non debe conter:

- Consultas SQL.
- Chamadas HTTP.
- Regras de negocio complexas.

Exemplos:

- HomeScreen
- GardensScreen
- GardenDetailScreen
- PlantDetailScreen
- LayoutDesignerScreen

---

## ViewModel Layer

Responsable da lóxica de presentación.

Funcións:

- Procesar accións do usuario.
- Solicitar datos aos repositorios.
- Preparar datos para a vista.
- Notificar cambios mediante Provider.

Exemplos:

- HomeViewModel
- GardensViewModel
- GardenDetailViewModel
- PlantDetailViewModel

---

## Repository Layer

Responsable do acceso aos datos.

Funcións:

- Abstraer a fonte dos datos.
- Combinar SQLite e APIs.
- Proporcionar unha interface común.

Exemplos:

- GardenRepository
- PlantRepository
- WeatherRepository

---

## Data Layer

Responsable do almacenamento.

Fontes previstas:

### SQLite

Persistencia local.

### APIs externas

Inicialmente:

- OpenWeatherMap

Futuras:

- APIs botánicas
- Servizos cloud

---

# Folder Structure

lib/
├── core/
│
├── models/
│
├── views/
│
├── viewmodels/
│
├── repositories/
│
├── services/
│
├── database/
│
├── widgets/
│
├── utils/
│
└── main.dart

---

# Folder Description

## core/

Configuración global.

Contido previsto:

- themes
- constants
- routes

---

## models/

Modelos de datos.

Exemplos:

- User
- Garden
- PlantSpecies
- GardenPlant
- WeatherRecord

---

## views/

Pantallas da aplicación.

Exemplos:

- home_screen.dart
- gardens_screen.dart
- garden_detail_screen.dart

---

## viewmodels/

Lóxica de presentación.

Exemplos:

- home_viewmodel.dart
- gardens_viewmodel.dart

---

## repositories/

Acceso aos datos.

Exemplos:

- garden_repository.dart
- plant_repository.dart
- weather_repository.dart

---

## services/

Servizos externos.

Exemplos:

- weather_service.dart
- storage_service.dart

---

## database/

Configuración SQLite.

Exemplos:

- database_service.dart
- migrations/

---

## widgets/

Compoñentes reutilizables.

Exemplos:

- garden_card.dart
- weather_card.dart
- action_card.dart

---

## utils/

Utilidades xerais.

Exemplos:

- date_utils.dart
- validators.dart

---

# State Management

## Provider

Utilizarase Provider como sistema principal de xestión de estado.

Motivos:

- Sinxeleza.
- Boa integración con Flutter.
- Curva de aprendizaxe moderada.
- Adecuado para o tamaño do proxecto.

---

# Navigation

Navegación prevista:

Navigator 2.0 ou GoRouter.

Decisión pendente.

Inicialmente poderase usar Navigator estándar.

---

# Dependency Flow

As dependencias deben seguir esta dirección:

View
→ ViewModel
→ Repository
→ Service / Database

Nunca:

Database
→ View

---

# Local First Strategy

A aplicación priorizará o almacenamento local.

Beneficios:

- Funciona sen conexión.
- Menor complexidade inicial.
- Desenvolvemento máis rápido.

A sincronización cloud poderá incorporarse posteriormente.

---

# Future Architecture Evolution

Posibles melloras futuras:

- Firebase
- Supabase
- Cloud Sync
- Authentication
- Push Notifications
- AI Services

---

# Notes

A arquitectura debe manterse simple durante as primeiras fases do proxecto.

O obxectivo principal é construír unha aplicación funcional antes de introducir capas adicionais de complexidade.

As futuras ampliacións deberán respectar a separación de responsabilidades definida neste documento.