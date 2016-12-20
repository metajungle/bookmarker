package bookmarker

/**
 * Domain class for bookmarks 
 *
 */ 
class Bookmark {

    SecUser user 

    String url
    String title

    Date dateCreated
    Date lastUpdated 
    
    static mapping = {
        version false
        autoTimestamp true
        table 'bookmark'
    
        dateCreated defaultValue: 'CURRENT_TIMESTAMP'
        lastUpdated defaultValue: 'CURRENT_TIMESTAMP'
    }
    
    static constraints = {
        user(blank: false, nullable: false)
        url(blank: false, nullable: false, maxSize: 2048)
        title(blank: true, nullable: true, maxSize: 1024)
    }
    
    @Override
    public String toString() {
        return url
    }
}
