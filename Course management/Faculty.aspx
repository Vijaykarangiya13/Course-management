<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faculty.aspx.cs" Inherits="Course_management.Faculty" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload File</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('img/high-angle-notebook-laptop-arrangement.jpg'); /* Same background image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #fff;
        }

        .container {
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            background-color: rgba(0, 0, 0, 0.7);
        }

        .container h2 {
            margin-top: 0;
            text-align: center;
            color: #fff;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #ddd;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #555;
            border-radius: 5px;
            background-color: #333;
            color: #fff;
        }

        .form-group button {
            width: 100%;
            padding: 10px;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .form-group .btn-primary {
            background-color: #007bff;
        }

        .form-group .btn-primary:hover {
            background-color: #0056b3;
        }

        #ddlFileType {
            margin-top: 8px;
        }

        .back-button {
    position: absolute;
    width: 100px;
    height: 50px;
    top: 20px;
    left: 20px;
    padding: 10px 15px;
    background-color: rgba(80, 200, 120, 0.7);
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.2s;
}

.back-button:hover {
    background-color: rgb(128, 128, 128);
}
    </style>
</head>
<body>
    <button class="back-button" onclick="goBack()">LogOut</button>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Upload File</h2>

            <div class="form-group">
                <asp:Label ID="lblFileType" runat="server" Text="Select File Type:" AssociatedControlID="ddlFileType" />
                <asp:DropDownList ID="ddlFileType" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Video">Video</asp:ListItem>
                    <asp:ListItem Value="PDF">PDF</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <asp:Label ID="lblFileUpload" runat="server" Text="Upload File:" AssociatedControlID="fileUpload" />
                <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" />
            </div>
        </div>
    </form>
    <script>
    function goBack() {
        window.history.back();  // This will navigate back to the previous page
    }
    </script>
</body>
</html>

