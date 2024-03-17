<%@ page import="DAOs.SaleDAOs" %>
<%@ page import="DAOs.AdminDAOs" %>
<%--
    Document   : admin
    Created on : Mar 1, 2024, 5:20:43 PM
    Author     : admin
--%>

<%
    SaleDAOs saleDAO = new SaleDAOs();
    request.setAttribute("saleDAOs", saleDAO);
    AdminDAOs adminDAO = new AdminDAOs();
    request.setAttribute("adminDAOs", adminDAO);
%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="link.jsp" %>
    <title>D&C Food</title>
</head>
<body>
<header>
    <div class="container">
        <div class="head">
            <div class="logo">
                <div class="logo-img">
                    <a href="${pageContext.request.contextPath}/"><img src="images/D&C Food (1).png" alt="logo"></a>
                </div>

                <div class="logo-name">
                    <a href="${pageContext.request.contextPath}/">
                        <p>D&C Food</p>
                    </a>
                </div>
            </div>

            <div class="other" style="justify-content: end; gap: 30px">

                <div class="user-icon">
                    <div id="mySidenav" class="sidenav">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                        <div class="infor">
                            <div class="infor-icon">
                                <i class="fa-regular fa-user"></i>
                            </div>
                            <h3>${sessionScope.username}</h3>
                        </div>
                        <a href="${pageContext.request.contextPath}/Logout">Đăng xuất</a>
                    </div>
                    <i class="fa-regular fa-user" onclick="openNav()"></i>
                </div>
            </div>
        </div>
    </div>
</header>

