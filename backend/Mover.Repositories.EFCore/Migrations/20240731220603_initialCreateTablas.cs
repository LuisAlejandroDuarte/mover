using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Mover.Repositories.EFCore.Migrations
{
    /// <inheritdoc />
    public partial class initialCreateTablas : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "EstadoUsuarioId",
                table: "Users",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "EstadoUsuario",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EstadoUsuario", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Users_EstadoUsuarioId",
                table: "Users",
                column: "EstadoUsuarioId");

            migrationBuilder.AddForeignKey(
                name: "FK_Users_EstadoUsuario_EstadoUsuarioId",
                table: "Users",
                column: "EstadoUsuarioId",
                principalTable: "EstadoUsuario",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Users_EstadoUsuario_EstadoUsuarioId",
                table: "Users");

            migrationBuilder.DropTable(
                name: "EstadoUsuario");

            migrationBuilder.DropIndex(
                name: "IX_Users_EstadoUsuarioId",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "EstadoUsuarioId",
                table: "Users");
        }
    }
}
