package bookmarker

class BootStrap {

    def init = { servletContext ->
        
        // create default role 
        SecRole.findByAuthority('ROLE_USER') ?:
            new SecRole(authority: 'ROLE_USER').save(failOnError: true)
        
    }
    
    def destroy = {
    }
}
