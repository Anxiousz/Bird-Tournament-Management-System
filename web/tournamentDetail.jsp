<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <link rel="stylesheet" href="./CSS/tourmamentDetail.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <title>Tournament Detail</title>
        <title>JSP Page</title>
    </head>
    <body>  
        <header>
            <%@include file="userHeader.jsp" %>
        </header>
        <!-- tournament Detail -->
        <div class="tnmde-container container">
            <div class="tnm-basic-info">
                <div class="tnm-picture">
                    <div class="card" style="width: 90rem;">
                        <img class="card-img-top" style="width: 90rem; height: 70rem;"
                             src="${sessionScope.GET_DETAIL.image}"
                             alt="Card image cap">
                    </div>
                </div>
                <!-- section 2  -->
                <div class="tnm-heading mt-5">
                    <h1>${sessionScope.GET_DETAIL.tournamentName}<i class="fa-solid fa-crown"></i></h1>
                    <p>
                        <c:choose>
                            <c:when test="${sessionScope.GET_DETAIL.tournamentStatus == 0}">Status: Up Coming</c:when>
                            <c:when test="${sessionScope.GET_DETAIL.tournamentStatus == 1}">Status: Open Form</c:when>
                            <c:when test="${sessionScope.GET_DETAIL.tournamentStatus == 2}">Status: Close Form</c:when>
                            <c:when test="${sessionScope.GET_DETAIL.tournamentStatus == 3}">Status: On Going</c:when>
                            <c:when test="${sessionScope.GET_DETAIL.tournamentStatus == 4}">Status: Finished</c:when>
                            <c:otherwise>Status: Delay</c:otherwise>
                        </c:choose>
                    </p>
                </div>
                <!-- Section 3 -->
                <div class="basic-tnm-form">
                    <div class="basic-tnm-form-categories">
                        <h1><i class="fa-solid fa-clock"></i>  Date and Time</h1>
                        <p>${sessionScope.GET_DETAIL.dateTime}</p>
                    </div>
                    <div class="basic-tnm-form-categories"
                         style="border-left: 4px solid #A87B24; border-right: 4px solid #A87B24;">
                        <h1><i class="fa-solid fa-location-dot"></i>  Location</h1>
                        <p>${sessionScope.GET_DETAIL.location}</p>
                    </div>
                    <div class="basic-tnm-form-categories">
                        <h1><i class="fa-sharp fa-solid fa-money-bill"></i> Fee</h1>
                        <p>${sessionScope.GET_DETAIL.fee} VND</p>
                    </div>
                </div>
                <!-- div line -->
                <div class="line-section">
                    <p></p>
                </div>
                <div class="both-prize-player-site">
                    <div class="prize-site" style="border-right: 4px solid #A87B24;">
                        <h1><i class="fa-sharp fa-solid fa-trophy"></i> Prize:  </h1>
                        <p>Total Prize: ${sessionScope.GET_DETAIL.prize} VND</p>
                    </div>
                    <div class="player-site">
                        <h1><i class="fa-sharp fa-solid fa-person"></i> Number of Player(required):  </h1>
                        <p>${sessionScope.GET_DETAIL.minParticipant}</p>
                    </div>
                </div>
                <!-- div line -->
                <div class="line-section">
                    <p></p>
                </div>
                <!-- Section 5 -->
                <div class="sponsor-site">
                    <h1>Main Sponsor <i class="fa-solid fa-hand-holding-heart" style="color: green;"></i></h1>
                    <div class="sponsor-site-picture">
                        <img src="${sessionScope.GET_DETAIL.sponsor}" alt="Avatar"
                             class="avatar-sponsor ">
                    </div>
                </div>

                <!-- div-site -->
                <div class="line-section">
                    <p></p>
                </div>
                <!-- Section 7 -->
                <c:choose>
                    <c:when test="${sessionScope.GET_DETAIL.tournamentStatus == 0}">
                        <div class="regis-site container">
                            <div class="regis-both-site">
                                <div class="regis-left-site">
                                    <h1><a>Please wait until the date of the registration form</h1></a>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${sessionScope.GET_DETAIL.tournamentStatus == 1}">
                        <div class="regis-site container">
                            <div class="regis-both-site">
                                <div class="regis-left-site">
                                    <h1><a>PLAY WITH US NOW</h1>
                                    <p>Gift, Achivement waiting you</p>
                                    <a class="left-join-tnm" style="color: white" href="MainController?action=RegisterForm&tID=${sessionScope.GET_DETAIL.tournamentID}&aID=${sessionScope.acc.accountID}">PLAY NOW</a>
                                </div>

                            </div>
                        </div>
                    </c:when>
                    <c:when test="${sessionScope.GET_DETAIL.tournamentStatus == 2}">
                        <div class="regis-site container">
                            <div class="regis-both-site">
                                <div class="regis-left-site">
                                    <h1><a>Oh Sorry :( The form has been closed. Please choose another tournament</h1></a>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${sessionScope.GET_DETAIL.tournamentStatus == 3}">
                        <div class="regis-site container">
                            <div class="regis-both-site">
                                <div class="regis-left-site">
                                    <h1><a>The match is in progress so can't register</h1></a>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${sessionScope.GET_DETAIL.tournamentStatus == 4}">
                        <div class="regis-site container">
                            <div class="regis-both-site">
                                <div class="regis-left-site">
                                    <h1><a>Oh Sorry :( The Tournament finshed.</h1></a>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="regis-site container">
                            <div class="regis-both-site">
                                <div class="regis-left-site">
                                    <h1><a>Sorry for this problem. Stay up to date and stay tuned.</h1></a>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <footer>
            <%@ include file="footer.jsp" %>
        </footer>
    </body>
</html>
