<%-- 
    Document   : shop
    Created on : Mar 4, 2024, 8:14:05 PM
    Author     : vip2021
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Product" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
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
        <link href="css/slidercss.css" rel="stylesheet">

        <title>Tempo. </title>
        <style>
            .hero {
                background-size: cover; /* Cover the entire container */
                background-position: center; /* Center the background image */
                background-repeat: no-repeat; /* Do not repeat the background image */
                /* Additional CSS properties to enhance details */
                -webkit-filter: brightness(1.1) contrast(1.1); /* Increase brightness and contrast */
                filter: brightness(1.1) contrast(1.1);
                /* You can adjust brightness and contrast values as needed */
            }
        </style>
    </head>

    <body>

        <%@include file="layout/navigation-menu.jsp" %>


        <div class="hero" style="background-image: url('img/mccc.jpg');background-repeat: no-repeat;background-size: 100%;">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-12">
                        <!--                        <div class="intro-excerpt">-->
                        <h1 style="width: 100%; text-align: center">Shop</h1>
                        <div class="main-search-input-wrap">
                            <div class="main-search-input fl-wrap">
                                <form action="search" method="POST"> 
                                    <div class="main-search-input-item">
                                        <!-- Assuming 'search' is the URL to handle search requests -->
                                        <input type="text" name="query" value="${param.query}" placeholder="Search Products...">
                                    </div>
                                    <button type="submit" class="main-search-button" >Search</button>
                                </form>

                            </div>


                        </div>
                        <!--</div>-->
                    </div>

                </div>
            </div>
        </div>	
        
       

        <!--
        <!-- end slider -->

        <div class="product-section m-3">


                <h1 class="text-center mb-3"> List of product </h1>
                <div class="row">
                    <div class="col-12   col-lg-4 col-md-12 center">
                        <div class="category-list">
                            <h3 class="text-center"><a href="Ticket">Categories</h3>

                            <ul class="list-group ">
                                <c:forEach items="${cdata}" var="c">
                                    <li class="list-group-item text-center ${tag == c.category_id ? "bg-primary text-white":""}"><a class="${tag == c.category_id ? " text-white":""} " style="text-decoration: none;text-transform: uppercase;" href="category?category_id=${c.category_id}">${c.name}</a></li>

                                </c:forEach>
                            </ul>
                        </div>

                        <div class=" mx-auto mt-3 col-lg-8 col-md-6 d-none d-lg-block">
                            <c:forEach  items="${requestScope.ldata}" var="l">

                                <h6 class="text-center"> Lastest Product</h6>
                                <a class="product-item" href="detail?pid=${l.product_id}">
                                    <img src="${l.img}" class="img-fluid product-thumbnail">
                                    <h3 class="product-title">${l.product_name}</h3>

                                </a>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-12 col-lg-8 container mt-5 pb-5">
                        <div class="row">

                            <c:forEach items="${pdata}" var="o">
                                <div class="col-6 col-md-6 col-lg-4 mb-5">
                                    <form action="detail" method="POST">
                                        <div class="product-item">
                                            <img src="${o.img}" class="img-fluid product-thumbnail">
                                            <h3 class="product-title">${o.product_name}</h3>
                                            <p>${o.discription}</p>
                                            <!-- Set product_id variable -->
                                            <c:set var="product_id" value="${o.product_id}" />
                                            <c:if test="${sessionScope.user ==null }">
                                                <a href="users?action=login" class="btn btn-primary text-white" data-toggle="modal" data-target="product-detail.jsp">
                                                    <i class="fa fa-search"></i> Quick View
                                                </a>
                                            </c:if>
                                            <c:if test="${sessionScope.user !=null }">
                                                <!-- Use product_id variable in the link -->
                                                <a href="detail?pid=${o.product_id}" class="btn btn-primary text-white" data-toggle="modal" data-target="product-detail.jsp">
                                                    <i class="fa fa-search"></i> Quick View
                                                </a>
                                            </c:if>
                                        </div>
                                    </form>
                                </div> 
                            </c:forEach>

                        </div>
                       
                    </div>


                </div>
            </div>
            <!-- End Column 1 -->

            <%@include file="layout/footer.jsp" %>



            <script src="js/bootstrap.bundle.min.js"></script>
            <script src="js/tiny-slider.js"></script>
            <script src="js/custom.js"></script>
    </body>

</html>