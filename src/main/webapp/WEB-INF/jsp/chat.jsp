<%@ page import="com.example.selfstudymvcai.dto.Message" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chat with GPT Bot</title>

    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">

    <!-- Include jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
        body {
            padding: 20px;
        }

        #chatArea {
            height: 400px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            padding: 10px;
            overflow-y: scroll;
            margin-bottom: 20px;
        }

        .user-message {
            text-align: right;
            color: blue;
        }

        .bot-message {
            text-align: left;
            color: green;
        }
    </style>

    <script>
        // show loader
        function showLoader() {
            var chatArea = $('#chatArea');
            chatArea.append('<div class="spinner-border text-primary" role="status"><span class="sr-only">Loading...</span></div>');
        }

        // on document ready
        $(document).ready(function() {
            // auto-scroll to the bottom
            function scrollToBottom() {
                var chatArea = document.getElementById('chatArea');
                chatArea.scrollTop = chatArea.scrollHeight;
            }

            // on page load
            scrollToBottom();

            // listen for changes in the chatArea and scroll to the bottom
            var chatArea = document.querySelector('#chatArea');
            var observer = new MutationObserver(scrollToBottom);

            // configuration of the observer:
            var config = { attributes: true, childList: true, characterData: true, subtree: true };
            observer.observe(chatArea, config);
        });
    </script>

</head>
<body>
<div class="container">
    <h2 class="text-center">Chat with Self-study Bot</h2>
    <div id="chatArea">
        <%
            List<Message> chatHistory = (List<Message>) request.getAttribute("chatHistory");
            if (chatHistory != null) {
                for (Message message : chatHistory) {
                    String cssClass = message.getRole().equals("user") ? "user-message" : "bot-message";
                    out.println("<p class='" + cssClass + "'>" + message.getRole() + ": " + message.getContent() + "</p>");
                }
            }
        %>
    </div>
    <form action="/bot/chat" method="get" onsubmit="showLoader()">
        <div class="form-group">
            <label for="prompt">Your Message:</label>
            <input type="text" id="prompt" name="prompt" class="form-control">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
