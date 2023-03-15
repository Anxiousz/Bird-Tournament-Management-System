

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
        <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Baloo' rel='stylesheet'>
        <link rel="stylesheet" href="./CSS/addBlogManagement.css">
        <title>Update Blog Form</title>
    </head>
    <body>
        <header>
            <%@include file="adminHeader.jsp" %>
        </header>
        <div class="add-blog-admin-main-site container">
            <div class="add-blog-form">
                <div class="blog-heading-add">
                    <h1>Update BLOG FORM</h1>
                </div>
                <form>    
                    <div class="card car-blogs-add" style="width: 100%;">
                        <label for="">Blogs Image</label>
                        <img src="" class="card-img-top" alt="...">
                        <div class="card-body">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Blogs Title</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">Blog Body</label>
                        <textarea name="" id="" rows="20" style="width: 100%;"></textarea>
                    </div>
                    <div class="button-add-site">
                        <button type="submit" class="btn btn-primary">ADD NEW BLOG</button>
                    </div> 
                </form>
            </div>
        </div>
        <header>
            <%@include file="footer.jsp" %>
        </header>
    </body>
</html>
