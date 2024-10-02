using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Mover.Repositories.EFCore.Migrations
{
    /// <inheritdoc />
    public partial class addDeviceIdDispositivo : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Dispositivos_Users_UserId",
                table: "Dispositivos");

            migrationBuilder.AlterColumn<int>(
                name: "UserId",
                table: "Dispositivos",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddColumn<string>(
                name: "UniqueDeviceId",
                table: "Dispositivos",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddForeignKey(
                name: "FK_Dispositivos_Users_UserId",
                table: "Dispositivos",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Dispositivos_Users_UserId",
                table: "Dispositivos");

            migrationBuilder.DropColumn(
                name: "UniqueDeviceId",
                table: "Dispositivos");

            migrationBuilder.AlterColumn<int>(
                name: "UserId",
                table: "Dispositivos",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_Dispositivos_Users_UserId",
                table: "Dispositivos",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id");
        }
    }
}
