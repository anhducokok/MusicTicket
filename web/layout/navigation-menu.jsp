<%-- 
    Document   : navigation-menu
    Created on : Mar 4, 2024, 10:05:35 PM
    Author     : vip2021
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        
        <title>Tempo. </title>
        
    </head>
    <body>
        <!-- Start Header/Navigation -->
        <nav class="sticky-top custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" style="top:0;" arial-label="Furni navigation bar">

            <div class="container">
                <a class="navbar-brand" href="Home">Tempo<span>.</span></a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsFurni">
                    <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0" style="font-size: 25px;display: flex; justify-content: space-between;">
                        <li class="nav-item">
                            <a class="nav-link" href="Home"><i class="fa-solid fa-house"></i></a>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="Ticket"><i class="fa-solid fa-shop"></i></a></li>
                        <li class="nav-item"><a class="nav-link" href="#"><i class="fa-regular fa-address-card"></i></a></li>
                        <c:if test="${sessionScope.user !=null}">
                            <c:if test="${sessionScope.user.getIsAdmin() == 1}">
                            <li class="nav-item"><a class="nav-link" href="ManageAccount"><i class="fa-solid fa-users"></i></a></li>
                            </c:if>
                                <c:if test="${sessionScope.user.getIsSeller() == 1}">
                                <li class="nav-item"><a class="nav-link" href="manage"><i class="fa-solid fa-list-ul"></i></a></li>
                            </c:if>
                            </c:if>
                    </ul>

                    <ul class="navbar-nav ms-auto mb-2 mb-md-0">
                        <li class="nav-item dropdown">
                            <c:if test="${sessionScope.user ==null }">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="img/user.svg" alt="User Image">
                            </a>
                            </c:if>
                            <c:if test="${sessionScope.user !=null }">
                            <a class="nav-link dropdown-toggle img-thumbnail" style=" display: flex;align-items: center;" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                  <c:if test="${sessionScope.user.avatar!=null}">
                                <img src="${sessionScope.user.avatar}" alt="User Image" style="width: 40px;height: 40px;border-radius: 50%;margin-right: 10px;">
                                    </c:if>
                                    <c:if test="${sessionScope.user.avatar==null}">
                                <img src="img/avatar.png" alt="User Image" style="width: 40px;height: 40px;border-radius: 50%;margin-right: 10px;">

                                    </c:if>
                            </a>
                            </c:if>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <c:if test="${sessionScope.user ==null }">
                                    <li><a class="dropdown-item" href="users?action=login"><i class="fas fa-sign-in"></i> Login</a></li>
                                    <li><a class="dropdown-item" href="users?action=register"><i class="fa fa-user-plus"></i> Register</a></li>
                                    
                                </c:if>
                                <c:if test="${sessionScope.user!=null}">
                                    <li><a class="dropdown-item" href="users?action=profile"><i class="fa-regular fa-user"></i> Profile</a></li>
                                    <li><a class="dropdown-item" href="users?action=purchase"><i class="fa-solid fa-ticket"></i> My Ticket</a></li>
                                    
                                    <li><a class="dropdown-item" href="users?action=logout"><i class="fas fa-sign-out"></i> Sign out</a></li>
                                </c:if>
                            </ul>
                        </li>
                        <li class="nav-item">
                            
                            <a class="nav-link" href="cart" style="font-size: 75px;">
                                <img src="img/cart.svg" alt="Cart Image">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
         

        <!-- End Header/Navigation -->
        <!--<script src="js/bootstrap.bundle.min.js"></script>-->
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
        <script>
    </script>
    </body>
</html>
