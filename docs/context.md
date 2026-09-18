# Contexto del Proyecto Store

## 1. Descripción general

Store es un sistema orientado a tiendas de barrio y pequeños negocios de Colombia que comercializan productos físicos.

El sistema debe poder adaptarse tanto a un negocio pequeño, por ejemplo una tienda ubicada en un espacio reducido con aproximadamente 50 a 100 productos, como a una microempresa con un catálogo considerablemente mayor y una infraestructura más amplia.

El objetivo es construir una solución que permita administrar productos, inventario, compras, ventas, clientes, proveedores y usuarios, además de proporcionar un sitio web público para que los clientes puedan consultar productos y generar compras.

El proyecto debe construirse de manera progresiva, manteniendo una base suficientemente sólida para crecer hacia funcionalidades más avanzadas sin introducir complejidad innecesaria desde el inicio.

---

## 2. Tipo de negocio

El sistema está pensado principalmente para negocios minoristas, especialmente tiendas de barrio y pequeños comercios.

El catálogo puede incluir diferentes tipos de productos, entre ellos:

* Productos de canasta familiar.
* Alimentos.
* Bebidas.
* Productos de aseo y hogar.
* Productos de uso diario.
* Papelería y útiles.
* Licores.
* Otros productos comercializados habitualmente por pequeños comercios.

Inicialmente el sistema administrará únicamente productos físicos.

En el futuro podrían incorporarse servicios ofrecidos por algunos negocios, por ejemplo:

* Domicilios.
* Instalación.
* Montaje o ensamblaje.
* Otros servicios asociados a la venta.

Estas funcionalidades no hacen parte del alcance inicial.

---

## 3. Objetivo del sistema

El sistema busca centralizar la operación de un pequeño negocio mediante dos aplicaciones principales:

### Store Web

Aplicación pública orientada a los clientes.

Permitirá inicialmente:

* Consultar el catálogo de productos.
* Consultar información de los productos.
* Registrarse como cliente.
* Crear un carrito de compras.
* Realizar una solicitud o compra.
* Consultar información relacionada con sus compras.

Inicialmente el sitio web no tendrá integración con pasarelas de pago.

El cliente realizará el pago físicamente en el establecimiento y posteriormente el negocio registrará o marcará la operación como pagada desde el sistema.

### Store Dashboard

Aplicación administrativa y privada para la gestión del negocio.

Permitirá administrar progresivamente:

* Productos.
* Presentaciones de productos.
* Inventario.
* Compras.
* Ventas.
* Facturas o documentos comerciales.
* Clientes.
* Proveedores.
* Usuarios.
* Roles y permisos.
* Configuraciones.
* Información para indicadores y dashboards.

---

## 4. Sucursal

Inicialmente el sistema funcionará para una única sucursal o establecimiento.

El diseño debe evitar impedir una futura evolución hacia múltiples sucursales.

En una futura etapa, un negocio podría tener varias sucursales y cada una podría manejar:

* Inventario propio.
* Existencias propias.
* Personal asignado.
* Operaciones de venta.
* Operaciones de compra.
* Clientes relacionados.
* Productos o presentaciones disponibles.
* Movimientos entre sucursales.

También podría existir interacción entre sucursales, por ejemplo mediante traslados de inventario.

La funcionalidad multi-sucursal no hace parte del alcance inicial, pero debe considerarse como una posible evolución del sistema.

---

## 5. Productos y presentaciones

Un producto puede tener diferentes presentaciones comerciales.

Por ejemplo:

### Coca-Cola

* Coca-Cola 250 ml.
* Coca-Cola 350 ml.
* Coca-Cola 1 litro.

Cada presentación puede representar una unidad comercial diferente y puede tener información propia como:

* Precio de venta.
* Costo.
* Existencia.
* Identificador.
* Código de barras.
* Información relacionada con inventario.

Otros ejemplos pueden ser:

* Leche en diferentes tamaños.
* Pan en diferentes presentaciones.
* Productos vendidos por diferentes cantidades o unidades.

La solución debe permitir distinguir el producto general de sus diferentes presentaciones cuando sea necesario.

