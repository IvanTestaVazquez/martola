# MARTOLA - Development Roadmap

## Purpose

Este documento define a planificación técnica do desenvolvemento de MARTOLA.

O seu obxectivo é:

- Dividir o proxecto en fases.
- Establecer prioridades.
- Facilitar o seguemento do progreso.
- Evitar bloqueos durante o desenvolvemento.

---

# Current Status

## Completed

- Idea do proxecto.
- Nome definitivo.
- Análise de requisitos.
- Planificación inicial.
- Modelo de datos inicial.
- Arquitectura.
- Fluxo de navegación.
- Estrutura Figma.
- Documentación técnica inicial.
- Creación do repositorio GitHub.
- Creación do proxecto Flutter.
- Estrutura inicial de carpetas.
- HomeScreen funcional.
- DashboardScreen inicial.
- Configuración inicial do Theme global.
- Primeiros widgets reutilizables.
- Navegación básica mediante `Navigator`.
- Modelo de dominio `Garden`.
- Listado inicial de hortas con datos ficticios.
- Pantalla de detalle dunha horta.
- Formulario validado para creación dunha horta.
- Integración de Provider.
- Primeiro ViewModel funcional (`GardensViewModel`).
- Estado compartido das hortas.
- Identificadores temporais para as hortas en memoria.
- Consulta de hortas mediante identificador.
- Edición de hortas.
- Eliminación de hortas con confirmación.
- CRUD completo de hortas en memoria.
- Sincronización automática das Views mediante Provider.
- Introdución do Repository Pattern.
- Creación da abstracción `GardenRepository`.
- Creación de `MemoryGardenRepository`.
- Traslado do almacenamento temporal de hortas desde `GardensViewModel` ao Repository.
- Integración de `GardensViewModel` con `GardenRepository`.
- Inxección de dependencias mediante o construtor.
- Desacoplamento do ViewModel da implementación concreta de persistencia.
- CRUD de hortas delegado na capa Repository.

## In Progress

- Aprendizaxe de Flutter e Dart.
- Primeira iteración da interface.
- Design System.
- Navegación entre pantallas.
- Módulo de hortas.
- Preparación da persistencia local con SQLite.

## Pending

- Persistencia con SQLite.
- Módulo de plantas.
- Seguemento da evolución das plantas.
- API meteorolóxica.
- Layout Designer.

---

# Phase 1 - Project Setup

## Objective

Preparar o proxecto Flutter e a súa estrutura.

## Tasks

- [x] Crear proxecto Flutter.
- [x] Configurar Git.
- [x] Crear repositorio GitHub.
- [x] Definir estrutura de carpetas.
- [x] Crear tema básico da aplicación.
- [x] Crear navegación básica mediante `Navigator`.
- [x] Configurar Provider.

## Deliverable

Aplicación Flutter funcional cunha estrutura inicial organizada, tema global e navegación básica.

**Estado:** completada.

---

# Phase 2 - Navigation and Screens

## Objective

Construír a navegación principal e as pantallas base da aplicación.

## Tasks

- [x] HomeScreen.
- [x] DashboardScreen.
- [x] GardensScreen.
- [x] GardenDetailsScreen.
- [x] CreateGardenScreen.
- [x] TasksScreen inicial.
- [x] CreateTaskScreen inicial.
- [ ] PlantListScreen.
- [ ] PlantDetailsScreen.
- [ ] LayoutDesignerScreen.
- [ ] SettingsScreen.
- [ ] Completar os fluxos de navegación pendentes.

## Deliverable

Navegación completa entre as pantallas principais.

Nesta fase poden empregarse datos ficticios, sen necesidade de persistencia real.

**Estado:** en progreso.

---

# Phase 3 - State Management

## Objective

Introducir unha xestión de estado organizada e desacoplar os datos das pantallas.

## Tasks

- [x] Configurar Provider.
- [x] Crear o primeiro ViewModel (`GardensViewModel`).
- [x] Mover o estado das hortas fóra das Views.
- [x] Permitir que varias pantallas compartan o mesmo estado.
- [x] Actualizar automaticamente a interface cando cambian os datos.
- [x] Utilizar `ChangeNotifier` e `notifyListeners()`.
- [x] Diferenciar o uso de `context.read`, `context.watch` e `context.select`.
- [x] Encapsular a colección de hortas.
- [x] Establecer `GardensViewModel` como punto de acceso ao estado das hortas desde as Views.

