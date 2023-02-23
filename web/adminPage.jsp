<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/adminPage.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link href='https://fonts.googleapis.com/css?family=Baloo' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/adminPage.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <title>Home</title>
    </head>
    <body>
        <header>
            <%@include file="adminHeader.jsp" %>
        </header>
        <section>
            <!-- Tnm-site -->
            <div class="container tnm-site">
                <div class="tnm-heading-content d-flex justify-content-center align-item-center mt-4">
                    <p>NEAR AND BIG TOURNAMENT</p> 
                    <i class='fas fa-certificate' style='font-size:24px;color: orange ;'></i>
                </div>
                <div class="tnm-card-site">
                    <c:forEach var="list" items="${sessionScope.GET_TOURNAMENT}">
                        <div class="card" style="width: 35rem; height: 60rem;">
                            <div class="card-img" style="width: 35rem; height: 30rem;">
                                <img class="card-img-top" src="${list.image}" alt="Card image cap">
                            </div>
                            <div class="card-body tnm-card-body"  style="height: 70rem;">
                                <div class="tnm-card-top-body">
                                    <div class="tnm-card-left-site">
                                        <h5>Tournament Name:</h5>
                                        <h5>Date and Time: </h5>
                                        <h5>Status: </h5>
                                        <h5>Number of Player: </h5>
                                        <h5>Tournament Fee: </h5>
                                        <h5>Prizes: </h5>
                                    </div>
                                    <div class="tnm-card-right-site">
                                        <p>${list.tournamentName}</p>
                                        <p>${list.dateTime}</p>
                                        <p>
                                        <c:choose>
                                            <c:when test="${list.tournamentStatus == 0}">Coming soon</c:when>
                                            <c:when test="${list.tournamentStatus == 1}">On Going</c:when>
                                            <c:when test="${list.tournamentStatus == 2}">Finish</c:when>
                                            <c:otherwise>Delay</c:otherwise>
                                        </c:choose>
                                        </p>
                                        <p>${list.numberOfPlayer}</p>
                                        <p>${list.fee}</p>
                                        <p>${list.prize}</p>
                                    </div>
                                </div>
                                <div class="card-end admin-card">
                                    <a href="">More Detail</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>   
            </div>
            <!-- Blog site -->
            <div class=" container blog-site">
                <div class="blog-site-heading d-flex justify-content-center align-item-center mt-4">
                    <p class="m-5">TOURNAMENT BLOGS  <i class='fas fa-certificate' style='font-size:24px;color: orange ;'></i></p>
                </div>
                <div class="blog-content-both-site">
                    <div class="blog-left-site">
                        <div class="card card-left-blog" style="width: 55rem; height: 550px;">
                            <img class="card-img-top" style="width: 65rem;height: 600px;" src="https://media.quangninh.gov.vn/1c7fa8bc-3c38-43e7-8558-4097bbe36b74/Libraries/hinhanhbaiviet/2021/long/t1/thi%20chim%20chao%20mao/hd%201080.01_36_12_07.still936.png" alt="Card image cap">
                            <div class="card-body card-blog" style="width: 65rem;">
                                <p class="card-text">Prepare for Tournament 2023 </p>
                            </div>
                        </div>
                    </div>
                    <div class="blog-right-site">
                        <div class="blog-right-both-site">
                            <div class="card card-left-blog mb-5" style="width: 40rem; height: 240px;">
                                <img class="card-img-top" style="width: 40rem;" src="https://media.quangninh.gov.vn/1c7fa8bc-3c38-43e7-8558-4097bbe36b74/Libraries/hinhanhbaiviet/2021/long/t1/thi%20chim%20chao%20mao/hd%201080.01_36_12_07.still936.png" alt="Card image cap">
                                <div class="card-body card-blog" style="width: 40rem;height: 100px;">
                                    <p class="card-text card-right-p">Food for crested birds before competition</p>
                                </div>
                            </div>
                            <div class="card card-left-blog " style="width: 40rem; height: 240px;">
                                <img class="card-img-top" style="width: 40rem;" src="https://media.quangninh.gov.vn/1c7fa8bc-3c38-43e7-8558-4097bbe36b74/Libraries/hinhanhbaiviet/2021/long/t1/thi%20chim%20chao%20mao/hd%201080.01_36_12_07.still936.png" alt="Card image cap">
                                <div class="card-body card-blog" style="width: 20rem;">
                                    <p class="card-text cart-right-p"></p>
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>   
            </div>
            <!-- bird site -->
            <div class=" container bird-site">
                <div class="bird-site-heading d-flex justify-content-center align-items-center mt-4">
                    <p>TOP HOT BIRDS 2023<i class='fas fa-certificate' style='font-size:24px;color: orange ;'></i></p>
                </div>
                <div class="bird-site-main-body mt-5">
                    <!-- 1 -->
                    <c:forEach var="bird" varStatus="counter" items="${sessionScope.GET_BIRD}">
                        <div class="card" style="width: 35rem;">
                            <img class="card-img-top" src="${bird.birdPhoto}" alt="Card image cap">
                            <div class="card-body" style="height: 40rem;">
                                <div class="bird-rank-number d-flex justify-content-center">
                                    TOP 1
                                </div>
                                <div class="bird-info-site">
                                    <div class="bird-left-info-site">
                                        <h4>Bird Name:</h4>
                                        <h4>Height:</h4>
                                        <h4>Weight:</h4>
                                        <h4>Color:</h4>
                                        <h4>Bird Status:</h4>
                                        <h4>Score:</h4>
                                    </div>
                                    <div class="bird-left-right-site">
                                        <h4>${bird.birdName}</h4>
                                        <h4>${bird.height}</h4>
                                        <h4>${bird.weight}</h4>
                                        <h4>${bird.color}</h4>
                                        <h4>
                                            <c:choose>
                                                <c:when test="${bird.birdStatus == 1}">Live</c:when>
                                                <c:otherwise>Dead</c:otherwise>
                                            </c:choose></h4>
                                        <h4>${bird.totalScore}</h4>
                                    </div>
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
