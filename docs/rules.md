# Reglas del Agente

## 1. Principios generales

- Estas reglas son obligatorias durante toda la sesión.
- El agente debe respetar estas reglas independientemente de la herramienta utilizada.
- El agente no debe asumir permisos que no hayan sido otorgados explícitamente.
- Cuando una operación esté restringida, debe detenerse y solicitar la intervención del usuario.


## 2. SQL Server

### 2.1 Generación de SQL

El agente puede:

- Crear scripts SQL.
- Modificar scripts SQL.
- Explicar scripts SQL.
- Revisar scripts SQL.
- Proponer scripts para crear o alterar tablas.
- Proponer scripts para crear o alterar procedimientos almacenados.
- Proponer scripts para crear o alterar vistas.
- Proponer scripts para crear o alterar funciones.
- Proponer scripts para índices y constraints.
- Proponer scripts de consulta o modificación de datos.

### 2.2 Conexión y ejecución de bases de datos

El agente nunca puede conectarse a ningún motor, servidor, instancia o archivo de base de datos, independientemente de la tecnología utilizada.

Esto incluye, entre otros:

- SQL Server.
- MySQL.
- PostgreSQL.
- SQLite.
- Oracle Database.
- MariaDB.
- MongoDB.
- Redis u otros sistemas utilizados como almacenamiento de datos.

El agente no debe utilizar conexiones, cadenas de conexión, clientes, drivers, herramientas, extensiones, terminales, SDKs, APIs u otros mecanismos para acceder directamente a una base de datos.

El agente tampoco puede ejecutar consultas, procedimientos, funciones, scripts, migraciones o cualquier otra operación directamente contra una base de datos.

El agente sí puede crear, modificar, revisar y explicar código o scripts relacionados con bases de datos, siempre que estos no sean ejecutados por el agente.


## 3. Git

### 3.1 Operaciones prohibidas

El agente nunca puede ejecutar comandos Git que modifiquen, guarden, sincronicen o publiquen cambios.

Esto incluye:

- add
- commit
- push
- pull
- fetch
- merge
- rebase
- reset
- checkout
- switch
- restore
- branch
- tag
- remote
- clone
- clean

También están prohibidas las operaciones equivalentes realizadas mediante otras herramientas.

### 3.2 GitHub CLI

El agente no puede ejecutar comandos `gh` que modifiquen repositorios, ramas, pull requests, issues u otros recursos de GitHub.

### 3.3 Git de consulta

Los comandos Git que solamente consulten información requieren confirmación explícita del usuario.

Ejemplos:

- git status
- git diff
- git log
- git show
- git branch --show-current

Antes de solicitar su ejecución, el agente debe explicar:

1. Qué comando quiere ejecutar.
2. Por qué lo necesita.
3. Qué información espera obtener.
4. Que no realizará modificaciones, cuando corresponda.

El agente debe esperar una confirmación explícita.

Una confirmación para un comando no autoriza otros comandos Git.

## 4. Archivos

- No modificar archivos que no sean necesarios para la tarea.
- No realizar refactorizaciones no relacionadas con la tarea.
- No eliminar archivos sin justificación.
- No crear archivos o carpetas innecesarios.

## 5. Seguridad

- Nunca almacenar secretos en el código.
- No almacenar contraseñas, tokens, claves JWT, API keys o credenciales.
- No exponer información sensible en logs.
- No introducir credenciales en scripts SQL.
- La autorización debe validarse en backend.

## 6. Cambios arquitectónicos

- No introducir nuevas capas o patrones sin necesidad.
- No introducir CQRS, MediatR, Event Sourcing, microservicios u otras abstracciones sin justificación.
- Los cambios arquitectónicos importantes requieren aprobación explícita del usuario.

## 7. Ejecución de comandos

