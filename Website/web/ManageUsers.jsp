<%-- 
    Document   : ManageUsers
    Created on : Apr 17, 2024, 11:32:25 AM
    Author     : vip2021
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <title>Tempo.</title><style>

        </style>
    </head>
    <body>
        <%@include file="layout/navigation-menu.jsp" %>

        <div class="container mt-5">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Account</b></h2>
                        </div>

                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="selectAll">
                                    <label class="form-check-label" for="selectAll"></label>
                                </div>
                            </th>
                            <th>ID</th>
                            <th>Avatar</th>
                            <th>Name</th>
             
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${requestScope.listA}" var="o">
                            <tr>
                                <td>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="checkbox" name="options[]">
                                        <label class="form-check-label" for="checkbox"></label>
                                    </div>
                                </td>
                                <td>${o.user_id}</td>

                                <td><img src="${o.avatar}" alt="avatar" class="img-thumbnail " style="max-width: 50px;" /></td>
                                <td>${o.user_name}</td>
                                
                                <td>
                                    <a href="loadAccount?uid=${o.user_id}" class="btn btn-sm btn-primary" data-toggle="modal">edit</a>
                                    <a href="deleteAccount?uid=${o.user_id}" class="btn btn-sm btn-danger" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">delete</i></a>

                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
            <a href="admin_page.jsp"><button type="button" class="btn btn-primary">Back to home</button></a>

        </div>
        <!-- Edit Modal HTML -->


       
    </body>
</html>
