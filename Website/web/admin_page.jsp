<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Untree.co">
    <link rel="shortcut icon" href="favicon.png">

    <meta name="description" content="" />
    <meta name="keywords" content="bootstrap, bootstrap4" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="css/tiny-slider.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <title>Tempo.</title>
    <style>
        /* Custom CSS for the boxes */
        .box {
            border: 1px solid #ddd; /* Add border */
            border-radius: 10px; /* Add rounded corners */
            background-color: #f8f9fa; /* Background color */
            padding: 20px; /* Padding inside the box */
            margin: 10px; /* Margin around the box */
        }

        /* Style the <a> tags */
        .box a {
            text-decoration: none;
            color: #333; /* Link color */
            font-size: 18px;
        }

        /* Add hover effect to links */
        .box a:hover {
            color: #007bff; /* Change link color on hover */
        }

        /* Adjust header style */
        h3 {
            color: #007bff; /* Header color */
            font-weight: bold; /* Bold font weight */
            text-align: center; /* Center align */
            margin-top: 50px; /* Add margin top */
        }

        /* Adjust subheader style */
        h6 {
            color: #6c757d; /* Subheader color */
            font-weight: bold; /* Bold font weight */
            margin-top: 30px; /* Add margin top */
        }

        /* Adjust container width */
        .container {
            max-width: 800px; /* Limit container width */
        }
    </style>
</head>
<body>
<%@include file="layout/navigation-menu.jsp" %>


<div class="container mt-5 mb-5">
    <h1 style="text-align: center;">Admin Page</h1>
    <div class="row mt-5">
        <div class="col-md-6">
            <h3 style="text-align: center;">Manage Product</h3>
            <div class="box">
                <h2 style="text-align: center;"><a href="manage">List Product</a></h2>
            </div>
            <div class="box">
                <h2 style="text-align: center;"><a href="addProduct">Add new Product</a></h2>
            </div>
        </div>
        <div class="col-md-6">
            <h3 style="text-align: center;">Manage Users</h3>
            <div class="box">
                <h2 style="text-align: center;"><a href="ManageAccount">List Users</a></h2>
            </div>
            <div class="box">
                <h2 style="text-align: center;"><a href="#">Add new Users</a></h2>
            </div>
        </div>
    </div>
</div>
<%@include file="layout/footer.jsp" %>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/tiny-slider.js"></script>
<script src="js/custom.js"></script>
</body>
</html>
