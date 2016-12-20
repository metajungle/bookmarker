package bookmarker

/**
 * Tokens for API usage 
 *
 */ 
class ApiToken {
    
    SecUser user
    
    // API token
    String token

    Date dateCreated
    Date lastUpdated 
    
    static mapping = {
        version false
        autoTimestamp true
        table 'sec_user_api_token'
    
        token index: 'idx_token'
    
        dateCreated defaultValue: 'CURRENT_TIMESTAMP'
        lastUpdated defaultValue: 'CURRENT_TIMESTAMP'
    }

    static constraints = {
        user(blank: false, nullable: false)
        token(blank: false, nullable: false, maxSize: 36)
    }
    
    @Override
    public String toString() {
        return token
    }
}