---

## 6. Identificación de productos

El sistema debe tener capacidad para identificar productos y sus presentaciones mediante identificadores internos y códigos de barras.

Se contempla la posibilidad de utilizar:

* SKU o código interno.
* Código de barras.
* Otros identificadores necesarios para el negocio.

La definición exacta del modelo de identificación se realizará durante la fase de diseño correspondiente.

No se debe asumir que todos los productos tendrán código de barras.

---

## 7. Proveedores

Un producto o presentación puede ser adquirido a través de diferentes proveedores.

Por ejemplo, un mismo producto puede ser comercializado por varios proveedores y el negocio puede decidir a cuál comprar dependiendo de:

* Precio.
* Disponibilidad.
* Condiciones comerciales.
* Otros factores.

El sistema debe permitir relacionar productos con múltiples proveedores.

Las compras deberán conservar la información necesaria para conocer de qué proveedor provino una determinada operación.

---

## 8. Costos y precios

El sistema debe diferenciar entre el costo de adquisición de un producto y su precio de venta.

Por ejemplo:

* Producto: Coca-Cola 350 ml.
* Costo de compra: $2.000.
* Precio de venta: $3.000.

El costo representa el valor al que el negocio adquiere el producto.

El precio de venta representa el valor que se cobra al cliente.

A partir de estos valores puede calcularse información como:

* Margen.
* Utilidad estimada.
* Porcentaje de margen.

El margen o utilidad no necesariamente debe almacenarse como un dato independiente si puede calcularse a partir del costo y el precio.

Los costos y precios pueden cambiar con el tiempo. La necesidad de mantener historial de cambios y la forma específica de modelarlo se definirá durante la etapa de diseño.

---

## 9. Inventario

El inventario debe permitir conocer las existencias disponibles de los productos y sus respectivas presentaciones.

La gestión del inventario debe estar basada en movimientos que permitan conservar trazabilidad.

Entre los movimientos posibles se encuentran, por ejemplo:

* Entrada por compra.
* Salida por venta.
* Ajuste de inventario.
* Devolución.
* Traslado entre sucursales en una futura etapa.
* Otros movimientos que sean necesarios.

El sistema debe permitir conocer el origen de los cambios en las existencias.

No se debe limitar el inventario únicamente a almacenar una cantidad actual sin trazabilidad.

---

## 10. Lotes y fechas de vencimiento

El sistema debe poder manejar lotes y fechas de vencimiento cuando el tipo de producto lo requiera.

Este control debe ser opcional.

Por ejemplo:

### Productos que podrían requerir lote y vencimiento

* Leche.
* Alimentos perecederos.
* Medicamentos, si posteriormente se incorporan.
* Otros productos con fecha de caducidad.

### Productos que normalmente no lo requieren

* Cuadernos.
* Papelería.
* Algunos productos de hogar.
* Productos sin fecha de vencimiento relevante.

No todos los productos deben estar obligados a manejar lote o vencimiento.

La definición exacta de cómo se configurará este comportamiento se realizará durante el diseño del módulo de inventario.

---

## 11. Compras

Las compras deben representar documentos comerciales completos y no únicamente movimientos individuales de inventario.

Una compra deberá poder conservar información como:

* Encabezado del documento.
* Detalle de productos.
* Proveedor.
* Fechas.
* Cantidades.
* Costos.
* Totales.
* Estado.
* Información de pago cuando corresponda.
* Información adicional necesaria para la operación.

La estructura exacta de las entidades y relaciones se definirá durante el diseño del backend.

Las compras deberán generar los movimientos de inventario correspondientes.

---

## 12. Ventas

Las ventas deben manejarse como documentos comerciales completos.

Una venta podrá contener:

* Encabezado.
* Detalle de productos.
* Cliente cuando corresponda.
* Cantidades.
* Precios.
* Descuentos cuando se definan.
* Subtotales.
* Impuestos cuando correspondan.
* Total.
* Estado.
* Estado de pago.
* Fecha.
* Información relacionada con su origen.

