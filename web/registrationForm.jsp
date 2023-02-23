<%-- 
    Document   : registrationForm
    Created on : Feb 23, 2023, 11:47:49 PM
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <link rel="stylesheet" href="./CSS/registrationForm.css">
    <title>Registration Form</title>
</head>
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="userHeader.jsp" %>
        </header>
        <section>
                    <div class="registration-form container">
        <div class="registration-main-form">
            <!-- left site -->
            <div class="registration-left-site">
                <!-- img site -->
                <div class="registration-img-form-tnm">
                    <img class="card-img-top"
                        src="https://media.quangninh.gov.vn/1c7fa8bc-3c38-43e7-8558-4097bbe36b74/Libraries/hinhanhbaiviet/2021/long/t1/thi%20chim%20chao%20mao/hd%201080.01_36_12_07.still936.png"
                        alt="Card image cap">
                </div>
                <div class="registration-inf-form-tnm">
                    <div class="mb-3 large-categories">
                        <label class="form-label form-name-categories">Tournament Name</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    </div>
                    <div class="mb-3 large-categories">
                        <label class="form-label form-name-categories">Status</label>
                        <input type="text" class="form-control" id="exampleInputPassword1">
                    </div>
                    <!-- Small input -->
                    <div class="other-inf-tnm-regis-form">
                        <div class="mb-3 small-categories">
                            <label class="form-label form-name-categories"> Player</label>
                            <input type="text" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="mb-3 small-categories">
                            <label class="form-label form-name-categories">Date Time</label>
                            <input type="text" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="mb-3 small-categories">
                            <label class="form-label form-name-categories">Location</label>
                            <input type="text" class="form-control" id="exampleInputPassword1">
                        </div>
                    </div>
                    <!-- Sponsor -->
                    <div class="mb-3 large-categories">
                        <label class="form-label form-name-categories">Main Sponsor </label>
                        <div class="img-sponsor">
                            <img src="https://i.pinimg.com/236x/60/27/c6/6027c6d0d27d96d86a2b6d3d42292786.jpg"
                                alt="Avatar" class="avatar">
                            <img src="https://i.pinimg.com/236x/60/27/c6/6027c6d0d27d96d86a2b6d3d42292786.jpg"
                                alt="Avatar" class="avatar">
                            <img src="https://i.pinimg.com/236x/60/27/c6/6027c6d0d27d96d86a2b6d3d42292786.jpg"
                                alt="Avatar" class="avatar">
                        </div>
                    </div>
                </div>
            </div>
            <!-- right -site -->
            <div class="registration-right-site">
                <div class="registration-right-heading">
                    <h1>REGISTRATION FORM</h1>
                </div>
                <div class="registration-right-form">
                    <div class="mb-3 right-small-site">
                        <label for="exampleInputEmail1" class="form-label lable-right">Telephone number Now*</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                        <div id="emailHelp" class="form-text" style="color:#ffff;">Telephone is compulsory</div>
                    </div>
                    <div class="mb-3 right-small-site">
                        <label class="form-label lable-right">Choose your bird</label><br>
                        <select class="section-bird">
                            <option value="">Bird 1</option>
                            <option value="">Bird 2</option>
                            <option value="">Bird 3</option>
                            <option value="">Bird 4</option>
                            <option value="">Bird 5</option>
                        </select>
                    </div>
                    <!-- image section -->
                    <div class="bird-img-section right-small-site">
                        <label class="form-label lable-right">Upload your bird image</label>
                        <div class="bird-identify-container">
                            <label for="input-img" class="preview">
                                <i class="fas fa-cloud-upload-alt"></i>
                                <span>Upload to preview image</span>
                            </label>
                            <input type="file" hidden id="input-img" />
                        </div>
                    </div>
                    <div class="fee-registration right-small-site" style="padding-right: 100px; width: 60%;">
                        <label class="form-label lable-right"> Tournament Fee</label>
                        <input type="text" class="form-control" id="exampleInputPassword1">
                        <div class="form-text" style="color: #ffff;">Cash Payment Only</div>
                    </div>
                </div>
                <div class="right-button">
                    <button type="submit">NEXT</button>
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
