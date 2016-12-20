package bookmarker

/**
 * Login history for all users 
 *
 */ 
class LoginHistory {

    SecUser user
    
    Date dateCreated
    
    static mapping = {
        version false
        autoTimestamp true
        table 'sec_user_login_history'
        
        dateCreated defaultValue: 'CURRENT_TIMESTAMP'
    }

    static constraints = {
        user(blank: false, nullable: false)
    }
}
