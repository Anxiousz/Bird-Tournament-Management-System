<%-- 
    Document   : blogs
    Created on : Mar 10, 2023, 10:17:33 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
        <link href="./CSS/blogs.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
        <title>Blogs</title>
    </head>
    <body>
        <!--header section-->
        <header>
            <%@include file="userHeader.jsp" %>
        </header>
        <!-- body section -->
        <div class="blogs-container-section">
            <div class="blogs-main-site">
                <div class="introduction-blogs-site">
                    <div class="both-container">
                        <div class="sub-title">
                            <h4>TOURNAMENT AND BIRD </h4>
                        </div>
                        <div class="main-title">
                            <h1>BLOGS</h1>
                        </div>
                    </div>
                </div>
                <!-- blogs-carouse-site -->
                <div class="blogs-carouse-main-site container">
                    <div class="blogs-carouse-body-site">
                        <div class="title-blogs-site">
                            <h1><i class="fa-solid fa-star"></i>  Popular Blogs</h1>
                        </div>
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100"
                                         src="https://i.pinimg.com/474x/69/4c/79/694c79141f3480c8a1afca00d89e8396.jpg"
                                         alt="First slide" style="width: 100%; height: 800px;">
                                    <!-- time site -->
                                    <div class="created-time-blog-site">
                                        <p>12:23:30AM 30/02/20XX</p>
                                    </div>
                                    <!-- ---------- -->
                                    <h1>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime, ullam? Aut, nemo
                                        esse
                                        deserunt odit quos tempore alias nam ad distinctio necessitatibus sed inventore
                                        voluptates. Minus quas eveniet illum asperiores.</h1>
                                    <div class="link-read-button">
                                        <a href="">Read more</a>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100"
                                         src="https://i.pinimg.com/474x/75/06/44/75064457c0456477d57b5563054d2b76.jpg"
                                         alt="Second slide" style="width: 100%; height: 800px;">
                                    <!-- time site -->
                                    <div class="created-time-blog-site">
                                        <p>12:23:30AM 30/02/20XX</p>

                                    </div>
                                    <!-- ---------- -->
                                    <h1>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime, ullam? Aut, nemo
                                        esse
                                        deserunt odit quos tempore alias nam ad distinctio necessitatibus sed inventore
                                        voluptates. Minus quas eveniet illum asperiores.</h1>
                                    <div class="link-read-button">
                                        <a href="">Read more</a>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100"
                                         src="https://i.pinimg.com/474x/e4/09/b3/e409b3a273eb756ab2d7d4659bfffc8d.jpg"
                                         alt="Third slide" style="width: 100%; height: 800px;">
                                    <!-- time site -->
                                    <div class="created-time-blog-site">
                                        <p>12:23:30AM 30/02/20XX</p>
                                    </div>
                                    <!-- ---------- -->
                                    <h1>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime, ullam? Aut, nemo
                                        esse
                                        deserunt odit quos tempore alias nam ad distinctio necessitatibus sed inventore
                                        voluptates. Minus quas eveniet illum asperiores.</h1>
                                    <div class="link-read-button">
                                        <a href="">Read more</a>
                                    </div>
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                               data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                               data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- other-blog-site-small -->
                <div class="small-categories-blogs-site container">
                    <!--title site--> 
                    <div class="container-site-logo-heading">
                        <div class="cover-site-logo-heading">
                            <p><i class="fa-solid fa-star"></i>  Maybe you want to read</p>
                        </div>
                    </div>
                    <!-- each card blog site -->
                    <div class="small-categories-blogs-main-body-site">
                        <div class="card card-categories" style="width: 100%;">
                            <div class="card-categories-img-left-site">
                                <img class="card-img-top"
                                     src="https://i.pinimg.com/474x/65/d8/35/65d8352f5c36cb9237d34bae1900a72e.jpg"
                                     alt="Card image cap">
                            </div>
                            <div class="card-body time-heading-site">

                                <h5>Lorem ipsum dolor sit amet consectetur adipisicing elit. Laboriosam commodi error
                                    doloremque magni sit eveniet ex quibusdam voluptates aspernatur, sequi inventore aliquam
                                    possimus quidem harum suscipit! Vitae fugit totam voluptatibus.</h5>
                                <p>00:00:00AM 30/02/20xx</p>
                                <div class="link-read-button">
                                    <a href="">Read more</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="small-categories-blogs-site container">
                    <!-- each card blog site -->
                    <div class="small-categories-blogs-main-body-site">
                        <div class="card card-categories" style="width: 100%;">
                            <div class="card-categories-img-left-site">
                                <img class="card-img-top"
                                     src="https://i.pinimg.com/474x/65/d8/35/65d8352f5c36cb9237d34bae1900a72e.jpg"
                                     alt="Card image cap">
                            </div>
                            <div class="card-body time-heading-site">

                                <h5>Lorem ipsum dolor sit amet consectetur adipisicing elit. Laboriosam commodi error
                                    doloremque magni sit eveniet ex quibusdam voluptates aspernatur, sequi inventore aliquam
                                    possimus quidem harum suscipit! Vitae fugit totam voluptatibus.</h5>
                                <p>00:00:00AM 30/02/20xx</p>
                                <div class="link-read-button">
                                    <a href="">Read more</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="small-categories-blogs-site container">
                    <!-- each card blog site -->
                    <div class="small-categories-blogs-main-body-site">
                        <div class="card card-categories" style="width: 100%;">
                            <div class="card-categories-img-left-site">
                                <img class="card-img-top"
                                     src="https://i.pinimg.com/474x/65/d8/35/65d8352f5c36cb9237d34bae1900a72e.jpg"
                                     alt="Card image cap">
                            </div>
                            <div class="card-body time-heading-site">

                                <h5>Lorem ipsum dolor sit amet consectetur adipisicing elit. Laboriosam commodi error
                                    doloremque magni sit eveniet ex quibusdam voluptates aspernatur, sequi inventore aliquam
                                    possimus quidem harum suscipit! Vitae fugit totam voluptatibus.</h5>
                                <p>00:00:00AM 30/02/20xx</p>
                                <div class="link-read-button">
                                    <a href="">Read more</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="small-categories-blogs-site container">
                    <!-- each card blog site -->
                    <div class="small-categories-blogs-main-body-site">
                        <div class="card card-categories" style="width: 100%;">
                            <div class="card-categories-img-left-site">
                                <img class="card-img-top"
                                     src="https://i.pinimg.com/474x/65/d8/35/65d8352f5c36cb9237d34bae1900a72e.jpg"
                                     alt="Card image cap">
                            </div>
                            <div class="card-body time-heading-site">

                                <h5>Lorem ipsum dolor sit amet consectetur adipisicing elit. Laboriosam commodi error
                                    doloremque magni sit eveniet ex quibusdam voluptates aspernatur, sequi inventore aliquam
                                    possimus quidem harum suscipit! Vitae fugit totam voluptatibus.</h5>
                                <p>00:00:00AM 30/02/20xx</p>
                                <div class="link-read-button">
                                    <a href="">Read more</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="small-categories-blogs-site container">
                    <!-- each card blog site -->
                    <div class="small-categories-blogs-main-body-site">
                        <div class="card card-categories" style="width: 100%;">
                            <div class="card-categories-img-left-site">
                                <img class="card-img-top"
                                     src="https://i.pinimg.com/474x/65/d8/35/65d8352f5c36cb9237d34bae1900a72e.jpg"
                                     alt="Card image cap">
                            </div>
                            <div class="card-body time-heading-site">

                                <h5>Lorem ipsum dolor sit amet consectetur adipisicing elit. Laboriosam commodi error
                                    doloremque magni sit eveniet ex quibusdam voluptates aspernatur, sequi inventore aliquam
                                    possimus quidem harum suscipit! Vitae fugit totam voluptatibus.</h5>
                                <p>00:00:00AM 30/02/20xx</p>
                                <div class="link-read-button">
                                    <a href="">Read more</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer section -->
    <foote>
        <%@include file="footer.jsp" %>
    </foote>
</body>
</html>
