# Arquitectura del Proyecto Store

## 1. Visión general

Descripción de la arquitectura general del sistema.

El proyecto está compuesto por:

- Store Web
- Store Dashboard
- Backend API
- SQL Server

## 2. Frontend

### 2.1 Store Web

Ruta:

frontend/store-web

Responsabilidad:

- Sitio público.
- Catálogo.
- Consulta de productos.
- Carrito.
- Procesos propios del cliente.

### 2.2 Store Dashboard

Ruta:

frontend/store-dashboard

Responsabilidad:

- Administración.
- Clientes.
- Catálogo.
- Inventario.
- Compras.
- Ventas.
- Reportes.
- Configuración.

### 2.3 UI compartida

Ruta:

frontend/shared/store-ui

Contiene únicamente elementos de UI realmente compartidos entre las dos aplicaciones.

No debe utilizarse para almacenar lógica de negocio, servicios específicos o modelos de dominio.

## 3. Backend

Ruta:

backend/

### Store.Api

Responsabilidades:

- HTTP.
- Controllers.
- Middleware.
- Autenticación.
- Autorización.
- Configuración.
- CORS.
- Swagger/OpenAPI.
- Manejo global de errores.

### Store.Application

Responsabilidades:

- Casos de uso.
- DTOs.
- Interfaces.
- Servicios de aplicación.
- Validaciones.
- Interfaces de repositorios.
- Interfaces de servicios externos.

No debe depender de implementaciones concretas de Infrastructure.

### Store.Domain

Responsabilidades:

- Entidades.
- Value Objects cuando sean necesarios.
- Enumeraciones.
- Reglas de negocio.
- Excepciones de dominio.

Debe mantener el mínimo posible de dependencias externas.

### Store.Infrastructure

Responsabilidades:

- Entity Framework Core.
- DbContext.
- Configuraciones de entidades.
- Implementaciones de repositorios.
- Persistencia.
- Servicios externos.

## 4. Persistencia

La base de datos objetivo es SQL Server.

El proyecto no utiliza EF Core Migrations.

La estructura de la base de datos se administra mediante scripts SQL versionados ubicados en:

database/

## 5. Repository

Se utiliza un repositorio genérico para operaciones CRUD comunes cuando corresponda.

Los repositorios específicos se crean cuando una entidad necesita consultas u operaciones propias.

## 6. Unit of Work

Unit of Work se utiliza cuando una operación necesita coordinar cambios sobre múltiples repositorios dentro de una misma transacción lógica.

Ejemplo:

- Registrar venta.
- Registrar detalles.
- Actualizar inventario.
- Registrar movimiento.
- Actualizar lote.

## 7. Inventario

El inventario debe mantener trazabilidad mediante movimientos.

Los movimientos pueden representar, entre otros:

- Compra.
- Venta.
- Devolución.
- Ajuste.
- Vencimiento.

Cuando corresponda, los productos pueden manejar múltiples lotes y fechas de vencimiento.

## 8. Seguridad

El Dashboard requiere:

- Autenticación.
- JWT cuando corresponda.
- Autorización.
- Roles.
- Permisos.
- Protección de endpoints.

Los guards del frontend no sustituyen la autorización del backend.

## 9. Frontend

Las aplicaciones Angular utilizan:

- Standalone Components.
- Angular Router.
- Lazy loading.
- Reactive Forms.
- SCSS.

Cada aplicación mantiene su propia lógica, modelos y servicios.

## 10. Principios

- Simplicidad.
- Separación de responsabilidades.
- Evolución progresiva.
- Evitar sobreingeniería.
- Mantener dependencias en la dirección correcta.