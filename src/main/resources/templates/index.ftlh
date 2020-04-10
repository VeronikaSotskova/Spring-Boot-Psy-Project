<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <link rel="stylesheet" href="/static/mdbootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/mdbootstrap/css/mdb.min.css">
    <link rel="stylesheet" href="/static/mdbootstrap/css/style.css">
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <script>
        var webSocket;

        function connect() {
            webSocket = new WebSocket('ws://localhost/chat');
            webSocket.onmessage = function receiveMessage(response) {
                let data = response['data'];
                let json = JSON.parse(data);
                $('#messagesList').append("<li>" + json['text'] + "</li>")
            }

        }
        
        function sendMessage(text, pageId) {
            let message = {
                "text": text,
                "from": pageId
            };
            webSocket.send(JSON.stringify(message));
        }
    </script>
    <title>Psy Helper</title>
</head>
<#include "parts/navbar.ftlh">
<body onload="connect()">

<main role="main" class="flex-shrink-0">
    <div class="container mb-2">
        <div class="row">
            <div class="form-inline">
                <label for="message">Текст сообщения: </label>
                <input type="text" name="message" id="message" class="form-control">
                <button class="btn btn-amber" onclick="sendMessage($('#message').val(), '${pageId}')">Отправить</button>
            </div>
        </div>

        <div class="row">
            <h3>Сообщения</h3>
        </div>
        <div class="row">
            <ul id="messagesList">
            </ul>
        </div>
    </div>
</main>

<#--<#include "footer.ftlh">-->

<script type="text/javascript" src="/static/mdbootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/mdbootstrap/js/popper.min.js"></script>
<script type="text/javascript" src="/static/mdbootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/mdbootstrap/js/mdb.min.js"></script>
</body>
</html>