<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chat with GPT Bot</title>
</head>
<body>
<h2>Chat with GPT Bot</h2>

<div id="chatArea">
    <% if(request.getAttribute("response") != null) { %>
    <p>Bot: ${response}</p>
    <% } %>
</div>

<form action="/bot/chat" method="get">
    <label for="prompt">Your Message:</label><br>
    <input type="text" id="prompt" name="prompt"><br>
    <input type="submit" value="Submit">
</form>
</body>
</html>
