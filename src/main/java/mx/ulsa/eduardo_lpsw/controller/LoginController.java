package mx.ulsa.eduardo_lpsw.controller;
import mx.ulsa.eduardo_lpsw.models.User;
import mx.ulsa.eduardo_lpsw.service.LoginService;
import mx.ulsa.eduardo_lpsw.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;


@Controller
public class LoginController {

    @Autowired
    LoginService loginService;
    @Autowired
    UserService userService;
    @Autowired
    private AuthenticationManager authenticationManager;

    @GetMapping("/signIn")
    public String login(@ModelAttribute("errorMessage") String errorMessage, Model model, @RequestParam(name = "error", required = false) String error) {
        model.addAttribute("user", new User());
        model.addAttribute("errorMessage", errorMessage);

        if ("true".equals(error)) {
            model.addAttribute("errorMessage", "Credenciales incorrectas");
        }

        return "pages/login";
    }

    @PostMapping("/authenticate")
    public String getUser(User user, Model model) {

        User loginSuccessful = loginService.login(user.getEmail(), user.getPassword());


        if (loginSuccessful != null) {


            List<GrantedAuthority> authorities = new ArrayList<>();
            authorities.add(new SimpleGrantedAuthority("ROLE_USER"));

            UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(loginSuccessful, null, authorities);

            Authentication authentication = authenticationManager.authenticate(authenticationToken);

            SecurityContextHolder.getContext().setAuthentication(authentication);



            return "redirect:/home";

        }

        else {
            model.addAttribute("errorMessage", "Credenciales incorrectas");


            return "redirect:/signIn";

        }


    }

}
