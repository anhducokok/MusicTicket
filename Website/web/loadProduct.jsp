<%-- 
    Document   : loadProduct
    Created on : Apr 21, 2024, 11:55:31 PM
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
                        <form action="loadProduct" method="POST">
                            <div class="modal-header">						
                                <h4 class="modal-title">Change Product</h4>

                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${detail.product_id}" name="id" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="category" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listCC}" var="o">
                                            <option value="${o.category_id}"  <c:if test="${o.category_id eq param.category}"> selected</c:if>
                                                    >${o.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${detail.product_name}" name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input value="${detail.img}" name="image" type="text" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Price</label>
                                    <input value="${detail.price}" name="price" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Ticket Type</label>
                                    <select name="ticket_type" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listP}" var="p">
                                            <option value="${p.ticket_type}">${p.ticket_name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" required>${detail.discription}</textarea>
                                </div>

                            </div>
                            <div class="modal-footer">

                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                            <div class="mt-3 d-flex col-md-6">
                                <a href="manage" class="mt-3">
                                    <button type="button" class="text-dark" data-dismiss="modal" aria-hidden="true">Back </button>
                                </a> 
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>




    </body>
</html>
