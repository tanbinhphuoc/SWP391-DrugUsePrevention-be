using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DrugUsePreventionAPI.Migrations
{
    /// <inheritdoc />
    public partial class update1 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "ID",
                table: "UserCourseProgresseses",
                newName: "UserCourseProgressesID");

            migrationBuilder.AddColumn<int>(
                name: "CourseRegistrationID",
                table: "CourseRegistrations",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_UserCourseProgresseses_UserID",
                table: "UserCourseProgresseses",
                column: "UserID");

            migrationBuilder.AddForeignKey(
                name: "FK_UserCourseProgresseses_Users_UserID",
                table: "UserCourseProgresseses",
                column: "UserID",
                principalTable: "Users",
                principalColumn: "UserID",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserCourseProgresseses_Users_UserID",
                table: "UserCourseProgresseses");

            migrationBuilder.DropIndex(
                name: "IX_UserCourseProgresseses_UserID",
                table: "UserCourseProgresseses");

            migrationBuilder.DropColumn(
                name: "CourseRegistrationID",
                table: "CourseRegistrations");

            migrationBuilder.RenameColumn(
                name: "UserCourseProgressesID",
                table: "UserCourseProgresseses",
                newName: "ID");
        }
    }
}
