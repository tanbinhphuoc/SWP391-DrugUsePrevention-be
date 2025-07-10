using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DrugUsePreventionAPI.Migrations
{
    /// <inheritdoc />
    public partial class update18 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserCourseProgresses_Courses_CourseId",
                table: "UserCourseProgresses");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "UserCourseProgresses",
                newName: "UserID");

            migrationBuilder.RenameColumn(
                name: "CourseId",
                table: "UserCourseProgresses",
                newName: "CourseID");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "UserCourseProgresses",
                newName: "ID");

            migrationBuilder.RenameIndex(
                name: "IX_UserCourseProgresses_CourseId",
                table: "UserCourseProgresses",
                newName: "IX_UserCourseProgresses_CourseID");

            migrationBuilder.AddForeignKey(
                name: "FK_UserCourseProgresses_Courses_CourseID",
                table: "UserCourseProgresses",
                column: "CourseID",
                principalTable: "Courses",
                principalColumn: "CourseID",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserCourseProgresses_Courses_CourseID",
                table: "UserCourseProgresses");

            migrationBuilder.RenameColumn(
                name: "UserID",
                table: "UserCourseProgresses",
                newName: "UserId");

            migrationBuilder.RenameColumn(
                name: "CourseID",
                table: "UserCourseProgresses",
                newName: "CourseId");

            migrationBuilder.RenameColumn(
                name: "ID",
                table: "UserCourseProgresses",
                newName: "Id");

            migrationBuilder.RenameIndex(
                name: "IX_UserCourseProgresses_CourseID",
                table: "UserCourseProgresses",
                newName: "IX_UserCourseProgresses_CourseId");

            migrationBuilder.AddForeignKey(
                name: "FK_UserCourseProgresses_Courses_CourseId",
                table: "UserCourseProgresses",
                column: "CourseId",
                principalTable: "Courses",
                principalColumn: "CourseID",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
