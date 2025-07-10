using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DrugUsePreventionAPI.Migrations
{
    /// <inheritdoc />
    public partial class FixPaymentForeignKeyAndSchema : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Consultants_Users_UserID",
                table: "Consultants");

            migrationBuilder.DropForeignKey(
                name: "FK_Payments_Appointments_AppointmentID",
                table: "Payments");

            migrationBuilder.DropForeignKey(
                name: "FK_Payments_Courses_CourseID",
                table: "Payments");

            migrationBuilder.DropForeignKey(
                name: "FK_Payments_Users_UserID",
                table: "Payments");

            migrationBuilder.DropColumn(
                name: "Title",
                table: "Courses");

            migrationBuilder.AlterColumn<decimal>(
                name: "Amount",
                table: "Payments",
                type: "decimal(10,2)",
                nullable: true,
                oldClrType: typeof(decimal),
                oldType: "decimal(18,2)");

            // Remove AppointmentID1 if it exists (fix migration)
            if (migrationBuilder.ActiveProvider == "Microsoft.EntityFrameworkCore.SqlServer")
            {
                migrationBuilder.Sql(@"
                        IF EXISTS (SELECT 1 FROM sys.columns WHERE Name = N'AppointmentID1' AND Object_ID = Object_ID(N'Payments'))
                        BEGIN
                            ALTER TABLE Payments DROP CONSTRAINT IF EXISTS [FK_Payments_Appointments_AppointmentID1];
                            DROP INDEX IF EXISTS [IX_Payments_AppointmentID1] ON Payments;
                            ALTER TABLE Payments DROP COLUMN AppointmentID1;
                        END
                    ");
            }

            migrationBuilder.AlterColumn<string>(
                name: "CourseName",
                table: "Courses",
                type: "nvarchar(255)",
                maxLength: 255,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<decimal>(
                name: "HourlyRate",
                table: "Consultants",
                type: "decimal(10,2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "decimal(18,2)");

            migrationBuilder.AlterColumn<string>(
                name: "GoogleMeetLink",
                table: "Consultants",
                type: "nvarchar(255)",
                maxLength: 255,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AddColumn<string>(
                name: "AuthorAvatar",
                table: "Blogs",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Thumbnail",
                table: "Blogs",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AlterColumn<decimal>(
                name: "Price",
                table: "Appointments",
                type: "decimal(10,2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "decimal(18,2)");

            migrationBuilder.AddForeignKey(
                name: "FK_Consultants_Users_UserID",
                table: "Consultants",
                column: "UserID",
                principalTable: "Users",
                principalColumn: "UserID",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Payments_Appointments_AppointmentID",
                table: "Payments",
                column: "AppointmentID",
                principalTable: "Appointments",
                principalColumn: "AppointmentID",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Payments_Courses_CourseID",
                table: "Payments",
                column: "CourseID",
                principalTable: "Courses",
                principalColumn: "CourseID",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Payments_Users_UserID",
                table: "Payments",
                column: "UserID",
                principalTable: "Users",
                principalColumn: "UserID",
                onDelete: ReferentialAction.Restrict);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Consultants_Users_UserID",
                table: "Consultants");

            migrationBuilder.DropForeignKey(
                name: "FK_Payments_Appointments_AppointmentID",
                table: "Payments");

            migrationBuilder.DropForeignKey(
                name: "FK_Payments_Courses_CourseID",
                table: "Payments");

            migrationBuilder.DropForeignKey(
                name: "FK_Payments_Users_UserID",
                table: "Payments");

            migrationBuilder.DropColumn(
                name: "AuthorAvatar",
                table: "Blogs");

            migrationBuilder.DropColumn(
                name: "Thumbnail",
                table: "Blogs");

            migrationBuilder.AlterColumn<decimal>(
                name: "Amount",
                table: "Payments",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m,
                oldClrType: typeof(decimal),
                oldType: "decimal(10,2)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "CourseName",
                table: "Courses",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(255)",
                oldMaxLength: 255);

            migrationBuilder.AddColumn<string>(
                name: "Title",
                table: "Courses",
                type: "nvarchar(255)",
                maxLength: 255,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AlterColumn<decimal>(
                name: "HourlyRate",
                table: "Consultants",
                type: "decimal(18,2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "decimal(10,2)");

            migrationBuilder.AlterColumn<string>(
                name: "GoogleMeetLink",
                table: "Consultants",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(255)",
                oldMaxLength: 255,
                oldNullable: true);

            migrationBuilder.AlterColumn<decimal>(
                name: "Price",
                table: "Appointments",
                type: "decimal(18,2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "decimal(10,2)");

            migrationBuilder.AddForeignKey(
                name: "FK_Consultants_Users_UserID",
                table: "Consultants",
                column: "UserID",
                principalTable: "Users",
                principalColumn: "UserID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Payments_Appointments_AppointmentID",
                table: "Payments",
                column: "AppointmentID",
                principalTable: "Appointments",
                principalColumn: "AppointmentID");

            migrationBuilder.AddForeignKey(
                name: "FK_Payments_Courses_CourseID",
                table: "Payments",
                column: "CourseID",
                principalTable: "Courses",
                principalColumn: "CourseID");

            migrationBuilder.AddForeignKey(
                name: "FK_Payments_Users_UserID",
                table: "Payments",
                column: "UserID",
                principalTable: "Users",
                principalColumn: "UserID",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
