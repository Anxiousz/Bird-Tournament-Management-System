<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tournament</title>
    </head>
    <body>
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
            <link rel="stylesheet" href="CSS/tournament.css">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
            <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        </head>
        <body>
            <!-- nav-site -->
            <nav class="navbar navbar-expand-lg navbar-light ">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse nav-container" id="navbarTogglerDemo01">
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="MainController?action=HOME_USER">HOME</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MainController?action=TOURNAMENT">TOURNAMENT<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">BLOG</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">INTRODUCTION</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">BIRD</a>
                        </li>
                    </ul>
                    <div class="right-site-form my-2 my-lg-0">
                        <div class="dropdown show drop-nav">
                            <a class="" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="https://i.pinimg.com/236x/b5/33/b5/b533b536208b06480c4804e20d2b204e.jpg" alt="Avatar" class="avatar">
                            </a>
                            <div class="dropdown-menu drop-down-menu-list" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href=""><i class="fa-solid fa-gear"></i> Account Setting </a>
                                <a class="dropdown-item" href="MainController?action=Logout"><i class="fa-solid fa-right-from-bracket"></i> Logout </a>
                            </div>
                        </div>
                        <h5>Welcome ${sessionScope.acc.getName()}</h5>
                    </div>
                </div>
            </nav>
            <!-- Pircture heading -->
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" style="height: 800px;" src="https://scontent.fhan4-1.fna.fbcdn.net/v/t1.6435-9/120244547_181839916770252_7737017247524544281_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=PF1sXFl2oHsAX8AwXzL&_nc_ht=scontent.fhan4-1.fna&oh=00_AfCA14tKPHXIttJSN6pO3YQ5wzyRdgTGYC8GfcCJ6Pjm5A&oe=6416C5C0" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" style="height: 800px;" src="https://scontent.fhan3-4.fna.fbcdn.net/v/t1.6435-9/100323510_144014140552830_4161607449062670336_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=-azFYExJaA8AX-6uNBh&_nc_ht=scontent.fhan3-4.fna&oh=00_AfACLg1J0HnlQ4LNrRPkailW8nP6FBYI00nCApmQLm70eA&oe=6416D8B4" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100"  style="height: 800px;" src="https://media.quangninh.gov.vn/1c7fa8bc-3c38-43e7-8558-4097bbe36b74/Libraries/hinhanhbaiviet/2021/long/t1/thi%20chim%20chao%20mao/hd%201080.01_36_12_07.still936.png" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!-- search tnm by name site -->
            <div class="search-tnm-site">
                <div class="search-tnm-main-site">
                    <form action="" class="search-tnm-form">
                        <input type="text" placeholder="Search tournament" class="form-control">
                        <button class="btn btn-search" type="search"><i class='fas fa-search' style='font-size:40px'></i></button>
                    </form>
                </div>     
            </div>
            <!-- tnm categories heading  -->
            <form name="MainController" method="post">
                <div class=" container tnm-categories-heading">
                    <a href="MainController?action=TOURNAMENT"><p> All Tournaments<i class='fas fa-award' style='font-size:24px;color: #dbbd0e;;'></i></p></a>
                    <a href="MainController?action=ON_GOING_TOURNAMENT"><p>On Going Tournaments</p></a>
                    <a href="MainController?action=OLD_TOURNAMENT"><p>Old Tournaments</p></a>
                    <a href="MainController?action=DELAY_TOURNAMENT"><p>Delay Tournament<i class='fas fa-hourglass-end' style='font-size:24px;color: green;'></i></p></a>
                </div>
            </form>
            <!-- tnm-list -->
            <div class="tnm-site-all container">
                <div class="tnm-list container">
                    <!-- card 1 -->
                    <c:forEach var="list" items="${sessionScope.GET_LIST}">
                        <div class="tnm-card-site-ptr">
                            <div class="card" style="width: 45rem;">
                                <img class="card-img-top" style="height: 30rem;" src="${list.image}" alt="Card image cap">
                                <div class="card-body" style="height:20rem;">
                                    <!-- status -->
                                    <div class="status-heading d-flex justify-content-center" style="font-weight: bold;">
                                        <h3>${list.tournamentName}</h3>
                                        <p>
                                            <c:choose>
                                                <c:when test="${list.tournamentStatus == 0}">Coming soon</c:when>
                                                <c:when test="${list.tournamentStatus == 1}">On Going</c:when>
                                                <c:when test="${list.tournamentStatus == 2}">Finish</c:when>
                                                <c:otherwise>Delay</c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                    <!-- Other information -->
                                    <div class="other-inf-tnm">
                                        <div class="each-other-inf-tnm">
                                            <h5>Date and Time</h5>
                                            <p>${list.dateTime}</p>
                                        </div>
                                        <div class="each-other-inf-tnm">
                                            <h5>Location</h5>
                                            <p>${list.location}</p>
                                        </div>
                                        <div class="each-other-inf-tnm">
                                            <h5>Fee</h5>
                                            <p>${list.fee}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-card-tnm">
                                    <a href="MainController?action=TOURNAMENT_DETAIL&ID=${list.tournamentID}">More Detail</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <!-- footer site -->

                </div>
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
                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        </body>
    </html>
</body>
</html>
