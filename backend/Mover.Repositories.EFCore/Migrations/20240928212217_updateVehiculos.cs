using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Mover.Repositories.EFCore.Migrations
{
    /// <inheritdoc />
    public partial class updateVehiculos : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Vehiculo_Condicion_CondicionId",
                table: "Vehiculo");

            migrationBuilder.DropTable(
                name: "Condicion");

            migrationBuilder.DropColumn(
                name: "Medidas",
                table: "Vehiculo");

            migrationBuilder.RenameColumn(
                name: "CondicionId",
                table: "Vehiculo",
                newName: "ModeloId");

            migrationBuilder.RenameIndex(
                name: "IX_Vehiculo_CondicionId",
                table: "Vehiculo",
                newName: "IX_Vehiculo_ModeloId");

            migrationBuilder.AddColumn<int>(
                name: "CondicionVehiculoId",
                table: "Vehiculo",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AlterColumn<string>(
                name: "UserName",
                table: "Users",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Telefono",
                table: "Users",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Nombre",
                table: "Users",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Identificacion",
                table: "Users",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Email",
                table: "Users",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Direccion",
                table: "Users",
                type: "nvarchar(200)",
                maxLength: 200,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Apellido",
                table: "Users",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.CreateTable(
                name: "CondicionVehiculo",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CondicionVehiculo", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Modelo",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Modelo", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "ParametrosVehiculo",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ParametrosVehiculo", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "VehiculoCondiciones",
                columns: table => new
                {
                    VehiculoId = table.Column<int>(type: "int", nullable: false),
                    ParametrosVehiculoId = table.Column<int>(type: "int", nullable: false),
                    Value = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VehiculoCondiciones", x => new { x.VehiculoId, x.ParametrosVehiculoId });
                    table.ForeignKey(
                        name: "FK_VehiculoCondiciones_ParametrosVehiculo_ParametrosVehiculoId",
                        column: x => x.ParametrosVehiculoId,
                        principalTable: "ParametrosVehiculo",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_VehiculoCondiciones_Vehiculo_VehiculoId",
                        column: x => x.VehiculoId,
                        principalTable: "Vehiculo",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Vehiculo_CondicionVehiculoId",
                table: "Vehiculo",
                column: "CondicionVehiculoId");

            migrationBuilder.CreateIndex(
                name: "IX_VehiculoCondiciones_ParametrosVehiculoId",
                table: "VehiculoCondiciones",
                column: "ParametrosVehiculoId");

            migrationBuilder.AddForeignKey(
                name: "FK_Vehiculo_CondicionVehiculo_CondicionVehiculoId",
                table: "Vehiculo",
                column: "CondicionVehiculoId",
                principalTable: "CondicionVehiculo",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Vehiculo_Modelo_ModeloId",
                table: "Vehiculo",
                column: "ModeloId",
                principalTable: "Modelo",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Vehiculo_CondicionVehiculo_CondicionVehiculoId",
                table: "Vehiculo");

            migrationBuilder.DropForeignKey(
                name: "FK_Vehiculo_Modelo_ModeloId",
                table: "Vehiculo");

            migrationBuilder.DropTable(
                name: "CondicionVehiculo");

            migrationBuilder.DropTable(
                name: "Modelo");

            migrationBuilder.DropTable(
                name: "VehiculoCondiciones");

            migrationBuilder.DropTable(
                name: "ParametrosVehiculo");

            migrationBuilder.DropIndex(
                name: "IX_Vehiculo_CondicionVehiculoId",
                table: "Vehiculo");

            migrationBuilder.DropColumn(
                name: "CondicionVehiculoId",
                table: "Vehiculo");

            migrationBuilder.RenameColumn(
                name: "ModeloId",
                table: "Vehiculo",
                newName: "CondicionId");

            migrationBuilder.RenameIndex(
                name: "IX_Vehiculo_ModeloId",
                table: "Vehiculo",
                newName: "IX_Vehiculo_CondicionId");

            migrationBuilder.AddColumn<string>(
                name: "Medidas",
                table: "Vehiculo",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AlterColumn<string>(
                name: "UserName",
                table: "Users",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(100)",
                oldMaxLength: 100);

            migrationBuilder.AlterColumn<string>(
                name: "Telefono",
                table: "Users",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(50)",
                oldMaxLength: 50);

            migrationBuilder.AlterColumn<string>(
                name: "Nombre",
                table: "Users",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(100)",
                oldMaxLength: 100);

            migrationBuilder.AlterColumn<string>(
                name: "Identificacion",
                table: "Users",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(50)",
                oldMaxLength: 50);

            migrationBuilder.AlterColumn<string>(
                name: "Email",
                table: "Users",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(100)",
                oldMaxLength: 100);

            migrationBuilder.AlterColumn<string>(
                name: "Direccion",
                table: "Users",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(200)",
                oldMaxLength: 200);

            migrationBuilder.AlterColumn<string>(
                name: "Apellido",
                table: "Users",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(100)",
                oldMaxLength: 100);

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

            migrationBuilder.AddForeignKey(
                name: "FK_Vehiculo_Condicion_CondicionId",
                table: "Vehiculo",
                column: "CondicionId",
                principalTable: "Condicion",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
