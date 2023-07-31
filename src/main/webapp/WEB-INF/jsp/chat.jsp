<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chat with GPT-4</title>
</head>
<body>
<h2>Chat with GPT-4</h2>
<form action="/chat" method="get">
    <label for="message">Enter your message:</label><br>
    <input type="text" id="message" name="message"><br>
    <input type="submit" value="Send">
</form>
<p>Response from GPT-4: ${chatbotResponse}</p>
</body>
</html>
