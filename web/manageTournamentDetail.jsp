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
                             src="${requestScope.tour.image}"
                             alt="Card image cap">
                    </div>
                </div>
                <div class="right-button">
                    <input type="submit" value="Update Tournament Picture">
                </div> 
                <!-- section 2  -->
                <form action="UpdateTournamentController" method="POST">
                    <div class="tnm-heading mt-5">
                        <h1>${requestScope.tour.tournamentName}<i class="fa-solid fa-crown"></i></h1>
                        <p>
                            Status: 
                            <c:choose>
                                <c:when test="${requestScope.tour.tournamentStatus == 0}">
                                    <select name="tournamentStatus">
                                        <option>Coming soon</option>
                                        <option>Open form</option>
                                    </select>
                                </c:when>
                                <c:when test="${requestScope.tour.tournamentStatus == 1}">
                                    <select name="tournamentStatus">
                                        <option>Open form</option>
                                        <option>Close form</option>
                                        <option>Coming soon</option>
                                    </select>
                                </c:when>
                                <c:when test="${requestScope.tour.tournamentStatus == 2 && requestScope.confirmedForm < requestScope.tour.minParticipant}">
                                    <select name="tournamentStatus">
                                        <option>Close form</option>
                                        <option>Cancel</option>
                                        <option>Open form</option>
                                    </select>
                                <p style="color:red;">Not enough minimum number of players</p>
                            </c:when>
                            <c:when test="${requestScope.tour.tournamentStatus == 2 && requestScope.confirmedForm >= requestScope.tour.minParticipant}">
                                <select name="tournamentStatus">
                                    <option>Close form</option>
                                    <option>On Going</option>
                                    <option>Open form</option>
                                </select>
                            </c:when>
                            <c:when test="${requestScope.tour.tournamentStatus == 3 && requestScope.finishTournament eq 'true'}">
                                <select name="tournamentStatus">
                                    <option>On Going</option>
                                    <option>Pause</option>
                                    <option>Finish</option>
                                </select>
                            </c:when>
                            <c:when test="${requestScope.tour.tournamentStatus == 3 && requestScope.finishTournament ne 'true'}">
                                <select name="tournamentStatus">
                                    <option>On Going</option>
                                    <option>Pause</option>
                                </select>
                                <p style="color:red;">Checking Top4 to finish Tournament</p>
                            </c:when>
                            <c:when test="${requestScope.tour.tournamentStatus == 4}">
                                <select name="tournamentStatus">
                                    <option>Finish</option>
                                </select>
                            </c:when>
                            <c:when test="${requestScope.tour.tournamentStatus == 5}">
                                <select name="tournamentStatus">
                                    <option>Pausing</option>
                                    <option>On Going</option>
                                </select>
                            </c:when>
                            <c:otherwise>
                                <select name="tournamentStatus" >
                                    <option>Cancel</option>
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
                            <input type="text" value="${requestScope.tour.dateTime}" name="dateTime">
                        </div>
                        <div class="basic-tnm-form-categories" style="border-left: 4px solid #A87B24; border-right: 4px solid #A87B24;">
                            <h1><i class="fa-solid fa-location-dot"></i>  Location</h1>
                            <input type="text" value="${requestScope.tour.location}" name="location">
                        </div>
                        <div class="basic-tnm-form-categories">
                            <h1><i class="fa-sharp fa-solid fa-money-bill"></i> Fee</h1>
                            <input type="text" value="${requestScope.tour.fee}VND" name="fee">
                        </div>
                    </div>
                    <!-- div line -->
                    <div class="line-section">
                        <p></p>
                    </div>
                    <!-- Section 4 -->
                    <div class="basic-tnm-form">
                        <div class="basic-tnm-form-categories" style="border-right: 4px solid #A87B24;">
                            <h1><i class="fa-sharp fa-solid fa-trophy"></i> Prize:  </h1>
                            <%
                                TournamentDTO tour = (TournamentDTO) request.getAttribute("tour");
                                String[] prizeArr = null;
                                String prize = tour.getPrize();
                                prizeArr = prize.split(",");
                                for (String items : prizeArr) {
                            %>
                            <p><%=items%></p>
                            <%
                                }
                            %>
                            <p>Change Prize: <input type="text" value="${requestScope.tour.prize}" name="prize"></p>
                        </div>
                        <div class="basic-tnm-form-categories">
                            <h1><i class="fa-sharp fa-solid fa-person"></i> Num Player:  </h1>
                            <input type="text" value="${requestScope.numberPlayer}" >
                        </div>
                        <div class="basic-tnm-form-categories">
                            <h1><i class="fa-sharp fa-solid fa-person"></i> Min Player:  </h1>
                            <input type="text" value="${requestScope.tour.minParticipant}" name="minp">
                        </div>
                        <div class="basic-tnm-form-categories">
                            <h1><i class="fa-sharp fa-solid fa-person"></i> Max Player:  </h1>
                            <input type="text" value="${requestScope.tour.maxParticipant}" name="maxp">
                        </div>
                    </div>
                    <!-- div line -->
                    <div class="sponsor-site" style="margin-top: 10px">
                        <h1>Description: </h1>
                        <textarea rows="10" cols="100" class="custom-font-3" ></textarea>
                    </div>
                    <div class="line-section">
                        <p></p>
                    </div>
                    <!-- Section 5 -->
                    <div class="sponsor-site">
                        <h1>Main Sponsor <i class="fa-solid fa-hand-holding-heart" style="color: green;"></i></h1>
                        <div class="sponsor-site-picture">
                            <img src="${requestScope.tour.sponsor}" alt="Avatar"
                                 class="avatar-sponsor ">
                        </div>
                    </div>
                    <div class="right-button">
                        <input type="hidden" value="${requestScope.tour.tournamentID}" name="tournamentID" />
                        <input type="submit" value="Update Tournament" name="action">
                    </div>  
                </form>
                <div class="line-section">
                    <p></p>
                </div>
                <c:choose>
                    <c:when test="${!empty requestScope.rounds}">
                        <form action="UpdateRoundController" method="GET">
                            <div class="tnm-heading mt-5">
                                <h1>Round</h1>
                            </div>
                            <div class="basic-tnm-form">
                                <c:forEach items="${requestScope.rounds}" var="r">
                                    <div class="basic-tnm-form-categories">
                                        <c:choose>
                                            <c:when test="${requestScope.round.roundID == r.roundID}">
                                                <a style="color:burlywood" id="roud-id" href="ManageRoundController?roundID=${r.roundID}&roundStatus=${r.roundStatus}&roundName=${r.roundName}&tournamentID=${tour.tournamentID}">${r.roundName}</a><br/>
                                            </c:when>
                                            <c:otherwise>
                                                <a id="roud-id" href="ManageRoundController?roundID=${r.roundID}&roundStatus=${r.roundStatus}&roundName=${r.roundName}&tournamentID=${tour.tournamentID}">${r.roundName}</a><br/>
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
                            <div class="line-section">
                                <p></p>
                            </div>
                            <c:if test="${!empty requestScope.round.roundID}">
                                <div class="round-detail">
                                    <div class="round-detail-site" style="border-right: 4px solid #A87B24;">
                                        <p>Type of Round: <input type="text" value="${requestScope.round.typeOfRound}" name="typeOfRound"></p>
                                        <p>Number Bird Attend:   <input type="number" value="${requestScope.round.birdAttend}" name="birdAttend"></p>
                                        <p>
                                            Status: 
                                            <c:choose>
                                                <c:when test="${requestScope.round.roundStatus == 0}">
                                                    <select name="roundStatus">
                                                        <option>Coming soon</option>
                                                        <option>On Going</option>
                                                    </select>
                                                </c:when>
                                                <c:when test="${requestScope.round.roundStatus == 1}">
                                                    <select name="roundStatus">
                                                        <option>On Going</option>
                                                        <option>Finish</option>
                                                    </select>
                                                </c:when>
                                                <c:when test="${requestScope.round.roundStatus == 2}">
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
                                        <input type="text" value="${requestScope.round.birdPass}" name="birdPass">
                                    </div>
                                </div>
                                <div class="right-button">
                                    <input type="hidden" value="${requestScope.round.roundID}" name="roundID">
                                    <input type="hidden" value="${requestScope.round.roundName}" name="roundName">
                                    <input type="hidden" value="${requestScope.tour.tournamentID}" name="tournamentID">
                                    <input type="submit" value="Update Round" name="action">
                                </div>
                            </form>
                            <c:if test="${requestScope.round.roundStatus == 1 || requestScope.round.roundStatus == 2}">
                                <c:choose>
                                    <c:when test="${requestScope.plstatus eq 'true'}">
                                        <div>
                                            <h1 class="candidate-heading">Winner</h1>
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">CID</th>
                                                        <th scope="col">Bird Name</th>
                                                        <th scope="col">Owner Name</th>
                                                        <th scope="col">Status</th>
                                                        <th scope="col">Point</th>
                                                            <c:choose>
                                                                <c:when test="${requestScope.round.roundName eq 'Top4'}">
                                                                <th scope="col">TOP</th>
                                                                </c:when>

                                                            <c:otherwise>
                                                                <th scope="col">Result</th>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <c:if test="${requestScope.round.roundStatus == 1}">
                                                            <th scope="col">Update</th>
                                                            </c:if>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.cands}" var="c">
                                                        <c:if test="${c.result ne 'fail'}">
                                                        <form action="UpdateCandidatesController" method="GET">
                                                            <tr>
                                                                <th scope="row">${c.candidatesID}</th>
                                                                <td>${c.bird.birdName}</td>
                                                                <td>${c.bird.account.name}</td>
                                                                <td>${c.candidatesStatus}</td>
                                                                <td><input id="score-save" type="number" min="0" max="100" value="${c.score}" name="score" ></td>
                                                                    <c:choose>
                                                                        <c:when test="${c.result eq 'pass'}">
                                                                        <td style="font-weight: bold; color: green">${c.result}</td>
                                                                    </c:when>

                                                                    <c:otherwise>
                                                                        <td style="font-weight: bold; color: red">${c.result}</td>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            <input type="hidden" value="${requestScope.round.roundID}" name="roundID"  />
                                                            <input type="hidden" value="${requestScope.round.roundStatus}" name="roundStatus" />
                                                            <input type="hidden" value="${requestScope.round.roundName}" name="roundName" />
                                                            <input type="hidden" value="${requestScope.tour.tournamentID}" name="tournamentID" />
                                                            <input type="hidden" value="${c.candidatesID}" name="candidatesID" />
                                                            <c:if test="${requestScope.round.roundStatus == 1}">
                                                                <td><input class="custom-button_2" type="submit" value="Update" name="action" /></td>
                                                                </c:if>
                                                            </tr>
                                                        </form>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div>
                                            <h1 class="candidate-heading">Failed</h1>
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">CID</th>
                                                        <th scope="col">Bird Name</th>
                                                        <th scope="col">Owner Name</th>
                                                        <th scope="col">Status</th>
                                                        <th scope="col">Point</th>
                                                        <th scope="col">Result</th>
                                                            <c:if test="${requestScope.round.roundStatus == 1}">
                                                            <th scope="col">Update</th>
                                                            </c:if>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.cands}" var="c">
                                                        <c:if test="${c.result eq 'fail'}">
                                                        <form action="UpdateCandidatesController" method="GET">
                                                            <tr>
                                                                <th scope="row">${c.candidatesID}</th>
                                                                <td>${c.bird.birdName}</td>
                                                                <td>${c.bird.account.name}</td>
                                                                <td>${c.candidatesStatus}</td>
                                                                <td><input id="score-save" type="number" min="0" max="100" value="${c.score}" name="score" ></td>
                                                                    <c:choose>
                                                                        <c:when test="${c.result eq 'pass'}">
                                                                        <td style="font-weight: bold; color: green">${c.result}</td>
                                                                    </c:when>

                                                                    <c:otherwise>
                                                                        <td style="font-weight: bold; color: red">${c.result}</td>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            <input type="hidden" value="${requestScope.round.roundID}" name="roundID"  />
                                                            <input type="hidden" value="${requestScope.round.roundStatus}" name="roundStatus" />
                                                            <input type="hidden" value="${requestScope.round.roundName}" name="roundName" />
                                                            <input type="hidden" value="${requestScope.tour.tournamentID}" name="tournamentID" />
                                                            <input type="hidden" value="${c.candidatesID}" name="candidatesID" />
                                                            <c:if test="${requestScope.round.roundStatus == 1}">
                                                                <td><input class="custom-button_2" type="submit" value="Update" name="action" /></td>
                                                                </c:if>
                                                            </tr>
                                                        </form>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div>
                                            <c:choose>
                                                <c:when test="${requestScope.round.roundStatus == 2 && requestScope.round.roundName eq 'Top4'}">
                                                    <h1 class="candidate-heading">Winner</h1>
                                                </c:when>
                                                <c:otherwise>
                                                    <h1 class="candidate-heading">Participant</h1>
                                                </c:otherwise>
                                            </c:choose>

                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">CID</th>
                                                        <th scope="col">Bird Name</th>
                                                        <th scope="col">Owner Name</th>
                                                        <th scope="col">Status</th>
                                                        <th scope="col">Point</th>
                                                            <c:choose>
                                                                <c:when test="${requestScope.round.roundName eq 'Top4'}">
                                                                <th scope="col">TOP</th>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <th scope="col">Result</th>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <c:if test="${requestScope.round.roundStatus == 1}">
                                                            <th scope="col">Update</th>
                                                            </c:if>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.cands}" var="c">
                                                    <form action="UpdateCandidatesController" method="GET">
                                                        <tr>
                                                            <th scope="row">${c.candidatesID}</th>
                                                            <td>${c.bird.birdName}</td>
                                                            <td>${c.bird.account.name}</td>
                                                            <td>${c.candidatesStatus}</td>
                                                            <td><input id="score-save" type="number" min="0" max="100" value="${c.score}" name="score" ></td>
                                                                <c:choose>
                                                                    <c:when test="${c.result eq 'pass'}">
                                                                    <td style="font-weight: bold; color: green">${c.result}</td>
                                                                </c:when>

                                                                <c:otherwise>
                                                                    <td style="font-weight: bold; color: red">${c.result}</td>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        <input type="hidden" value="${requestScope.round.roundID}" name="roundID"  />
                                                        <input type="hidden" value="${requestScope.round.roundStatus}" name="roundStatus" />
                                                        <input type="hidden" value="${requestScope.round.roundName}" name="roundName" />
                                                        <input type="hidden" value="${requestScope.tour.tournamentID}" name="tournamentID" />
                                                        <input type="hidden" value="${c.candidatesID}" name="candidatesID" />
                                                        <c:if test="${requestScope.round.roundStatus == 1}">
                                                            <td><input class="custom-button_2" type="submit" value="Update" name="action" /></td>
                                                            </c:if>
                                                        </tr>
                                                    </form>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
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
        document.addEventListener("DOMContentLoaded", function (event) {
            var scrollpos = localStorage.getItem('scrollpos');
            if (scrollpos)
                window.scrollTo(0, scrollpos);
        });

        window.onbeforeunload = function (e) {
            localStorage.setItem('scrollpos', window.scrollY);
        };
    </script>
</html>
