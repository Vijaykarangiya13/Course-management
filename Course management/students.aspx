<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="students.aspx.cs" Inherits="Course_management.students" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>File Manager</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #333;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            margin: 0;
            background-image: url('img/high-angle-notebook-laptop-arrangement.jpg');
            background-size: cover;
            background-position: center;
        }

        h1 {
            color: #fff;
            margin-bottom: 20px;
        }

        .file-manager {
            width: 80%;
            max-width: 1000px;
            background-color: rgba(255, 255, 255, 0.2);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        .folder {
            display: flex;
            align-items: center;
            padding: 10px;
            background-color: rgba(255, 255, 255, 0.2);
            margin-bottom: 5px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.2s;
            text-decoration: none;
            color: #fff;
        }

        .folder:hover {
            background-color: rgba(80, 200, 120, 0.7);
        }

        .folder img {
            width: 40px;
            margin-right: 10px;
        }

        .folder span {
            flex-grow: 1;
        }

        /* Back button styling */
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
        <form runat="server">
        <!-- Back button -->
    
        <asp:Button class="back-button" ID="Button1" runat="server" Text="LogOut" OnClick="backbtn_Click"/>
        <h1>Welcome Students</h1>
    
    <div class="file-manager">
        <!-- Folder 1 -->
        <a href="sem1.aspx" class="folder">
            <img src="img/images.jfif" alt="Folder Icon">
            <span>SEM 1</span>
        </a>

        <!-- Folder 2 -->
        <a href="sem2.aspx" class="folder">
            <img src="img/images.jfif" alt="Folder Icon">
            <span>SEM 2</span>
        </a>

        <!-- Folder 3 -->
        <a href="sem3.aspx" class="folder">
            <img src="img/images.jfif" alt="Folder Icon">
            <span>SEM 3</span>
        </a>

        <!-- Folder 4 -->
        <a href="sem4.aspx" class="folder">
            <img src="img/images.jfif" alt="Folder Icon">
            <span>SEM 4</span>
        </a>

        <!-- Folder 5 -->
        <a href="sem5.aspx" class="folder">
            <img src="img/images.jfif" alt="Folder Icon">
            <span>SEM 5</span>
        </a>

        <!-- Folder 6 -->
        <a href="sem6.aspx" class="folder">
            <img src="img/images.jfif" alt="Folder Icon">
            <span>SEM 6</span>
        </a>

        <!-- Folder 7 -->
        <a href="sem7.aspx" class="folder">
            <img src="img/images.jfif" alt="Folder Icon">
            <span>SEM 7</span>
        </a>
    </div>

        </form>
</body>
</html>

