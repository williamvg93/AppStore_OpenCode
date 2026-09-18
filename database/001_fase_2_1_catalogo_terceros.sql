/*
    Store - Fase 2.1: Catalogo y terceros
    Objetivo: SQL Server 2022
    Schema: dbo

    Este script solo define tablas, constraints e indices de la microfase 2.1.
    No incluye datos de prueba, procedimientos, triggers, vistas ni funciones.
*/

CREATE TABLE dbo.Categoria
(
    CategoriaId BIGINT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(500) NULL,
    Activo BIT NOT NULL,
    FechaCreacion DATETIME2(3) NOT NULL,
    FechaActualizacion DATETIME2(3) NOT NULL,

    CONSTRAINT PK_Categoria PRIMARY KEY (CategoriaId),
    CONSTRAINT UQ_Categoria_Nombre UNIQUE (Nombre),
    CONSTRAINT CK_Categoria_Nombre_NoVacio
        CHECK (LEN(LTRIM(RTRIM(Nombre))) > 0)
);

CREATE TABLE dbo.Marca
(
    MarcaId BIGINT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(150) NOT NULL,
    Descripcion NVARCHAR(500) NULL,
    Activo BIT NOT NULL,
    FechaCreacion DATETIME2(3) NOT NULL,
    FechaActualizacion DATETIME2(3) NOT NULL,

    CONSTRAINT PK_Marca PRIMARY KEY (MarcaId),
    CONSTRAINT UQ_Marca_Nombre UNIQUE (Nombre),
    CONSTRAINT CK_Marca_Nombre_NoVacio
        CHECK (LEN(LTRIM(RTRIM(Nombre))) > 0)
);

CREATE TABLE dbo.Producto
(
    ProductoId BIGINT IDENTITY(1,1) NOT NULL,
    CategoriaId BIGINT NOT NULL,
    MarcaId BIGINT NULL,
    Nombre NVARCHAR(200) NOT NULL,
    Descripcion NVARCHAR(1000) NULL,
    Activo BIT NOT NULL,
    FechaCreacion DATETIME2(3) NOT NULL,
    FechaActualizacion DATETIME2(3) NOT NULL,

    CONSTRAINT PK_Producto PRIMARY KEY (ProductoId),
    CONSTRAINT FK_Producto_Categoria
        FOREIGN KEY (CategoriaId) REFERENCES dbo.Categoria (CategoriaId),
    CONSTRAINT FK_Producto_Marca
        FOREIGN KEY (MarcaId) REFERENCES dbo.Marca (MarcaId),
    CONSTRAINT CK_Producto_Nombre_NoVacio
        CHECK (LEN(LTRIM(RTRIM(Nombre))) > 0)
);

CREATE TABLE dbo.PresentacionProducto
(
    PresentacionProductoId BIGINT IDENTITY(1,1) NOT NULL,
    ProductoId BIGINT NOT NULL,
    Nombre NVARCHAR(200) NOT NULL,
    SKU VARCHAR(50) NULL,
    CodigoBarras VARCHAR(50) NULL,
    PrecioVentaActual DECIMAL(19,4) NOT NULL,
    ManejaLotes BIT NOT NULL,
    Activo BIT NOT NULL,
    FechaCreacion DATETIME2(3) NOT NULL,
    FechaActualizacion DATETIME2(3) NOT NULL,

    CONSTRAINT PK_PresentacionProducto PRIMARY KEY (PresentacionProductoId),
    CONSTRAINT FK_PresentacionProducto_Producto
        FOREIGN KEY (ProductoId) REFERENCES dbo.Producto (ProductoId),
    CONSTRAINT UQ_PresentacionProducto_Producto_Nombre
        UNIQUE (ProductoId, Nombre),
    CONSTRAINT CK_PresentacionProducto_Nombre_NoVacio
        CHECK (LEN(LTRIM(RTRIM(Nombre))) > 0),
    CONSTRAINT CK_PresentacionProducto_PrecioVenta_NoNegativo
        CHECK (PrecioVentaActual >= 0),
    CONSTRAINT CK_PresentacionProducto_SKU_NoVacio
        CHECK (SKU IS NULL OR LEN(LTRIM(RTRIM(SKU))) > 0),
    CONSTRAINT CK_PresentacionProducto_CodigoBarras_NoVacio
        CHECK (CodigoBarras IS NULL OR LEN(LTRIM(RTRIM(CodigoBarras))) > 0)
);

CREATE TABLE dbo.Cliente
(
    ClienteId BIGINT IDENTITY(1,1) NOT NULL,
    TipoIdentificacion VARCHAR(20) NULL,
    NumeroIdentificacion VARCHAR(30) NULL,
    NombreRazonSocial NVARCHAR(200) NOT NULL,
    Telefono VARCHAR(30) NULL,
    CorreoElectronico VARCHAR(254) NULL,
    Direccion NVARCHAR(250) NULL,
    Activo BIT NOT NULL,
    FechaCreacion DATETIME2(3) NOT NULL,
    FechaActualizacion DATETIME2(3) NOT NULL,

    CONSTRAINT PK_Cliente PRIMARY KEY (ClienteId),
    CONSTRAINT CK_Cliente_Nombre_NoVacio
        CHECK (LEN(LTRIM(RTRIM(NombreRazonSocial))) > 0),
    CONSTRAINT CK_Cliente_Identificacion_Consistente
        CHECK
        (
            (TipoIdentificacion IS NULL AND NumeroIdentificacion IS NULL)
            OR
            (
                TipoIdentificacion IS NOT NULL
                AND NumeroIdentificacion IS NOT NULL
                AND LEN(LTRIM(RTRIM(TipoIdentificacion))) > 0
                AND LEN(LTRIM(RTRIM(NumeroIdentificacion))) > 0
            )
        )
);

