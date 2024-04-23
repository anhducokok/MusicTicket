<%-- 
    Document   : AddProduct
    Created on : Apr 23, 2024, 9:26:17 AM
    Author     : vip2021
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <style>
        /* Add custom styles here */
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h4 class="modal-title">Add Product</h4>
                </div>
                <div class="card-body">
                    <form action="addProduct" method="post">
                        <div class="mb-3">
                            <label for="id" class="form-label">ID</label>
                            <input name="id" type="text" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input name="name" type="text" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="image" class="form-label">Image</label>
                            <input name="image" type="text" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="price" class="form-label">Price</label>
                            <input name="price" type="text" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="ticket_type" class="form-label">Ticket Type</label>
                            <select name="ticket_type" class="form-select" aria-label="Select Ticket Type">
                                <c:forEach items="${listP}" var="p">
                                    <option value="${p.ticket_type}">${p.ticket_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">Description</label>
                            <textarea name="description" class="form-control" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="category" class="form-label">Category</label>
                            <select name="category" class="form-select" aria-label="Select Category">
                                <c:forEach items="${listCC}" var="o">
                                    <option value="${o.category_id}" >
                                            ${o.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="d-grid gap-2">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
                <div class="card-footer bg-light">
                    <div class="d-flex justify-content-between">
                        <a href="admin_page.jsp" class="btn btn-link text-light">Back</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
