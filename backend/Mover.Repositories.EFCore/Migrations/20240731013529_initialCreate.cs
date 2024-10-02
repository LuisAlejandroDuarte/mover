using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Mover.Repositories.EFCore.Migrations
{
    /// <inheritdoc />
    public partial class initialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Categoria",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Categoria", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Condicion",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Condicion", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "EstadoOferta",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EstadoOferta", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "EstadoVehiculo",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EstadoVehiculo", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Marca",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Descripcion = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Marca", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "TipoIdentificacion",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Sigla = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TipoIdentificacion", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "TipoUser",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TipoUser", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Titulos",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Tabla = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Relacion = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Titulos", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Ubicacion",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NombreCiudad = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Latitud = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Longitud = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Precision = table.Column<int>(type: "int", nullable: true),
                    FechaHora = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Direccion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    DispositivoId = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Ubicacion", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "ZonaTransporter",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ZonaTransporter", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Clase",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Descripcion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CategoriaId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Clase", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Clase_Categoria_CategoriaId",
                        column: x => x.CategoriaId,
                        principalTable: "Categoria",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Referencia",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Descripcion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    MarcaId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Referencia", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Referencia_Marca_MarcaId",
                        column: x => x.MarcaId,
                        principalTable: "Marca",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    Apellido = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    Identificacion = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Direccion = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false),
                    Telefono = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Email = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    UserName = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    Password = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TipoUserId = table.Column<int>(type: "int", nullable: true),
                    TipoIdentificacionId = table.Column<int>(type: "int", nullable: true),
                    UltimaSesion = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Users_TipoIdentificacion_TipoIdentificacionId",
                        column: x => x.TipoIdentificacionId,
                        principalTable: "TipoIdentificacion",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Users_TipoUser_TipoUserId",
                        column: x => x.TipoUserId,
                        principalTable: "TipoUser",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Carroceria",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Descripcion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ClaseId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Carroceria", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Carroceria_Clase_ClaseId",
                        column: x => x.ClaseId,
                        principalTable: "Clase",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "ConductorAutorizado",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Apellido = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Direccion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Correo = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Identificacion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Estado = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ConductorAutorizado", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ConductorAutorizado_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Equipo",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    PlacasVehiculo = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    IdMarca = table.Column<int>(type: "int", nullable: false),
                    IdModelo = table.Column<int>(type: "int", nullable: false),
                    IdLinea = table.Column<int>(type: "int", nullable: false),
                    IdTipoCarroceria = table.Column<int>(type: "int", nullable: false),
                    IdColor = table.Column<int>(type: "int", nullable: false),
                    PlacasSemirremolque = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    LinkLicenciaConduccion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    LinkSoat = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    LinkTecnomecanica = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Estado = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Equipo", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Equipo_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Oferta",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NombreRecibe = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    NombreEntrega = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Observaciones = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Precio = table.Column<decimal>(type: "decimal(10,3)", precision: 10, scale: 3, nullable: true),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    UbicacionOrigenId = table.Column<int>(type: "int", nullable: false),
                    UbicacionDestinoId = table.Column<int>(type: "int", nullable: false),
                    ZonaTransporterId = table.Column<int>(type: "int", nullable: false),
                    EstadoOfertaId = table.Column<int>(type: "int", nullable: false),
                    UserId1 = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Oferta", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Oferta_EstadoOferta_EstadoOfertaId",
                        column: x => x.EstadoOfertaId,
                        principalTable: "EstadoOferta",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                    table.ForeignKey(
                        name: "FK_Oferta_Ubicacion_UbicacionDestinoId",
                        column: x => x.UbicacionDestinoId,
                        principalTable: "Ubicacion",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                    table.ForeignKey(
                        name: "FK_Oferta_Ubicacion_UbicacionOrigenId",
                        column: x => x.UbicacionOrigenId,
                        principalTable: "Ubicacion",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                    table.ForeignKey(
                        name: "FK_Oferta_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                    table.ForeignKey(
                        name: "FK_Oferta_Users_UserId1",
                        column: x => x.UserId1,
                        principalTable: "Users",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Oferta_ZonaTransporter_ZonaTransporterId",
                        column: x => x.ZonaTransporterId,
                        principalTable: "ZonaTransporter",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                });

            migrationBuilder.CreateTable(
                name: "Vehiculo",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Placa = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Medidas = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Observacion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    OfertaId = table.Column<int>(type: "int", nullable: false),
                    CarroceriaId = table.Column<int>(type: "int", nullable: false),
                    CondicionId = table.Column<int>(type: "int", nullable: false),
                    ReferenciaId = table.Column<int>(type: "int", nullable: false),
                    EstadoVehiculoId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Vehiculo", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Vehiculo_Carroceria_CarroceriaId",
                        column: x => x.CarroceriaId,
                        principalTable: "Carroceria",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Vehiculo_Condicion_CondicionId",
                        column: x => x.CondicionId,
                        principalTable: "Condicion",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Vehiculo_EstadoVehiculo_EstadoVehiculoId",
                        column: x => x.EstadoVehiculoId,
                        principalTable: "EstadoVehiculo",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Vehiculo_Oferta_OfertaId",
                        column: x => x.OfertaId,
                        principalTable: "Oferta",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Vehiculo_Referencia_ReferenciaId",
                        column: x => x.ReferenciaId,
                        principalTable: "Referencia",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "MultimediaVehiculo",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Multimedia = table.Column<int>(type: "int", nullable: false),
                    VehiculoId = table.Column<int>(type: "int", nullable: false),
                    Link = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MultimediaVehiculo", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MultimediaVehiculo_Vehiculo_VehiculoId",
                        column: x => x.VehiculoId,
                        principalTable: "Vehiculo",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Carroceria_ClaseId",
                table: "Carroceria",
                column: "ClaseId");

            migrationBuilder.CreateIndex(
                name: "IX_Clase_CategoriaId",
                table: "Clase",
                column: "CategoriaId");

            migrationBuilder.CreateIndex(
                name: "IX_ConductorAutorizado_UserId",
                table: "ConductorAutorizado",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Equipo_UserId",
                table: "Equipo",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_MultimediaVehiculo_VehiculoId",
                table: "MultimediaVehiculo",
                column: "VehiculoId");

            migrationBuilder.CreateIndex(
                name: "IX_Oferta_EstadoOfertaId",
                table: "Oferta",
                column: "EstadoOfertaId");

            migrationBuilder.CreateIndex(
                name: "IX_Oferta_UbicacionDestinoId",
                table: "Oferta",
                column: "UbicacionDestinoId");

            migrationBuilder.CreateIndex(
                name: "IX_Oferta_UbicacionOrigenId",
                table: "Oferta",
                column: "UbicacionOrigenId");

            migrationBuilder.CreateIndex(
                name: "IX_Oferta_UserId",
                table: "Oferta",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Oferta_UserId1",
                table: "Oferta",
                column: "UserId1");

            migrationBuilder.CreateIndex(
                name: "IX_Oferta_ZonaTransporterId",
                table: "Oferta",
                column: "ZonaTransporterId");

            migrationBuilder.CreateIndex(
                name: "IX_Referencia_MarcaId",
                table: "Referencia",
                column: "MarcaId");

            migrationBuilder.CreateIndex(
                name: "IX_Users_TipoIdentificacionId",
                table: "Users",
                column: "TipoIdentificacionId");

            migrationBuilder.CreateIndex(
                name: "IX_Users_TipoUserId",
                table: "Users",
                column: "TipoUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Vehiculo_CarroceriaId",
                table: "Vehiculo",
                column: "CarroceriaId");

            migrationBuilder.CreateIndex(
                name: "IX_Vehiculo_CondicionId",
                table: "Vehiculo",
                column: "CondicionId");

            migrationBuilder.CreateIndex(
                name: "IX_Vehiculo_EstadoVehiculoId",
                table: "Vehiculo",
                column: "EstadoVehiculoId");

            migrationBuilder.CreateIndex(
                name: "IX_Vehiculo_OfertaId",
                table: "Vehiculo",
                column: "OfertaId");

            migrationBuilder.CreateIndex(
                name: "IX_Vehiculo_ReferenciaId",
                table: "Vehiculo",
                column: "ReferenciaId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ConductorAutorizado");

            migrationBuilder.DropTable(
                name: "Equipo");

            migrationBuilder.DropTable(
                name: "MultimediaVehiculo");

            migrationBuilder.DropTable(
                name: "Titulos");

            migrationBuilder.DropTable(
                name: "Vehiculo");

            migrationBuilder.DropTable(
                name: "Carroceria");

            migrationBuilder.DropTable(
                name: "Condicion");

            migrationBuilder.DropTable(
                name: "EstadoVehiculo");

            migrationBuilder.DropTable(
                name: "Oferta");

            migrationBuilder.DropTable(
                name: "Referencia");

            migrationBuilder.DropTable(
                name: "Clase");

            migrationBuilder.DropTable(
                name: "EstadoOferta");

            migrationBuilder.DropTable(
                name: "Ubicacion");

            migrationBuilder.DropTable(
                name: "Users");

            migrationBuilder.DropTable(
                name: "ZonaTransporter");

            migrationBuilder.DropTable(
                name: "Marca");

            migrationBuilder.DropTable(
                name: "Categoria");

            migrationBuilder.DropTable(
                name: "TipoIdentificacion");

            migrationBuilder.DropTable(
                name: "TipoUser");
        }
    }
}
