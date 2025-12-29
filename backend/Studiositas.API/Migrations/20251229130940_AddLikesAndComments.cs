using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Studiositas.API.Migrations
{
    /// <inheritdoc />
    public partial class AddLikesAndComments : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "CommentsCount",
                table: "StudyPosts",
                type: "integer",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "LikesCount",
                table: "StudyPosts",
                type: "integer",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CommentsCount",
                table: "StudyPosts");

            migrationBuilder.DropColumn(
                name: "LikesCount",
                table: "StudyPosts");
        }
    }
}