- El agente puede utilizar las herramientas necesarias para analizar, desarrollar y validar el código, siempre que no infrinja estas reglas.
- Las operaciones restringidas por este documento nunca deben ejecutarse.
- Si una tarea requiere una operación restringida, el agente debe informar al usuario y proporcionar los pasos o comandos para realizarla manualmente.


## 8. Reutilización de componentes Frontend

El desarrollo del frontend debe priorizar la reutilización de componentes cuando un elemento pueda aparecer en diferentes módulos, vistas o escenarios.

Antes de crear un componente nuevo, el agente debe analizar si el elemento puede ser reutilizable y si existen, o podrían existir, diferentes escenarios de uso.

Esto aplica especialmente a elementos como:

* Tablas.
* Modales.
* Formularios.
* Selectores.
* Inputs.
* Botones con comportamientos comunes.
* Paginadores.
* Filtros.
* Componentes de búsqueda.
* Mensajes de confirmación.
* Alertas.
* Cards.
* Componentes de carga.
* Componentes de visualización de información.
* Otros elementos de UI que puedan repetirse.

### 8.1 Componentes configurables

Cuando un componente tenga diferentes necesidades según la vista, se debe evaluar primero si esas diferencias pueden resolverse mediante configuración, propiedades, eventos, templates o estrategias de comportamiento, en lugar de crear componentes duplicados.

Por ejemplo, una tabla podría utilizarse:

* Solo para mostrar información.
* Para mostrar información y permitir editar registros.
* Para mostrar información y permitir eliminar registros.
* Para mostrar información con acciones personalizadas.
* Para permitir selección de registros.
* Con diferentes columnas dependiendo del escenario.

En estos casos se debe evaluar la creación de una tabla reutilizable y configurable, en lugar de crear una tabla diferente para cada módulo.

El componente debe permitir configurar únicamente las capacidades que realmente necesite cada escenario.

### 8.2 Ejemplo conceptual

Una tabla reutilizable podría permitir definir:

* Columnas.
* Títulos.
* Campos.
* Formato de valores.
* Paginación.
* Ordenamiento.
* Selección de registros.
* Acciones disponibles.
* Eventos de las acciones.
* Estado de carga.
* Mensaje cuando no existen registros.

Una vista que solamente necesita consultar información podría utilizar la tabla sin acciones CRUD.

Otra vista podría utilizar la misma tabla habilitando acciones como editar o eliminar.

La reutilización no significa que todos los componentes deban tener todas las funcionalidades posibles. El componente debe ser configurable y mantener una API clara, evitando opciones innecesarias.

### 8.3 Ubicación

Los componentes reutilizables entre `store-web` y `store-dashboard` deben ubicarse en:

`frontend/shared/store-ui`

Los componentes reutilizables únicamente dentro de una aplicación deben permanecer dentro de la aplicación correspondiente, en una ubicación común de esa aplicación.

Los componentes específicos de un módulo o una funcionalidad deben permanecer dentro de dicho módulo cuando no exista una necesidad real de reutilización.

### 8.4 Criterio de reutilización

No se debe crear un componente genérico únicamente por anticipar una posible reutilización futura.

La decisión debe considerar:

1. Si el componente ya se utiliza en más de un lugar.
2. Si existen escenarios claramente diferentes que pueden resolverse mediante configuración.
3. Si la reutilización reduce duplicación real.
4. Si la abstracción mantiene una API sencilla y comprensible.
5. Si el componente sigue teniendo una responsabilidad clara.

Se debe evitar tanto la duplicación innecesaria como la creación de componentes excesivamente genéricos y difíciles de mantener.

### 8.5 Regla para nuevas funcionalidades

Antes de implementar una tabla, modal, formulario u otro elemento de UI que pueda repetirse, el agente debe:

1. Revisar si ya existe un componente reutilizable que pueda utilizarse.
2. Si existe, utilizarlo y extenderlo únicamente si la extensión beneficia otros escenarios y mantiene una API clara.
3. Si no existe, evaluar si el nuevo elemento debe ser reutilizable.
4. Si existen múltiples escenarios de uso previsibles y concretos, diseñarlo como componente configurable.
5. Si el elemento es completamente específico de una funcionalidad, mantenerlo dentro de ese módulo.
6. No duplicar componentes equivalentes en diferentes módulos sin justificar la razón.

