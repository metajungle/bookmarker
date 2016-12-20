package bookmarker

import java.util.UUID

import javax.servlet.http.HttpServletResponse

import grails.plugin.springsecurity.annotation.Secured
import grails.converters.*

class ApiController {

    def springSecurityService
    def apiService
    
    static allowedMethods = [
        index: 'GET', 
        token: 'GET', 
        revokeToken: 'POST', 
        
        bookmark: ['GET', 'POST'],
        getBookmarks: ['GET', 'POST'], 
    ]

    @Secured(['ROLE_USER'])
    def index() { 
        // get user 
        def user = springSecurityService.currentUser
        // get token 
        String token = ApiToken.findByUser(user)
        
        return [token: token]
        
    }
    
    @Secured(['ROLE_USER'])
    def token() {
        // get user 
        def user = springSecurityService.currentUser
        // validate that the user does not already have a token
        if (ApiToken.countByUser(user) > 0) {
            redirect(action: "index")
            return
        }
        // generate token 
        String token = UUID.randomUUID().toString().toUpperCase()
        new ApiToken(user: user, token: token).save()
        
        redirect(action: "index")
        return
    }
    
    @Secured(['ROLE_USER'])
    def revokeToken() {
        // get user 
        def user = springSecurityService.currentUser
        // validate that the user has a token
        if (ApiToken.countByUser(user) > 0) {
            def tokens = ApiToken.findAllByUser(user)
            // NOTE: should only be one
            for (def token : tokens) {
                token.delete()
            }
        }
        redirect(action: "index")
        return
    }
    
    /**
     * API endpoint to save bookmarks
     *
     */ 
    def bookmark() {

        // default error response 
        def error = [
            status: "ERROR", 
            message: "An error occurred when saving the bookmark"
        ]
        
        // validate request method 
        if (request.method == "GET") {
            error.message = "This API endpoint only supports 'POST' requests"
            return render(text: error as JSON, 
                contentType: "application/json", status: HttpServletResponse.SC_BAD_REQUEST)
        }
        
        def json = request.JSON 
        if (json != null) {
            // parameters 
            String paramToken = json.get('token', '').trim()
            String paramTitle = json.get('title', '').trim()
            String paramUrl = json.get('url', '').trim()
            
            // validate 
            if (paramToken.equals('')) {
                error.message = "Parameter 'token' was missing"
                return render(text: error as JSON, 
                    contentType: "application/json", status: HttpServletResponse.SC_BAD_REQUEST)
            }
            
            def token = ApiToken.findByToken(paramToken)
            if (token == null) {
                error.message = "Invalid 'token' value provided"
                return render(text: error as JSON, 
                    contentType: "application/json", status: HttpServletResponse.SC_BAD_REQUEST)
            }
            
            if (paramUrl.equals('')) {
                error.message = "Parameter 'url' was empty, not allowed"
                return render(text: error as JSON, 
                    contentType: "application/json", status: HttpServletResponse.SC_BAD_REQUEST)
            }
            
            // validate URL 
            // TODO: use validation library 
            try {
                URL url = new URL(paramUrl)
            } catch (MalformedURLException e) {
                error.message = "Parameter 'url' was not a valid URL"
                return render(text: error as JSON, 
                    contentType: "application/json", status: HttpServletResponse.SC_BAD_REQUEST)
            }
            
            // save bookmark 
            boolean status = apiService.saveBookmark(paramToken, paramUrl, paramTitle)
            
            // success? 
            if (status) {
                def success = [
                    status: "OK", 
                    message: "Bookmarked saved"
                ]
                return render(text: success as JSON, 
                    contentType: "application/json", status: HttpServletResponse.SC_OK)
            }
        }
        // something went wrong 
        return render(text: error as JSON, 
            contentType: "application/json", status: HttpServletResponse.SC_BAD_REQUEST)
    }
    
    /**
     * API endpoint to retrieve bookmarks
     *
     */ 
    def getBookmarks() {
        
        // default error response 
        def error = [
            status: "ERROR", 
            message: "An error occurred when retrieving bookmarks"
        ]
        
        // validate request method 
        if (request.method == "POST") {
            error.message = "This API endpoint only supports 'GET' requests"
            return render(text: error as JSON, 
                contentType: "application/json", status: HttpServletResponse.SC_BAD_REQUEST)
        }
        
        // parameters 
        String paramToken = params.get('token', '').trim()
        int paramLimit = 10 
        
        // try to parse limit parameter 
        try {
            paramLimit = params.get('limit', 10).toInteger()
        } catch (NumberFormatException e) {
            ;
        }
            
        // validate 
        if (paramToken.equals('')) {
            error.message = "Parameter 'token' was missing"
            return render(text: error as JSON, 
                contentType: "application/json", status: HttpServletResponse.SC_BAD_REQUEST)
        }
        
        def token = ApiToken.findByToken(paramToken)
        if (token == null) {
            error.message = "Invalid 'token' value provided"
            return render(text: error as JSON, 
                contentType: "application/json", status: HttpServletResponse.SC_BAD_REQUEST)
        }
            
        if (paramLimit < 1) {
            paramLimit = 10
        } else if (paramLimit > 50) {
            paramLimit = 50
        }
            
        // get bookmarks
        def bookmarks = apiService.getBookmarks(paramToken, paramLimit)
        
        if (bookmarks != null) {
            def success = [
                status: "OK", 
                message: "Bookmarks retreived", 
                result: bookmarks.collect { bookmark -> 
                    def res = [
                        url: bookmark.getUrl()
                    ]
                    def title = bookmark.getTitle()
                    if (title != null) {
                        res['title'] = title
                    }
                    return res
                }
            ]
            return render(text: success as JSON, 
                contentType: "application/json", status: HttpServletResponse.SC_OK)
        }
        
        // something went wrong 
        return render(text: error as JSON, 
            contentType: "application/json", status: HttpServletResponse.SC_BAD_REQUEST)
    }
    
}
