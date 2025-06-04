using System;
using System.Configuration;
using System.Data.SqlClient;

namespace HIGH_SCHOOL_SYSTEM.Pages
{
    public partial class StudentDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string studentId = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(studentId))
                {
                    LoadStudentDetails(Convert.ToInt32(studentId));
                }
                else
                {
                    lblError.Text = "No student ID provided.";
                    lblError.Visible = true;
                }
            }
        }

        private void LoadStudentDetails(int studentId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = @"SELECT StudentID, ApplicationID, FirstName, LastName, IDNumber, 
                            EnrollmentDate, CurrentGrade, IsActive 
                            FROM Students WHERE StudentID = @StudentID";

            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@StudentID", studentId);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblStudentID.Text = reader["StudentID"].ToString();
                    lblApplicationID.Text = reader["ApplicationID"].ToString();
                    lblFirstName.Text = reader["FirstName"].ToString();
                    lblLastName.Text = reader["LastName"].ToString();
                    lblIDNumber.Text = reader["IDNumber"].ToString();
                    lblEnrollmentDate.Text = Convert.ToDateTime(reader["EnrollmentDate"]).ToString("yyyy-MM-dd");
                    lblCurrentGrade.Text = reader["CurrentGrade"].ToString();
                    lblStatus.Text = Convert.ToBoolean(reader["IsActive"]) ? "Active" : "Inactive";

                    pnlDetails.Visible = true;
                }
                else
                {
                    lblError.Text = "Student not found.";
                    lblError.Visible = true;
                }
            }
        }
    }
}
