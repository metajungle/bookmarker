<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Bookmarked</title>
</head>
<body>

    <h2>
        Login history
    </h2>
    
    <p>
        Last 5 successful logins 
    </p>
    
    <g:if test="${history}">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Date (UTC)</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${history}" var="h" status="i">
                    <tr>
                        <td>${i + 1}</td>
                        <td>
                            <g:formatDate format="dd MMM, yyyy HH:mm" 
                                date="${h.getDateCreated()}" 
                                timeZone="UTC" /> 
                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </g:if>
    <g:else>
        <p>
            No login history found!
        </p>
    </g:else>

</body>
</html>