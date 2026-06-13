# UI_REFERENCE.md

# MARTOLA - User Interface Reference

## Purpose

Este documento describe a estrutura visual e funcional das pantallas da aplicación MARTOLA.

Non pretende definir o deseño visual final da aplicación. O seu obxectivo é servir como referencia para:

- Desenvolvemento en Flutter
- Deseño en Figma
- Organización da navegación
- Identificación de widgets reutilizables

---

# General Layout Rules

## Mobile First

Resolución base:

390 x 844

---

## Spacing System

Valores base:

- XS = 4
- SM = 8
- MD = 16
- LG = 24
- XL = 32

---

## Horizontal Padding

Padding estándar:

16 px

---

## Border Radius

Tarxetas e elementos principais:

12 px

---

# Reusable Widgets

## WeatherCard

### Descrición

Mostra información meteorolóxica resumida.

### Información

- Temperatura
- Estado meteorolóxico
- Humidade

### Uso

- HomeScreen
- GardenDetailScreen

---

## GardenCard

### Descrición

Representa unha horta ou xardín.

### Información

- Nome
- Número de plantas
- Imaxe opcional

### Uso

- HomeScreen
- GardensScreen

---

## PlantCard

### Descrición

Representa unha planta concreta.

### Información

- Nome
- Estado
- Data de plantación

### Uso

- GardenPlantsScreen

---

## ActionCard

### Descrición

Tarxeta de acceso rápido a funcionalidades.

### Uso

- GardenDetailScreen

### Accións previstas

- Plantas
- Evolución
- Meteoroloxía
- Deseño Visual

---

## MainBottomNavigation

### Descrición

Barra principal de navegación.

### Seccións previstas

- Inicio
- Hortas
- Perfil

---

# Screens

## HomeScreen

### Propósito

Pantalla principal da aplicación.

### Seccións

- Header
- WeatherCard
- Lista de hortas
- Actividade recente
- Bottom Navigation

### Widgets utilizados

- WeatherCard
- GardenCard
- MainBottomNavigation

---

## GardensScreen

### Propósito

Visualización e xestión das hortas.

### Seccións

- Header
- Botón Nova Horta
- Lista de GardenCards

### Widgets utilizados

- GardenCard
- PrimaryButton

---

## GardenDetailScreen

### Propósito

Centro de control dunha horta.

### Seccións

- Header
- Resumo meteorolóxico
- Estatísticas
- Accións rápidas

### Widgets utilizados

- WeatherCard
- ActionCard

### Accesos

- Plantas
- Evolución
- Meteoroloxía
- Deseño da Horta

---

## PlantDetailScreen

### Propósito

Seguemento dunha planta.

### Seccións

- Header
- Fotografía
- Información básica
- Notas
- Rexistros de evolución

### Widgets utilizados

- InfoRow
- EvolutionRecordCard

---

## LayoutDesignerScreen

### Propósito

Representación visual da horta.

### Seccións

- Header
- Barra de ferramentas
- Área de deseño
- Lista de plantas

### Widgets utilizados

- ToolButton
- LayoutCanvas
- PlantLayoutItem

---

# Desktop Adaptation

## Main Navigation

A navegación inferior substituirase por:

- NavigationRail
- Sidebar

---

## Layout

En escritorio utilizaranse:

- múltiples columnas
- paneis simultáneos
- maior área de traballo

Especialmente en:

- GardenDetailScreen
- LayoutDesignerScreen

---

# Future Screens

Pantallas previstas para futuras versións:

- LoginScreen
- RegisterScreen
- SettingsScreen
- NotificationsScreen
- StatisticsScreen

---

# Notes

A implementación inicial priorizará funcionalidade fronte a deseño visual.

O deseño definitivo definirase posteriormente mediante o Design System e os mockups de Figma.

Este documento considérase a referencia principal para a implementación das pantallas en Flutter.