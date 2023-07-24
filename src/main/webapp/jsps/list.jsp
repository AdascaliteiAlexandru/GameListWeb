<%--
  Created by IntelliJ IDEA.
  User: alex_
  Date: 6/21/2023
  Time: 8:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored = "false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
    <title>Game list</title>
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

<nav class="navbar bg-dark border-bottom border-bottom-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
    <div class="container-fluid">
        <a class="navbar-brand">MyVideoGameList</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/GameListWeb_war">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/GameListWeb_war/games">Games</a>
                </li>
                <div class="btn-group dropend">
                    <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        Platform
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="http://localhost:8080/GameListWeb_war/games?platform=all">ALL</a></li>
                        <li><a class="dropdown-item" href="http://localhost:8080/GameListWeb_war/games?platform=pc">PC</a></li>
                        <li><a class="dropdown-item" href="http://localhost:8080/GameListWeb_war/games?platform=browser">BROWSER</a></li>
                    </ul>
                </div>
                <label class = "toggleButton">
                    <input type = "checkbox" id = "toggle" onclick="themeToggle()">
                    <div class = "roundButton circle" ></div>
                </label>
                <jsp:include page="toggleJSP.jsp" />
            </ul>
        </div>


    </div>
</nav>

<c:if test = "${requestScope.error != null}">
    <div class="alert alert-danger" role="alert">
        <c:out value="${requestScope.error}"/>
    </div>
</c:if>

<c:forEach items="${requestScope.games}" var="game">
    <div class="card text-bg-dark mb-3" style="max-width: 1100px;">
        <div class="row g-0">
            <div class="col-md-4">
                <a href="http://localhost:8080/GameListWeb_war/games?id=<c:out value="${game.id}"/>">
                    <img src="<c:out value="${game.thumbnail}"/>" class="img-fluid rounded-start" alt=<c:out value="${game.title}"/>> </a>
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title"><c:out value="${game.title}"/></h5>
                    <p class="card-text"><c:out value="${game.shortDescription}"/></p>
                    <a href="<c:out value="${game.gameUrl}"/>" class="btn btn-primary" role="button" data-bs-toggle="button">Go to Official Website</a>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
