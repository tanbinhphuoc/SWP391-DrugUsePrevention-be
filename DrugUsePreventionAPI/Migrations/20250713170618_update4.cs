using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DrugUsePreventionAPI.Migrations
{
    public partial class update4 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            // Bỏ khoá chính cũ đang dùng CourseRegistrationID
            migrationBuilder.DropPrimaryKey(
                name: "PK_CourseRegistrations",
                table: "CourseRegistrations");

            // Xoá cột cũ (vì không thể sửa thành IDENTITY trực tiếp)
            migrationBuilder.DropColumn(
                name: "CourseRegistrationID",
                table: "CourseRegistrations");

            // Thêm lại cột mới có IDENTITY (auto-increment)
            migrationBuilder.AddColumn<int>(
                name: "CourseRegistrationID",
                table: "CourseRegistrations",
                type: "int",
                nullable: false,
                defaultValue: 0)
                .Annotation("SqlServer:Identity", "1, 1");

            // Đặt lại khoá chính
            migrationBuilder.AddPrimaryKey(
                name: "PK_CourseRegistrations",
                table: "CourseRegistrations",
                column: "CourseRegistrationID");

            // (tuỳ chọn) Tạo lại index nếu cần
            migrationBuilder.CreateIndex(
                name: "IX_CourseRegistrations_UserID",
                table: "CourseRegistrations",
                column: "UserID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            // Xoá lại khoá chính
            migrationBuilder.DropPrimaryKey(
                name: "PK_CourseRegistrations",
                table: "CourseRegistrations");

            // Xoá index
            migrationBuilder.DropIndex(
                name: "IX_CourseRegistrations_UserID",
                table: "CourseRegistrations");

            // Xoá cột mới
            migrationBuilder.DropColumn(
                name: "CourseRegistrationID",
                table: "CourseRegistrations");

            // Thêm lại cột cũ (không IDENTITY)
            migrationBuilder.AddColumn<int>(
                name: "CourseRegistrationID",
                table: "CourseRegistrations",
                type: "int",
                nullable: false,
                defaultValue: 0);

            // Đặt lại khóa chính cũ nếu cần
            migrationBuilder.AddPrimaryKey(
                name: "PK_CourseRegistrations",
                table: "CourseRegistrations",
                columns: new[] { "UserID", "CourseID" });
        }
    }
}