### 8.6 Evolución de componentes

Cuando durante el desarrollo aparezca un segundo escenario que requiere un componente similar a uno existente, primero se debe evaluar la posibilidad de evolucionar el componente existente antes de crear uno nuevo.

Si la evolución convierte el componente en una abstracción excesivamente compleja, se debe mantener la separación de componentes y documentar brevemente la decisión.

El objetivo es encontrar un equilibrio entre:

* Reutilización.
* Simplicidad.
* Mantenibilidad.
* Claridad.
* Bajo acoplamiento.

No se debe buscar una abstracción universal para todos los casos.


## 9 Uso de Context7

Context7 debe utilizarse como fuente de consulta de documentación técnica cuando aporte valor a la tarea.

El agente **no debe utilizar Context7 para todas las tareas ni realizar consultas innecesarias**.

Debe priorizar la documentación oficial y actualizada de las tecnologías, frameworks y librerías cuando:

* Se vaya a implementar una funcionalidad que dependa de una API o comportamiento específico de una tecnología.
* Exista riesgo de utilizar una API obsoleta, incorrecta o incompatible con la versión utilizada por el proyecto.
* La implementación dependa de detalles que puedan haber cambiado entre versiones.
* Exista una duda técnica que pueda resolverse consultando la documentación de la tecnología.
* Se incorpore o utilice una librería o framework cuya API necesite ser verificada.

Esto es especialmente importante para tecnologías con evolución frecuente, como:

* Angular.
* TypeScript.
* .NET.
* ASP.NET Core.
* Entity Framework Core.
* Angular CDK.
* Otras librerías utilizadas por el proyecto.

### 9.1 No utilizar Context7 innecesariamente

El agente no debe consultar Context7 cuando la tarea no requiere documentación externa.

Por ejemplo, no es necesario utilizar Context7 para:

* Leer y comprender el código existente del proyecto.
* Consultar `AGENTS.md` o los documentos de `docs`.
* Analizar las reglas o el contexto del proyecto.
* Realizar modificaciones simples sobre código cuyo comportamiento ya está claro.
* Aplicar convenciones ya definidas en la documentación del proyecto.
* Realizar tareas de organización o refactorización cuando no exista una duda relacionada con la API de una tecnología.
* Consultar información que ya esté claramente disponible en el contexto actual.

### 9.2 Prioridad de fuentes

Cuando sea necesario consultar documentación técnica, utilizar Context7 como herramienta de consulta de documentación de las tecnologías correspondientes.

La documentación específica del proyecto siempre tiene prioridad para conocer:

* Requisitos del negocio.
* Decisiones arquitectónicas.
* Convenciones internas.
* Restricciones del agente.
* Estado actual del proyecto.

Context7 no reemplaza:

* `AGENTS.md`
* `docs/context.md`
* `docs/rules.md`
* `docs/arquitectura.md`
* `docs/estado-del-proyecto.md`

### 9.3 Versiones

Cuando se consulte documentación mediante Context7, el agente debe tener en cuenta la versión utilizada por el proyecto.

No debe asumir automáticamente que la documentación más reciente corresponde a la versión instalada.

Antes de utilizar una API o característica específica, debe verificar que sea compatible con la versión del proyecto cuando esta información sea relevante.

### 9.4 Criterio general

La regla general es:

> Utilizar Context7 cuando consultar documentación técnica actualizada reduzca la posibilidad de implementar una solución incorrecta, obsoleta o incompatible; no utilizarlo simplemente porque está disponible.


## 10. Mantenimiento de la documentación

La documentación del proyecto debe mantenerse sincronizada con la implementación real.

