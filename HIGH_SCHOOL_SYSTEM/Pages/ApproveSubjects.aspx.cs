using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace HIGH_SCHOOL_SYSTEM.Pages
{
    public partial class ApproveSubjects : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPendingRegistrations();
            }
        }

        private void LoadPendingRegistrations()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT SubjectRegistrationId, StudentId, ApplicationId, SubjectName, IsApproved FROM SubjectRegistration WHERE IsApproved = 0";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvSubjectRegistrations.DataSource = dt;
                gvSubjectRegistrations.DataBind();
            }
        }

        protected void btnApproveSelected_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                foreach (GridViewRow row in gvSubjectRegistrations.Rows)
                {
                    CheckBox chk = (CheckBox)row.FindControl("chkApprove");
                    if (chk != null && chk.Checked)
                    {
                        int registrationId = Convert.ToInt32(gvSubjectRegistrations.DataKeys[row.RowIndex].Value);

                        string query = "UPDATE SubjectRegistration SET IsApproved = 1 WHERE SubjectRegistrationId = @Id";
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@Id", registrationId);
                            cmd.ExecuteNonQuery();
                        }
                    }
                }

                con.Close();
            }

            lblStatus.Text = "Selected subject registrations approved successfully!";
            LoadPendingRegistrations(); // refresh grid
        }
    }
}
