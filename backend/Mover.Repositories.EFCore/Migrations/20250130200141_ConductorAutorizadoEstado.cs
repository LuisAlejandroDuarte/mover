using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Mover.Repositories.EFCore.Migrations
{
    /// <inheritdoc />
    public partial class ConductorAutorizadoEstado : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ConductorAutorizado_EstadoConductorAutorizado_EstadoId",
                table: "ConductorAutorizado");

            migrationBuilder.DropIndex(
                name: "IX_ConductorAutorizado_EstadoId",
                table: "ConductorAutorizado");

            migrationBuilder.DropColumn(
                name: "EstadoId",
                table: "ConductorAutorizado");

            migrationBuilder.AddColumn<int>(
                name: "EstadoConductorAutorizadoId",
                table: "ConductorAutorizado",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_ConductorAutorizado_EstadoConductorAutorizadoId",
                table: "ConductorAutorizado",
                column: "EstadoConductorAutorizadoId");

            migrationBuilder.AddForeignKey(
                name: "FK_ConductorAutorizado_EstadoConductorAutorizado_EstadoConductorAutorizadoId",
                table: "ConductorAutorizado",
                column: "EstadoConductorAutorizadoId",
                principalTable: "EstadoConductorAutorizado",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ConductorAutorizado_EstadoConductorAutorizado_EstadoConductorAutorizadoId",
                table: "ConductorAutorizado");

            migrationBuilder.DropIndex(
                name: "IX_ConductorAutorizado_EstadoConductorAutorizadoId",
                table: "ConductorAutorizado");

            migrationBuilder.DropColumn(
                name: "EstadoConductorAutorizadoId",
                table: "ConductorAutorizado");

            migrationBuilder.AddColumn<int>(
                name: "EstadoId",
                table: "ConductorAutorizado",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_ConductorAutorizado_EstadoId",
                table: "ConductorAutorizado",
                column: "EstadoId");

            migrationBuilder.AddForeignKey(
                name: "FK_ConductorAutorizado_EstadoConductorAutorizado_EstadoId",
                table: "ConductorAutorizado",
                column: "EstadoId",
                principalTable: "EstadoConductorAutorizado",
                principalColumn: "Id");
        }
    }
}
