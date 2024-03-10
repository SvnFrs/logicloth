<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header>
    <div class="container">
        <div class="head">
            <div class="logo">
                <div class="logo-img">
                    <a href="${pageContext.request.contextPath}/Seller"><img src="images/D&C Food (1).png" alt="logo"></a>
                </div>

                <div class="logo-name">
                    <a href="${pageContext.request.contextPath}/Seller">
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
                        <a href="#">Thông tin</a>
                        <a href="#">Đơn hàng hiện có</a>
                        <a href="${pageContext.request.contextPath}/Logout">Đăng xuất</a>
                    </div>
                    <i class="fa-regular fa-user" onclick="openNav()"></i>
                </div>

<%--                <div class="cart">--%>
<%--                    <i class="fa fa-bag-shopping"></i>--%>
<%--                </div>--%>
            </div>
        </div>
    </div>
</header>