using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace HIGH_SCHOOL_SYSTEM.Pages
{
    public partial class Application : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize form if needed
            }
        }

        protected void submitBTN_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        string query = @"INSERT INTO Applications 
                                        (FirstName, LastName, IDNumber, DateOfBirth, Gender, Email, 
                                         PhoneNumber, Address, LastSchoolAttended, LastGradePassed, 
                                         SubjectsPassed, YearCompleted) 
                                        VALUES 
                                        (@FirstName, @LastName, @IDNumber, @DateOfBirth, @Gender, @Email, 
                                         @PhoneNumber, @Address, @LastSchool, @LastGrade, 
                                         @Subjects, @YearCompleted)";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@FirstName", firstNameTXT.Text.Trim());
                            cmd.Parameters.AddWithValue("@LastName", lastNameTXT.Text.Trim());
                            cmd.Parameters.AddWithValue("@IDNumber", idTXT.Text.Trim());
                            cmd.Parameters.AddWithValue("@DateOfBirth", DateTime.Parse(dobTXT.Text));
                            cmd.Parameters.AddWithValue("@Gender", genderDDL.SelectedValue);
                            cmd.Parameters.AddWithValue("@Email", emailTXT.Text.Trim());
                            cmd.Parameters.AddWithValue("@PhoneNumber", phoneTXT.Text.Trim());
                            cmd.Parameters.AddWithValue("@Address", addressTXT.Text.Trim());
                            cmd.Parameters.AddWithValue("@LastSchool", lastSchoolTXT.Text.Trim());
                            cmd.Parameters.AddWithValue("@LastGrade", lastGradeTXT.Text.Trim());
                            cmd.Parameters.AddWithValue("@Subjects", subjectsTXT.Text.Trim());
                            cmd.Parameters.AddWithValue("@YearCompleted", int.Parse(yearCompletedTXT.Text));

                            conn.Open();
                            cmd.ExecuteNonQuery();
                            conn.Close();

                            statusLBL.Text = "Application submitted successfully!";
                            statusLBL.ForeColor = System.Drawing.Color.Green;

                            // Clear form
                            firstNameTXT.Text = "";
                            lastNameTXT.Text = "";
                            // ... clear other fields
                        }
                    }
                }
                catch (Exception ex)
                {
                    statusLBL.Text = "Error submitting application: " + ex.Message;
                    statusLBL.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}