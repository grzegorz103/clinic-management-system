package bartek.io.controllers;

import bartek.io.models.User;
import bartek.io.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping ("/user")
@Controller
public class UserController
{
        @Autowired
        private UserService userService;

        @GetMapping ("/registration")
        @Secured ("ROLE_ANONYMOUS")
        public String registerUser ( Model model )
        {
                model.addAttribute( "user", new User() );
                return "registrationPage";
        }

        @PostMapping ("/registration")
        @Secured ("ROLE_ANONYMOUS")
        public String saveUser ( @ModelAttribute ("user") User user )
        {
                userService.save( user );
                return "redirect:/";
        }


}
