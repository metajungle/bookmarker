<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Bookmarked</title>
</head>
<body>

    <h1>
        API
    </h1>
    
    <p>
        This section details the provided API to manage bookmarks. 
    </p>
    
    <h3>
        Token
    </h3>
    
    <g:if test="${token}">
        <p>Your API token is:</p>
        <div class="alert alert-info">
            <strong>${token}</strong>
        </div>
        <form action="${createLink(controller: 'api', action: 'revokeToken')}" method="POST">
            <button type="submit" class="btn btn-danger">Revoke Token</button>
        </form>
    </g:if>
    <g:else>
        <p>
            <g:link controller="api" action="token" class="btn btn-primary">
                Generate Token
            </g:link>
        </p>
    </g:else>
    
    <h3>
        Bookmark
    </h3>
    
    <p>
        API to save a bookmark (URL).
    </p>
    
    <table class="table table-striped table-documentation">
        <thead>
            <tr>
                <th>Endpoint</th>
                <th>Method</th>
                <th>Comment</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>/api/bookmark/</td>
                <td>POST</td>
                <td>Bookmarks a URL</td>
            </tr>
        </tbody>
    </table>
    
    <p>
        Parameters provided in JSON in request body
    </p>
    
    <table class="table table-striped table-documentation">
        <thead>
            <tr>
                <th>Parameter</th>
                <th>Optional</th>
                <th>Comment</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>token</td>
                <td><strong>No</strong></td>
                <td>API token</td>
            </tr>
            <tr>
                <td>url</td>
                <td><strong>No</strong></td>
                <td>URL to bookmark</td>
            </tr>
            <tr>
                <td>title</td>
                <td><em>Yes</em></td>
                <td>URL title</td>
            </tr>
        </tbody>
    </table>
    
    <p>
        Example JSON request body: 
    </p>
    
    <pre>
{
    "token": "973521EA-220A-4D9A-AA27-80D8E1D52A4A", 
    "url": "http://www.nytimes.com", 
    "title": "The New York Times"
}
</pre>

    <p>Example Client</p>
    
    <g:if test="${token}">
        <div class="">
            <div class="form-group">
                <label for="saveToken">Token</label> 
                <input type="text" class="text_ form-control" 
                    name="saveToken" id="saveToken" value="${token}" /> 
            </div>
            <div class="form-group">
                <label for="saveUrl">URL</label> 
                <input type="text" class="text_ form-control" 
                    name="saveUrl" id="saveUrl" value="http://www.nytimes.com" /> 
            </div>
            <div class="form-group">
                <label for="saveTitle">Title</label> 
                <input type="text" class="text_ form-control" 
                    name="saveTitle" id="saveTitle" value="" /> 
            </div>
        </div>
        
        <button id="btnSaveBookmark" class="btn btn-primary">Save Bookmark</button>
        
        <p>
            <div id="saveResult" class="alert alert-info">
                Currently no result
            </div>
        </p>
    </g:if>
    <g:else>
        <div class="alert alert-warning">
            NOTE: Please generate an API token first
        </div>
    </g:else>
    
    <g:javascript>
    $(function() {
        
        $("#btnSaveBookmark").click(function() {
            
            // get input 
            var token = $("#saveToken").val();
            var url = $("#saveUrl").val();
            var title = $("#saveTitle").val();
        
            $.ajax({
                type: "POST", 
                url: "${createLink(controller: 'api', action: 'bookmark')}", 
                contentType: "application/json; charset=utf-8",
                dataType: "JSON", 
                data: JSON.stringify({
                    token: token, 
                    url: url, 
                    title: title
                })
            }).success(function(json) {
                // update status 
                $("#saveResult")
                    .removeClass()
                    .addClass("alert alert-success")
                    .text(JSON.stringify(json));
            }).error(function(json) {
                $("#saveResult")
                    .removeClass()
                    .addClass("alert alert-danger")
                    .text(JSON.stringify(json.responseJSON));
            });
        });
    });
    </g:javascript>
    
</body>
</html>