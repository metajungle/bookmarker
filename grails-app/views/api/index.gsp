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
    
    <h2>
        Token
    </h2>
    
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
    
    <h2>
        Save Bookmarks
    </h2>
    
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

    <p>Test API</p>
    
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
    
    <p>Example JavaScript client:</p>
    
    <pre>
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
    // success
}).error(function(json) {
    // error 
});
</pre>
    
    <h2>
        Get Bookmarks
    </h2>

    <p>
        API to retrieve saved bookmarks.
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
                <td>/api/getBookmarks/</td>
                <td>GET</td>
                <td>Retrieves saved bookmarks</td>
            </tr>
        </tbody>
    </table>

    <p>
        Parameters provided as query parameters
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
                <td>limit</td>
                <td><em>Yes</em></td>
                <td>Number of bookmarks to retrieve (default 10, max 50)</td>
            </tr>
        </tbody>
    </table>

    <p>
        Example request: 
    </p>

    <pre>http://server.com/api/getBookmarks/?token=973521EA-220A-4D9A-AA27-80D8E1D52A4A</pre>

    <p>Test API</p>

    <g:if test="${token}">
        <div class="">
            <div class="form-group">
                <label for="getToken">Token</label> 
                <input type="text" class="text_ form-control" 
                    name="getToken" id="getToken" value="${token}" /> 
            </div>
            <div class="form-group">
                <label for="getLimit">Limit</label> 
                <input type="text" class="text_ form-control" 
                    name="getLimit" id="getLimit" value="10" /> 
            </div>
        </div>
    
        <button id="btnGetBookmark" class="btn btn-primary">Get Bookmarks</button>
    
        <p>
            <div id="getResult" class="alert alert-info">
                Currently no result
            </div>
        </p>
    </g:if>
    <g:else>
        <div class="alert alert-warning">
            NOTE: Please generate an API token first
        </div>
    </g:else>
    
    <p>Example JavaScript client:</p>

    <pre>
$.getJSON("${createLink(controller: 'api', action: 'getBookmarks')}",
    {
        token: token, 
        limit: limit
    }, 
    function(json) {
        // success
    }
).error(function(json) {
    // error 
});
</pre>
    
    <g:javascript>
    $(function() {
        
        /*
         * Example client 
         *
         */ 
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
                // update status 
                $("#saveResult")
                    .removeClass()
                    .addClass("alert alert-danger")
                    .text(JSON.stringify(json.responseJSON));
            });
        });
        
        /*
         * Example client 
         *
         */ 
        $("#btnGetBookmark").click(function() {
            
            // get input 
            var token = $("#getToken").val();
            var limit = $("#getLimit").val();
        
            $.getJSON("${createLink(controller: 'api', action: 'getBookmarks')}",
                {
                    token: token, 
                    limit: limit
                }, 
                function(json) {
                    // update status 
                    $("#getResult")
                        .removeClass()
                        .addClass("alert alert-success")
                        .text(JSON.stringify(json));
                }
            ).error(function(json) {
                // update status 
                $("#getResult")
                    .removeClass()
                    .addClass("alert alert-danger")
                    .text(JSON.stringify(json.responseJSON));
            });
        });
    });
    </g:javascript>
    
</body>
</html>