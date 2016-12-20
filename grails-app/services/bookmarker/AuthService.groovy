package bookmarker

import grails.transaction.Transactional

@Transactional
class AuthService {

    /**
     * Register a successful login attempt 
     *
     * @param username 
     */ 
    def registerSuccessfulLoginAttempt(String username) {
        println("Username: " + username)
        // get user 
        def user = SecUser.findByUsername(username)
        if (user != null) {
            // record successful login attempt 
            def history = new LoginHistory(user: user)
            history.save(failOnError: true)
        } else {
            log.info("Could not register successful login attempt, no such user: " + username)
        }
    }
}
