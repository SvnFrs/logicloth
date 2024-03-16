<%@page contentType="text/html" pageEncoding="UTF-8" %>
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

            <div class="other">
                <form action="Search" method="get" class="search">
                    <div class="search">
                        <input type="text" name="search" id="search" placeholder="Nhập từ khóa cần tìm...">
                        <button type="submit" class="btn-sm">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </div>
                </form>
                <div class="login"><a href="<%=
                    request.getServletContext().getContextPath()%>/Login">Login/Sign Up</a></div>
                <div class="cart">
                    <i class="fa fa-bag-shopping"></i>
                </div>
            </div>
        </div>
    </div>
</header>