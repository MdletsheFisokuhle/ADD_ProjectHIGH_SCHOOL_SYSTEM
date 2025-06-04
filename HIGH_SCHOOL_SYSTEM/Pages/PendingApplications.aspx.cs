using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace HIGH_SCHOOL_SYSTEM.Pages.Admin
{
    public partial class PendingApplications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPendingApplications();
            }
        }

        private void LoadPendingApplications()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Applications WHERE Status = 'Pending' ORDER BY ApplicationDate DESC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    applicationsGrid.DataSource = dt;
                    applicationsGrid.DataBind();
                }
            }
        }

        protected void applicationsGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Review")
            {
                int applicationID = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"ReviewApplication.aspx?id={applicationID}");
            }
            else if (e.CommandName == "Approve")
            {
                int applicationID = Convert.ToInt32(e.CommandArgument);
                // Show confirmation dialog
                ScriptManager.RegisterStartupScript(this, GetType(), "confirmApprove",
                    $"if(confirm('Are you sure you want to approve this application?')) {{ __doPostBack('approveApplication', '{applicationID}'); }}", true);
            }
            else if (e.CommandName == "Reject")
            {
                int applicationID = Convert.ToInt32(e.CommandArgument);
                // Show confirmation dialog
                ScriptManager.RegisterStartupScript(this, GetType(), "confirmReject",
                    $"if(confirm('Are you sure you want to reject this application?')) {{ __doPostBack('rejectApplication', '{applicationID}'); }}", true);
            }
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            // Handle the postback from the confirmation dialogs
            if (Request["__EVENTTARGET"] == "approveApplication")
            {
                int applicationID = Convert.ToInt32(Request["__EVENTARGUMENT"]);
                ApproveApplication(applicationID);
            }
            else if (Request["__EVENTTARGET"] == "rejectApplication")
            {
                int applicationID = Convert.ToInt32(Request["__EVENTARGUMENT"]);
                RejectApplication(applicationID);
            }
        }

        private void ApproveApplication(int applicationID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Start transaction
                conn.Open();
                SqlTransaction transaction = conn.BeginTransaction();

                try
                {
                    // 1. Get application details
                    string getQuery = "SELECT * FROM Applications WHERE ApplicationID = @ApplicationID";
                    DataTable dt = new DataTable();

                    using (SqlCommand cmd = new SqlCommand(getQuery, conn, transaction))
                    {
                        cmd.Parameters.AddWithValue("@ApplicationID", applicationID);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(dt);
                    }

                    if (dt.Rows.Count == 1)
                    {
                        DataRow row = dt.Rows[0];
                        string lastGradePassed = row["LastGradePassed"].ToString();
                        string currentGrade = "";

                        // Calculate current grade based on last grade passed
                        if (!string.IsNullOrEmpty(lastGradePassed))
                        {
                            if (lastGradePassed.StartsWith("Grade "))
                            {
                                int gradeNumber;
                                if (int.TryParse(lastGradePassed.Replace("Grade ", ""), out gradeNumber))
                                {
                                    if (gradeNumber >= 8 && gradeNumber <= 11)
                                    {
                                        currentGrade = "Grade " + (gradeNumber + 1);
                                    }
                                    else if (gradeNumber == 12)
                                    {
                                        currentGrade = "Graduated";
                                    }
                                }
                            }
                            else
                            {
                                currentGrade = "Grade 8"; // Default if format is unexpected
                            }
                        }
                        else
                        {
                            currentGrade = "Grade 8"; // Default if no last grade passed
                        }

                        // 2. Create student record
                        string insertQuery = @"INSERT INTO Students 
                                    (ApplicationID, FirstName, LastName, IDNumber, DateOfBirth, 
                                     Gender, Email, PhoneNumber, Address, CurrentGrade, EnrollmentDate)
                                    VALUES 
                                    (@ApplicationID, @FirstName, @LastName, @IDNumber, @DateOfBirth, 
                                     @Gender, @Email, @PhoneNumber, @Address, @CurrentGrade, GETDATE());
                                    SELECT SCOPE_IDENTITY();";

                        int studentId;
                        using (SqlCommand cmd = new SqlCommand(insertQuery, conn, transaction))
                        {
                            cmd.Parameters.AddWithValue("@ApplicationID", applicationID);
                            cmd.Parameters.AddWithValue("@FirstName", row["FirstName"]);
                            cmd.Parameters.AddWithValue("@LastName", row["LastName"]);
                            cmd.Parameters.AddWithValue("@IDNumber", row["IDNumber"]);
                            cmd.Parameters.AddWithValue("@DateOfBirth", row["DateOfBirth"]);
                            cmd.Parameters.AddWithValue("@Gender", row["Gender"]);
                            cmd.Parameters.AddWithValue("@Email", row["Email"]);
                            cmd.Parameters.AddWithValue("@PhoneNumber", row["PhoneNumber"]);
                            cmd.Parameters.AddWithValue("@Address", row["Address"]);
                            cmd.Parameters.AddWithValue("@CurrentGrade", currentGrade);

                            studentId = Convert.ToInt32(cmd.ExecuteScalar());
                        }

                        // 3. Update application status
                        string updateQuery = "UPDATE Applications SET Status = 'Approved' WHERE ApplicationID = @ApplicationID";
                        using (SqlCommand cmd = new SqlCommand(updateQuery, conn, transaction))
                        {
                            cmd.Parameters.AddWithValue("@ApplicationID", applicationID);
                            cmd.ExecuteNonQuery();
                        }

                        transaction.Commit();
                        LoadPendingApplications();

                        // Show success message
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert",
                            "alert('Application approved successfully! Student record has been created.');", true);
                    }
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    // Show error message
                    ScriptManager.RegisterStartupScript(this, GetType(), "showerror",
                        $"alert('Error approving application: {ex.Message.Replace("'", "\\'")}');", true);
                }
            }
        }
        private void RejectApplication(int applicationID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"UPDATE Applications 
                               SET Status = 'Rejected',                            
                                   Notes = 'Rejected by administrator'
                               WHERE ApplicationID = @ApplicationID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ApplicationID", applicationID);

                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    conn.Close();

                    if (rowsAffected > 0)
                    {
                        LoadPendingApplications();
                        // Show success message
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert",
                            "alert('Application has been rejected.');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showerror",
                            "alert('Application not found or could not be rejected.');", true);
                    }
                }
            }
        }
    }
}