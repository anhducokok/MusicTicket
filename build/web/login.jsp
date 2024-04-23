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
            .signup-form {
                display: none;
            }
        </style>
    </head>
    <body>

        <div class="container card mt-5 mb-5">
            <div class="row">
                <h1 class="text-center mb-4 mt-4 text-primary"> Tempo </h1>
                <p class="lead text-center mb-4">Tempo giúp bạn kết nối với thế giới của những mọt mê nhạc</p>
                <p>${done}</p>
                <p>${emailavailable}</p>
                <form class="col login-form" action="users" style="margin: 25px;">
                    <!-- Login form fields -->
                    <input name="action" value="checkLogin" hidden>
                    <div class="form-outline mb-4">
                        <input type="email" name="user_email" id="form2Example1" class="form-control" placeholder="Email address" />
                        <label class="form-label" for="form2Example1" placeholder="Email address"></label>
                    </div>

                    <div class="form-outline mb-4">
                        <input type="password" name="user_pass" id="form2Example2" class="form-control" placeholder="Password" />
                        <label class="form-label" for="form2Example2"></label>
                    </div>

                    <div class="row mb-4">
                        <div class="col-6 col-lg-6 d-flex justify-content-center">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
                                <label class="form-check-label" name="remember" for="form2Example31"> Remember me </label>
                            </div>
                        </div>
                        ${error}
                       
                    </div>

                    <div class="col-12 text-center">
                        <button type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>
                    </div>
                    <div class="text-center">
                        <p>Not a member? <a href="users?action=register" id="showSignUpFormButton" style="color: blue;">Register</a>
                    </p>
                        <p>or sign up with:</p>
                        <button type="button" class="btn btn-link btn-floating mx-1">
                            <i class="fab fa-facebook-f"></i>
                        </button>

                        <button type="button" class="btn btn-link btn-floating mx-1">
                            <i class="fab fa-google"></i>
                        </button>

                        <button type="button" class="btn btn-link btn-floating mx-1">
                            <i class="fab fa-twitter"></i>
                        </button>

                        <button type="button" class="btn btn-link btn-floating mx-1">
                            <i class="fab fa-github"></i>
                        </button>
                    </div>
                </form>
            </div>
        </form>
       
    </div>
</div>

<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/tiny-slider.js"></script>
<script src="js/custom.js"></script>
<!--<script>
    document.getElementById('showSignUpFormButton').addEventListener('click', function () {
        // Toggle visibility of login and signup forms
        var loginForm = document.querySelector('.login-form');
        var signUpForm = document.querySelector('.signup-form');

        if (loginForm.style.display === 'none') {
            loginForm.style.display = 'block';
            signUpForm.style.display = 'none';
        } else {
            loginForm.style.display = 'none';
            signUpForm.style.display = 'block';
        }
    });
</script>-->
</body>
</html>
