# Instrucciones del Proyecto Store

Este archivo define las instrucciones generales que deben seguir los agentes de IA que trabajen en este proyecto.


## Documentación obligatoria

Antes de realizar cualquier tarea, el agente debe consultar:

- `docs/context.md`: contexto y objetivo general del proyecto.
- `docs/rules.md`: reglas y restricciones obligatorias del agente.
- `docs/arquitectura.md`: arquitectura y decisiones técnicas.
- `docs/estado-del-proyecto.md`: estado actual y fase de trabajo.

Las reglas de `docs/rules.md` son obligatorias durante toda la sesión.


## Flujo de trabajo

- Comprender primero el contexto y el estado actual.
- Trabajar una fase a la vez.
- No inventar requisitos.
- No adelantar funcionalidades de fases posteriores.
- Antes de realizar cambios importantes, analizar el código relacionado y las decisiones existentes.
- Los cambios arquitectónicos importantes requieren explicación y aprobación del usuario.


## Convenciones

- La documentación y las explicaciones deben redactarse en español.
- C# utiliza `PascalCase`.
- TypeScript utiliza `camelCase`.
- Los conceptos específicos del dominio utilizan nombres en español.
- Mantener las convenciones y estructura existentes del proyecto.


## Restricciones

Las restricciones relacionadas con SQL Server, Git, seguridad y ejecución de comandos están definidas en `docs/rules.md` y deben cumplirse estrictamente.


## Frontend

Las reglas de reutilización y diseño de componentes Frontend están definidas en `docs/rules.md`.

Antes de crear una tabla, modal, formulario u otro componente de UI, revisar las reglas de reutilización y evaluar si debe utilizarse o crearse un componente configurable y reutilizable.


## Herramientas de documentación

Cuando una tarea requiera consultar documentación técnica externa o verificar APIs específicas de frameworks o librerías, revisar las reglas de uso de Context7 definidas en `docs/rules.md`.

Context7 debe utilizarse de forma selectiva y teniendo en cuenta las versiones utilizadas por el proyecto.


## Mantenimiento de documentación

La documentación debe mantenerse sincronizada con el estado real del proyecto.

Después de una tarea, el agente debe evaluar si los cambios requieren actualizar `docs/context.md`, `docs/rules.md`, `docs/arquitectura.md` o `docs/estado-del-proyecto.md`, siguiendo las reglas definidas en `docs/rules.md`.

No debe registrar cambios menores o irrelevantes; la documentación debe contener únicamente información útil para comprender el proyecto, sus decisiones y su estado actual.
