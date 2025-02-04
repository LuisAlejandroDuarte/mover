using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Mover.Repositories.EFCore.Migrations
{
    /// <inheritdoc />
    public partial class EstadoEquipos : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Estado",
                table: "Equipo");

            migrationBuilder.DropColumn(
                name: "IdColor",
                table: "Equipo");

            migrationBuilder.RenameColumn(
                name: "IdTipoCarroceria",
                table: "Equipo",
                newName: "ReferenciaId");

            migrationBuilder.RenameColumn(
                name: "IdModelo",
                table: "Equipo",
                newName: "ModeloId");

            migrationBuilder.RenameColumn(
                name: "IdMarca",
                table: "Equipo",
                newName: "MarcaId");

            migrationBuilder.RenameColumn(
                name: "IdLinea",
                table: "Equipo",
                newName: "CarroceriaId");

            migrationBuilder.AddColumn<string>(
                name: "Color",
                table: "Equipo",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<int>(
                name: "EstadoEquipoId",
                table: "Equipo",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "EstadoEquipo",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EstadoEquipo", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Equipo_CarroceriaId",
                table: "Equipo",
                column: "CarroceriaId");

            migrationBuilder.CreateIndex(
                name: "IX_Equipo_EstadoEquipoId",
                table: "Equipo",
                column: "EstadoEquipoId");

            migrationBuilder.CreateIndex(
                name: "IX_Equipo_MarcaId",
                table: "Equipo",
                column: "MarcaId");

            migrationBuilder.CreateIndex(
                name: "IX_Equipo_ModeloId",
                table: "Equipo",
                column: "ModeloId");

            migrationBuilder.CreateIndex(
                name: "IX_Equipo_ReferenciaId",
                table: "Equipo",
                column: "ReferenciaId");

            migrationBuilder.AddForeignKey(
                name: "FK_Equipo_Carroceria_CarroceriaId",
                table: "Equipo",
                column: "CarroceriaId",
                principalTable: "Carroceria",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Equipo_EstadoEquipo_EstadoEquipoId",
                table: "Equipo",
                column: "EstadoEquipoId",
                principalTable: "EstadoEquipo",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Equipo_Marca_MarcaId",
                table: "Equipo",
                column: "MarcaId",
                principalTable: "Marca",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Equipo_Modelo_ModeloId",
                table: "Equipo",
                column: "ModeloId",
                principalTable: "Modelo",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Equipo_Referencia_ReferenciaId",
                table: "Equipo",
                column: "ReferenciaId",
                principalTable: "Referencia",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Equipo_Carroceria_CarroceriaId",
                table: "Equipo");

            migrationBuilder.DropForeignKey(
                name: "FK_Equipo_EstadoEquipo_EstadoEquipoId",
                table: "Equipo");

            migrationBuilder.DropForeignKey(
                name: "FK_Equipo_Marca_MarcaId",
                table: "Equipo");

            migrationBuilder.DropForeignKey(
                name: "FK_Equipo_Modelo_ModeloId",
                table: "Equipo");

            migrationBuilder.DropForeignKey(
                name: "FK_Equipo_Referencia_ReferenciaId",
                table: "Equipo");

            migrationBuilder.DropTable(
                name: "EstadoEquipo");

            migrationBuilder.DropIndex(
                name: "IX_Equipo_CarroceriaId",
                table: "Equipo");

            migrationBuilder.DropIndex(
                name: "IX_Equipo_EstadoEquipoId",
                table: "Equipo");

            migrationBuilder.DropIndex(
                name: "IX_Equipo_MarcaId",
                table: "Equipo");

            migrationBuilder.DropIndex(
                name: "IX_Equipo_ModeloId",
                table: "Equipo");

            migrationBuilder.DropIndex(
                name: "IX_Equipo_ReferenciaId",
                table: "Equipo");

            migrationBuilder.DropColumn(
                name: "Color",
                table: "Equipo");

            migrationBuilder.DropColumn(
                name: "EstadoEquipoId",
                table: "Equipo");

            migrationBuilder.RenameColumn(
                name: "ReferenciaId",
                table: "Equipo",
                newName: "IdTipoCarroceria");

            migrationBuilder.RenameColumn(
                name: "ModeloId",
                table: "Equipo",
                newName: "IdModelo");

            migrationBuilder.RenameColumn(
                name: "MarcaId",
                table: "Equipo",
                newName: "IdMarca");

            migrationBuilder.RenameColumn(
                name: "CarroceriaId",
                table: "Equipo",
                newName: "IdLinea");

            migrationBuilder.AddColumn<int>(
                name: "Estado",
                table: "Equipo",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "IdColor",
                table: "Equipo",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }
    }
}
