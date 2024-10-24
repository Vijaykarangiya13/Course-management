using System;
using System.Web;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Course_management
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (IsUserValid())
            {
                string selectedType = DropDownList1.SelectedValue.Trim();

                // Store the username and user type in session
                Session["username"] = txtUsername.Text.Trim();
                Session["usertype"] = selectedType;
                insertlogins();

                // Redirect based on user type
                RedirectUser(selectedType);
            }
            else
            {
                ShowAlert("Invalid username or password!");
            }

            // Clear the fields after login attempt
            txtUsername.Text = "";
            txtPassword.Text = "";
            DropDownList1.ClearSelection();
        }

        private void RedirectUser(string userType)
        {
            switch (userType)
            {
                case "Admin":
                    Response.Redirect("admin.aspx");
                    break;
                case "Faculty":
                    Response.Redirect("faculty.aspx");
                    break;
                case "Student":
                    Response.Redirect("students.aspx");
                    break;
            }
        }

        private bool IsUserValid()
        {
            bool isValid = false;
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString;
            string query = "SELECT User_id, Type FROM users WHERE User_name = @u_name AND Password = @pwd";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@u_name", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@pwd", txtPassword.Text.Trim()); // Consider hashing this

                try
                {
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            reader.Read();
                            string userType = reader["Type"].ToString();
                            int userId = (int)reader["User_id"]; // Fetch the User_id
                            Session["User_id"] = userId;  // Store the User_id in session

                            // Check if the selected type matches the user's type in the database
                            isValid = userType == DropDownList1.SelectedValue.Trim();
                        }
                    }
                }
                catch
                {
                    ShowAlert("An error occurred while connecting to the database.");
                }
            }

            return isValid;
        }

        public void insertlogins()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString;
            string query = "INSERT INTO Audit_Trail (username, usertype, logintime) OUTPUT INSERTED.Aid VALUES (@un, @utype, @logintime)";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@un", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@utype", DropDownList1.SelectedValue.Trim());  // Use SelectedValue to get the actual value, not text
                cmd.Parameters.AddWithValue("@logintime", DateTime.Now);  // Insert current time as logintime

                try
                {
                    con.Open();

                    // ExecuteScalar should return the identity (Aid) if the query runs successfully
                    object result = cmd.ExecuteScalar();

                    if (result != null)  // Check if a value is returned
                    {
                        int auditId = Convert.ToInt32(result);

                        // Store the Aid in Session or persistent storage
                        Session["AuditId"] = auditId;
                        ShowAlert("Login recorded successfully.");
                    }
                    else
                    {
                        ShowAlert("Failed to retrieve the Audit ID.");
                    }
                }
                catch (Exception ex)
                {
                    ShowAlert("An error occurred while connecting to the database: " + ex.Message);
                }
            }
        }


        private void ShowAlert(string message)
        {
            Response.Write($"<script>alert('{message}');</script>");
        }
    }
}