CREATE TABLE dbo.Proveedor
(
    ProveedorId BIGINT IDENTITY(1,1) NOT NULL,
    TipoIdentificacion VARCHAR(20) NULL,
    NumeroIdentificacion VARCHAR(30) NULL,
    NombreRazonSocial NVARCHAR(200) NOT NULL,
    NombreContacto NVARCHAR(150) NULL,
    Telefono VARCHAR(30) NULL,
    CorreoElectronico VARCHAR(254) NULL,
    Direccion NVARCHAR(250) NULL,
    Activo BIT NOT NULL,
    FechaCreacion DATETIME2(3) NOT NULL,
    FechaActualizacion DATETIME2(3) NOT NULL,

    CONSTRAINT PK_Proveedor PRIMARY KEY (ProveedorId),
    CONSTRAINT CK_Proveedor_Nombre_NoVacio
        CHECK (LEN(LTRIM(RTRIM(NombreRazonSocial))) > 0),
    CONSTRAINT CK_Proveedor_Identificacion_Consistente
        CHECK
        (
            (TipoIdentificacion IS NULL AND NumeroIdentificacion IS NULL)
            OR
            (
                TipoIdentificacion IS NOT NULL
                AND NumeroIdentificacion IS NOT NULL
                AND LEN(LTRIM(RTRIM(TipoIdentificacion))) > 0
                AND LEN(LTRIM(RTRIM(NumeroIdentificacion))) > 0
            )
        )
);

CREATE TABLE dbo.PresentacionProveedor
(
    PresentacionProveedorId BIGINT IDENTITY(1,1) NOT NULL,
    PresentacionProductoId BIGINT NOT NULL,
    ProveedorId BIGINT NOT NULL,
    CodigoProveedor VARCHAR(50) NULL,
    ReferenciaProveedor NVARCHAR(100) NULL,
    Activo BIT NOT NULL,
    FechaCreacion DATETIME2(3) NOT NULL,
    FechaActualizacion DATETIME2(3) NOT NULL,

    CONSTRAINT PK_PresentacionProveedor PRIMARY KEY (PresentacionProveedorId),
    CONSTRAINT FK_PresentacionProveedor_PresentacionProducto
        FOREIGN KEY (PresentacionProductoId)
        REFERENCES dbo.PresentacionProducto (PresentacionProductoId),
    CONSTRAINT FK_PresentacionProveedor_Proveedor
        FOREIGN KEY (ProveedorId)
        REFERENCES dbo.Proveedor (ProveedorId),
    CONSTRAINT UQ_PresentacionProveedor_Presentacion_Proveedor
        UNIQUE (PresentacionProductoId, ProveedorId),
    CONSTRAINT CK_PresentacionProveedor_Codigo_NoVacio
        CHECK (CodigoProveedor IS NULL OR LEN(LTRIM(RTRIM(CodigoProveedor))) > 0)
);

CREATE UNIQUE INDEX UX_PresentacionProducto_SKU
    ON dbo.PresentacionProducto (SKU)
    WHERE SKU IS NOT NULL;

CREATE UNIQUE INDEX UX_PresentacionProducto_CodigoBarras
    ON dbo.PresentacionProducto (CodigoBarras)
    WHERE CodigoBarras IS NOT NULL;

CREATE UNIQUE INDEX UX_Cliente_Identificacion
    ON dbo.Cliente (TipoIdentificacion, NumeroIdentificacion)
    WHERE TipoIdentificacion IS NOT NULL
      AND NumeroIdentificacion IS NOT NULL;

CREATE UNIQUE INDEX UX_Proveedor_Identificacion
    ON dbo.Proveedor (TipoIdentificacion, NumeroIdentificacion)
    WHERE TipoIdentificacion IS NOT NULL
      AND NumeroIdentificacion IS NOT NULL;

CREATE INDEX IX_Producto_CategoriaId_Activo
    ON dbo.Producto (CategoriaId, Activo);

CREATE INDEX IX_Producto_MarcaId
    ON dbo.Producto (MarcaId);

CREATE INDEX IX_PresentacionProducto_ProductoId_Activo
    ON dbo.PresentacionProducto (ProductoId, Activo);

CREATE INDEX IX_PresentacionProveedor_ProveedorId_Activo
    ON dbo.PresentacionProveedor (ProveedorId, Activo);

CREATE INDEX IX_Cliente_Activo_NombreRazonSocial
    ON dbo.Cliente (Activo, NombreRazonSocial);

CREATE INDEX IX_Cliente_CorreoElectronico
    ON dbo.Cliente (CorreoElectronico);

CREATE INDEX IX_Proveedor_Activo_NombreRazonSocial
    ON dbo.Proveedor (Activo, NombreRazonSocial);

CREATE INDEX IX_Proveedor_CorreoElectronico
    ON dbo.Proveedor (CorreoElectronico);
