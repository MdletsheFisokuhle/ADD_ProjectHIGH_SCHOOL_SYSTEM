using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace HIGH_SCHOOL_SYSTEM.Pages
{
    public partial class StudentProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudentData();
                LoadRegisteredSubjects();
            }
        }

        private void LoadStudentData()
        {
            string email = Session["Email"]?.ToString();
            if (string.IsNullOrEmpty(email))
            {
                email = User.Identity.Name;
            }

            if (string.IsNullOrEmpty(email))
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }

            string query = "SELECT * FROM Students WHERE Email = @Email";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Email", email);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblFullName.Text = reader["FirstName"] + " " + reader["LastName"];
                    lblIDNumber.Text = reader["IDNumber"].ToString();
                    lblDOB.Text = Convert.ToDateTime(reader["DateOfBirth"]).ToShortDateString();
                    lblGender.Text = reader["Gender"].ToString();
                    lblGrade.Text = reader["CurrentGrade"].ToString();
                    lblEnrollDate.Text = Convert.ToDateTime(reader["EnrollmentDate"]).ToShortDateString();

                    txtEmail.Text = reader["Email"].ToString();
                    txtPhone.Text = reader["PhoneNumber"].ToString();
                    txtAddress.Text = reader["Address"].ToString();

                    ShowProgress(reader["CurrentGrade"].ToString());
                }
            }
        }

        private void LoadRegisteredSubjects()
        {
            string email = Session["Email"]?.ToString();
            if (string.IsNullOrEmpty(email))
            {
                email = User.Identity.Name;
            }

            if (string.IsNullOrEmpty(email))
            {
                // no email found, redirect to login or just return
                return;
            }

            string query = @"
        SELECT sr.SubjectName, sr.IsApproved
        FROM SubjectRegistration sr
        INNER JOIN Students s ON sr.StudentId = s.StudentID
        WHERE s.Email = @Email";

            DataTable dtSubjects = new DataTable();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Email", email);
                conn.Open();

                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    adapter.Fill(dtSubjects);
                }
            }

            gvSubjects.DataSource = dtSubjects;
            gvSubjects.DataBind();
        }


        protected void btnUpdateContact_Click(object sender, EventArgs e)
        {
            string email = Session["Email"]?.ToString();

            string query = "UPDATE Students SET PhoneNumber = @Phone, Address = @Address WHERE Email = @Email";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", email);

                conn.Open();
                int rowsAffected = cmd.ExecuteNonQuery();

                lblMessage.Text = rowsAffected > 0 ? "Contact information updated." : "Update failed.";
            }
        }

        private void ShowProgress(string grade)
        {
            int progress = 0;
            string note = "Unknown";

            switch (grade)
            {
                case "Grade 8": progress = 10; note = "New-Comer"; break;
                case "Grade 9": progress = 30; note = "Developing"; break;
                case "Grade 10": progress = 50; note = "Intermediate"; break;
                case "Grade 11": progress = 75; note = "Pre-Matric"; break;
                case "Grade 12": progress = 100; note = "Matric"; break;
            }

            string script = $@"
                document.getElementById('progressAcademic').style.width = '{progress}%';
                document.getElementById('progressAcademic').setAttribute('aria-valuenow', '{progress}');
                document.getElementById('progressAcademic').innerText = '{note} - {progress}%';
            ";

            ScriptManager.RegisterStartupScript(this, GetType(), "UpdateProgress", script, true);
            lblProgressNote.Text = $"Academic Progress: {note}";
        }
    }
}
