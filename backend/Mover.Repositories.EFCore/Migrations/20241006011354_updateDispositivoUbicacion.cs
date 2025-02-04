using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Mover.Repositories.EFCore.Migrations
{
    /// <inheritdoc />
    public partial class updateDispositivoUbicacion : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Ubicacion_Dispositivos_DispositivosId",
                table: "Ubicacion");

            migrationBuilder.DropIndex(
                name: "IX_Ubicacion_DispositivosId",
                table: "Ubicacion");

            migrationBuilder.DropColumn(
                name: "DispositivosId",
                table: "Ubicacion");

            migrationBuilder.AlterColumn<int>(
                name: "DispositivoId",
                table: "Ubicacion",
                type: "int",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.CreateIndex(
                name: "IX_Ubicacion_DispositivoId",
                table: "Ubicacion",
                column: "DispositivoId");

            migrationBuilder.AddForeignKey(
                name: "FK_Ubicacion_Dispositivos_DispositivoId",
                table: "Ubicacion",
                column: "DispositivoId",
                principalTable: "Dispositivos",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Ubicacion_Dispositivos_DispositivoId",
                table: "Ubicacion");

            migrationBuilder.DropIndex(
                name: "IX_Ubicacion_DispositivoId",
                table: "Ubicacion");

            migrationBuilder.AlterColumn<string>(
                name: "DispositivoId",
                table: "Ubicacion",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddColumn<int>(
                name: "DispositivosId",
                table: "Ubicacion",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Ubicacion_DispositivosId",
                table: "Ubicacion",
                column: "DispositivosId");

            migrationBuilder.AddForeignKey(
                name: "FK_Ubicacion_Dispositivos_DispositivosId",
                table: "Ubicacion",
                column: "DispositivosId",
                principalTable: "Dispositivos",
                principalColumn: "Id");
        }
    }
}
