using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Mover.Repositories.EFCore.Migrations
{
    /// <inheritdoc />
    public partial class changeNameVehiculosCondiciones : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_VehiculoCondiciones_ParametrosVehiculo_ParametrosVehiculoId",
                table: "VehiculoCondiciones");

            migrationBuilder.DropForeignKey(
                name: "FK_VehiculoCondiciones_Vehiculo_VehiculoId",
                table: "VehiculoCondiciones");

            migrationBuilder.DropPrimaryKey(
                name: "PK_VehiculoCondiciones",
                table: "VehiculoCondiciones");

            migrationBuilder.RenameTable(
                name: "VehiculoCondiciones",
                newName: "ParametrosVehiculoVehiculo");

            migrationBuilder.RenameIndex(
                name: "IX_VehiculoCondiciones_ParametrosVehiculoId",
                table: "ParametrosVehiculoVehiculo",
                newName: "IX_ParametrosVehiculoVehiculo_ParametrosVehiculoId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_ParametrosVehiculoVehiculo",
                table: "ParametrosVehiculoVehiculo",
                columns: new[] { "VehiculoId", "ParametrosVehiculoId" });

            migrationBuilder.AddForeignKey(
                name: "FK_ParametrosVehiculoVehiculo_ParametrosVehiculo_ParametrosVehiculoId",
                table: "ParametrosVehiculoVehiculo",
                column: "ParametrosVehiculoId",
                principalTable: "ParametrosVehiculo",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ParametrosVehiculoVehiculo_Vehiculo_VehiculoId",
                table: "ParametrosVehiculoVehiculo",
                column: "VehiculoId",
                principalTable: "Vehiculo",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ParametrosVehiculoVehiculo_ParametrosVehiculo_ParametrosVehiculoId",
                table: "ParametrosVehiculoVehiculo");

            migrationBuilder.DropForeignKey(
                name: "FK_ParametrosVehiculoVehiculo_Vehiculo_VehiculoId",
                table: "ParametrosVehiculoVehiculo");

            migrationBuilder.DropPrimaryKey(
                name: "PK_ParametrosVehiculoVehiculo",
                table: "ParametrosVehiculoVehiculo");

            migrationBuilder.RenameTable(
                name: "ParametrosVehiculoVehiculo",
                newName: "VehiculoCondiciones");

            migrationBuilder.RenameIndex(
                name: "IX_ParametrosVehiculoVehiculo_ParametrosVehiculoId",
                table: "VehiculoCondiciones",
                newName: "IX_VehiculoCondiciones_ParametrosVehiculoId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_VehiculoCondiciones",
                table: "VehiculoCondiciones",
                columns: new[] { "VehiculoId", "ParametrosVehiculoId" });

            migrationBuilder.AddForeignKey(
                name: "FK_VehiculoCondiciones_ParametrosVehiculo_ParametrosVehiculoId",
                table: "VehiculoCondiciones",
                column: "ParametrosVehiculoId",
                principalTable: "ParametrosVehiculo",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_VehiculoCondiciones_Vehiculo_VehiculoId",
                table: "VehiculoCondiciones",
                column: "VehiculoId",
                principalTable: "Vehiculo",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
