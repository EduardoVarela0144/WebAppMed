package mx.ulsa.eduardo_lpsw.controller;

import mx.ulsa.eduardo_lpsw.models.Doctor;
import mx.ulsa.eduardo_lpsw.models.Patient;
import mx.ulsa.eduardo_lpsw.models.Specialties;
import mx.ulsa.eduardo_lpsw.service.PatientService;
import mx.ulsa.eduardo_lpsw.service.SpecialityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class SpecialityController {
    @Autowired
    SpecialityService specialityService;

    @PostMapping("/saveSpeciality")
    public String saveSpeciality(Specialties speciality, RedirectAttributes redirectAttributes) {

        if(specialityService.saveOrUpdateSpeciality(speciality)){
            redirectAttributes.addFlashAttribute("message", "Registro exitoso");
            return "redirect:/dashboard?page=specialities";
        }
       redirectAttributes.addFlashAttribute("message","Error al registrar Especialidad");
        return "redirect:/dashboard?page=specialities";
    }

    @GetMapping("/deleteSpeciality/{id}")
    public String deleteSpeciality(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        if (specialityService.deleteSpeciality(id)) {
            redirectAttributes.addFlashAttribute("message", "Especialidad eliminada correctamente");
        } else {
            redirectAttributes.addFlashAttribute("message", "Error al eliminar Especialidad");
        }
        return "redirect:/dashboard?page=specialities";
    }

    @PostMapping("/editSaveSpeciality")
    public String editSaveSpeciality(Specialties speciality, RedirectAttributes redirectAttributes) {
        if (specialityService.saveOrUpdateSpeciality(speciality)) {
            redirectAttributes.addFlashAttribute("message", "Especialidad actualizada correctamente");
            return "redirect:/dashboard?page=specialities";
        }

        redirectAttributes.addFlashAttribute("message", "Error al actualizar Especialidad");
        return "redirect:/dashboard?page=specialities";
    }


}
