<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sem1.aspx.cs" Inherits="Course_management.WebForm2" %>

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
            width:100px;
            height:50px;
            top: 20px;
            left: 20px;
            padding: 10px 15px;
background-color: rgba(80, 200, 120, 0.7); /* Adjusted opacity */


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

    <!-- Back button -->
    <button class="back-button" onclick="goBack()">Back</button>

    <h1>Welcome Students</h1>
    
    <div class="file-manager">
        <!-- Folder 1 -->
        <div class="folder" onclick="toggleFolder('folder1')">
            <img src="img/images.jfif" alt="Folder Icon">
            <span>MPR</span>
        </div>

        <!-- Folder 2 -->
        <div class="folder" onclick="toggleFolder('folder2')">
            <img src="img/images.jfif" alt="Folder Icon">
            <span>YRG</span>
        </div>

        <!-- Folder 3 -->
        <div class="folder" onclick="toggleFolder('folder3')">
            <img src="img/images.jfif" alt="Folder Icon">
            <span>XUS</span>
        </div>

        <!-- Folder 4 -->
        <div class="folder" onclick="toggleFolder('folder4')">
            <img src="img/images.jfif" alt="Folder Icon">
            <span>GBC</span>
        </div>

        <!-- Folder 5 -->
        <div class="folder" onclick="toggleFolder('folder5')">
            <img src="img/images.jfif" alt="Folder Icon">
            <span>RSP</span>
        </div>

        <!-- Folder 6 -->
        <div class="folder" onclick="toggleFolder('folder6')">
            <img src="img/images.jfif" alt="Folder Icon">
            <span>DKP</span>
        </div>

        <!-- Folder 7 -->
        <div class="folder" onclick="toggleFolder('folder7')">
            <img src="img/images.jfif" alt="Folder Icon">
            <span>KUC</span>
        </div>
    </div>

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
