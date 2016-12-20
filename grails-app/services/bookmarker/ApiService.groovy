package bookmarker

import grails.transaction.Transactional

@Transactional
class ApiService {

    /**
     * Save the URL as a bookmark
     *
     * @param token
     * @param url
     * @param title
     */ 
    def saveBookmark(String token, String url, String title) {
        if (token != null && url != null && title != null) {
            def apiToken = ApiToken.findByToken(token)
            if (apiToken != null) {
                def user = apiToken.getUser()
                // validate input 
                if (url.length() > 2048) {
                    // TODO: provide error message
                    return false
                }
                if (title.length() > 1024) {
                    // truncate
                    title = title.substring(0, 1024)
                }
                // save bookmark
                def bookmark = new Bookmark(user: user, url: url, title: title)
                bookmark.save()
                return true
            }
        }
        return false
    }
}
