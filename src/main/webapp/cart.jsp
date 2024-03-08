<jsp:useBean id="Restaurant" scope="request" type="Model.restaurant"/>
<%--<jsp:useBean id="Products" scope="request" type="Model.product"/>--%>
<%--
  Created by IntelliJ IDEA.
  User: IuseArch
  Date: 3/8/24
  Time: 1:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="link.jsp" %>
    <title>${requestScope.username}'s Cart</title>
</head>
<body>

<%@include file="user-header.jsp" %>

<%@include file="footer.jsp" %>
</body>
</html>