## Deliverable

Xestión de estado funcional mediante Provider seguindo o enfoque MVVM simplificado previsto para MARTOLA.

**Estado:** completada para a infraestrutura inicial. Poderán engadirse novos ViewModels segundo se desenvolvan os restantes módulos.

---

# Phase 4 - Repository Foundation

## Objective

Introducir a capa Repository e separar a xestión do estado do acceso aos datos.

## Tasks

- [x] Comprender a responsabilidade do Repository.
- [x] Crear `GardenRepository`.
- [x] Definir as operacións necesarias para o módulo de hortas.
- [x] Crear `MemoryGardenRepository`.
- [x] Conectar `GardensViewModel` con `GardenRepository`.
- [x] Mover o almacenamento temporal desde `GardensViewModel` ao Repository.
- [x] Aplicar inxección de dependencias.
- [x] Evitar que o ViewModel dependa directamente dunha implementación concreta.
- [x] Preparar a arquitectura para substituír o almacenamento temporal en memoria pola persistencia local.

## Deliverable

Separación funcional entre a xestión do estado e o acceso aos datos.

Fluxo actual:

```text
View
 ↓
GardensViewModel
 ↓
GardenRepository
 ↑
MemoryGardenRepository
 ↓
Memoria
```

A arquitectura permite substituír no futuro MemoryGardenRepository por unha implementación baseada en SQLite sen modificar as Views.

**Estado:** completada.

---

# Phase 5 - Database Foundation

## Objective

Integrar SQLite e establecer a capa básica de persistencia.

## Tasks

- [ ] Configurar `sqflite`.
- [ ] Crear DatabaseService.
- [ ] Crear táboas.
- [ ] Crear migracións iniciais.
- [ ] Implementar operacións básicas de lectura e escritura.
- [ ] Integrar a persistencia coa capa Repository.

## Deliverable

Base de datos local funcional e accesible mediante unha capa de persistencia organizada.

---

# Phase 6 - Gardens Module

## Objective

Implementar a xestión completa de hortas.

## Implemented

- [x] Crear modelo `Garden`.
- [x] Mostrar unha lista inicial de hortas con datos ficticios.
- [x] Crear `GardenListItem`.
- [x] Seleccionar unha horta.
- [x] Mostrar o detalle dunha horta.
- [x] Crear formulario de nova horta.
- [x] Validar os datos do formulario.
- [x] Construír un obxecto `Garden` desde o formulario.
- [x] Devolver un `Garden` entre rutas como primeira aproximación ao fluxo de creación.
- [x] Integrar o módulo con `GardensViewModel`.
- [x] Incorporar novas hortas ao estado compartido.
- [x] Substituír os datos ficticios do listado polo estado real en memoria.
- [x] Actualizar automaticamente o listado mediante Provider.
- [x] Asignar identificadores temporais ás hortas.
- [x] Recuperar unha horta mediante `getGardenById()`.
- [x] Consultar o detalle mediante a identidade da horta.
- [x] Crear `EditGardenScreen`.
- [x] Editar unha horta.
- [x] Conservar a identidade durante unha actualización.
- [x] Eliminar unha horta.
- [x] Solicitar confirmación antes da eliminación.
- [x] Completar o CRUD de hortas en memoria.
- [x] Crear `GardenRepository`.
- [x] Crear `MemoryGardenRepository`.
- [x] Integrar `GardensViewModel` con `GardenRepository`.
- [x] Delegar o CRUD na capa Repository.
- [x] Utilizar a identidade da horta nas operacións de actualización e eliminación.
- [x] Desacoplar o ViewModel da implementación concreta do Repository.

## Pending

## Pending

- [ ] Gardar unha horta en SQLite.
- [ ] Recuperar hortas desde SQLite.
- [ ] Actualizar hortas en SQLite.
- [ ] Eliminar hortas de SQLite.
- [ ] Substituír os identificadores temporais polos identificadores da capa de persistencia.
- [ ] Revisar e refinar a interface do módulo.

