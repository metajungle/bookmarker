package bookmarker

import grails.plugin.springsecurity.annotation.Secured

class HomeController {

    def springSecurityService

    def index() { 
    
    }
    
    @Secured(['ROLE_USER'])
    def history() {
        // get user 
        def user = springSecurityService.currentUser
        // get login history 
        def history = LoginHistory.findAllByUser(user, 
            [sort: "dateCreated", order: "desc", max: 5])
        // return model 
        return [history: history]
    }
}
