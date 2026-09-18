# Estado del Proyecto

## Fase actual

Fase 2 - Implementación de la base de datos

## Estado

Microfase 2.1 en revisión

## Completado

* Estructura base del proyecto creada.
* Documentación inicial del proyecto creada.
* Reglas del agente definidas.
* Arquitectura inicial definida.
* Reglas de seguridad, Git, SQL Server y reutilización de componentes Frontend definidas.
* Reglas para el mantenimiento de la documentación definidas.

## En desarrollo

* Revisión y aprobación de los scripts SQL de la microfase 2.1 - Catálogo y terceros.

## Pendiente

* Revisar y aprobar la microfase 2.1.
* Implementar posteriormente la microfase 2.2 - Inventario y Lotes.
* Crear posteriormente el backend sobre el modelo de datos definido.

## Decisiones tomadas

* El diseño del modelo de datos se realizará antes de implementar el backend.
* Los scripts SQL serán generados y versionados, pero el agente no podrá ejecutarlos ni conectarse a ninguna base de datos.
* El backend se construirá sobre el modelo de datos previamente definido y aprobado.
* El proyecto se desarrollará por fases y microfases, evitando generar grandes cantidades de código en una sola tarea.
* La documentación debe mantenerse sincronizada con el estado real del proyecto.
* SQL Server 2022 se adopta como tecnología objetivo de la base de datos y referencia para el diseño y validación de los scripts SQL.
* El schema principal de la base de datos es `dbo`; las tablas de la Fase 2 se crearán bajo este schema.
* El cambio a SQL Server 2022 es una decisión tecnológica y documental; no modifica el modelo relacional aprobado.
* La microfase 2.1 tiene scripts SQL creados para revisión, pero todavía no está aprobada ni completada.
* Los scripts SQL no han sido ejecutados por el agente.

## Decisiones pendientes

* Revisar y aprobar los scripts SQL de la microfase 2.1.
* Diseñar e implementar la microfase 2.2 - Inventario y Lotes, después de la aprobación correspondiente.

## Próxima fase

Fase 2.2 - Inventario y Lotes, después de aprobar la microfase 2.1

## Última actualización

2026-09-18
