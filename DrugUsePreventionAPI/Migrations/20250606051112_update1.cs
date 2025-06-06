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
            migrationBuilder.DropForeignKey(
                name: "FK_Questions_Surveys_SurveyID",
                table: "Questions");

            migrationBuilder.AlterColumn<int>(
                name: "SurveyID",
                table: "Questions",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<int>(
                name: "AssessmentID",
                table: "Questions",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Questions_AssessmentID",
                table: "Questions",
                column: "AssessmentID");

            migrationBuilder.AddForeignKey(
                name: "FK_Questions_Assessments_AssessmentID",
                table: "Questions",
                column: "AssessmentID",
                principalTable: "Assessments",
                principalColumn: "AssessmentID");

            migrationBuilder.AddForeignKey(
                name: "FK_Questions_Surveys_SurveyID",
                table: "Questions",
                column: "SurveyID",
                principalTable: "Surveys",
                principalColumn: "SurveyID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Questions_Assessments_AssessmentID",
                table: "Questions");

            migrationBuilder.DropForeignKey(
                name: "FK_Questions_Surveys_SurveyID",
                table: "Questions");

            migrationBuilder.DropIndex(
                name: "IX_Questions_AssessmentID",
                table: "Questions");

            migrationBuilder.DropColumn(
                name: "AssessmentID",
                table: "Questions");

            migrationBuilder.AlterColumn<int>(
                name: "SurveyID",
                table: "Questions",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Questions_Surveys_SurveyID",
                table: "Questions",
                column: "SurveyID",
                principalTable: "Surveys",
                principalColumn: "SurveyID",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
