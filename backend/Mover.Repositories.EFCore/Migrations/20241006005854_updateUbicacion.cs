using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Mover.Repositories.EFCore.Migrations
{
    /// <inheritdoc />
    public partial class updateUbicacion : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "NombreCiudad",
                table: "Ubicacion");

            migrationBuilder.AddColumn<int>(
                name: "CiudadId",
                table: "Ubicacion",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "DispositivosId",
                table: "Ubicacion",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Ubicacion_CiudadId",
                table: "Ubicacion",
                column: "CiudadId");

            migrationBuilder.CreateIndex(
                name: "IX_Ubicacion_DispositivosId",
                table: "Ubicacion",
                column: "DispositivosId");

            migrationBuilder.AddForeignKey(
                name: "FK_Ubicacion_Ciudad_CiudadId",
                table: "Ubicacion",
                column: "CiudadId",
                principalTable: "Ciudad",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Ubicacion_Dispositivos_DispositivosId",
                table: "Ubicacion",
                column: "DispositivosId",
                principalTable: "Dispositivos",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Ubicacion_Ciudad_CiudadId",
                table: "Ubicacion");

            migrationBuilder.DropForeignKey(
                name: "FK_Ubicacion_Dispositivos_DispositivosId",
                table: "Ubicacion");

            migrationBuilder.DropIndex(
                name: "IX_Ubicacion_CiudadId",
                table: "Ubicacion");

            migrationBuilder.DropIndex(
                name: "IX_Ubicacion_DispositivosId",
                table: "Ubicacion");

            migrationBuilder.DropColumn(
                name: "CiudadId",
                table: "Ubicacion");

            migrationBuilder.DropColumn(
                name: "DispositivosId",
                table: "Ubicacion");

            migrationBuilder.AddColumn<string>(
                name: "NombreCiudad",
                table: "Ubicacion",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }
    }
}
