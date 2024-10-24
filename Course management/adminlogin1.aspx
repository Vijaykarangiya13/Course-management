<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Another Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            background-image: url('img/5.jpg'); /* Update the path to your image */
            background-size: cover; /* Cover the entire viewport */
            background-position: center; /* Center the background image */
            background-attachment: fixed; /* Keep the background image fixed while scrolling */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.9); /* White background with less transparency */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border: 2px solid #007bff;
            width: 100%;
            max-width: 400px;
        }

        .container h2 {
            margin-top: 0;
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-group.row {
            display: flex;
            justify-content: space-between;
        }

        .form-group .btn-primary {
            background-color: #007bff;
        }

        .form-group .btn-primary:hover {
            background-color: #0056b3;
        }

        .form-group .btn-success {
            background-color: #28a745;
        }

        .form-group .btn-success:hover {
            background-color: #218838;
        }
        
        /* Back button styling */
        .back-button {
            position: absolute;
            width:100px;
            height:50px;
            top: 20px;
            left: 20px;
            padding: 10px 15px;
background-color: #0056b3; /* Adjusted opacity */


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
     <button class="back-button" onclick="goBack()">Back</button>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Login</h2>
                        <div class="form-group">
                <asp:Label ID="lblUsername" runat="server" Text="Username:" AssociatedControlID="txtUsername" />
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" Text="Password:" AssociatedControlID="txtPassword" />
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
            </div>
            <div class="form-group row">
                <asp:Button ID="btnLogin" runat="server" Text="Submit" CssClass="btn btn-primary" />
            </div>
        </div>
    </form>
    <script>
        function toggleFolder(id) {
            var folder = document.getElementById(id);
            folder.classList.toggle('open');
        }

        function goBack() {
            window.history.back();  // This will navigate back to the previous page
        }
    </script>
</body>

</html>
