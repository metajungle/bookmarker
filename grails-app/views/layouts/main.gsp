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
                Bookmarkr
            </h1>
        </div>
    </div>

    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${createLink(uri: '/')}">
                    BMr
                </a>
            </div>
            
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <g:link controller="home" action="history">History</g:link>
                    </li>
                    <li>
                        <g:link controller="api">API</g:link>
                    </li>
                </ul>
                
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <sec:ifLoggedIn>
                            <a href="${createLink(uri: '/')}">
                                Signed in as 
                                <strong><sec:loggedInUserInfo field="username"/></strong>
                            </a>
                        </sec:ifLoggedIn>
                        <sec:ifNotLoggedIn>
                            <g:link controller="login">Sign In</g:link>
                        </sec:ifNotLoggedIn>
                    </li>
                    <sec:ifLoggedIn>
                    <li>
                        <g:link controller="logout">Logout</g:link>
                    </li>
                    </sec:ifLoggedIn>
                </ul>
            </div>
        </div>
    </nav>
    
    <asset:javascript src="application.js"/>

    <div class="container">
        <g:layoutBody/>

        <div class="page-footer">
            Bookmarkr
        </div>
    </div>

</body>
</html>
