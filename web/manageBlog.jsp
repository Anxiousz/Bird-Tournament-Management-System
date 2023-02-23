<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/manageTournamnet-Blog.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <title>Manage Tournament</title>
    </head>
    <body>
        <header>
            <%@include file="adminHeader.jsp" %>
        </header>
        <section>
            <div>
                <form>
                    <input class="custom-button_3" type="submit" value="Create Blog">
                </form>
            </div>
            <div>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Title</th>
                            <th scope="col">Author</th>
                            <th scope="col">Created Date</th>
                            <th scope="col">Remove</th>
                            <th scope="col">Detail</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Tile1</td>
                            <td>Mark</td>
                            <td>22-02-2023</td>
                            <td>
                                <a class="custom-button_2" href="MainController?action=Remove_Bird">Remove</a>
                            </td>
                            <td>
                                <a class="custom-button_2" href="MainController?action=Bird_Detail">Detail</a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Tile2</td>
                            <td>Jacob</td>
                            <td>22-02-2023</td>
                            <td>
                                <a class="custom-button_2" href="MainController?action=Remove_Blog">Remove</a>
                            </td>
                            <td>
                                <a class="custom-button_2" href="MainController?action=Blog_Detail">Detail</a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Tile3</td>
                            <td>Larry</td>
                            <td>22-02-2023</td>
                            <td>
                                <a class="custom-button_2" href="MainController?action=Remove_Blog">Remove</a>
                            </td>
                            <td>
                                <a class="custom-button_2" href="MainController?action=Blog_Detail">Detail</a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">4</th>
                            <td>Tile4</td>
                            <td>Andy</td>
                            <td>22-02-2023</td>
                            <td>
                                <a class="custom-button_2" href="MainController?action=Remove_Blog">Remove</a>
                            </td>
                            <td>
                                <a class="custom-button_2" href="MainController?action=Blog_Detail">Detail</a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">5</th>
                            <td>Tile5</td>
                            <td>Jay</td>
                            <td>22-02-2023</td>
                            <td>
                                <a class="custom-button_2" href="MainController?action=Remove_Blog">Remove</a>
                            </td>
                            <td>
                                <a class="custom-button_2" href="MainController?action=Blog_Detail">Detail</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
