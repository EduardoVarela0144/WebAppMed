package mx.ulsa.eduardo_lpsw.controller;

import mx.ulsa.eduardo_lpsw.models.Doctor;
import mx.ulsa.eduardo_lpsw.models.User;
import mx.ulsa.eduardo_lpsw.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.util.Objects;

@Controller
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/signUp")
    public String addUser(@ModelAttribute("message") String message, Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("message", message);
        return "pages/register";
    }

    @PostMapping("/signUpSaveUser")
    public String saveUser(User user, RedirectAttributes redirectAttributes) {

        if(user.getId_patient() != null){
            user.setType("Patient");
        }
        if(user.getId_doctor() != null){
            user.setType("Doctor");
        }

        String hashedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(hashedPassword);

        if (userService.saveOrUpdateUser(user)) {
            redirectAttributes.addFlashAttribute("message", "Registro exitoso");

            //return "redirect:/signUp";
            if(Objects.equals(user.getType(), "Patient")){
                return "redirect:/complete_register?type=Patient&User=" + user.getId_user();
            }else{
                return "redirect:/complete_register?type=Doctor&User=" + user.getId_user();
            }
        }
        redirectAttributes.addFlashAttribute("message", "Error al registrar Usuario");
        return "redirect:/signUp";
    }

    @PostMapping("/saveUser")
    public String saveUserCrud(User user, RedirectAttributes redirectAttributes) {

        try {

            if (user.getId_patient() != null) {
                user.setType("Patient");
            }
            if (user.getId_doctor() != null) {
                user.setType("Doctor");
            }

            String hashedPassword = passwordEncoder.encode(user.getPassword());
            user.setPassword(hashedPassword);

            if (userService.saveOrUpdateUser(user)) {
                redirectAttributes.addFlashAttribute("message", "Registro exitoso");

                return "redirect:/dashboard?page=users";
            }
            redirectAttributes.addFlashAttribute("message", "Error al registrar Usuario");
            return "redirect:/dashboard?page=users";
        }catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error inesperado al registrar usuario");
            return "redirect:/dashboard?page=users";
        }
    }

    @GetMapping("/deleteUser/{id}")
    public String deleteUser(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        if (userService.deleteUser(id)) {
            redirectAttributes.addFlashAttribute("message", "Usuario eliminado correctamente");
        } else {
            redirectAttributes.addFlashAttribute("message", "Error al eliminar doctor");
        }
        return "redirect:/dashboard?page=users";
    }

    @PostMapping("/editSaveUser")
    public String editSaveUser(User user, RedirectAttributes redirectAttributes) {
        if (userService.saveOrUpdateUser(user)) {
            redirectAttributes.addFlashAttribute("message", "Usuario actualizado correctamente");
            return "redirect:/dashboard?page=users";
        }

        redirectAttributes.addFlashAttribute("message", "Error al actualizar Doctor");
        return "redirect:/dashboard?page=users";
    }

}