## Deliverable

Módulo de hortas completo con operacións de creación, consulta, edición e eliminación persistidas localmente.

**Estado:** en progreso. CRUD funcional mediante Repository en memoria; persistencia SQLite pendente.

---

# Phase 7 - Plants Module

## Objective

Implementar a xestión de plantas.

## Tasks

- [ ] Crear modelo de planta.
- [ ] Listar plantas.
- [ ] Crear planta.
- [ ] Editar planta.
- [ ] Eliminar planta.
- [ ] Asociar planta cunha horta.
- [ ] Asociar especie.
- [ ] Mostrar detalle.

## Deliverable

Módulo de plantas funcional e integrado co módulo de hortas.

---

# Phase 8 - Plant Evolution Module

## Objective

Implementar o seguemento das plantas.

## Tasks

- [ ] Crear rexistros de evolución.
- [ ] Editar rexistros.
- [ ] Mostrar historial.
- [ ] Rexistrar medicións.
- [ ] Mostrar fotografías.

## Deliverable

Seguemento da evolución dunha planta ao longo do tempo.

---

# Phase 9 - Weather Module

## Objective

Integrar información meteorolóxica.

## Tasks

- [ ] Conectar OpenWeatherMap.
- [ ] Substituír os datos meteorolóxicos ficticios.
- [ ] Mostrar clima actual.
- [ ] Relacionar información meteorolóxica coa horta correspondente.
- [ ] Gardar históricos.
- [ ] Consultar rexistros meteorolóxicos.

## Deliverable

Sistema meteorolóxico funcional e integrado coas hortas.

---

# Phase 10 - Layout Designer

## Objective

Implementar a representación visual da horta.

## Tasks

- [ ] Crear área de deseño.
- [ ] Mostrar plantas.
- [ ] Posicionar elementos.
- [ ] Gardar disposición.
- [ ] Recuperar unha disposición gardada.

## Deliverable

Primeira versión funcional do deseñador visual.

---

# Phase 11 - UI Improvement

## Objective

Mellorar a experiencia visual e consolidar o Design System.

## Tasks

- [x] Configuración inicial do Theme global.
- [x] Creación dos primeiros widgets reutilizables.
- [ ] Completar o Design System.
- [ ] Refinar compoñentes.
- [ ] Unificar estilos de formularios, Cards e botóns.
- [ ] Adaptar a tablet.
- [ ] Adaptar a escritorio.
- [ ] Revisar accesibilidade e usabilidade.

## Deliverable

Interface consistente, usable e responsive.

---

# Phase 12 - Testing

## Objective

Validar o funcionamento.

## Tasks

- [ ] Testes manuais.
- [ ] Testes das validacións.
- [ ] Testes de navegación.
- [ ] Testes de persistencia.
- [ ] Corrección de erros.
- [ ] Optimización.
- [ ] Validación en Android.
- [ ] Validación en escritorio.

## Deliverable

Versión candidata á entrega.

---

# Phase 13 - Documentation

## Objective

Completar a documentación final.

## Tasks

- [ ] Actualizar documentación técnica.
- [ ] Memoria.
- [ ] Diagramas.
- [ ] Capturas.
- [ ] Conclusións.
- [ ] Liñas futuras.

## Deliverable

Documentación final do TFC.

---

# MVP Definition

A primeira versión mínima viable de MARTOLA debe incluír:

- [x] Navegación funcional.
- [x] Xestión de estado.
- [ ] SQLite.
- [ ] Xestión de hortas persistente.
- [ ] Xestión de plantas.
- [ ] Rexistros de evolución.

O resto considerarase ampliación ou funcionalidade adicional segundo o tempo dispoñible.

---

# Future Features

Funcionalidades opcionais:

- Login.
- Sincronización cloud.
- Compartición de hortas.
- Notificacións.
- Estatísticas avanzadas.
- IA para recomendacións.
- Integración con sensores.

---

# Success Criteria

O proxecto considerarase exitoso se:

- Funciona en Android.
- Funciona en escritorio.
- Permite xestionar hortas.
- Permite xestionar plantas.
- Almacena información localmente.
- Mantén unha arquitectura organizada.
- Presenta unha interface usable.