El agente debe actualizar la documentación correspondiente cuando una tarea produzca cambios relevantes en:

* El estado o fase actual del proyecto.
* El alcance funcional.
* Los requisitos o decisiones del negocio.
* La arquitectura.
* La estructura de proyectos, módulos o componentes.
* Las decisiones técnicas importantes.
* Las convenciones de desarrollo.
* Las reglas del proyecto.
* La forma en que se utilizan o relacionan componentes reutilizables.
* Otras decisiones que puedan ser relevantes para futuras sesiones.

### 10.1 Documento que debe actualizarse

El agente debe determinar qué documento corresponde al cambio:

* `docs/context.md`

  * Para cambios en el contexto del negocio, objetivo, alcance o funcionalidades previstas.

* `docs/rules.md`

  * Para nuevas reglas, restricciones, convenciones o comportamientos obligatorios del agente.

* `docs/arquitectura.md`

  * Para decisiones arquitectónicas, estructura técnica, dependencias, patrones, organización de módulos o decisiones de diseño importantes.

* `docs/estado-del-proyecto.md`

  * Para avances, funcionalidades implementadas, fases completadas, tareas pendientes, decisiones ya aplicadas y siguiente fase.

* `AGENTS.md`

  * Solo cuando sea necesario modificar las instrucciones generales o referencias principales del agente.

### 10.2 Actualización del estado

Cuando una tarea complete una funcionalidad o una fase, el agente debe actualizar `docs/estado-del-proyecto.md` para reflejar el estado real del proyecto.

El estado debe permitir que una nueva sesión del agente pueda comprender rápidamente:

* En qué fase se encuentra el proyecto.
* Qué funcionalidades están implementadas.
* Qué funcionalidades están pendientes.
* Qué decisiones ya fueron tomadas.
* Qué está actualmente en desarrollo.
* Cuál es el siguiente paso previsto.

No se debe marcar una funcionalidad como terminada si solamente fue diseñada, propuesta o parcialmente implementada.

### 10.3 Nuevas decisiones

Cuando durante una tarea aparezca una decisión que pueda afectar futuras implementaciones, el agente debe identificarla y proponer su documentación en el documento correspondiente.

Las decisiones arquitectónicas importantes requieren aprobación del usuario antes de ser adoptadas.

Una vez aprobada una decisión importante, la documentación debe actualizarse para que futuras sesiones no tengan que volver a tomar la misma decisión.

### 10.4 No documentar cambios irrelevantes

No es necesario modificar la documentación por cada cambio de código.

Por ejemplo, normalmente no requiere actualizar documentación:

* Cambiar el nombre de una variable local.
* Corregir un typo.
* Corregir un error puntual sin impacto arquitectónico.
* Modificar estilos específicos de una vista.
* Realizar cambios internos que no alteren decisiones, alcance o estado del proyecto.

La documentación debe mantenerse útil, clara y actualizada sin convertirse en un registro innecesario de cada modificación.

### 10.5 Verificación antes de finalizar una tarea

Antes de considerar terminada una tarea, el agente debe evaluar:

1. Si el cambio modifica el estado del proyecto.
2. Si introduce o modifica una decisión arquitectónica.
3. Si cambia el alcance o comportamiento funcional.
4. Si introduce una nueva regla o convención.
5. Si afecta la organización general del proyecto.
6. Si requiere actualizar alguno de los documentos de `docs`.

Si alguna de estas situaciones aplica, debe actualizar la documentación correspondiente antes de finalizar la tarea, salvo que el cambio requiera aprobación previa del usuario.

### 10.6 La documentación debe reflejar la realidad

La documentación no debe utilizarse para describir funcionalidades futuras como si ya estuvieran implementadas.

Debe distinguir claramente entre:

* Definido.
* En desarrollo.
* Implementado.
* Pendiente.
* Futuro.
* Decisión pendiente.

El código existente y las decisiones aprobadas son la referencia para determinar qué está realmente implementado.



