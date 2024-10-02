using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Mover.Repositories.EFCore.Migrations
{
    /// <inheritdoc />
    public partial class initialCreateTablas2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ClaseId",
                table: "Marca",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Marca_ClaseId",
                table: "Marca",
                column: "ClaseId");

            migrationBuilder.AddForeignKey(
                name: "FK_Marca_Clase_ClaseId",
                table: "Marca",
                column: "ClaseId",
                principalTable: "Clase",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Marca_Clase_ClaseId",
                table: "Marca");

            migrationBuilder.DropIndex(
                name: "IX_Marca_ClaseId",
                table: "Marca");

            migrationBuilder.DropColumn(
                name: "ClaseId",
                table: "Marca");
        }
    }
}
