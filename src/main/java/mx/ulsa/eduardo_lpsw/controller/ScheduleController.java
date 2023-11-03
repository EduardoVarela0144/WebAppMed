package mx.ulsa.eduardo_lpsw.controller;

import mx.ulsa.eduardo_lpsw.models.Schedules;
import mx.ulsa.eduardo_lpsw.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.ParseException;

@Controller

public class ScheduleController {
    @Autowired
    ScheduleService scheduleService;


    @PostMapping("/saveSchedule")
    public String saveSchedule(Schedules schedule, RedirectAttributes redirectAttributes) {

        try {
            if (scheduleService.saveOrUpdateSchedule(schedule)) {
                redirectAttributes.addFlashAttribute("message", "Registro exitoso");
                return "redirect:/dashboard?page=schedules";
            } else {
                redirectAttributes.addFlashAttribute("message", "Error al registrar Horario");
                return "redirect:/dashboard?page=schedules";
            }
        } catch (Exception e) {
            System.out.println(e);
            System.out.println(schedule);
            redirectAttributes.addFlashAttribute("message", "Error inesperado al registrar Horario");
            return "redirect:/dashboard?page=schedules";
        }

    }

    @GetMapping("/deleteSchedule/{id}")
    public String deleteSpeciality(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        if (scheduleService.deleteSchedule(id)) {
            redirectAttributes.addFlashAttribute("message", "Horario eliminado correctamente");
        } else {
            redirectAttributes.addFlashAttribute("message", "Error al eliminar Horario");
        }
        return "redirect:/dashboard?page=schedules";
    }

    @PostMapping("/editSaveSchedule")
    public String editSaveSchedule(Schedules schedule, RedirectAttributes redirectAttributes) {
        if (scheduleService.saveOrUpdateSchedule(schedule)) {
            redirectAttributes.addFlashAttribute("message", "Horario actualizado correctamente");
            return "redirect:/dashboard?page=schedules";
        }

        redirectAttributes.addFlashAttribute("message", "Error al actualizar Horario");
        return "redirect:/dashboard?page=schedules";
    }

    @PostMapping("/saveScheduleDoctor")
    public String saveScheduleDoctor(Schedules schedule, RedirectAttributes redirectAttributes) {

        try {
            if (scheduleService.saveOrUpdateSchedule(schedule)) {
                redirectAttributes.addFlashAttribute("message", "Registro exitoso");
                return "redirect:/my_schedules_doctor";
            } else {
                redirectAttributes.addFlashAttribute("message", "Error al registrar Horario");
                return "redirect:/my_schedules_doctor";
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error inesperado al registrar Horario");
            return "redirect:/my_schedules_doctor";
        }

    }


    @GetMapping("/deleteScheduleDoctor/{id}")
    public String deleteSpecialityDoctor(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        if (scheduleService.deleteSchedule(id)) {
            redirectAttributes.addFlashAttribute("message", "Horario eliminado correctamente");
        } else {
            redirectAttributes.addFlashAttribute("message", "Error al eliminar Horario");
        }
        return "redirect:/my_schedules_doctor";
    }


}
