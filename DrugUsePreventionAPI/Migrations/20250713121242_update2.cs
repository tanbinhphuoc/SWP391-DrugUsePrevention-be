using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DrugUsePreventionAPI.Migrations
{
    /// <inheritdoc />
    public partial class update2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "RegisterTime",
                table: "CourseRegistrations",
                newName: "RegistrationDate");

            migrationBuilder.AddColumn<decimal>(
                name: "Amount",
                table: "CourseRegistrations",
                type: "decimal(18,2)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PaymentStatus",
                table: "CourseRegistrations",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Status",
                table: "CourseRegistrations",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "TransactionID",
                table: "CourseRegistrations",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Amount",
                table: "CourseRegistrations");

            migrationBuilder.DropColumn(
                name: "PaymentStatus",
                table: "CourseRegistrations");

            migrationBuilder.DropColumn(
                name: "Status",
                table: "CourseRegistrations");

            migrationBuilder.DropColumn(
                name: "TransactionID",
                table: "CourseRegistrations");

            migrationBuilder.RenameColumn(
                name: "RegistrationDate",
                table: "CourseRegistrations",
                newName: "RegisterTime");
        }
    }
}
