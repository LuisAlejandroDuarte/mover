using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Mover.Repositories.EFCore.Migrations
{
    /// <inheritdoc />
    public partial class createRegistro : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Users_TipoIdentificacion_TipoIdentificacionId",
                table: "Users");

            migrationBuilder.DropIndex(
                name: "IX_Users_TipoIdentificacionId",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Apellido",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Direccion",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Email",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Identificacion",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Nombre",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Telefono",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Estado",
                table: "ConductorAutorizado");

            migrationBuilder.RenameColumn(
                name: "TipoIdentificacionId",
                table: "Users",
                newName: "TipoNaturaleza");

            migrationBuilder.AddColumn<int>(
                name: "TipoNaturaleza",
                table: "Oferta",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "EstadoId",
                table: "ConductorAutorizado",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Empresa",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: true),
                    RazonSocial = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NIT = table.Column<string>(type: "nvarchar(450)", nullable: true),
                    RepresentanteLegal = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Direccion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Telefono = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Empresa", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Empresa_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "EstadoConductorAutorizado",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EstadoConductorAutorizado", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "PersonaNatural",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Apellido = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Direccion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Telefono = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TipoIdentificacionId = table.Column<int>(type: "int", nullable: true),
                    Identificacion = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PersonaNatural", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PersonaNatural_TipoIdentificacion_TipoIdentificacionId",
                        column: x => x.TipoIdentificacionId,
                        principalTable: "TipoIdentificacion",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_PersonaNatural_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ConductorAutorizado_EstadoId",
                table: "ConductorAutorizado",
                column: "EstadoId");

            migrationBuilder.CreateIndex(
                name: "IX_Empresa_NIT",
                table: "Empresa",
                column: "NIT",
                unique: true,
                filter: "[NIT] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_Empresa_UserId",
                table: "Empresa",
                column: "UserId",
                unique: true,
                filter: "[UserId] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_PersonaNatural_Identificacion",
                table: "PersonaNatural",
                column: "Identificacion",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_PersonaNatural_TipoIdentificacionId",
                table: "PersonaNatural",
                column: "TipoIdentificacionId");

            migrationBuilder.CreateIndex(
                name: "IX_PersonaNatural_UserId",
                table: "PersonaNatural",
                column: "UserId",
                unique: true);

            migrationBuilder.AddForeignKey(
                name: "FK_ConductorAutorizado_EstadoConductorAutorizado_EstadoId",
                table: "ConductorAutorizado",
                column: "EstadoId",
                principalTable: "EstadoConductorAutorizado",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ConductorAutorizado_EstadoConductorAutorizado_EstadoId",
                table: "ConductorAutorizado");

            migrationBuilder.DropTable(
                name: "Empresa");

            migrationBuilder.DropTable(
                name: "EstadoConductorAutorizado");

            migrationBuilder.DropTable(
                name: "PersonaNatural");

            migrationBuilder.DropIndex(
                name: "IX_ConductorAutorizado_EstadoId",
                table: "ConductorAutorizado");

            migrationBuilder.DropColumn(
                name: "TipoNaturaleza",
                table: "Oferta");

            migrationBuilder.DropColumn(
                name: "EstadoId",
                table: "ConductorAutorizado");

            migrationBuilder.RenameColumn(
                name: "TipoNaturaleza",
                table: "Users",
                newName: "TipoIdentificacionId");

            migrationBuilder.AddColumn<string>(
                name: "Apellido",
                table: "Users",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Direccion",
                table: "Users",
                type: "nvarchar(200)",
                maxLength: 200,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "Users",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Identificacion",
                table: "Users",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Nombre",
                table: "Users",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Telefono",
                table: "Users",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<int>(
                name: "Estado",
                table: "ConductorAutorizado",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Users_TipoIdentificacionId",
                table: "Users",
                column: "TipoIdentificacionId");

            migrationBuilder.AddForeignKey(
                name: "FK_Users_TipoIdentificacion_TipoIdentificacionId",
                table: "Users",
                column: "TipoIdentificacionId",
                principalTable: "TipoIdentificacion",
                principalColumn: "Id");
        }
    }
}
