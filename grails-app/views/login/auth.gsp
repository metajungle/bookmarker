<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code="springSecurity.login.title"/></title>

</head>

<body>
    
    <div class="container-fluid container-center">
    
        <h1 class="text-center">
            Sign In
        </h1>
    
        <p class="alert alert-info">
            No account? No problem: <g:link controller="register">Create Account</g:link>
        </p>
    
        <g:if test="${flash.message}">
            <div class="alert alert-warning">
                <div class="login_message">${flash.message}</div>
            </div>
        </g:if>
        
        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
            
            <%-- username --%>
            <div class="form-group ${hasErrors(bean: registerCommand, field: 'username', 'has-error')}">
                <label for="username">Username</label> 
                <input type="text" class="text_ form-control" 
                    name="username" id="username" value="${registerCommand?.username}" /> 
                <g:hasErrors bean="${registerCommand}" field="username">
                    <g:eachError bean="${registerCommand}" field="username">
                        <p class="tight text-danger text-left">
                            <g:message error="${it}" />
                        </p>
                    </g:eachError>
                </g:hasErrors>
            </div>
            
            <%-- password --%>
            <div class="form-group ${hasErrors(bean: registerCommand, field: 'password', 'has-error')}">
                <label for="password">Password</label> 
                <input type="password" class="text_ form-control" 
                    name="password" id="password" value="${registerCommand?.password}" /> 
                <g:hasErrors bean="${registerCommand}" field="password">
                    <g:eachError bean="${registerCommand}" field="password">
                        <p class="tight text-danger text-left">
                            <g:message error="${it}" />
                        </p>
                    </g:eachError>
                </g:hasErrors>
            </div>
            
            <%--
            <p>
                <label for="username"><g:message code="springSecurity.login.username.label"/>:</label>
                <input type="text" class="text_" name="${usernameParameter ?: 'username'}" id="username"/>
            </p>

            
            <p>
                <label for="password"><g:message code="springSecurity.login.password.label"/>:</label>
                <input type="password" class="text_" name="${passwordParameter ?: 'password'}" id="password"/>
            </p>
            --%>

            <p id="remember_me_holder">
                <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test="${hasCookie}">checked="checked"</g:if>/>
                <label for="remember_me"><g:message code="springSecurity.login.remember.me.label"/></label>
            </p>

            <p>
                <input type="submit" id="submit" class="btn btn-primary" alue="${message(code: 'springSecurity.login.button')}"/>
            </p>
        </form>
        
    </div>
    
    <script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
    </script>
    
</body>
</html>
