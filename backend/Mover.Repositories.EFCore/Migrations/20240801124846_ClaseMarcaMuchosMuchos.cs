using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Mover.Repositories.EFCore.Migrations
{
    /// <inheritdoc />
    public partial class ClaseMarcaMuchosMuchos : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
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

            migrationBuilder.CreateTable(
                name: "ClaseMarca",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ClaseId = table.Column<int>(type: "int", nullable: false),
                    MarcaId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ClaseMarca", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ClaseMarca_Clase_ClaseId",
                        column: x => x.ClaseId,
                        principalTable: "Clase",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ClaseMarca_Marca_MarcaId",
                        column: x => x.MarcaId,
                        principalTable: "Marca",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ClaseMarca_ClaseId",
                table: "ClaseMarca",
                column: "ClaseId");

            migrationBuilder.CreateIndex(
                name: "IX_ClaseMarca_MarcaId",
                table: "ClaseMarca",
                column: "MarcaId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ClaseMarca");

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
    }
}
