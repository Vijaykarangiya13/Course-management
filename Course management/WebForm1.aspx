<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Course_management.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Faculty</title>
    <style>
        /* Similar styles from your main admin panel page */
        body, .admin-panel, .form-group {
            /* Add styling like in the previous admin panel */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="admin-panel">
            <h2>Update Faculty</h2>
            <div class="form-group">
                <asp:Label ID="lblUpdateSelect" runat="server" Text="Select Faculty:" />
                <asp:DropDownList ID="ddlUpdateFaculty" runat="server" CssClass="form-control">
                    <!-- Faculty names loaded dynamically -->
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label ID="lblUpdateName" runat="server" Text="New Name:" />
                <asp:TextBox ID="txtUpdateName" runat="server" CssClass="form-control" />
            </div>
            <!-- Additional fields like password, year, subject, etc. -->
            <div class="form-group">
                <asp:Button ID="btnUpdateFaculty" runat="server" Text="Update" CssClass="btn-update" OnClick="btnUpdateFaculty_Click" />
            </div>
        </div>
    </form>
</body>
</html>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

</asp:Content>
