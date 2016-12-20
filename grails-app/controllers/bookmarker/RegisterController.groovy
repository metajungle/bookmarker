package bookmarker

import grails.plugin.springsecurity.authentication.dao.NullSaltSource
import grails.plugin.springsecurity.ui.CommandObject 
import grails.plugin.springsecurity.ui.RegisterCommand
import grails.plugin.springsecurity.ui.RegistrationCode

class RegisterController extends grails.plugin.springsecurity.ui.RegisterController {
    
    def register(RegisterCommand registerCommand) {

        if (!request.post) {
            return [registerCommand: new RegisterCommand()]
        }

        print("Posted new user")

        if (registerCommand.hasErrors()) {
            return [registerCommand: registerCommand]
        }

        print("No errors!")

        def user = uiRegistrationCodeStrategy.createUser(registerCommand)
        
        // NOTE: disable email verification 
        
        String salt = saltSource instanceof NullSaltSource ? null : registerCommand.username
        RegistrationCode registrationCode = uiRegistrationCodeStrategy.register(user, registerCommand.password, salt)

        if (registrationCode == null || registrationCode.hasErrors()) {
            // null means problem creating the user
            flash.error = message(code: 'spring.security.ui.register.miscError')
            return [registerCommand: registerCommand]
        }
        
        /*
        sendVerifyRegistrationMail registrationCode, user, registerCommand.email
        */ 
        
        [emailSent: true, registerCommand: registerCommand]
    }
}

/*
class RegisterCommand implements CommandObject {

    protected static Class<?> SecUser
    protected static String usernamePropertyName

    String username
    // String email
    String password
    String password2

    static constraints = {
        username validator: { value, command ->
            if (!value) {
                return
            }
            
            println("Value: $value")
            if (SecUser.findWhere((usernamePropertyName): value)) {
                return 'registerCommand.username.unique'
            }
        }
        //email email: true
        password validator: RegisterController.passwordValidator
        password2 nullable: true, validator: RegisterController.password2Validator
    }
}
*/