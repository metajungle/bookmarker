package bookmarker

import grails.plugin.springsecurity.annotation.Secured

class HomeController {

    def index() { 
    
    }
    
    @Secured('ROLE_USER')
    def view() {
        
    }
}
