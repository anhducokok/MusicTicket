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

        <link href="css/style.css" rel="stylesheet">
        <!--<link href="css/slidercss.css" rel="stylesheet">-->
        <title>Tempo.</title>
        <style>
            /* Move your CSS styles here */
            .card-wrapper {
                width: 100%;
                max-width: 600px; /* Adjust as needed */
                margin: 0 auto;
            }

            .product-imgs {
                position: relative;
                overflow: hidden;
            }

            .img-display {
                width: 100%;
                overflow: hidden;
            }

            .img-showcase {
                display: flex;
                transition: transform 0.5s ease;
            }

            .img-showcase img {
                width: 100%;
                height: auto;
                object-fit: cover;
            }

            .img-select {
                display: flex;
                justify-content: center;
                margin-top: 10px;
            }

            .img-item {
                margin: 0 5px;
            }

            .img-item img {
                width: 50px; /* Adjust thumbnail size as needed */
                height: auto;
                cursor: pointer;
                border: 2px solid transparent;
            }

            .img-item img:hover {
                border-color: #333; /* Adjust border color on hover as needed */
            }

            .img-item.active img {
                border-color: #333; /* Adjust border color for active thumbnail */
            }

        </style>
    </head>
    <body>
        <%@include file="layout/navigation-menu.jsp" %>
        <div class="container p-3" style="padding: 13px; margin-top: 40px; background-color:#eeeeee;">
            <!--<h1 class="text-center text-primary">Ticket Detail</h1>-->
            <div class="row">
                <div class="col-lg-4 col-md-5 col-12 col-sm-12">
                    <div class="card-wrapper">
                        <div class="card">
                            <!-- card left -->
                            <div class="product-imgs">
                                <div class="img-display">
                                    <div class="img-showcase">
                                        <img src="${details.img}" alt="shoe image">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7 col-12 col-sm-12 mt-3">
                    <div class="product_d_right mt-3">
                        <form action="cart">
                            <h3 class="fw-bold">${details.product_name}</h3>

                            <div class="product_desc">
                                <h5>Description: </h5>
                                <p style="font-size: 13px;">${details.detail_discription}</p>
                            </div>
                            <div class="mt-1">
                                <h5 style="width: 15%;display: inline-block;">Price: </h5>
                                <span class="postition-absolute current_price text-danger"> ${details.price} VNĐ</span>
                            </div>
                            <div class="container">
                                <div class="row">
                                    <div class="product_variant quantity col-lg-6 col-6 col-md-6 col-sm-6">
                                        <label for="ticket_type" style=""><h5>Type of tickets:</h5></label>
                                        <div class="product_price">
                                            <div class="dropdown">

                                                <select name="ticket_type" class="form-select" style="width: 50%;">
                                                    <c:forEach items="${p}" var="o">
                                                        <label for="ticket_type" style=""></label>
                                                        <option value="${o.ticket_type}" name="ticket_type">${o.ticket_name}</option>

                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div></div>
                            <div class="postion-relative">
                                <a href="cart?pid=${details.product_id}" class="btn btn-primary text-white" data-toggle="modal" data-target="product-detail.jsp">
                                    Add to Cart
                                </a>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
<section class="product_section related_product mt-5" >
    <div class="container" style="margin-top: 100px;">
        <div class="row">
            <div class="col-12">
                <div class="section_title">
                    <h2 class="text-center">Related products</h2>
                </div>
            </div>
        </div>
        <div class="product_area">
            <div class="popular-product">
                <div class="row">
                    <div class="col">
                        <div class="row row-cols-1 row-cols-md-3 g-4">
                            <c:forEach items="${rdata}" var="c">
                                <div class="col d-flex">
                                    <div class="card flex-fill">
                                        <img src="${c.img}" class="card-img-top" alt="Product Image">
                                        <div class="card-body">
                                            <h5 class="card-title">${c.product_name}</h5>
                                            <p class="card-text">${c.discription}</p>
                                            <a href="detail?pid=${c.product_id}" class="btn btn-primary">Read More</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

    <%@include file="layout/footer.jsp" %>

    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/tiny-slider.js"></script>
    <script src="js/custom.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const imgs = document.querySelectorAll('.img-select a');
            const imgBtns = [...imgs];
            let imgId = 1;

            imgBtns.forEach((imgItem) => {
                imgItem.addEventListener('click', (event) => {
                    event.preventDefault();
                    imgId = imgItem.dataset.id;
                    slideImage();
                });
            });

            function slideImage() {
                const displayWidth = document.querySelector('.img-showcase img').clientWidth;
                document.querySelector('.img-showcase').style.transform = `translateX(${- (imgId - 1) * displayWidth}px)`;
            }

            window.addEventListener('resize', slideImage);

            // Initially call slideImage to set correct initial position
            slideImage();
        });
    </script>
</body>
</html>