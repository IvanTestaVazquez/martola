# DATABASE_DESIGN.md

# MARTOLA - Database Design

## Purpose

Este documento define o modelo de datos da aplicación MARTOLA.

O seu obxectivo é:

- Documentar as entidades principais.
- Definir as relacións entre táboas.
- Servir como guía para SQLite.
- Facilitar futuras migracións.
- Apoiar a elaboración da memoria final do proxecto.

---

# Database Technology

## Selected Database

SQLite

## Motivation

SQLite foi seleccionada debido a:

- Integración sinxela con Flutter.
- Funcionamento local sen servidor.
- Bo rendemento en dispositivos móbiles.
- Simplicidade de implementación.
- Posibilidade de evolucionar posteriormente cara a solucións cloud.

---

# Entity Relationship Overview

users
│
└── gardens
     │
     ├── garden_plants
     │      │
     │      └── plant_evolution_records
     │
     ├── weather_records
     │
     └── garden_layout_items

plant_species
│
└── garden_plants

---

# Entities

## users

Representa os usuarios da aplicación.

### Fields

| Field | Type | Description |
|---------|---------|---------|
| id | INTEGER | Primary Key |
| name | TEXT | User name |
| email | TEXT | Email address |
| password_hash | TEXT | Password hash |
| created_at | TEXT | Creation date |

### Relationships

- One user can own multiple gardens.

---

## gardens

Representa unha horta ou xardín.

### Fields

| Field | Type |
|---------|---------|
| id | INTEGER |
| user_id | INTEGER |
| name | TEXT |
| description | TEXT |
| location | TEXT |
| latitude | REAL |
| longitude | REAL |
| created_at | TEXT |

### Relationships

- Belongs to one user.
- Contains multiple plants.
- Contains weather records.
- Contains layout elements.

---

## plant_species

Información xeral dunha especie vexetal.

### Fields

| Field | Type |
|---------|---------|
| id | INTEGER |
| common_name | TEXT |
| scientific_name | TEXT |
| plant_type | TEXT |
| watering_frequency | TEXT |
| sunlight | TEXT |
| soil_type | TEXT |
| ideal_temperature_min | REAL |
| ideal_temperature_max | REAL |
| notes | TEXT |

### Relationships

- One species can be used by multiple plants.

---

## garden_plants

Representa unha planta concreta dentro dunha horta.

### Fields

| Field | Type |
|---------|---------|
| id | INTEGER |
| garden_id | INTEGER |
| species_id | INTEGER |
| custom_name | TEXT |
| planting_date | TEXT |
| status | TEXT |
| notes | TEXT |
| created_at | TEXT |

### Relationships

- Belongs to one garden.
- References one species.
- Has multiple evolution records.

---

## plant_evolution_records

Histórico de evolución dunha planta.

### Fields

| Field | Type |
|---------|---------|
| id | INTEGER |
| garden_plant_id | INTEGER |
| record_date | TEXT |
| height_cm | REAL |
| growth_stage | TEXT |
| health_status | TEXT |
| has_flowers | INTEGER |
| has_fruits | INTEGER |
| notes | TEXT |
| photo_path | TEXT |

### Relationships

- Belongs to one plant.

---

## weather_records

Histórico meteorolóxico.

### Fields

| Field | Type |
|---------|---------|
| id | INTEGER |
| garden_id | INTEGER |
| record_date | TEXT |
| temperature | REAL |
| humidity | REAL |
| rainfall | REAL |
| wind_speed | REAL |
| weather_description | TEXT |
| source | TEXT |

### Relationships

- Belongs to one garden.

---

## garden_layout_items

Elementos visuais do deseño dunha horta.

### Fields

| Field | Type |
|---------|---------|
| id | INTEGER |
| garden_id | INTEGER |
| garden_plant_id | INTEGER |
| x_position | REAL |
| y_position | REAL |
| width | REAL |
| height | REAL |
| rotation | REAL |
| color | TEXT |
| icon | TEXT |

### Relationships

- Belongs to one garden.
- References one plant.

---

# Relationship Summary

users 1:N gardens

gardens 1:N garden_plants

plant_species 1:N garden_plants

garden_plants 1:N plant_evolution_records

gardens 1:N weather_records

gardens 1:N garden_layout_items

garden_plants 1:1 garden_layout_items

---

# SQLite Type Mapping

| SQLite | Dart |
|----------|----------|
| INTEGER | int |
| TEXT | String |
| REAL | double |
| INTEGER (0/1) | bool |
| TEXT (ISO Date) | DateTime |

---

# Initial Dataset

A primeira versión da aplicación incluirá unha pequena colección de especies vexetais predefinidas:

- Tomate
- Leituga
- Pemento
- Cenoria
- Amorodo
- Albahaca

Estas especies almacenaranse localmente.

---

# Future Improvements

Posibles ampliacións futuras:

- API botánica externa.
- Sincronización cloud.
- Compartición de hortas.
- Sistema multiusuario.
- Fotografías almacenadas remotamente.
- Integración con sensores ambientais.

---

# Notes

O deseño da base de datos segue un enfoque modular e escalable.

A estrutura proposta permite implementar unha primeira versión completamente funcional utilizando SQLite e facilita futuras ampliacións sen modificar significativamente o modelo de datos.
