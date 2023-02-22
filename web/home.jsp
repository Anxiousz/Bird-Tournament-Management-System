
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home page</title>
    </head>

    <body>
        <h1>Hello ${sessionScope.acc.name}</h1>
        <c:choose>
            <c:when test="${sessionScope.acc == null}">
                <form action="MainController" method="POST">
                    <input type="hidden" value="LoginBar" name="action" />
                    <input type="submit" value="Login" />
                </form>
            </c:when>
            <c:otherwise>
                <form action="MainController" method="POST">
                    <input type="submit" value="Logout" name="action" />
                </form>
            </c:otherwise>
        </c:choose>  
    </body>
    <script>
    </script>
</html>
