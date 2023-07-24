<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Fancy Website</title>
    <!-- Add Bootstrap CSS for easy styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: #ffffff;
            box-shadow: 0 2px 4px 0 rgba(0,0,0,.06);
            position: sticky;
            top: 0;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }
        .navbar-brand {
            color: #3c3c3b;
        }
        .hero {
            position: relative;
            color: #fff;
            text-align: center;
            background-size: cover;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh; /* This makes the video take the whole screen */
        }
        .hero video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }
        .content {
            padding: 50px;
            text-align: left;
            color: black;
        }
    </style>
</head>
<body>
<nav class="navbar">
    <a href="#" class="navbar-brand">Moyi.ai</a>
</nav>
<div class="hero">
    <video autoplay loop muted>
        <source src="https://www.pexels.com/download/video/5198159/?h=1080&w=1920" type="video/mp4">
    </video>
    <h1>Change the future of education using AI</h1>
    <p>Creating the future of AI, together.</p>
    <div>
        <a href="/hello?name=Test" class="btn btn-primary">Try it out</a>
    </div>
</div>
</body>
</html>
