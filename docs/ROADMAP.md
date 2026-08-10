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

## In Progress

- Aprendizaxe de Flutter e Dart.
- Primeira iteración da interface.
- Design System.
- Navegación entre pantallas.
- Módulo de hortas.

## Pending

- Xestión de estado mediante Provider.
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
- [ ] Configurar Provider.

## Deliverable

Aplicación Flutter funcional cunha estrutura inicial organizada, tema global e navegación básica.

**Estado:** practicamente completada. Queda pendente a integración de Provider.

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

- [ ] Configurar Provider.
- [ ] Crear os primeiros ViewModels.
- [ ] Mover o estado dos módulos fóra das Views cando corresponda.
- [ ] Permitir que varias pantallas compartan o mesmo estado.
- [ ] Actualizar automaticamente a interface cando cambien os datos.

## Deliverable

Xestión de estado funcional mediante Provider seguindo o enfoque MVVM simplificado previsto para MARTOLA.

---

# Phase 4 - Database Foundation

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

# Phase 5 - Gardens Module

## Objective

Implementar a xestión completa de hortas.

## Implemented

- [x] Crear modelo `Garden`.
- [x] Mostrar unha lista de hortas con datos ficticios.
- [x] Crear `GardenListItem`.
- [x] Seleccionar unha horta.
- [x] Mostrar o detalle dunha horta.
- [x] Crear formulario de nova horta.
- [x] Validar os datos do formulario.
- [x] Construír un obxecto `Garden` desde o formulario.
- [x] Devolver un `Garden` entre rutas.

## Pending

- [ ] Incorporar a nova horta ao estado da aplicación.
- [ ] Gardar unha horta en SQLite.
- [ ] Recuperar hortas desde SQLite.
- [ ] Editar horta.
- [ ] Eliminar horta.
- [ ] Actualizar automaticamente o listado.
- [ ] Integrar o módulo co ViewModel e Repository correspondentes.

## Deliverable

Módulo de hortas completo con operacións de creación, consulta, edición e eliminación persistidas localmente.

**Estado:** en progreso.

---

# Phase 6 - Plants Module

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

# Phase 7 - Plant Evolution Module

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

# Phase 8 - Weather Module

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

# Phase 9 - Layout Designer

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

# Phase 10 - UI Improvement

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

# Phase 11 - Testing

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

# Phase 12 - Documentation

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

- Navegación funcional.
- Xestión de estado.
- SQLite.
- Xestión de hortas.
- Xestión de plantas.
- Rexistros de evolución.

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