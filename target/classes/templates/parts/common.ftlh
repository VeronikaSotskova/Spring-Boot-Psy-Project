<#macro page>
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
        <title>Psy Helper</title>
    </head>
    <body>

    <#include "navbar.ftlh">
    <main role="main" class="flex-shrink-0">
        <div class="container mb-2">
            <#nested>
        </div>
    </main>

    <#--<#include "footer.ftlh">-->


    <script type="text/javascript" src="/static/mdbootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="/static/mdbootstrap/js/popper.min.js"></script>
    <script type="text/javascript" src="/static/mdbootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/mdbootstrap/js/mdb.min.js"></script>
    </body>
    </html>
</#macro>

