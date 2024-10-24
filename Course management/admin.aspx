<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Course_management.admin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Management - Admin Panel</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('img/high-angle-notebook-laptop-arrangement.jpg'); /* Update the path to your image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #333;
        }

        .admin-panel {
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.95);
            max-width: 800px;
            width: 100%;
            position: relative; /* Added for positioning the buttons */
        }

        .admin-panel h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
            font-size: 28px;
        }

        .admin-panel h3 {
            color: #007bff;
            margin-bottom: 15px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #333;
        }

        .form-group input, 
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .form-group input[type="date"] {
            color: #495057;
        }

        .form-group button {
            width: 100%;
            padding: 12px;
            border-radius: 5px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 10px;
            font-weight: 600;
        }

        .form-group .btn-add {
            background-color: #28a745;
            color: #fff;
        }

        .form-group .btn-add:hover {
            background-color: #218838;
        }

        .form-group .btn-update {
            background-color: #ffc107;
            color: #212529;
        }

        .form-group .btn-update:hover {
            background-color: #e0a800;
        }

        .form-group .btn-remove {
            background-color: #dc3545;
            color: #fff;
        }

        .form-group .btn-remove:hover {
            background-color: #c82333;
        }

        .back-button, .audit-button {
            position: absolute;
            width: 120px;
            height: 45px;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .back-button {
            top: 20px;
            left: 20px;
        }

        .audit-button {
            top: 20px;
            right: 20px; /* Position to the right */
        }

        .back-button:hover, .audit-button:hover {
            background-color: #0056b3;
        }

        /* Hover Effect */
        .form-group input:focus, .form-group select:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.25);
        }

        .admin-panel .section {
            margin-top: 20px;
        }

        .admin-panel .section h3 {
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
        }

        @media (max-width: 768px) {
            .admin-panel {
                padding: 20px;
            }

            .admin-panel h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button class="back-button" ID="Button1" runat="server" Text="LogOut" OnClick="backbtn_Click"/>
        <asp:Button class="audit-button" ID="btnAuditDetail" runat="server" Text="Audit Detail" OnClick="btnAuditDetail_Click"/>

        <div class="admin-panel">
            <h2>Faculty Management - Admin Panel</h2>

            <!-- Add Faculty Section -->
            <div class="section">
                <h3>Add Faculty</h3>
                <div class="form-group">
                    <asp:Label ID="lblAddName" runat="server" Text="Name:" />
                    <asp:TextBox ID="txtAddName" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblAddpwd" runat="server" Text="Password:" />
                    <asp:TextBox ID="txtAddpwd" runat="server" CssClass="form-control" TextMode="Password"/>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblAddSem" runat="server" Text="SEM:" />
                    <asp:TextBox ID="txtAddSem" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblyear1" runat="server" Text="Year:" />
                    <asp:TextBox ID="txtAddyear" runat="server" CssClass="form-control" TextMode="Date" />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblAddSubject" runat="server" Text="Subject:" />
                    <asp:TextBox ID="txtAddSubject" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnAddFaculty" class="btn" runat="server" Text="Add Faculty" CssClass="btn-add" OnClick="btnAddFaculty_Click" />
                </div>
            </div>

            <!-- Update Faculty Section -->
            <div class="section">
                <h3>Update Faculty</h3>
                <div class="form-group">
                    <asp:Label ID="lblUpdateSelect" runat="server" Text="Select Faculty:" />
                    <asp:DropDownList ID="ddlUpdateFaculty" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblUpdateName" runat="server" Text="New Name:" />
                    <asp:TextBox ID="txtUpdateName" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblAddpwd2" runat="server" Text="Password:" />
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" TextMode="Password"/>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="SEM:" />
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblyear" runat="server" Text="Year:" />
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Date" />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblUpdateSubject" runat="server" Text="Subject:" />
                    <asp:TextBox ID="txtUpdateSubject" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnUpdateFaculty" class="btn" runat="server" Text="Update Faculty" CssClass="btn-update" OnClick="btnUpdateFaculty_Click" />
                </div>
            </div>

            <!-- Remove Faculty Section -->
            <div class="section">
                <h3>Remove Faculty</h3>
                <div class="form-group">
                    <asp:Label ID="lblRemoveSelect" runat="server" Text="Select Faculty to Remove:" />
                    <asp:DropDownList ID="ddlRemoveFaculty" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnRemoveFaculty" class="btn" runat="server" Text="Remove Faculty" CssClass="btn-remove" OnClick="btnRemoveFaculty_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
