<%-- 
    Document   : birdRepository
    Created on : Feb 24, 2023, 4:06:23 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link href='https://fonts.googleapis.com/css?family=Baloo' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
              integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <link rel="stylesheet" href="./CSS/birdRepository.css">
        <title>Bird Repository</title>
    </head>
    <body>
        <header>
            <%@include file="userHeader.jsp"%>
        </header>
        <section>
            <div class="bird-repository container">
                <div class="bird-repositoryp-main-card container">
                    <c:forEach var="bird" items="${sessionScope.birdList}">
                        <div class="card" style="width: 40rem; height: 60rem;">
                            <div class="img-card-container">
                                <img class="card-img-top"
                                     src="${bird.birdPhoto}"
                                     alt="Card image cap">  
                                <p>
                                    <c:choose>
                                        <c:when test="${bird.birdStatus == 0}">Status: Dead</c:when>
                                        <c:when test="${bird.birdStatus == 1}">Status: Alive</c:when>
                                        <c:when test="${bird.birdStatus == 2}">Status: Unvailable</c:when>
                                    </c:choose>
                                </p>
                            </div>

                            <div class="card-body main-body-bird">
                                <div class="left-main-site">
                                    <li>Bird Name</li>
                                    <li>Height</li>
                                    <li>Weight</li>
                                    <li>Color</li>
                                </div>
                                <div class="right-main-site">
                                    <li>${bird.getBirdName()}</li>
                                    <li>${bird.getHeight()}</li>
                                    <li>${bird.getWeight()}</li>
                                    <li>${bird.getColor()}</li>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
