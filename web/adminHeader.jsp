<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link href='https://fonts.googleapis.com/css?family=Baloo' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/adminHeader.css.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light ">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse nav-container" id="navbarTogglerDemo01">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="MainController?action=HOME_GUEST">HOME</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="MainController?action=TOURNAMENT">TOURNAMENT</a><span class="sr-only">(current)</span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="MainController?action=BLOG">BLOG</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="MainController?action=INTRODUCTION">INTRODUCTION</a>
                    </li>
                    <li class="nav-item dropdown show">
                        <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">MANAGE</a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <a class="dropdown-item" href="MainController?action=LoadAccountController">ACCOUNT</a>
                            <a class="dropdown-item" href="MainController?action=LoadBirdController">BIRD</a>
                            <a class="dropdown-item" href="MainController?action=MANAGE_TOURNAMENT">TOURNAMENT</a>
                            <a class="dropdown-item" href="MainController?action=MANAGE_BLOG">BLOG</a>
                            <a class="dropdown-item" href="MainController?action=MANAGE_INTRODUCTION">INTRODUCTION</a>
                            <a class="dropdown-item" href="MainController?action=FEEDBACK">FEEDBACK</a>
                            <a class="dropdown-item" href="MainController?action=STATISTIC">STATISTIC</a>
                        </div>
                    </li>
                </ul>
                <div class="right-site-form my-2 my-lg-0">
                    <!--<input class="form-control mr-sm-2 search-nav" type="search" placeholder="Search" aria-label="Search">-->
                    <div class="dropdown show drop-nav">
                        <a class="" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="https://i.pinimg.com/236x/b5/33/b5/b533b536208b06480c4804e20d2b204e.jpg" alt="Avatar" class="avatar">
                        </a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <a class="dropdown-item" href=""<i class="fa-solid fa-gear"></i>  Account Setting</a>
                            <a class="dropdown-item" href="MainController?action=Logout"> <i class="fa-solid fa-right-from-bracket"></i>  Logout</a>
                        </div>
                    </div>
                    <h5 class="custom-font">Welcome ${sessionScope.acc.getName()}</h5>
                </div>
            </div>
        </nav>
    </body>
</html>
