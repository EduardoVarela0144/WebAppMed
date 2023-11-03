package mx.ulsa.eduardo_lpsw.controller;

import mx.ulsa.eduardo_lpsw.models.Appointments;
import mx.ulsa.eduardo_lpsw.models.Doctor;
import mx.ulsa.eduardo_lpsw.models.User;
import mx.ulsa.eduardo_lpsw.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class DoctorController {

    @Autowired
    DoctorService doctorService;
    @Autowired
    UserService userService;
    @Autowired
    ScheduleService scheduleService;

    @PostMapping("/saveDoctor")
    public String saveDoctor(Doctor doctor, RedirectAttributes redirectAttributes) {
        try {
            if (doctorService.saveOrUpdateDoctor(doctor)) {
                redirectAttributes.addFlashAttribute("message", "Registro exitoso");
                return "redirect:/dashboard?page=doctors";
            } else {
                redirectAttributes.addFlashAttribute("message", "Error al registrar Doctor");
                return "redirect:/dashboard?page=doctors";
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error inesperado al registrar Doctor");
            return "redirect:/dashboard?page=doctors";
        }
    }


    @GetMapping("/deleteDoctor/{id}")
    public String deleteDoctor(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        if (doctorService.deleteDoctor(id)) {
            redirectAttributes.addFlashAttribute("message", "Doctor eliminado correctamente");
        } else {
            redirectAttributes.addFlashAttribute("message", "Error al eliminar doctor");
        }
        return "redirect:/dashboard?page=doctors";
    }

    @PostMapping("/editSaveDoctor")
    public String editSaveDoctor(Doctor doctor, RedirectAttributes redirectAttributes) {
        if (doctorService.saveOrUpdateDoctor(doctor)) {
            redirectAttributes.addFlashAttribute("message", "Doctor actualizado correctamente");
            return "redirect:/dashboard?page=doctors";
        }

        redirectAttributes.addFlashAttribute("message", "Error al actualizar Doctor");
        return "redirect:/dashboard?page=doctors";
    }

    //Complete doctor account
    @PostMapping("/completeDoctorAccount/{id}")
    public String completeDoctorAccount(@PathVariable Integer id,Doctor doctor, RedirectAttributes redirectAttributes) {

        if(doctorService.saveOrUpdateDoctor(doctor)){
            Doctor doc = doctorService.getDoctorById(doctor.getId_doctor());
            User user = userService.getUserById(id);
            user.setId_doctor(doc);
            userService.saveOrUpdateUser(user);
            redirectAttributes.addFlashAttribute("message", "Registro exitoso");
            return "redirect:/dashboard";
        }
        redirectAttributes.addFlashAttribute("message","Error al registrar Doctor");
        return "redirect:/complete_register?type=Doctor&User="+ id;
    }

    @PreAuthorize("hasRole('ROLE_PATIENT')")
    @GetMapping("/doctor/{id}")
    public String showDoctor(@PathVariable Integer id, Model model, @AuthenticationPrincipal CustomUserDetails customUserDetails) {
        model.addAttribute("doctor", userService.getUserById(id));
        model.addAttribute("appointment", new Appointments());

        model.addAttribute("auth", customUserDetails);
        model.addAttribute("listSchedules", scheduleService.getSchedulesByDoctorFromPatient(userService.getUserById(id)));


        return "pages/doctor";

    }


}
