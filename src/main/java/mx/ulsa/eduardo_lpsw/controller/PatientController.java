package mx.ulsa.eduardo_lpsw.controller;

import mx.ulsa.eduardo_lpsw.models.Doctor;
import mx.ulsa.eduardo_lpsw.models.Patient;
import mx.ulsa.eduardo_lpsw.models.Specialties;
import mx.ulsa.eduardo_lpsw.models.User;
import mx.ulsa.eduardo_lpsw.service.PatientService;
import mx.ulsa.eduardo_lpsw.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller

public class PatientController {
    @Autowired
    PatientService patientService;
    @Autowired
    UserService userService;
    @Autowired
    private AuthenticationManager authenticationManager;


    @PostMapping("/savePatient")
    public String savePatient(Patient patient, RedirectAttributes redirectAttributes) {

        if(patientService.saveOrUpdatePatient(patient)){
            redirectAttributes.addFlashAttribute("message", "Registro exitoso");
            return "redirect:/dashboard?page=patients";
        }
        redirectAttributes.addFlashAttribute("message","Error al registrar Paciente");
        return "redirect:/dashboard?page=patients";
    }

    @GetMapping("/deletePatient/{id}")
    public String deletePatient(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        if (patientService.deletePatient(id)) {
            redirectAttributes.addFlashAttribute("message", "Paceinte eliminado correctamente");
        } else {
            redirectAttributes.addFlashAttribute("message", "Error al eliminar Paciente");
        }
        return "redirect:/dashboard?page=patients";
    }

    @PostMapping("/editSavePatient")
    public String editSavePatient(Patient patient, RedirectAttributes redirectAttributes) {
        if (patientService.saveOrUpdatePatient(patient)) {
            redirectAttributes.addFlashAttribute("message", "Paciente actualizado correctamente");
            return "redirect:/dashboard?page=patients";
        }

        redirectAttributes.addFlashAttribute("message", "Error al actualizar Paciente");
        return "redirect:/dashboard?page=patients";
    }

    //Complete doctor account
    @PostMapping("/completePatientAccount/{id}")
    public String completeDoctorAccount(@PathVariable Integer id, Patient patient, RedirectAttributes redirectAttributes) {

        if(patientService.saveOrUpdatePatient(patient)){
            Patient pat = patientService.getPatientById(patient.getId_patient());
            User user = userService.getUserById(id);
            user.setId_patient(pat);
            userService.saveOrUpdateUser(user);
            redirectAttributes.addFlashAttribute("message", "Registro exitoso");

            return "redirect:/login";
        }
        redirectAttributes.addFlashAttribute("message","Error al registrar Paciente");
        return "redirect:/complete_register?type=Patient&User="+ id;
    }
}