El sistema debe poder distinguir una operación realizada directamente en el establecimiento de una operación originada desde el sitio web cuando esta necesidad sea incorporada al diseño.

---

## 13. Clientes

El sistema debe permitir administrar clientes.

Un cliente podrá:

* Registrarse desde Store Web.
* Ser registrado desde el Dashboard cuando corresponda.
* Asociarse a ventas.
* Consultar sus operaciones desde el sitio web, cuando esta funcionalidad esté disponible.

La información exacta requerida para un cliente se definirá durante el diseño del módulo correspondiente.

---

## 14. Formas de pago

Inicialmente el sistema tendrá un modelo de pago sencillo.

El negocio podrá registrar una venta y posteriormente marcarla como pagada cuando el cliente haya realizado el pago físicamente.

Inicialmente se contempla principalmente:

* Efectivo.

Podría contemplarse posteriormente:

* Transferencia bancaria.
* Otros medios utilizados habitualmente por pequeños comercios.

No se implementará inicialmente una integración directa con:

* Pasarelas de pago.
* Bancos.
* Plataformas de pago.
* Procesadores de tarjetas.
* Nequi.
* Daviplata.
* Otros servicios externos.

La prioridad inicial es permitir registrar correctamente el estado de pago de una operación realizada físicamente.

---

## 15. Facturación electrónica

La facturación electrónica integrada con la DIAN no hace parte del alcance inicial.

Inicialmente el sistema manejará sus propios documentos y estados de venta/pago, de acuerdo con las necesidades del negocio.

La integración con facturación electrónica podrá considerarse posteriormente como una evolución del sistema.

No se debe implementar anticipadamente una integración con la DIAN ni diseñar el proyecto alrededor de ella sin un requisito concreto.

---

## 16. Usuarios, roles y permisos

El Dashboard será una aplicación privada y contará con autenticación y autorización.

Debe existir un administrador con capacidad de realizar las operaciones administrativas necesarias.

Sin embargo, el sistema debe permitir evolucionar hacia diferentes roles y permisos.

El control de acceso debe poder determinar qué acciones puede realizar cada usuario.

Por ejemplo, un usuario podría tener permiso para:

* Consultar productos.
* Consultar inventario.
* Consultar ventas.

Pero no necesariamente tendría permiso para:

* Crear productos.
* Editar productos.
* Eliminar productos.
* Modificar facturas.
* Eliminar documentos.
* Realizar ajustes de inventario.
* Ejecutar otras operaciones sensibles.

Las operaciones especialmente delicadas deberán poder restringirse mediante permisos.

La definición exacta de roles, permisos y acciones se realizará durante el diseño del módulo de seguridad.

La autorización real deberá ser validada en el backend.

---

## 17. Dashboard e indicadores

El Dashboard deberá permitir obtener información útil para la operación del negocio.

Entre los indicadores y consultas que se contemplan como parte de la evolución del sistema se encuentran:

* Productos más vendidos.
* Productos con baja rotación.
* Productos con mayor movimiento.
* Inventario disponible.
* Productos próximos a vencerse.
* Clientes frecuentes.
* Ventas.
* Compras.
* Utilidad o margen calculado.
* Comportamiento de las ventas.

Estos indicadores se implementarán progresivamente y no todos hacen parte de la primera fase funcional.

---

## 18. Base de datos

La base de datos objetivo será SQL Server 2022.

SQL Server 2022 será la versión de referencia para el diseño y la validación de los scripts SQL.

El schema principal de la base de datos será `dbo`. Las tablas de la Fase 2 se crearán bajo este schema, por ejemplo `dbo.Categoria`, `dbo.Marca` y `dbo.Producto`.

El esquema de base de datos será administrado mediante scripts SQL versionados.

No se utilizarán características incompatibles con SQL Server 2022.

No se utilizarán migraciones de Entity Framework Core como mecanismo principal para administrar el esquema de la base de datos.

La base de datos debe conservar las relaciones necesarias para representar:

