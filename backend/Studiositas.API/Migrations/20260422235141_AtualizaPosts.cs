using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Studiositas.API.Migrations
{
    /// <inheritdoc />
    public partial class AtualizaPosts : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Description",
                table: "StudyPosts",
                newName: "Title");

            migrationBuilder.AddColumn<string>(
                name: "Content",
                table: "StudyPosts",
                type: "text",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<int>(
                name: "UserId",
                table: "StudyPosts",
                type: "integer",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Content",
                table: "StudyPosts");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "StudyPosts");

            migrationBuilder.RenameColumn(
                name: "Title",
                table: "StudyPosts",
                newName: "Description");
        }
    }
}
