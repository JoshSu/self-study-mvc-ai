<%@ page import="com.example.selfstudymvcai.dto.Message" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chat with GPT Bot</title>
    <style>
        /* Center the loader */
        #loader {
            position: absolute;
            left: 50%;
            top: 50%;
            z-index: 1;
            width: 150px;
            height: 150px;
            margin: -75px 0 0 -75px;
            border: 16px solid #f3f3f3;
            border-radius: 50%;
            border-top: 16px solid #3498db;
            width: 120px;
            height: 120px;
            -webkit-animation: spin 2s linear infinite;
            animation: spin 2s linear infinite;
        }

        @-webkit-keyframes spin {
            0% { -webkit-transform: rotate(0deg); }
            100% { -webkit-transform: rotate(360deg); }
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
    <script>
        function showLoader() {
            document.getElementById('loader').style.display = 'block';
        }
    </script>
</head>
<body>
<h2>Chat with GPT Bot</h2>

<div id="loader" style="display: none;"></div>

<div id="chatArea">
    <%
        List<Message> chatHistory = (List<Message>) request.getAttribute("chatHistory");
        if (chatHistory != null) {
            for (Message message : chatHistory) {
                out.println("<p>" + message.getRole() + ": " + message.getContent() + "</p>");
            }
        }
    %>
</div>

<form action="/bot/chat" method="get" onsubmit="showLoader()">
    <label for="prompt">Your Message:</label><br>
    <input type="text" id="prompt" name="prompt"><br>
    <input type="submit" value="Submit">
</form>

</body>
</html>
