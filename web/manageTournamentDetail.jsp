<%@page import="tournament.TournamentDTO"%>
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
        <title>Manage Tournament Detail</title>
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
                             src="${tour.image}"
                             alt="Card image cap">
                    </div>
                </div>
                <div class="right-button">
                    <input type="submit" value="Update Tournament Picture">
                </div> 
                <!-- section 2  -->
                <form action="UpdateTournamentController" method="GET">
                    <div class="tnm-heading mt-5">
                        <h1>${tour.tournamentName}<i class="fa-solid fa-crown"></i></h1>
                        <p>
                            Status: 
                            
                                        <c:choose>
                                                <c:when test="${tour.tournamentStatus == 0}">
                                                    <select name="tournamentStatus">
                                                        <option>Coming soon</option>
                                                        <option>On Going</option>
                                                    </select>
                                                </c:when>
                                                <c:when test="${tour.tournamentStatus == 3}">
                                                    <select name="tournamentStatus">
                                                        <option>On Going</option>
                                                        <option>Pause</option>
                                                        <option>Finish</option>
                                                    </select>
                                                </c:when>
                                                <c:when test="${tour.tournamentStatus == 4}">
                                                    <select name="tournamentStatus">
                                                        <option>Finish</option>
                                                    </select>
                                                </c:when>
                                                <c:when test="${tour.tournamentStatus == 5}">
                                                    <select name="tournamentStatus">
                                                         <option>On Going</option>
                                                    </select>
                                                </c:when>
                                                <c:otherwise>
                                                    <select name="tournamentStatus" >
                                                        <option>Coming soon</option>
                                                    </select>
                                                </c:otherwise>
                                        </c:choose>
                               
                            
                        </p>
                    </div>
                    <!-- Section 3 -->
                    <div class="basic-tnm-form">
                        <div class="basic-tnm-form-categories">
                            <h1><i class="fa-solid fa-clock"></i>  Date and Time</h1>
                            <input type="text" value="${tour.dateTime}" name="dateTime">
                        </div>
                        <div class="basic-tnm-form-categories" style="border-left: 4px solid #A87B24; border-right: 4px solid #A87B24;">
                            <h1><i class="fa-solid fa-location-dot"></i>  Location</h1>
                            <input type="text" value="${tour.location}" name="location">
                        </div>
                        <div class="basic-tnm-form-categories">
                            <h1><i class="fa-sharp fa-solid fa-money-bill"></i> Fee</h1>
                            <input type="text" value="${tour.fee}VND" name="fee">
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
                            <%
                                TournamentDTO tour = (TournamentDTO) request.getAttribute("tour");
                                String[] prizeArr = null;
                                String prize = tour.getPrize();
                                prizeArr = prize.split(",");  
                                for(String items : prizeArr){
                            %>
                                    <p><%=items%></p>
                            <%
                                }       
                            %>
                            <p><input type="text" value="${tour.prize}" name="prize"></p>
                            
                        </div>
                        <div class="player-site">
                            <h1><i class="fa-sharp fa-solid fa-person"></i> Number of Player:  </h1>
                            <input type="text" value="${numberPlayer}">
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
                            <img src="${tour.sponsor}" alt="Avatar"
                                 class="avatar-sponsor ">
                        </div>
                    </div>
                    <div class="right-button">
                        <input type="hidden" value="${tour.tournamentID}" name="tournamentID" />
                        <input type="submit" value="Update Tournament" name="action">
                    </div>  
                </form>
                <div class="line-section">
                    <p></p>
                </div>
                
                <c:choose>
                    <c:when test="${!empty rounds}">
                    <form action="UpdateRoundController" method="GET">
                    <div class="tnm-heading mt-5">
                        <h1>Round</h1>
                    </div>
                    <div class="basic-tnm-form">
                        <c:forEach items="${rounds}" var="r">
                            <div class="basic-tnm-form-categories">
                                 <c:choose>
                                                <c:when test="${round.roundID == r.roundID}">
                                                   <a style="color:burlywood" id="roud-id" href="RoundController?roundID=${r.roundID}&roundStatus=${r.roundStatus}&roundName=${r.roundName}&tournamentID=${tour.tournamentID}">${r.roundName}</a><br/>
                                                </c:when>
                                                
                                                <c:otherwise>
                                                   <a id="roud-id" href="RoundController?roundID=${r.roundID}&roundStatus=${r.roundStatus}&roundName=${r.roundName}&tournamentID=${tour.tournamentID}">${r.roundName}</a><br/>
                                                </c:otherwise>
                                </c:choose>
                                <c:choose>
                                                <c:when test="${r.roundStatus == 0}">
                                                    <a>Coming soon</a>
                                                </c:when>
                                                <c:when test="${r.roundStatus == 1}">
                                                    <a>On Going</a>
                                                </c:when>
                                                <c:when test="${r.roundStatus == 2}">
                                                    <a>Finish</a>
                                                </c:when>
                                                <c:otherwise>
                                                   <a></a>
                                                </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </div>
                    <!--<div class="scoring-criteria">
                        <h1>Scoring Criteria</h1>
                        <div class="scroll-container">
                            <div class="scroll-page">
                                <p><input type="text" value="" name="scoringCriteria"> </p>
                            </div>
                        </div>
                    </div>-->
                    <div class="line-section">
                        <p></p>
                    </div>
                        <c:if test="${!empty round.roundID}">
                    <div class="round-detail">
                        <div class="round-detail-site" style="border-right: 4px solid #A87B24;">
                            <p>Type of Round: <input type="text" value="${round.typeOfRound}" name="typeOfRound"></p>
                            <p>Number Bird Attend:   <input type="number" value="${round.birdAttend}" name="birdAttend"></p>
                            <p>
                                Status: 
                                <c:choose>
                                                <c:when test="${round.roundStatus == 0}">
                                                    <select name="roundStatus">
                                                        <option>Coming soon</option>
                                                        <option>On Going</option>
                                                    </select>
                                                </c:when>
                                                <c:when test="${round.roundStatus == 1}">
                                                    <select name="roundStatus">
                                                        <option>On Going</option>
                                                        <option>Finish</option>
                                                    </select>
                                                </c:when>
                                                <c:when test="${round.roundStatus == 2}">
                                                    <select name="roundStatus">
                                                        <option>Finish</option>
                                                    </select>
                                                </c:when>
                                                <c:otherwise>
                                                    <select name="roundStatus" >
                                                        <option>Coming soon</option>
                                                    </select>
                                                </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                        <div class="player-site">
                            <h1><i class="fa-sharp fa-solid fa-person"></i> Number Bird Pass</h1>
                            <input type="text" value="${round.birdPass}" name="birdPass">
                        </div>
                    </div>
                        <div class="right-button">
                        <input type="hidden" value="${round.roundID}" name="roundID">
                        <input type="hidden" value="${round.roundName}" name="roundName">
                        <input type="hidden" value="${tour.tournamentID}" name="tournamentID">
                        <input type="submit" value="Update Round" name="action">
                        </div>
                        </form>
                    <div>
                        <h1 class="candidate-heading">Participant</h1>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">CID</th>
                                    <th scope="col">Bird Name</th>
                                    <th scope="col">Owner Name</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Point</th>
                                    <c:choose>
                                        <c:when test="${round.roundName == 'Top4'}">
                                                 <th scope="col">TOP</th>
                                        </c:when>
                                                
                                        <c:otherwise>
                                                    <th scope="col">Result</th>
                                        </c:otherwise>
                                    </c:choose>
                                    <th scope="col">Update</th>
                                </tr>
                            </thead>
                            
                            <tbody>
                                <c:forEach items="${cands}" var="c">
                                    <form action="UpdateCandidatesController" method="GET">
                                    <tr>
                                        <th scope="row">${c.candidatesID}</th>
                                        <td>${c.bird.birdName}</td>
                                        <td>${c.bird.account.name}</td>
                                        <td>${c.candidatesStatus}</td>
                                        <td><input id="score-save" type="number" min="0" max="100" value="${c.score}" name="score" ></td>
                                        <c:choose>
                                        <c:when test="${c.result == 'pass'}">
                                                 <td style="font-weight: bold; color: green">${c.result}</td>
                                        </c:when>
                                                
                                        <c:otherwise>
                                                    <td style="font-weight: bold; color: red">${c.result}</td>
                                        </c:otherwise>
                                        </c:choose>
                                        <input type="hidden" value="${round.roundID}" name="roundID"  />
                                        <input type="hidden" value="${round.roundStatus}" name="roundStatus" />
                                        <input type="hidden" value="${round.roundName}" name="roundName" />
                                        <input type="hidden" value="${tour.tournamentID}" name="tournamentID" />
                                        <input type="hidden" value="${c.candidatesID}" name="candidatesID" />
                                        <td><input class="custom-button_2" type="submit" value="Update" name="action" /></td>
                                    </tr>
                                    </form>
                                </c:forEach>
                            </tbody>
                        </table>
                                                   

                    </div>
                    
                </c:if>
                
                </c:when>
                                                
                <c:otherwise>
                                                   
                </c:otherwise>
                </c:choose>
                
            </div>
        </div>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
 <script>
        document.addEventListener("DOMContentLoaded", function(event) { 
            var scrollpos = localStorage.getItem('scrollpos');
            if (scrollpos) window.scrollTo(0, scrollpos);
        });

        window.onbeforeunload = function(e) {
            localStorage.setItem('scrollpos', window.scrollY);
        };
</script>
</html>
