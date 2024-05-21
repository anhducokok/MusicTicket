<%--
    Document   : my_account
    Created on : Mar 13, 2024, 10:52:36 PM
    Author     : vip2021
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/newcss.css" rel="stylesheet">
        <title>Tempo.</title>
        <style>
            /* Custom Navbar */

            .custom-navbar {
                background-color: #343a40;
            }

            .custom-navba588r .navbar-brand {
                font-size: 24px;
            }

            .custom-navbar .nav-link {
                color: #ffffff;
            }

            .custom-navbar .nav-link:hover {
                color: #ffffff;
            }

            .custom-navbar .dropdown-menu {
                background-color: #343a40;
            }

            .custom-navbar .dropdown-menu a {
                color: #ffffff;
            }

            .custom-navbar .dropdown-menu a:hover {
                background-color: #212529;
            }

            /* Account Dashboard */

            .account_dashboard {
                margin-top: 80px;
            }

            .dashboard_tab_button {
                background-color: #ffffff;
                border-radius: 10px;
                padding: 20px;
            }

            .dashboard-list .nav-link {
                color: #000000;
            }

            .dashboard-list .nav-link:hover {
                color: #000000;
            }

            .main_content_area {
                padding-bottom: 55px;
            }
            @media only screen and (max-width: 767px) {
                .main_content_area {
                    padding-bottom: 54px;
                }
            }
            /* User Profile Card */

            .user-profile-card {
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }

            .user-profile-card .card-title {
                font-size: 24px;
                color: #333333;
            }

            .user-profile-card .card-text {
                color: #666666;
            }

            .user-profile-card .fab {
                color: #4e73df;
            }
        </style>
    </head>

    <body>
        <%@include file="layout/navigation-menu.jsp" %>
        <section class="main_content_area " style="" id="account-details">

            <div class="container mt-3">
                <div class="row mt-3">
                    <div class="col-sm-12 col-md-12 col-lg-3 ">
                        <!-- Navigation Tabs -->
                        <div class="dashboard_tab_button text-center">
                            <ul role="tablist" class="nav flex-column dashboard-list">
                                <li><a href="#account-details" data-toggle="tab" class="nav-link">Tài khoản của tôi</a></li>
                                <li><a href="#orders" data-toggle="tab" class="nav-link">Đơn hàng</a></li>
                                <li><a href="users?action=logout" class="nav-link">Đăng xuất</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-9 " id="account-details" style="margin-bottom: 30px;">
                        <!-- User Profile Card -->
                        <div  class="" style="width: 100%;">
                            <section class="" style=" background-color: #eee;">
                                <div class="container">
                                    <div class="row  h-100">
                                        <div class="col-12 col-lg-12 mb-4 mb-lg-0 mt-3">
                                            <div class="card mb-3" style="border-radius: .5rem;">
                                                <div class="row g-0">
                                                    <div class="col-md-4 col-4 col-lg-4 col-sm-12 gradient-custom text-center text-white" style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                                                        <c:if test="${sessionScope.user.avatar!=null}">
                                                        <img src="${sessionScope.user.avatar}" alt="Avatar" class="img-thumbnail my-5" style="width: 80px;" />
                                                        </c:if>
                                                        <c:if test="${sessionScope.user.avatar==null}">
                                                            <img src="img/avatar.png" alt="Avatar" class="img-thumbnail my-5" style="width: 80px;" />
                                                        
                                                        </c:if>
                                                        <h5>${sessionScope.user.user_name}</h5>
                                                        <p></p>
                                                        <i class="far fa-edit mb-5"></i>
                                                    </div>
                                                    <div class="col-md-8 col-8 col-lg-8 col-sm-12">
                                                        <div class="card-body p-4">
                                                            <h6>Information</h6>
                                                            <hr class="mt-0 mb-4">
                                                            <div class="row pt-1">
                                                                <div class="col-6 mb-3">
                                                                    <h6>Email</h6>
                                                                    <p class="text-muted">${sessionScope.user.user_email}</p>
                                                                </div>
                                                                <div class="col-6 mb-3">
                                                                    <h6>Phone</h6>
                                                                    <p class="text-muted">${sessionScope.user.phone}</p>
                                                                </div>
                                                            </div>
                                                           
                                                            <div class="d-flex justify-content-start">
                                                                <a href="#!"><i class="fab fa-facebook-f fa-lg me-3"></i></a>
                                                                <a href="#!"><i class="fab fa-twitter fa-lg me-3"></i></a>
                                                                <a href="#!"><i class="fab fa-instagram fa-lg"></i></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <div class="user-profile-card" id="orders">
                            <div class="tab-pane fade" >
                                <h3>Đơn hàng</h3>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Mã đơn hàng</th>
                                                <th>Đơn hàng</th>
                                                <th>Tên</th>
                                                <th>Hình thức GD</th>
                                                
                                                <th>Tổng đơn</th>
                                                <th>Actions</th>	 	 	 	
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${bill}" var="b">
                                                <tr>
                                                    <td>${b.bill_id}</td>
                                                    <td><img src="${b.img}"></td>
                                                    <td>${b.product_name}</td>
                                                    <td><span class="success">${b.payment}</span></td>
                                                    
                                                    <td>${b.total}</td>
                                                    <td><a href="detail?pid=${b.product_id}" class="view">view</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                                                                 <div class="user-profile-card" id="orders">
                            <div class="tab-pane fade" >
                                <h3>Đơn hàng</h3>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Mã đơn hàng</th>
                                                <th>Đơn hàng</th>
                                                <th>Tên</th>
                                                <th>Hình thức GD</th>
                                                
                                                <th>Tổng đơn</th>
                                                <th>Actions</th>	 	 	 	
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${bill}" var="b">
                                                <tr>
                                                    <td>${b.bill_id}</td>
                                                    <td><img src="${b.img}"></td>
                                                    <td>${b.product_name}</td>
                                                    <td><span class="success">${b.payment}</span></td>
                                                    
                                                    <td>${b.total}</td>
                                                    <td><a href="detail?pid=${b.product_id}" class="view">view</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </section>
    <
        <%@include file="layout/footer.jsp" %>
    </div>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/tiny-slider.js"></script>
    <script src="js/custom.js"></script>
</body>

</html>
