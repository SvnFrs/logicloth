<%@page contentType="text/html" pageEncoding="UTF-8" %>
<header>
    <div class="container">
        <div class="head">
            <div class="logo">
                <div class="logo-img">
                    <a href="${pageContext.request.contextPath}/User"><img src="images/D&C Food (1).png" alt="logo"></a>
                </div>

                <div class="logo-name">
                    <a href="${pageContext.request.contextPath}/User">
                        <p>D&C Food</p>
                    </a>
                </div>
            </div>

            <div class="other" style="justify-content: end; gap: 30px">
                <div class="search">
                    <input type="text" name="search-product" id="search" placeholder="Nhập từ khóa cần tìm...">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </div>

                <div class="user-icon">
                    <div id="mySidenav" class="sidenav" tabindex="10">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                        <div class="infor">
                            <div class="infor-icon">
                                <i class="fa-regular fa-user"></i>
                            </div>

                            <%--                                    <h3>Huynh Nhut Khang</h3>--%>
                            <h3>${sessionScope.username}</h3>
                        </div>
                        <a href="">Thông tin</a>
                        <a href="${contextPath}/Order">Đơn hàng hiện có</a>
                        <a href="${pageContext.request.contextPath}/Logout">Đăng xuất</a>
                    </div>
                    <i class="fa-regular fa-user" onclick="openNav()"></i>
                </div>

                <div class="cart">
<%--                    <a href="${pageContext.request.contextPath}/User/Cart?userID=${sessionScope.userID}">--%>
                    <a href="${pageContext.request.contextPath}/Cart">
                        <i class="fa fa-bag-shopping"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>