* Productos.
* Presentaciones.
* Proveedores.
* Clientes.
* Compras.
* Ventas.
* Inventario.
* Movimientos.
* Usuarios.
* Roles.
* Permisos.
* Configuraciones.
* Información necesaria para futuras funcionalidades.

La estructura definitiva será determinada durante las fases de diseño e implementación.

---

## 19. Arquitectura general

El backend estará dividido inicialmente en cuatro proyectos:

* `Store.Api`
* `Store.Application`
* `Store.Domain`
* `Store.Infrastructure`

El frontend estará dividido en:

* `store-web`: sitio público.
* `store-dashboard`: aplicación administrativa.
* `shared/store-ui`: componentes de interfaz reutilizables.

La arquitectura debe mantenerse simple y evolucionar progresivamente.

No se deben introducir patrones o tecnologías complejas únicamente por anticipar necesidades futuras.

---

## 20. Principios del proyecto

El desarrollo del sistema debe seguir estos principios:

### Simplicidad

Implementar únicamente la complejidad necesaria para resolver las necesidades actuales.

### Evolución progresiva

Construir una base que permita agregar funcionalidades posteriormente sin implementar anticipadamente todo el futuro del sistema.

### Trazabilidad

Las operaciones importantes, especialmente las relacionadas con inventario, compras y ventas, deben conservar suficiente información para conocer qué ocurrió.

### Separación de responsabilidades

Cada aplicación y capa debe tener responsabilidades claras.

### Seguridad

Las operaciones sensibles deben estar protegidas mediante autenticación, autorización y validaciones apropiadas.

### No inventar requisitos

Cuando una funcionalidad no esté definida, debe solicitarse aclaración o dejarse como decisión pendiente.

No se deben implementar funcionalidades basándose únicamente en suposiciones.

### Evitar sobreingeniería

No introducir CQRS, MediatR, Event Sourcing, microservicios u otras abstracciones o arquitecturas complejas si no existe una necesidad concreta.

---

## 21. Alcance inicial

El alcance inicial se concentra en construir la base del sistema y posteriormente desarrollar progresivamente:

1. Estructura base del proyecto.
2. Backend base.
3. Base de datos y scripts.
4. Productos.
5. Presentaciones.
6. Proveedores.
7. Inventario.
8. Clientes.
9. Compras.
10. Ventas.
11. Usuarios, roles y permisos.
12. Store Web.
13. Store Dashboard.
14. Indicadores y dashboards.

El orden exacto podrá ajustarse durante la planificación de cada fase.

---

## 22. Funcionalidades futuras

Las siguientes funcionalidades se consideran posibles evoluciones del sistema, pero no hacen parte del alcance inicial:

* Múltiples sucursales.
* Traslado de inventario entre sucursales.
* Domicilios.
* Servicios adicionales ofrecidos por el negocio.
* Integración con WhatsApp.
* Integración con correo electrónico.
* Pagos electrónicos.
* Integración con Nequi u otros medios de pago.
* Integración con plataformas bancarias.
* Facturación electrónica DIAN.
* Integraciones con proveedores.
* Automatizaciones.
* Funcionalidades adicionales de analítica.
* Otras funcionalidades que surjan de necesidades reales del negocio.

Estas funcionalidades no deben implementarse anticipadamente.

---

## 23. Estado conceptual del proyecto

El proyecto se encuentra en una etapa inicial de construcción.

La estructura base del proyecto ha sido definida y se está trabajando progresivamente por fases.

Actualmente no se deben asumir como implementadas funcionalidades que únicamente estén descritas en este documento.

La implementación real debe determinarse a partir del código existente y de `docs/estado-del-proyecto.md`.

---

## 24. Documentos relacionados

La información del proyecto se encuentra separada en diferentes documentos:

* `AGENTS.md`: punto de entrada de instrucciones para el agente.
* `docs/context.md`: contexto del negocio, alcance y decisiones funcionales.
* `docs/rules.md`: reglas y restricciones obligatorias para el agente.
* `docs/arquitectura.md`: arquitectura y decisiones técnicas.
* `docs/estado-del-proyecto.md`: estado actual, avances, pendientes y siguiente fase.
