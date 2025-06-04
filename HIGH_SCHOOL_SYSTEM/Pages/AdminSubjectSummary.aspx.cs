using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace HIGH_SCHOOL_SYSTEM.Pages
{
    public partial class AdminSubjectSummary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSubjectSummary();
            }
        }

        private void LoadSubjectSummary()
        {
            string query = @"
                SELECT 
                    SubjectName,
                    COUNT(*) AS StudentCount
                FROM SubjectRegistration
                GROUP BY SubjectName
                ORDER BY SubjectName";

            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
            {
                adapter.Fill(dt);
            }

            gvSubjectSummary.DataSource = dt;
            gvSubjectSummary.DataBind();
        }
    }
}
