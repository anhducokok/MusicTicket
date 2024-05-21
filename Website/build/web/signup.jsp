<%-- 
    Document   : signup
    Created on : Mar 19, 2024, 9:49:49 PM
    Author     : vip2021
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/tiny-slider.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
                <style>
                    body {
                        background-image: url('img/8-scaled.jpg');
                        background-size: cover;
                        background-position: center;
                        background-repeat: no-repeat;
                    }
                    /* Hide sign-up form initially */
                    
                    </style>
    </head>
    <body>
        <div class="container card mt-5 mb-5"><div class="row">
                <h1 class="text-center mb-4 mt-4 text-primary"> Tempo </h1>
                <p class="lead text-center mb-4">Tempo giúp bạn kết nối với thế giới của những mọt mê nhạc</p>

                <form class="col signup-form" action="users" style="margin: 25px;">
                    <!-- Sign-up form fields -->
                    <input name="action" value="signup" hidden>
                    <h2 class="text-center">Sign Up</h2>
                    <!-- Include your sign-up form fields here -->
                    <div class="form-outline mb-4">
                        <input type="text" name="user_name" id="form3Example1" class="form-control" placeholder="Your Name" />
                        <label class="form-label" for="form3Example1"></label>
                    </div>

                    <div class="form-outline mb-4">
                        <input type="email" name="user_email" id="form3Example2" class="form-control" placeholder="Email address" />
                        <label class="form-label" for="form3Example2"></label>
                    </div>

                    <div class="form-outline mb-4">
                        <input type="password" name="user_pass" id="form3Example3" class="form-control" placeholder="Password" />
                        <label class="form-label" for="form3Example3"></label>
                    </div>
                    <div class="form-outline mb-4">
                        <input type="password" name="re_pass" id="form3Example3" class="form-control" placeholder="Password again" />
                        <label class="form-label" for="form3Example3"></label>
                    </div>
                    <p  style="color: red;" class="text-center">${error_pass}</p>
                    <div class="col-12 text-center">
                        <button type="submit" class="btn btn-primary btn-block mb-4">Sign Up</button>
                    </div>
                    <p> <a href="users?action=login" style="color: blue;">Back to <span style="color: red;">Log In</span></a>
                </form>
            </div></div>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
