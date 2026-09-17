# Estado del Proyecto

## Fase actual

El proyecto está en la **Fase 0: Preparación**.

## Entorno verificado

- Angular CLI `22.1.6`.
- Node.js `24.20.0`.
- npm `11.19.0`.
- .NET SDK `10.0.303`.

## Decisiones iniciales

- Se utiliza la carpeta actual como raíz del repositorio `Store`.
- Las aplicaciones Angular son independientes y usan standalone components, Router y SCSS.
- El backend está dividido en cuatro proyectos .NET por responsabilidad.
- `database/` se reserva para scripts SQL Server versionados.
- No se configura conexión a una base de datos real en esta fase.


## Estado actual

- Estructura base creada.
- Store Web creado.
- Store Dashboard creado.
- Backend base creado.
- Estructura de proyectos .NET creada.
- Carpeta database creada.
- Documentación inicial creada.

## Decisiones realizadas

- SQL Server como base de datos.
- Scripts SQL versionados.
- No utilizar EF Core Migrations.
- El agente no ejecuta SQL.
- El agente no ejecuta Git de modificación.
- Los comandos Git de consulta requieren confirmación.

## Fuera de alcance

En esta fase no se implementan productos, clientes, autenticación, inventario, compras, ventas ni reportes.


## Próxima fase

Fase 1: Backend Base.
