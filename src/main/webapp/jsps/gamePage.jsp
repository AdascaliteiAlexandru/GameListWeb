<%--
  Created by IntelliJ IDEA.
  User: alex_
  Date: 6/23/2023
  Time: 11:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored = "false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
    <title>Game Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <style>
        body {
            color: black;
            background-color: rgb(241, 241, 241);
            text-align: center;
            justify-content: center;
        }
        .dark-class {
            color: white;
            background-color: rgb(12, 10, 10);
        }
        p {
            font-size: 1.2rem;
        }
        .toggleButton {
            width: 5rem;
            height: 2rem;
            position: relative;
            display: inline-block;
        }
        .toggleButton input {
            opacity: 0;
        }
        .roundButton {
            background-color: black;
            top: 0;
            left: 0;
            position: absolute;
            right: 0;
            bottom: 0;
            cursor: pointer;
        }
        .roundButton:before {
            left: 0;
            bottom: 0;
            position: absolute;
            content: "";
            background-color: grey;
            transition: 1s;
            height: 2rem;
            width: 2rem;
        }
        input:checked+.roundButton {
            background-color: white;
        }
        input:checked+.roundButton:before {
            transform: translateX(3rem);
        }
        .roundButton.circle {
            border-radius: 2rem;
        }
        .roundButton.circle:before {
            border-radius: 50%;
        }
    </style>
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
            Integrity = "sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
            crossorigin = "anonymous" referrerpolicy = "no-referrer"> </script>
</head>
<body>
<div class="position-absolute top-0 start-50 translate-middle-x card text-bg-dark text-center" style="width: 40rem;">
    <div class="card-body">
        <h5 class="card-title">${requestScope.game.title}</h5>
        <img src="<c:out value="${requestScope.game.thumbnail}"/>" class="rounded" alt=<c:out value="${requestScope.game.title}"/>>
        <p class="card-text text-start"><c:out value="Platform: ${requestScope.game.platform}"/></p>
        <p class="card-text text-start"><c:out value="Developer: ${requestScope.game.developer}"/></p>
        <p class="card-text text-start"><c:out value="Publisher: ${requestScope.game.publisher}"/></p>
        <p class="card-text text-start"><c:out value="Genre: ${requestScope.game.genre}"/></p>
        <a href="<c:out value="${requestScope.game.gameUrl}"/>" class="btn btn-primary">Go to Official Website</a>
    </div>

</div>
<jsp:include page="toggleJSP.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
