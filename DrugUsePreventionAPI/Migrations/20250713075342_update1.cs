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
                table: "UserCourseProgresses",
                newName: "UserCourseProgressID");

            migrationBuilder.AddColumn<int>(
                name: "CourseRegistrationID",
                table: "CourseRegistrations",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_UserCourseProgresses_UserID",
                table: "UserCourseProgresses",
                column: "UserID");

            migrationBuilder.AddForeignKey(
                name: "FK_UserCourseProgresses_Users_UserID",
                table: "UserCourseProgresses",
                column: "UserID",
                principalTable: "Users",
                principalColumn: "UserID",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserCourseProgresses_Users_UserID",
                table: "UserCourseProgresses");

            migrationBuilder.DropIndex(
                name: "IX_UserCourseProgresses_UserID",
                table: "UserCourseProgresses");

            migrationBuilder.DropColumn(
                name: "CourseRegistrationID",
                table: "CourseRegistrations");

            migrationBuilder.RenameColumn(
                name: "UserCourseProgressID",
                table: "UserCourseProgresses",
                newName: "ID");
        }
    }
}
