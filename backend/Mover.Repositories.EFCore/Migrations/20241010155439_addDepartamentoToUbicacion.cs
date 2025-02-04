using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Mover.Repositories.EFCore.Migrations
{
    /// <inheritdoc />
    public partial class addDepartamentoToUbicacion : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Ubicacion_Ciudad_CiudadId",
                table: "Ubicacion");

            migrationBuilder.AlterColumn<int>(
                name: "CiudadId",
                table: "Ubicacion",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<int>(
                name: "DepartamentoId",
                table: "Ubicacion",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Ubicacion_DepartamentoId",
                table: "Ubicacion",
                column: "DepartamentoId");

            migrationBuilder.AddForeignKey(
                name: "FK_Ubicacion_Ciudad_CiudadId",
                table: "Ubicacion",
                column: "CiudadId",
                principalTable: "Ciudad",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Ubicacion_Departamento_DepartamentoId",
                table: "Ubicacion",
                column: "DepartamentoId",
                principalTable: "Departamento",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Ubicacion_Ciudad_CiudadId",
                table: "Ubicacion");

            migrationBuilder.DropForeignKey(
                name: "FK_Ubicacion_Departamento_DepartamentoId",
                table: "Ubicacion");

            migrationBuilder.DropIndex(
                name: "IX_Ubicacion_DepartamentoId",
                table: "Ubicacion");

            migrationBuilder.DropColumn(
                name: "DepartamentoId",
                table: "Ubicacion");

            migrationBuilder.AlterColumn<int>(
                name: "CiudadId",
                table: "Ubicacion",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Ubicacion_Ciudad_CiudadId",
                table: "Ubicacion",
                column: "CiudadId",
                principalTable: "Ciudad",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
