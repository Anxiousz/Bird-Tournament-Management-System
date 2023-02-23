<%-- 
    Document   : tournamentDetail
    Created on : Feb 22, 2023, 9:10:01 PM
    Author     : Admin
--%>

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
                             src="https://scontent.fsgn13-2.fna.fbcdn.net/v/t1.6435-9/132410054_239568537523026_1305047298580901566_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=iMfT7OFbd7EAX_8or26&_nc_ht=scontent.fsgn13-2.fna&oh=00_AfAhcTDu2WioU6CAzHrDinbD0NSbTjulvPW6Styb-_59Vg&oe=641BEFAB"
                             alt="Card image cap">
                    </div>
                </div>
                <!-- section 2  -->
                <div class="tnm-heading mt-5">
                    <h1>Spring Bird Tournament 2023 KonTum <i class="fa-solid fa-crown"></i></h1>
                    <p>Status: On-Going</p>
                </div>
                <!-- Section 3 -->
                <div class="basic-tnm-form">
                    <div class="basic-tnm-form-categories">
                        <h1><i class="fa-solid fa-clock"></i>  Date and Time</h1>
                        <p>#########</p>
                    </div>
                    <div class="basic-tnm-form-categories"
                         style="border-left: 4px solid #A87B24; border-right: 4px solid #A87B24;">
                        <h1><i class="fa-solid fa-location-dot"></i>  Location</h1>
                        <p>#########</p>
                    </div>
                    <div class="basic-tnm-form-categories">
                        <h1><i class="fa-sharp fa-solid fa-money-bill"></i> Fee</h1>
                        <p>#########</p>
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
                        <p>Top 1: ######</p>
                        <p>Top 2: ######</p>
                        <p>Top 3: ######</p>
                        <p>Top 4: ######</p>
                    </div>
                    <div class="player-site">
                        <h1><i class="fa-sharp fa-solid fa-person"></i> Number of Player:  </h1>
                        <p>100</p>
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
                        <img src="https://i.pinimg.com/564x/ee/f2/bb/eef2bb94fee278841e2ced335008216b.jpg" alt="Avatar"
                             class="avatar-sponsor ">
                        <img src="https://i.pinimg.com/236x/49/33/96/49339665366f51689443db2b6832f2cb.jpg" alt="Avatar"
                             class="avatar-sponsor ">
                        <img src="https://i.pinimg.com/564x/30/f4/38/30f4385c60633caaa8cdcf430d3bb16d.jpg" alt="Avatar"
                             class="avatar-sponsor ">
                    </div>
                </div>
                <!-- div line -->
                <div class="line-section">
                    <p></p>
                </div>
                <!-- Section 6 -->
                <!-- Policy -->
                <div class="policy-site">
                    <h1><i class="fa-solid fa-bookmark"></i>  Policy and Rules</h1>
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
                <!-- div-site -->
                <div class="line-section">
                    <p></p>
                </div>
                <!-- Section 7 -->
                <div class="regis-site container">
                    <div class="regis-both-site">
                        <div class="regis-left-site">
                            <h1>PLAY WITH US NOW</h1>
                            <p>Gift, Achivement waiting you</p>
                        </div>
                        <div class="regis-right-site">
                            <form action="">
                                <div class="form-group tnm-regis">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group tnm-regis">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <button type="submit" class= "btn-regis">Next</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
