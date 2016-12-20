import bookmarker.CustomAuthenticationSuccessHandler

// Place your Spring DSL code here
beans = {
    
    authenticationSuccessHandler(CustomAuthenticationSuccessHandler) { bean -> 
        requestCache = ref('requestCache')
        // auto-wire injections 
        bean.autowire = true
    }
}
