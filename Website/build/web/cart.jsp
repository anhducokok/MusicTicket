
<%-- 
    Document   : cart
    Created on : Mar 9, 2024, 3:58:07 PM
    Author     : vip2021
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <title>Tempo.</title>
        <style>


            .breadcrumbs_area {
                background-color: #ffffff;
                padding: 20px 0;
                border-bottom: 1px solid #dee2e6;
            }

            .breadcrumb_content ul {
                margin: 0;
                padding: 0;
                list-style: none;
            }

            .breadcrumb_content ul li {
                display: inline;
                margin-right: 5px;
                font-size: 14px;
            }

            .shopping_cart_area {
                margin-top: 20px;
            }

            .table_desc {
                background-color: #ffffff;
                border: 1px solid #dee2e6;
                border-radius: 5px;
                padding: 20px;
            }

            .table_desc table {
                width: 100%;
            }

            .table_desc table th,
            .table_desc table td {
                padding: 10px;
                vertical-align: middle;
            }

            .coupon_area {
                margin-top: 20px;
            }

            .coupon_code {
                background-color: #ffffff;
                border: 1px solid #dee2e6;
                border-radius: 5px;
                padding: 20px;
            }

            .coupon_code h3 {
                font-size: 20px;
                margin-bottom: 15px;
            }

            .coupon_inner p {
                margin: 5px 0;
            }

            .checkout_btn a {
                background-color: #007bff;
                color: #ffffff;
                padding: 10px 20px;
                border-radius: 5px;
                text-decoration: none;
            }

            .checkout_btn a:hover {
                background-color: #0056b3;
            }
        </style>
    </head>

    <body>

        <%@include file="layout/navigation-menu.jsp" %>

        <div class="shopping-cart">
            <div class="px-4 px-lg-0">
                <div class="pb-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">
                                <!-- Shopping cart table -->
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 text-uppercase">Sản Phẩm</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 text-uppercase">Type</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Price</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Amount</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Action</div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${list}" var="p">
                                                <tr>
                                                    <td scope="row">
                                                        <div class="p-2">
                                                            <img src="${p.img}" alt="" width="70" class="img-fluid rounded shadow-sm text-center">
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <h5 class="mb-0"> <a href="detail?pid=${p.product_id}" class="text-dark d-inline-block">${p.product_name}</a></h5>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="align-middle"><strong class="text-primary">${p.ticket_name}</strong></td>

                                                    <td class="align-middle"><strong class="text-primary">${p.price}</strong></td>

                                                    <td class="align-middle">
                                                        <strong class="text-success pr-3">${p.getAmount()}</strong>
                                                        <a href="reduce?pid=${p.product_id}">
                                                            <button type="button" class="btn btn-outline-primary btn-sm">-</button>
                                                        </a>  

                                                        <a href="cart?pid=${p.product_id}">
                                                            <button type="button" class="btn btn-outline-primary btn-sm">+</button>
                                                        </a>
                                                    </td>
                                                    <td class="align-middle">
                                                        <a href="remove?pid=${p.product_id}" class="text-dark">
                                                            <button type="button" class="btn btn-danger btn-sm">Delete</button>
                                                        </a>
                                                    </td>
                                                </tr> 
                                            </c:forEach>
                                        </tbody>

                                    </table>

                                </div>
                                <!-- End -->
                            </div>
                        </div>

                        <div class="row py-5 p-4 bg-white rounded shadow-sm">
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Voucher</div>
                                <div class="p-4">
                                    <div class="input-group mb-4 border rounded-pill p-2">
                                        <input type="text" placeholder="Nhập Voucher" aria-describedby="button-addon3" class="form-control border-0">
                                        <div class="input-group-append border-0">
                                            <button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill"><i class="fa fa-gift mr-2"></i>Sử dụng</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--<form action="getorder" method="POST">-->
                                <div class="col-lg-6">
                                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Total</div>
                                    <div class="p-4">

                                        <ul class="list-unstyled mb-4">
                                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total ticket</strong><strong>${total}</strong></li>
                                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total bill</strong>
                                                <h5 class="font-weight-bold">${sum} ₫</h5>
                                            </li>
                                        </ul>

                                        <a href="getorder" class="btn btn-dark rounded-pill py-2 btn-block">Mua hàng</a>

                                    </div>
                                </div>
                            <!--</form>-->
                        </div>


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
