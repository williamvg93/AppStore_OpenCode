# Reglas del Proyecto Store

## Idioma y convenciones

- La documentación, reglas y explicaciones se redactan en español.
- Las carpetas técnicas pueden conservar nombres convencionales en inglés.
- Los módulos y conceptos específicos del dominio utilizan nombres en español.
- C# utiliza `PascalCase`; TypeScript utiliza `camelCase`.
- Los componentes Angular siguen el formato `nombre.component.ts`, `.html` y `.scss`.

## Estructura

- `frontend/store-web` contiene el sitio público.
- `frontend/store-dashboard` contiene la aplicación administrativa.
- `frontend/shared/store-ui` contiene únicamente UI reutilizable por ambas aplicaciones.
- `backend` contiene `Store.Api`, `Store.Application`, `Store.Domain` y `Store.Infrastructure`.
- `database` contiene scripts SQL versionados; no es una base de datos física.
- `docs` contiene decisiones y documentación arquitectónica.

## Arquitectura

- Mantener una arquitectura simple y evolucionar por fases.
- Usar componentes Angular standalone, Router, lazy loading, formularios reactivos y SCSS.
- Los controllers solo coordinan HTTP; la lógica de negocio pertenece a Application o Domain.
- Application no depende de detalles concretos de Infrastructure.
- Domain debe mantener el mínimo de dependencias externas.
- Usar Repository y Unit of Work cuando aporten valor real.
- No introducir CQRS, MediatR, Event Sourcing, microservicios u otras abstracciones sin necesidad concreta.

## Base de datos

- SQL Server es la base de datos objetivo.
- No usar EF Core Migrations; administrar el esquema con scripts versionados.
- El agente no se conecta a SQL Server ni ejecuta scripts contra bases reales.
- El inventario debe conservar trazabilidad mediante movimientos y contemplar lotes cuando corresponda.

## Seguridad y calidad

- Validar en frontend por UX y en backend por seguridad e integridad.
- Nunca almacenar secretos, contraseñas, claves JWT o credenciales en el código fuente.
- La autorización real siempre se valida en el backend; los guards del frontend no son suficientes.
- Mantener errores consistentes y no exponer información interna en producción.
- Implementar pruebas progresivamente, priorizando reglas de negocio y operaciones críticas.

## Flujo de trabajo

- Trabajar una fase a la vez: analizar, diseñar, implementar, probar y revisar.
- Antes de cada tarea revisar esta guía y el código relacionado.
- No adelantar funcionalidades futuras ni inventar requisitos.
- Explicar y solicitar aprobación para cambios arquitectónicos importantes.

## Git

- El usuario es responsable de todas las operaciones Git.
- El agente no ejecuta `git add`, `commit`, `push`, `pull`, `fetch`, `merge`, `rebase`, `reset`, `checkout`, `switch`, `branch`, `tag`, `remote`, `clone`, `clean`, `restore` ni comandos `gh`.
- Solo se permiten operaciones Git de lectura como `status`, `diff`, `log` y `show`.
