<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link href='https://fonts.googleapis.com/css?family=Baloo' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
              integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/userPage.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
        <title>Welcome</title>
    </head>
    <body>
        <header>
            <%@include file="userHeader.jsp" %>
        </header>
        <!-- Tnm-site -->
        <div class="container tnm-site">
            <div class="tnm-heading-content d-flex justify-content-center align-item-center mt-4">
                <p>NEAR AND BIG TOURNAMENT</p> 
                <i class='fas fa-certificate' style='font-size:24px;color: orange ;'></i>
            </div>
            <div class="tnm-card-site">
                <c:forEach var="list" items="${sessionScope.GET_TOURNAMENT}">
                    <div class="card" style="width: 35rem; height: 55rem;">
                        <img class="card-img-top" src="${list.image}" alt="Card image cap">
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
                            <div class="card-end">
                                <a href="login.jsp">More Detail</a>
                                <a href="login.jsp">Register</a>
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
        <!-- Support-site -->
        <div class=" container sp-site">
            <div class="sp-both-site">
                <div class="sp-left-site">
                    <div class="card" style="width: 50rem;">
                        <img class="card-img-top" src="https://i.pinimg.com/236x/f6/62/af/f662af3b9a1cd3cf54d5ce49295bb25c.jpg" alt="Card image cap">
                    </div>
                </div>
                <div class="sp-right-site">
                    <p class="sp-right-site-heading">We Are Professional Support Team<br>
                    <p class="sp-right-site-sub">Let us know when you have problems</p>
                    <p><a href=""><i class="fa fa-facebook-f" style="font-size:24px"></i>An Le</a></p>
                    <p><a href=""><i class="fa fa-envelope" style="font-size:24px"></i>ledingduyan@gmail.com</a></p>
                    <p><a href=""><i class="fa fa-phone" style="font-size:24px"></i>(78) 454-33-432</a></p>
                </div>
            </div>
        </div>
        <!-- Sub site -->
        <div class="sub-site container">
            <div class="sub-box-site">
                <div class="sub-box-left-site">
                    <img src="https://www.saigontourist.net/images/promotion.png" alt="">
                </div>
                <div class="sub-box-right-site">
                    <h4>FREE CONSULTATION</h4>
                    <P>Free online consultation support</P>
                </div>
            </div>
            <!-- 2 -->
            <div class="sub-box-site">
                <div class="sub-box-left-site">
                    <img src="https://www.saigontourist.net/images/star.png" alt="">
                </div>
                <div class="sub-box-right-site">
                    <h4>PRESTIGE WEBSITE</h4>
                    <P>Top reputable website in Vietnam</P>
                </div>
            </div>
            <!-- 3 -->
            <div class="sub-box-site">
                <div class="sub-box-left-site">
                    <img src="https://www.saigontourist.net/images/price.png" alt="">
                </div>
                <div class="sub-box-right-site">
                    <h4>GUI Friendly</h4>
                    <P>Quick and simple operation</P>
                </div>
            </div>
            <!-- 4 -->
            <div class="sub-box-site">
                <div class="sub-box-left-site">
                    <img src="https://www.saigontourist.net/images/star.png" alt="">
                </div>
                <div class="sub-box-right-site">
                    <h4>PROFESSIONAL ENVIRONMENT</h4>
                    <P>Trustworthy and legit</P>
                </div>
            </div>
        </div>
        <!-- footer site -->
        <div class="footer-site"> 
            <p class="footer-heading">@Copyrigh2023</p>
            <div class="wrapper">
                <a href=""><div class="icon facebook">
                        <i class="fab fa-facebook-f"></i>
                        <span class="tooltip">Facebook</span>
                    </div></a>
                <a href=""><div class="icon github">
                        <i class="fab fa-github"></i>
                        <span class="tooltip">Github</span>
                    </div></a>
                <a href=""><div class="icon twitter">
                        <i class="fab fa-twitter"></i>
                        <span class="tooltip">Twitter</span>
                    </div></a>
                <a href="">
                    <div class="icon instagram">
                        <i class="fab fa-instagram"></i>
                        <span class="tooltip">Instagram</span>
                    </div>
                </a>
                <a href=""><div class="icon youtube">
                        <i class="fab fa-youtube"></i>
                        <span class="tooltip">Youtube</span>
                    </div></a>
            </div>
        </div>
    </body>
</html>