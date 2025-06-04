using System;
using System.Data.SqlClient;

namespace HIGH_SCHOOL_SYSTEM.Pages
{
    public partial class ViewApplicationStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            resultLBL.Text = ""; // Clear label on load
        }

        protected void checkStatusBTN_Click(object sender, EventArgs e)
        {
            string email = emailTXT.Text.Trim();

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT FirstName, LastName, Status FROM Applications WHERE Email = @Email";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        string name = reader["FirstName"].ToString() + " " + reader["LastName"].ToString();
                        string status = reader["Status"] != DBNull.Value ? reader["Status"].ToString() : "Pending";
                        resultLBL.ForeColor = System.Drawing.Color.Green;
                        resultLBL.Text = $"Hi {name}, your application status is: <b>{status}</b>.";
                    }
                    else
                    {
                        resultLBL.ForeColor = System.Drawing.Color.Red;
                        resultLBL.Text = "No application found for the entered email.";
                    }

                    reader.Close();
                }
            }
        }
    }
}
