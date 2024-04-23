<%-- 
    Document   : loadAccount
    Created on : Apr 23, 2024, 12:51:18 AM
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
        <title>Tempo.</title>

    </head>
    <body>
         <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="loadAccount" method="post">
                            
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${em.user_id}" name="uid" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${em.user_name}" name="user" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input value="${em.user_email}" name="email" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>PassWord</label>
                                    <input value="${em.user_pass}" name="pass" type="text" class="form-control" readonly required>
                                </div>
                                
                                <div class="form-group">
                                    <label>IsSeller</label>
                                    
                                    <input value="${em.isSeller}" name="isSell" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>IsAdmin</label>
                                    <input value="${em.isAdmin}" name="isAdmin" type="text" class="form-control" required>
                                </div>
                                

                            </div>
                            <div class="modal-footer">

                                <input type="submit" class="btn btn-success">
                            </div>
                            <div class="mt-3 d-flex col-md-6">
                                <a href="ManageAccount" class="mt-3">
                                    <button type="button" class="text-dark" data-dismiss="modal" aria-hidden="true">Back </button>
                                </a> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
