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
        <link rel="stylesheet" href="CSS/manageTournamentDetail.css">
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
            <%@include file="adminHeader.jsp" %>
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
                <form>
                    <div class="tnm-heading mt-5">
                        <h1>${sessionScope.GET_DETAIL.tournamentName}<i class="fa-solid fa-crown"></i></h1>
                        <p>
                            Status: 
                            <select>
                                <option>Coming soon</option>
                                <option>On Going</option>
                                <option>Finish</option>
                            </select>
                        </p>
                    </div>
                    <!-- Section 3 -->
                    <div class="basic-tnm-form">
                        <div class="basic-tnm-form-categories">
                            <h1><i class="fa-solid fa-clock"></i>  Date and Time</h1>
                            <input type="text" value="${sessionScope.GET_DETAIL.dateTime}">
                        </div>
                        <div class="basic-tnm-form-categories" style="border-left: 4px solid #A87B24; border-right: 4px solid #A87B24;">
                            <h1><i class="fa-solid fa-location-dot"></i>  Location</h1>
                            <input type="text" value="${sessionScope.GET_DETAIL.location}">
                        </div>
                        <div class="basic-tnm-form-categories">
                            <h1><i class="fa-sharp fa-solid fa-money-bill"></i> Fee</h1>
                            <input type="text" value="${sessionScope.GET_DETAIL.fee}$">
                        </div>
                    </div>
                    <!-- div line -->
                    <div class="line-section">
                        <p></p>
                    </div>
                    <!-- Section 4 -->
                    <div class="both-prize-player-site">
                        <div class="prize-site" style="border-right: 4px solid #A87B24;">
                            <h1><i class="fa-sharp fa-solid fa-trophy"></i> Prize:  </h1>
                            <p>Top 1: <input type="text"></p>
                            <p>Top 2: <input type="text"></p>
                            <p>Top 3: <input type="text"></p>
                            <p>Top 4: <input type="text"></p>
                        </div>
                        <div class="player-site">
                            <h1><i class="fa-sharp fa-solid fa-person"></i> Number of Player:  </h1>
                            <input type="text" value="${sessionScope.GET_DETAIL.numberOfPlayer}">
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
                </form>
                <div class="line-section">
                    <p></p>
                </div>
                <form>
                    <div class="tnm-heading mt-5">
                        <h1>Round</h1>
                    </div>
                    <div class="basic-tnm-form">
                        <div class="basic-tnm-form-categories">
                            <a href="#">Qualified</a>
                        </div>
                        <div class="basic-tnm-form-categories">
                            <a href="#">Top 30</a>
                        </div>
                        <div class="basic-tnm-form-categories">
                            <a href="#">Top 20</a>
                        </div>
                        <div class="basic-tnm-form-categories">
                            <a href="#">Top 10</a>
                        </div>
                        <div class="basic-tnm-form-categories">
                            <a href="#">Top 4</a>
                        </div>
                    </div>
                    <div class="scoring-criteria">
                        <h1>Scoring Criteria</h1>
                        <div class="scroll-container">
                            <div class="scroll-page">
                                <p>fdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfd
                                    sdfdsfsdfsdfdsfdsfsfdsfdsfdsfdsfdsfdsfdsfds
                                    fdsfsdfdfdsfdsfsdfdsfdsfdsfdsfdsfdsfefdsfdsfds
                                    fsdfdsfdsfdsfdsfdsfsdfsdfsdfdsfsdfsdfdsfdsfdfd
                                    dfdsfdsfsdfsdfdsfdsfdsfdsfsdfdsfdsfsdfsdfsdfsdf
                                    dsfdsfdsfsdfdsffdsfsdfsdfsdfdsfsdfsdfdsfdsfdsfds
                                    fsdfdsfdsfdsfsdfdsfdsfsdfsdfdsfdsfsdfsdfsdfsdfsdf
                                </p><br>
                                <p>sadasdsadsadsadsadasdsadsadsadsadsadsadsadsadsad
                                    sadsadsadsadsadsadsadsadsadsadsfdsfdsfdsfdsfsdfsdf
                                    fsdfdsfdsfdsfdsfdsfdsfdsfdsfdsfsdfdsfdsfdsfdsfdsf
                                    dsfdsfdsfds
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="line-section">
                        <p></p>
                    </div>
                    <div class="round-detail">
                        <div class="round-detail-site" style="border-right: 4px solid #A87B24;">
                            <p>Type of Round: <input type="text"></p>
                            <p>Number Bird Attend:   <input type="number"></p>
                            <p>
                                Status: 
                                <select>
                                    <option>Coming soon</option>
                                    <option>On Going</option>
                                    <option>Finish</option>
                                </select>
                            </p>
                        </div>
                        <div class="player-site">
                            <h1><i class="fa-sharp fa-solid fa-person"></i> Number Bird Pass</h1>
                            <input type="text" value="${sessionScope.GET_DETAIL.numberOfPlayer}">
                        </div>
                    </div>
                    <div>
                        <h1 class="candidate-heading">Scoring Criteria</h1>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">CID</th>
                                    <th scope="col">Bird Name</th>
                                    <th scope="col">Owner Name</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Point</th>
                                    <th scope="col">Result</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>1</td>
                                    <td><input type="number" min="0" max="100"></td>
                                    <td style="font-weight: bold; color: green">PASS</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>1</td>
                                    <td><input type="number" min="0" max="100"></td>
                                    <td style="font-weight: bold; color: green">PASS</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>1</td>
                                    <td><input type="number" min="0" max="100"></td>
                                    <td style="font-weight: bold; color: green">PASS</td>
                                </tr>
                                <tr>
                                    <th scope="row">4</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>1</td>
                                    <td><input type="number" min="0" max="100"></td>
                                    <td style="font-weight: bold; color: green">PASS</td>
                                </tr>
                                <tr>
                                    <th scope="row">5</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>1</td>
                                    <td><input type="number" min="0" max="100"></td>
                                    <td style="font-weight: bold; color: green">PASS</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
                <div class="right-button">
                    <input type="submit" value="Update Round">
                </div>
                <div class="right-button">
                    <input type="submit" value="Change Tournament Picture">
                    <input type="submit" value="Update Tournament">
                </div>
            </div>
        </div>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
