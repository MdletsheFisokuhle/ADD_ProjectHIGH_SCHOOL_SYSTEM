using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace HIGH_SCHOOL_SYSTEM.Pages.Admin
{
    public partial class StudentsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!User.IsInRole("Admin"))
                {
                    Response.Redirect("~/Account/Login.aspx");
                }

                BindStudents();
            }
        }

        private void BindStudents()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = @"SELECT StudentID, ApplicationID, FirstName, LastName, 
                           EnrollmentDate, CurrentGrade, IsActive
                           FROM Students
                           WHERE 1=1";

            // Add search filter if provided
            if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
            {
                query += " AND (FirstName LIKE @Search OR LastName LIKE @Search OR IDNumber LIKE @Search)";
            }

            // Add grade filter if selected
            if (!string.IsNullOrEmpty(ddlGradeFilter.SelectedValue))
            {
                query += " AND CurrentGrade = @Grade";
            }

            query += " ORDER BY LastName, FirstName";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                    {
                        cmd.Parameters.AddWithValue("@Search", "%" + txtSearch.Text.Trim() + "%");
                    }

                    if (!string.IsNullOrEmpty(ddlGradeFilter.SelectedValue))
                    {
                        cmd.Parameters.AddWithValue("@Grade", ddlGradeFilter.SelectedValue);
                    }

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvStudents.DataSource = dt;
                    gvStudents.DataBind();
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindStudents();
        }

        protected void ddlGradeFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindStudents();
        }

        protected void gvStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvStudents.PageIndex = e.NewPageIndex;
            BindStudents();
        }

        protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                int studentId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"StudentDetails.aspx?id={studentId}");
            }
            else if (e.CommandName == "ToggleStatus")
            {
                int studentId = Convert.ToInt32(e.CommandArgument);
                ToggleStudentStatus(studentId);
                BindStudents();
            }
        }

        private void ToggleStudentStatus(int studentId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = @"UPDATE Students 
                            SET IsActive = CASE WHEN IsActive = 1 THEN 0 ELSE 1 END
                            WHERE StudentID = @StudentID";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StudentID", studentId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            // Export to Excel
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=EnrolledStudents.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";

            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                // Create a table to contain the grid
                Table table = new Table();
                table.GridLines = GridLines.Both;

                // Add the header row
                TableRow headerRow = new TableRow();
                foreach (DataControlField column in gvStudents.Columns)
                {
                    if (column.HeaderText != "Actions")
                    {
                        TableCell cell = new TableCell();
                        cell.Text = column.HeaderText;
                        cell.Font.Bold = true;
                        headerRow.Cells.Add(cell);
                    }
                }
                table.Rows.Add(headerRow);

                // Add the data rows
                foreach (GridViewRow row in gvStudents.Rows)
                {
                    TableRow dataRow = new TableRow();
                    for (int i = 0; i < row.Cells.Count; i++)
                    {
                        if (gvStudents.Columns[i].HeaderText != "Actions")
                        {
                            TableCell cell = new TableCell();
                            cell.Text = row.Cells[i].Text;
                            dataRow.Cells.Add(cell);
                        }
                    }
                    table.Rows.Add(dataRow);
                }

                // Render the table
                table.RenderControl(hw);

                // Output the content
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }

        protected void gvStudents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Highlight inactive students
                bool isActive = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "IsActive"));
                if (!isActive)
                {
                    e.Row.BackColor = System.Drawing.Color.LightGray;
                }
            }
        }
    }
}