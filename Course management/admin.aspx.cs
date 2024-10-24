using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Course_management
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["username"] == null || Session["usertype"] == null || Session["usertype"].ToString() != "Admin")
            {
                // Redirect to login page if the session is invalid or if the user is not an admin
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
            {
                BindFacultyDropdown();
            }
        }

        private void BindFacultyDropdown()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString;
            string query = "SELECT faculty_id, Name FROM faculty"; // Adjust 'faculty_id' as per your table structure

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                var facultyList = new List<ListItem>();

                while (reader.Read())
                {
                    facultyList.Add(new ListItem
                    {
                        Text = reader["Name"].ToString(),
                        Value = reader["faculty_id"].ToString()
                    });
                }

                ddlUpdateFaculty.Items.Clear();
                ddlRemoveFaculty.Items.Clear();

                ddlUpdateFaculty.DataSource = facultyList;
                ddlUpdateFaculty.DataTextField = "Text";
                ddlUpdateFaculty.DataValueField = "Value";
                ddlUpdateFaculty.DataBind();

                ddlRemoveFaculty.DataSource = facultyList;
                ddlRemoveFaculty.DataTextField = "Text";
                ddlRemoveFaculty.DataValueField = "Value";
                ddlRemoveFaculty.DataBind();
            }

            ddlUpdateFaculty.Items.Insert(0, new ListItem("Select Faculty", "0"));
            ddlRemoveFaculty.Items.Insert(0, new ListItem("Select Faculty", "0"));
        }

        protected void btnAddFaculty_Click(object sender, EventArgs e)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString;
            string query = "INSERT INTO faculty (Name, Password, Sem, Year, Subject) VALUES (@name, @pwd, @sem, @year, @sub)";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@name", txtAddName.Text);
                cmd.Parameters.AddWithValue("@pwd", txtAddpwd.Text);
                cmd.Parameters.AddWithValue("@sem", txtAddSem.Text);
                cmd.Parameters.AddWithValue("@year", txtAddyear.Text);
                cmd.Parameters.AddWithValue("@sub", txtAddSubject.Text);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            BindFacultyDropdown();

            txtAddName.Text = "";
            txtAddpwd.Text = "";
            txtAddSem.Text = "";
            txtAddyear.Text = "";
            txtAddSubject.Text = "";
        }


        protected void btnUpdateFaculty_Click(object sender, EventArgs e)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString;
            string query = "UPDATE faculty SET Name = @name, Password = @pwd, Sem = @sem, Year = @year, Subject = @sub WHERE faculty_id = @id";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@name", txtUpdateName.Text);
                cmd.Parameters.AddWithValue("@pwd", TextBox5.Text);
                cmd.Parameters.AddWithValue("@sem", TextBox3.Text);
                cmd.Parameters.AddWithValue("@year", TextBox1.Text);
                cmd.Parameters.AddWithValue("@sub", txtUpdateSubject.Text);
                cmd.Parameters.AddWithValue("@id", ddlUpdateFaculty.SelectedValue);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            BindFacultyDropdown();

            txtUpdateName.Text = "";
            TextBox5.Text = "";
            TextBox3.Text = "";
            TextBox1.Text = "";
            txtUpdateSubject.Text = "";
        }

        protected void btnRemoveFaculty_Click(object sender, EventArgs e)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString;
            string query = "DELETE FROM faculty WHERE faculty_id = @id";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@id", ddlRemoveFaculty.SelectedValue);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            BindFacultyDropdown();
        }

        //public void updatelogout()
        //{
        //    string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString;
        //    string query = "UPDATE Audit_Trail SET logouttime = @logouttime WHERE Aid = @Aid";

        //    using (SqlConnection con = new SqlConnection(connectionString))
        //    using (SqlCommand cmd = new SqlCommand(query, con))
        //    {
        //        // Retrieve the stored Aid from the session
        //        int auditId = Convert.ToInt32(Session["AuditId"]);

        //        // Update the logout time for this specific audit entry
        //        cmd.Parameters.AddWithValue("@logouttime", DateTime.Now);  // Update with current time as logout time
        //        cmd.Parameters.AddWithValue("@Aid", auditId);

        //        try
        //        {
        //            con.Open();
        //            int rowsAffected = cmd.ExecuteNonQuery();

        //            if (rowsAffected > 0)
        //            {
        //                //("Logout time updated successfully.");
        //            }
        //            else
        //            {
        //                //ShowAlert("No rows were updated.");
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            //ShowAlert("An error occurred while updating the database: " + ex.Message);
        //        }
        //    }
        //}

        protected void backbtn_Click(object sender, EventArgs e)
        {
            // Retrieve the AuditId from the session if available
            if (Session["AuditId"] != null)
            {
                int auditId = (int)Session["AuditId"];
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString;
                string query = "UPDATE Audit_Trail SET logouttime = @logouttime WHERE Aid = @auditId";

                using (SqlConnection con = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@logouttime", DateTime.Now); // Record current time as logout time
                    cmd.Parameters.AddWithValue("@auditId", auditId); // Use AuditId stored in session
                    con.Open();
                    cmd.ExecuteNonQuery(); // Execute the update query
                }
            }

            // Clear session and abandon
            Session.Clear();
            Session.Abandon();

            // Redirect to login page
            Response.Redirect("login.aspx");
        }


        protected void btnAuditDetail_Click(object sender, EventArgs e)
        {
            Response.Redirect("audit.aspx");
        }


    }
}
