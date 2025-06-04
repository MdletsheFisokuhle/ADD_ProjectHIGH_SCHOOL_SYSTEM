using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;

namespace HIGH_SCHOOL_SYSTEM.Pages
{
    public partial class SubjectRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check authentication first
                if (!User.Identity.IsAuthenticated)
                {
                    Response.Redirect("~/Account/Login.aspx");
                    return;
                }

                // Get student email from authentication
                string email = User.Identity.Name;

                // Initialize session if not already set
                if (Session["StudentEmail"] == null)
                {
                    // Load student data from database
                    LoadStudentData(email);
                }

                chkSubjects.Items.Clear();
                ddlStream.ClearSelection();

                // Hide subjects section and button on first load
                subjectsSection.Visible = false;
                lblMessage.Visible = false;
                btnSubmit.Visible = false;
            }
        }

        private void LoadStudentData(string email)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT StudentId, ApplicationId FROM Students WHERE Email = @Email";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Session["StudentId"] = reader["StudentId"].ToString();
                            Session["ApplicationId"] = reader["ApplicationId"].ToString();
                            Session["StudentEmail"] = email;
                        }
                        else
                        {
                            // Student not found in database
                            HttpContext.Current.GetOwinContext().Authentication.SignOut();
                            Response.Redirect("~/Account/Login.aspx");
                        }
                    }
                }
            }
        }

        protected void ddlStream_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }

            string stream = ddlStream.SelectedValue;
            chkSubjects.Items.Clear();

            if (!string.IsNullOrEmpty(stream))
            {
                // Make the container visible so subjects and button show
                subjectsSection.Visible = true;

                chkSubjects.Visible = true;
                lblSubjects.Visible = true;
                btnSubmit.Visible = true;

                List<string> subjects = new List<string>();

                switch (stream)
                {
                    case "Science":
                        subjects.AddRange(new[] {
                            "Physical Science", "Mathematics", "Life Sciences", "English", "IsiZulu",
                            "Life Orientation", "Business Studies", "Computer Applications",
                            "Engineering Graphics and Design"
                        });
                        break;
                    case "Commerce":
                        subjects.AddRange(new[] {
                            "Accounting", "Economics", "Business Studies", "Mathematics",
                            "Life Orientation", "English", "IsiZulu", "Tourism",
                            "Computer Applications"
                        });
                        break;
                    case "General":
                        subjects.AddRange(new[] {
                            "History", "Geography", "Agriculture", "IsiZulu", "English",
                            "Life Orientation", "Business Studies", "Tourism", "Hospitality"
                        });
                        break;
                }

                foreach (var subject in subjects)
                {
                    chkSubjects.Items.Add(new ListItem(subject));
                }
            }
            else
            {
                // Hide subjects section if no stream selected
                subjectsSection.Visible = false;
                btnSubmit.Visible = false;
                lblMessage.Visible = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }

            // Get from session or reload if needed
            string email = User.Identity.Name;
            if (Session["StudentEmail"] == null || Session["StudentEmail"].ToString() != email)
            {
                LoadStudentData(email);
            }

            string studentId = Session["StudentId"]?.ToString();
            string applicationId = Session["ApplicationId"]?.ToString();

            if (string.IsNullOrEmpty(studentId) || string.IsNullOrEmpty(applicationId))
            {
                lblMessage.Text = "Student information not found. Please contact administrator.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
                return;
            }

            List<string> selectedSubjects = new List<string>();
            foreach (ListItem item in chkSubjects.Items)
            {
                if (item.Selected)
                    selectedSubjects.Add(item.Text);
            }

            if (selectedSubjects.Count == 0)
            {
                lblMessage.Text = "Please select at least one subject.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                // First clear existing registrations for this student
                string deleteQuery = "DELETE FROM SubjectRegistration WHERE StudentId = @StudentId";
                using (SqlCommand deleteCmd = new SqlCommand(deleteQuery, con))
                {
                    deleteCmd.Parameters.AddWithValue("@StudentId", studentId);
                    deleteCmd.ExecuteNonQuery();
                }

                // Insert new selections
                foreach (string subject in selectedSubjects)
                {
                    string insertQuery = @"INSERT INTO SubjectRegistration 
                                        (StudentId, ApplicationId, SubjectName, RegistrationDate) 
                                        VALUES (@StudentId, @ApplicationId, @SubjectName, GETDATE())";
                    using (SqlCommand insertCmd = new SqlCommand(insertQuery, con))
                    {
                        insertCmd.Parameters.AddWithValue("@StudentId", studentId);
                        insertCmd.Parameters.AddWithValue("@ApplicationId", applicationId);
                        insertCmd.Parameters.AddWithValue("@SubjectName", subject);
                        insertCmd.ExecuteNonQuery();
                    }
                }
            }

            lblMessage.Text = "Subjects registered successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Visible = true;
        }
    }
}
