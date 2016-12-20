<html>
<head>
    <%--
    <meta name="layout" content="${layoutRegister}"/>
    --%> 
    <meta name="layout" content="main" />
    <s2ui:title messageCode='spring.security.ui.register.title'/>
</head>
<body>
    <%--
<s2ui:formContainer type='register' focus='username' width='800px'>
    <s2ui:form beanName='registerCommand'>
    --%>
    
    <div class="container-center">
    
        <h1 class="text-center">
            Create Account
        </h1>
    
        <g:form action="register" name="registerForm"> 
    
            <g:if test='${emailSent}'>
                <%-- successfully created account --%>
                <p class="text-center text-success">
                    <strong>Your account has successfully been created!</strong> 
                </p>
                <%--
                <g:message code='spring.security.ui.register.sent'/>
                --%>
            </g:if>
            <g:else>
                <%-- create account --%>
                <%-- username --%>
                <div class="form-group ${hasErrors(bean: registerCommand, field: 'username', 'has-error')}">
                    <label for="username">Username</label> 
                    <input type="text" class="text_ form-control" 
                        name="username" id="username" value="${registerCommand?.username}" /> 
                    <p class="help-block">
                        <i class="fa fa-password txt-color-teal"></i> 
                        Enter your username
                    </p>
                    <g:hasErrors bean="${registerCommand}" field="username">
                        <g:eachError bean="${registerCommand}" field="username">
                            <p class="tight text-danger text-left">
                                <g:message error="${it}" />
                            </p>
                        </g:eachError>
                    </g:hasErrors>
                </div>
                <%-- email --%>
                <div class="form-group ${hasErrors(bean: registerCommand, field: 'email', 'has-error')}">
                    <label for="email">Email</label> 
                    <input type="text" class="text_ form-control" 
                        name="email" id="email" value="${registerCommand?.email}" /> 
                    <p class="help-block">
                        <i class="fa fa-password txt-color-teal"></i> 
                        Enter an email
                    </p>
                    <g:hasErrors bean="${registerCommand}" field="email">
                        <g:eachError bean="${registerCommand}" field="email">
                            <p class="tight text-danger text-left">
                                <g:message error="${it}" />
                            </p>
                        </g:eachError>
                    </g:hasErrors>
                </div>
                <%-- passwords --%>
                <div class="form-group ${hasErrors(bean: registerCommand, field: 'password', 'has-error')}">
                    <label for="password" >Password</label> 
                    <input type="password" class="text_ form-control" 
                        name="password" id="password" value="${registerCommand?.password}" />
                    <p class="help-block">
                        Enter your password
                    </p>
                    <g:hasErrors bean="${registerCommand}" field="password">
                        <g:eachError bean="${registerCommand}" field="password">
                            <p class="tight text-danger text-left">
                                <g:message error="${it}" />
                            </p>
                        </g:eachError>
                    </g:hasErrors>
                </div>

                <div class="form-group ${hasErrors(bean: registerCommand, field: 'password2', 'has-error')}">
                    <label for="password2" >Password (again)</label> 
                    <input type="password" class="text_ form-control" 
                        name="password2" id="password2" value="${registerCommand?.password2}" />
                    <p class="help-block">
                        Re-enter your password
                    </p>
                    <g:hasErrors bean="${registerCommand}" field="password2">
                        <g:eachError bean="${registerCommand}" field="password2">
                            <p class="tight text-danger text-left">
                                <g:message error="${it}" />
                            </p>
                        </g:eachError>
                    </g:hasErrors>
                </div>
            

                <%--
                <table>
                    <tbody>
                    <s2ui:textFieldRow name='username' size='40' labelCodeDefault='Username'/>
                    <s2ui:textFieldRow name='email' size='40' labelCodeDefault='E-mail'/>
                    <s2ui:passwordFieldRow name='password' size='40' labelCodeDefault='Password'/>
                    <s2ui:passwordFieldRow name='password2' size='40' labelCodeDefault='Password (again)'/>
                    </tbody>
                </table>
                <s2ui:submitButton elementId='submit' messageCode='spring.security.ui.register.submit'/>
                --%>
            
                <button class="btn btn-primary" type="submit">
                    Create Account
                </button>
            </g:else>
        </g:form>
            <%--
        </s2ui:form>
    </s2ui:formContainer>
            --%>
            
    </div>
    
</body>
</html>
