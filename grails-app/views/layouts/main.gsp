<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>
    <asset:stylesheet href="basic.css"/>

    <g:layoutHead/>
</head>
<body>

    <div class="jumbotron">
        <div class="container">
            <h1>
                Bookmarker
            </h1>
        </div>
    </div>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="${createLink(uri: '/')}">
                    BMr
                </a>
            </div>
            <div class="collapse navbar-collapse">
                <p class="navbar-text">
                    <g:link controller="home" action="history">History</g:link>
                </p>
                <p class="navbar-text navbar-right">
                    <sec:ifLoggedIn>
                        <g:link controller="logout">Logout</g:link>
                    </sec:ifLoggedIn>
                </p>
                <p class="navbar-text navbar-right">
                    <sec:ifLoggedIn>
                        Signed in as 
                        <strong><sec:loggedInUserInfo field="username"/></strong>
                        
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                        <g:link controller="login">Sign In</g:link>
                    </sec:ifNotLoggedIn>
                </p>
            </div>
        </div>
    </nav>

    <div class="container">
        <g:layoutBody/>

        <div class="page-footer">
            Bookmarker
        </div>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
