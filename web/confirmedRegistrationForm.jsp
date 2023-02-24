
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <link rel="stylesheet" href="./CSS/confirmedRegistrationForm.css">
        <title>Confirmed Form</title>
    </head>
    <body>
        <header>
            <%@include file="userHeader.jsp" %>
        </header>
        <section>
            <div class="confirmed-regisgtration-form container">
                <div class="confirmed-registration-main-form">
                    <!-- Left-site -->
                    <div class="confirmed-left-registration-form">
                        <h1>Confirmed Tournament Registration</h1>
                        <div class="confirmed-left-registration-support">
                            <h2>If something wrong or you do not understand something. Let's us know throught: </h2>
                            <li><i class="fa-solid fa-phone"></i> (78)321-32-432</li>
                            <li><i class="fa-solid fa-envelope"></i> (78)321-32-432</li>
                            <li><i class="fa-brands fa-facebook"></i> (78)321-32-432</li>
                        </div>
                        <div class="button-left-site">
                            <button class="btn btn-back">Return</button>
                        </div>
                    </div>
                    <!-- Right-site -->
                    <div class="confirmed-right-registration-form">
                        <div class="form-right-registration-form">
                            <form>
                                <!-- Tounrament -->
                                <div class="mb-3">
                                    <label class="form-label">Tournament Name</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3"  style="padding-right: 300px;">
                                    <label for="exampleInputPassword1" class="form-label">Staus</label>
                                    <input type="text" class="form-control" id="exampleInputPassword1">
                                </div>
                                <div class="small-categories">
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label small-item">Player</label>
                                        <input type="text" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label small-item">Date Time</label>
                                        <input type="text" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label small-item">Location</label>
                                        <input type="text" class="form-control" id="exampleInputPassword1">
                                    </div>
                                </div>
                                <!-- Player Information -->
                                <div class="Player-categories">
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label small-item-p">Telephone number now*</label>
                                        <input type="text" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label small-item-p">Your bird</label>
                                        <input type="text" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <label for="">Bird Image</label>
                                    <div class="card" style="width: 18rem;">
                                        <img class="card-img-top" src="https://i.pinimg.com/236x/72/0d/c6/720dc6db1b2428dd0519d5fb68066f5e.jpg" alt="Card image cap">
                                    </div>
                                    <div class="mb-3"   style="padding-right: 300px;">
                                        <label for="exampleInputPassword1" class="form-label small-item-p">Fee</label>
                                        <input type="text" class="form-control" id="exampleInputPassword1">
                                    </div>
                                </div>
                                <div class="form-text">Please check your information carefully before completed this form. If something wrong or not same , let us know  throughtout left site tools</div>
                                <div class="btn-site">
                                    <button type="submit" class="btn btn-complete">Complete</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