<main>
    <div class="container-xxl py-5">
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-lg-10 col-md-9">
                        Quản lý người dùng
                    </div>
                    <div class="col-lg-2 col-md-3 text-end justify-content-end">
                        <a href="" class="btn btn-success"
                           data-bs-toggle="modal" data-bs-target="#user-add-modal"
                        >Thêm người dùng</a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <table class="table table-striped justify-content-center align-middle text-center">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên người đùng</th>
                        <th>Email</th>
                        <th>Tên đầy đủ</th>
                        <th>Quyền</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${accounts}" var="account">
                        <tr>
                            <td>${account.userID}</td>
                            <td>${account.userName}</td>
                            <td>${account.email}</td>
                            <td>${account.fullName}</td>
                            <td>${account.role}</td>
                            <td>
                                <a href="" class="btn btn-sm btn-primary"
                                   data-bs-toggle="modal"
                                   data-bs-target="#user-update-modal-${account.userID}"
                                >Sửa</a>
                                <a href="" class="btn btn-sm btn-danger">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="user-add-modal" tabindex="-1" aria-labelledby="user-add-modal" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thêm người dùng</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class="my-3">
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <div class="mb-3">
                                    <label for="user-add-username" class="form-label">Tên đăng nhập</label>
                                    <input type="text" class="form-control" id="user-add-username"
                                           placeholder="Tên đăng nhập"
                                           aria-describedby="user-username">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <div class="mb-3">
                                    <label for="user-add-role" class="form-label">Loại tài khoản</label>
                                    <select class="form-select" aria-label="user-role"
                                            id="user-add-role"
                                            name="role">
                                        <option value="user">Người dùng</option>
                                        <option value="seller">Chủ quán</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <div class="mb-3">
                                    <label for="user-add-email" class="form-label">Email</label>
                                    <input type="text" class="form-control" id="user-add-email"
                                           placeholder="example@gmail.com"
                                           aria-describedby="user-email">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <div class="mb-3">
                                    <label for="user-add-fullName" class="form-label">Tên đầy đủ</label>
                                    <input type="text" class="form-control" id="user-add-fullName"
                                           placeholder="Tên đầy đủ"
                                           aria-describedby="user-fullName">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-12">
                            <button type="button" class="btn btn-primary" onclick="addUser()">Thêm</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <c:forEach items="${accounts}" var="account">
        <div class="modal fade" id="user-update-modal-${account.userID}" tabindex="-1"
             aria-labelledby="user-update-modal" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Chỉnh sửa người dùng</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="my-3">
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                    <div class="mb-3">
                                        <label for="user-update-username-${account.userID}" class="form-label">Tên đăng
                                            nhập</label>
                                        <input type="text" class="form-control"
                                               id="user-update-username-${account.userID}"
                                               placeholder="Tên đăng nhập"
                                               aria-describedby="user-username">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                    <div class="mb-3">
                                        <label for="user-update-email-${account.userID}"
                                               class="form-label">Email</label>
                                        <input type="text" class="form-control" id="user-update-email-${account.userID}"
                                               placeholder="example@gmail.com"
                                               aria-describedby="user-email">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                    <div class="mb-3">
                                        <label for="user-update-fullName-${account.userID}" class="form-label">Tên đầy
                                            đủ</label>
                                        <input type="text" class="form-control"
                                               id="user-update-fullName-${account.userID}"
                                               placeholder="Tên đầy đủ"
                                               aria-describedby="user-fullName">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-12">
                                <button type="button" class="btn btn-primary" onclick="updateUserInfo(${account.userID})">
                                    Chỉnh sửa
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

    <div class="container-xxl py-5">
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-lg-10 col-md-9">
                        Quản lý quán ăn
                    </div>
                    <div class="col-lg-2 col-md-3 text-end justify-content-end">
                        <a href="" class="btn btn-success"
                           data-bs-toggle="modal" data-bs-target="#restaurant-add-modal"
                        >Thêm quán ăn</a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <table class="table table-striped justify-content-center align-middle text-center">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên quán</th>
                        <th>Chủ quán</th>
                        <th>Ảnh</th>
                        <th>Địa chỉ</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <jsp:useBean id="restaurantOwners" scope="request" type="java.util.List"/>
                    <c:forEach items="${restaurants}" var="restaurant">
                        <tr>
                            <td>${restaurant.restaurantID}</td>
                            <td>${restaurant.restaurantName}</td>
                            <td>${adminDAOs.getSellerNameByID(adminDAOs.getSellerIDByRestaurantID(restaurant.restaurantID))}</td>
                            <td><img src="${restaurant.restaurantImage}" alt="" class="img-fluid"
                                     style="width: auto;height: 100px;object-fit: contain;"></td>
                            <td>${restaurant.restaurantAddress}</td>
                            <td class="w-25">
                                <div class="my-1">
                                    <a href="" class="btn btn-primary" data-bs-toggle="modal"
                                       data-bs-target="#restaurant-detail-modal-${restaurant.restaurantID}">Thông
                                        tin</a>
                                </div>
                                <div class="my-1">
                                    <a href="" class="btn btn-sm btn-primary"
                                       data-bs-toggle="modal"
                                       data-bs-target="#restaurant-update-modal-${restaurant.restaurantID}"
                                    >Chỉnh sửa quán ăn</a>
                                </div>
                                <div class="my-1">
                                    <a href="" class="btn btn-sm btn-danger"
                                       data-bs-toggle="modal" data-bs-target=""
                                    >Xóa quán ăn</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="modal fade" id="restaurant-add-modal" tabindex="-1" aria-labelledby="restaurant-add-modal"
             aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Thêm quán ăn</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="my-3">
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                    <div class="mb-3">
                                        <label for="restaurant-add-name" class="form-label">Tên quán ăn</label>
                                        <input type="text" class="form-control" id="restaurant-add-name"
                                               placeholder="Tên quán ăn"
                                               aria-describedby="restaurant-name">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                    <c:choose>
                                        <c:when test="${adminDAOs.isEmptyOrNull(adminDAOs.allSellersWithNoRestaurant())}">
                                            <div class="mb-3">
                                                <label for="restaurant-add-owner" class="form-label">Chủ quán</label>
                                                <input type="text" class="form-control disabled"
                                                       placeholder="Hiện tại không có chủ quán nào"
                                                       disabled
                                                       aria-describedby="restaurant-owner">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="mb-3">
                                                <label for="restaurant-add-owner" class="form-label">Chủ quán</label>
                                                <select class="form-select" aria-label="restaurant-owner"
                                                        id="restaurant-add-owner">
                                                    <c:forEach
                                                            items="${adminDAOs.allSellersWithNoRestaurant()}"
                                                            var="owner">
                                                        <option value="${owner.userID}">${adminDAOs.getSellerNameByID(owner.userID)}</option>
                                                    </c:forEach>
                                                        <%--                                            <option value="${sellerOrderDAOs.lastOrderStatusID()}">${sellerOrderDAOs.getOrderStatusByOrderStatusID(sellerOrderDAOs.lastOrderStatusID())}</option>--%>
                                                </select>
                                            </div>
                                        </c:otherwise>

                                    </c:choose>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                    <div class="mb-3">
                                        <label for="restaurant-add-address" class="form-label">Địa chỉ</label>
                                        <input type="text" class="form-control" id="restaurant-add-address"
                                               placeholder="Địa chỉ"
                                               aria-describedby="restaurant-address">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                    <label for="restaurant-add-description" class="form-label">Miêu tả</label>
                                    <textarea class="form-control" id="restaurant-add-description" rows="3"
                                              placeholder="Miêu tả"
                                    ></textarea>
                                </div>
                            </div>
                        </form>
                        <div class="col-lg-12 col-md-12">
                            <%--                                    <form id="restaurant-add-image" method="post" action="" enctype="multipart/form-data">--%>
                            <%--                                        <label class="form-label">Ảnh quán ăn</label>--%>
                            <%--                                        <div class="row">--%>
                            <%--                                            <div class="col-lg-9 col-md-12">--%>
                            <%--                                                <input type="file" id="restaurant-add-file" name="multiPartServlet" class="form-control"/>--%>
                            <%--                                            </div>--%>
                            <%--                                            <div class="col-lg-3 col-md-12">--%>
                            <%--                                                <input type="submit" value="Upload" class="form-control"/>--%>
                            <%--                                            </div>--%>
                            <%--                                        </div>--%>
                            <%--                                    </form>--%>

                            <div class="mb-3">
                                <label class="form-label" for="restaurant-add-image-path">Ảnh quán ăn</label>
                                <input type="text" id="restaurant-add-image-path" class="form-control"
                                       placeholder="Xin nhập link ảnh">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-12">
                                <button type="button" class="btn btn-primary" onclick="addRestaurant()">Add</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <c:forEach items="${restaurants}" var="restaurant">
            <div class="modal fade" id="restaurant-detail-modal-${restaurant.restaurantID}" tabindex="-1"
                 aria-labelledby="restaurant-detail-modal-${restaurant.restaurantID}Label" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title"
                                id="restaurant-detail-modal-${restaurant.restaurantID}Label">${restaurant.restaurantName}</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="card mb-3">
                                <div class="card-header">
                                    Thông tin quán ăn
                                </div>
                                <div class="card-body">
                                    <div class="input-group">
                                        <input type="text" class="form-control"
                                               value="${restaurant.restaurantDescription}" disabled
                                               aria-label="Username" aria-describedby="basic-addon1">
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header">
                                    <div class="row">
                                        <div class="col-lg-10 col-md-9">
                                            Sales Report
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table class="table table-striped align-middle">
                                        <thead>
                                        <tr>
                                            <th>Date</th>
                                            <th>Amount</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach
                                                items="${saleDAOs.getAllSaleIDByRestaurantID(restaurant.restaurantID)}"
                                                var="saleID">
                                            <c:forEach items="${saleDAOs.getAllSaleBySaleID(saleID)}" var="sale">
                                                <tr>
                                                    <td>${sale.saleDate}</td>
                                                    <td>${sale.totalSale}</td>
                                                    <td>
                                                        <div class="btn-group-lg">
                                                            <div class="row">
                                                                <a href="" class="btn btn-primary"
                                                                   data-bs-toggle="modal" data-bs-target=""
                                                                >Detail</a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <c:forEach items="${restaurants}" var="restaurant">
            <div class="modal fade" id="restaurant-update-modal-${restaurant.restaurantID}" tabindex="-1"
                 aria-labelledby="restaurant-update-modal-${restaurant.restaurantID}" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Chỉnh sửa thông tin <span
                                    class="text-success fs-4">${restaurant.restaurantName}</span></h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form class="my-3">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                        <div class="mb-3">
                                            <label for="restaurant-update-name-${restaurant.restaurantID}"
                                                   class="form-label">Tên quán ăn</label>
                                            <input type="text" class="form-control"
                                                   id="restaurant-update-name-${restaurant.restaurantID}"
                                                   placeholder="${restaurant.restaurantName}"
                                                   aria-describedby="restaurant-name">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                        <div class="mb-3">
                                            <label for="restaurant-update-address-${restaurant.restaurantID}"
                                                   class="form-label">Địa chỉ</label>
                                            <input type="text" class="form-control"
                                                   id="restaurant-update-address-${restaurant.restaurantID}"
                                                   placeholder="${restaurant.restaurantAddress}"
                                                   aria-describedby="restaurant-address">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                        <label for="restaurant-update-description-${restaurant.restaurantID}"
                                               class="form-label">Product description</label>
                                        <textarea class="form-control"
                                                  id="restaurant-update-description-${restaurant.restaurantID}" rows="3"
                                                  placeholder="${restaurant.restaurantDescription}"
                                        ></textarea>
                                    </div>
                                </div>
                            </form>
                            <div class="col-lg-12 col-md-12">
                                    <%--                                <form id="restaurant-update-image" method="post" action=""--%>
                                    <%--                                      enctype="multipart/form-data">--%>
                                    <%--                                    <label class="form-label">Ảnh quán ăn</label>--%>
                                    <%--                                    <div class="row">--%>
                                    <%--                                        <div class="col-lg-9 col-md-12">--%>
                                    <%--                                            <input type="file" id="restaurant-update-file" name="multiPartServlet"--%>
                                    <%--                                                   class="form-control"/>--%>
                                    <%--                                        </div>--%>
                                    <%--                                        <div class="col-lg-3 col-md-12">--%>
                                    <%--                                            <input type="submit" value="Upload" class="form-control"/>--%>
                                    <%--                                        </div>--%>
                                    <%--                                    </div>--%>
                                    <%--                                </form>--%>
                                    <%--                                <input type="text" id="restaurant-update-image-path" hidden="hidden">--%>
                                <div class="mb-3">
                                    <label class="form-label" for="restaurant-update-image-path">Ảnh quán ăn</label>
                                    <input type="text" id="restaurant-update-image-path" class="form-control"
                                           placeholder="Xin nhập link ảnh">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-12">
                                    <button type="button" class="btn btn-primary"
                                            onclick="updateRestaurant(${restaurant.restaurantID})">Update
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</main>
<script src="js/add.js"></script>
<script src="js/update.js"></script>
<script src="js/admin-upload.js"></script>
<%@include file="footer.jsp" %>
</body>
</html>
