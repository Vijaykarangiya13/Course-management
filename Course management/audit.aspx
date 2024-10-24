<!DOCTYPE html>
<script runat="server">
    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs)
    End Sub

    Protected Sub BtnBack_Click(sender As Object, e As EventArgs)
        ' Redirect to the previous page or a specific page
        Response.Redirect("admin.aspx") ' Replace with your target page
    End Sub
</script>

<html>
<head>
    <meta charset="utf-8" />
    <title>Audit Trail</title>
    <style>
        body {
            font-family: Arial, sans-serif; /* Set a font family */
            background-color: #f4f4f4; /* Light background color for contrast */
            margin: 0;
            padding: 20px;
            text-align: center; /* Center align text for body */
        }

        .container {
            max-width: 800px; /* Set a max width for the container */
            margin: 50px auto; /* Center the container */
            background-color: white; /* White background for the table */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            overflow: hidden; /* Prevent overflow from rounded corners */
            padding: 20px; /* Padding inside the container */
        }

        h1 {
            color: #333; /* Dark color for the header */
            margin-bottom: 20px; /* Spacing below the header */
            font-size: 28px; /* Increase header font size */
        }

        /* GridView styling */
        .gridview {
            width: 100%; /* Make the GridView take full width of the container */
            border-collapse: collapse; /* Collapse borders for a cleaner look */
        }

        .gridview th, .gridview td {
            padding: 12px; /* Padding for table cells */
            border: 1px solid #ddd; /* Border for table cells */
            text-align: left; /* Left-align the text */
        }

        .gridview-header {
            background-color: #507CD1; /* Header background color */
            color: white; /* Header text color */
            font-weight: bold; /* Bold header text */
            font-size: 16px; /* Header font size */
        }

        .gridview-row {
            background-color: #EFF3FB; /* Row background color */
            font-size: 14px; /* Increase row font size */
            transition: background-color 0.3s; /* Smooth transition for hover effect */
        }

        .gridview-row:hover {
            background-color: #D1DDF1; /* Change color on hover */
        }

        .gridview-alternating-row {
            background-color: white; /* Alternating row color */
        }

        .gridview-footer {
            background-color: #507CD1; /* Footer background color */
            color: white; /* Footer text color */
            font-weight: bold; /* Bold footer text */
        }

        .gridview-pager {
            background-color: #2461BF; /* Pager background color */
            color: white; /* Pager text color */
        }

        .back-button {
            margin-top: 20px; /* Spacing above the button */
            padding: 10px 20px; /* Padding inside the button */
            background-color: #2461BF; /* Button background color */
            color: white; /* Button text color */
            border: none; /* Remove border */
            border-radius: 5px; /* Rounded corners for the button */
            cursor: pointer; /* Change cursor to pointer */
            font-size: 16px; /* Increase font size */
        }

        .back-button:hover {
            background-color: #1b4a8e; /* Darker shade on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Audit Trail</h1>
        <form runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="gridview" HeaderStyle-CssClass="gridview-header" RowStyle-CssClass="gridview-row" AlternatingRowStyle-CssClass="gridview-alternating-row" FooterStyle-CssClass="gridview-footer" PagerStyle-CssClass="gridview-pager">
                <Columns>
                    <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username"></asp:BoundField>
                    <asp:BoundField DataField="usertype" HeaderText="User Type" SortExpression="usertype"></asp:BoundField>
                    <asp:BoundField DataField="logintime" HeaderText="Login Time" SortExpression="logintime" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" HtmlEncode="false"></asp:BoundField>
                    <asp:BoundField DataField="logouttime" HeaderText="Logout Time" SortExpression="logouttime" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" HtmlEncode="false"></asp:BoundField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' ProviderName='<%$ ConnectionStrings:ConnectionString.ProviderName %>' SelectCommand="SELECT [username], [usertype], [logintime], [logouttime] FROM [Audit_Trail]"></asp:SqlDataSource>
            
            <asp:Button ID="BtnBack" runat="server" Text="Back" CssClass="back-button" OnClick="BtnBack_Click" />
        </form>
    </div>
</body>
</html>
